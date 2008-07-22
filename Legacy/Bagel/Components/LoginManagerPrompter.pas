(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Bagel.
 *
 * The Initial Developer of the Original Code is NOSE Takafumi.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** *)

unit LoginManagerPrompter;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings, nsXPCOMGlue, nsInit, nsLogin, nsError,
     SysUtils;

type

  ILoginPromptListener = interface(IInterface)
  ['{9c87a9bd-bf8b-4fae-bdb8-70513b2877df}'] //ToDo: Change GUID
    function HandlePromptToSavePassword(aWindow: nsIDOMWindow; aLogin: nsILoginInfo):boolean;
    function HandlePromptToChangePassword(aWindow: nsIDOMWindow; aOldLogin: nsILoginInfo; aNewLogin:nsILoginInfo):boolean;
    function HandlePromptToChangePasswordWithUsernames(aWindow: nsIDOMWindow; const logins_array; count: PRUint32; aNewLogin: nsILoginInfo):boolean;
  end;

  TLoginManagerPrompterImpl = class(TInterfacedObject, nsILoginManagerPrompter)
  private
    _window : nsIDOMWindow;
  public
    procedure Init(aWindow: nsIDOMWindow); safecall;
    procedure PromptToSavePassword(aLogin: nsILoginInfo); safecall;
    procedure PromptToChangePassword(aOldLogin: nsILoginInfo; aNewLogin: nsILoginInfo); safecall;
    procedure PromptToChangePasswordWithUsernames(const logins_array; count: PRUint32; aNewLogin: nsILoginInfo); safecall;
  end;

  TLoginManagerFactory = class(TInterfacedObject, nsIFactory)
    constructor Create;
    destructor Destroy; override;
    procedure CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result); safecall;
    procedure LockFactory(lock: PRBool); safecall;
  end;

implementation

uses Classes;

var
  sLoginPromptFactory: nsIFactory;
  LoginPromptListener : TInterfaceList;

constructor TLoginManagerFactory.Create;
begin
  inherited;
end;

destructor TLoginManagerFactory.Destroy;
begin
  inherited;
end;

procedure TLoginManagerFactory.CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result);
var
  inst: TLoginManagerPrompterImpl;
begin
  Integer(_result) := 0;

  inst := TLoginManagerPrompterImpl.Create;
  if not Assigned(inst) then
  begin
    //Raise NS_ERROR_OUT_OF_MEMORY;  ToDo:
    Exit;
  end;

  try
    inst.QueryInterface(iid, _result);
  except
    inst.free;
  end;
end;

procedure TLoginManagerFactory.LockFactory(lock: PRBool);
begin
  //dummy
end;

procedure TLoginManagerPrompterImpl.Init(aWindow: nsIDOMWindow); safecall;
begin
  _window := aWindow;
end;

procedure TLoginManagerPrompterImpl.PromptToSavePassword(aLogin: nsILoginInfo); safecall;
var
  i:Integer;
begin
  for i := 0 to LoginPromptListener.Count - 1 do begin
    if ILoginPromptListener(LoginPromptListener.Items[i]).HandlePromptToSavePassword(_window, aLogin) then
      Exit;
  end;
end;

procedure TLoginManagerPrompterImpl.PromptToChangePassword(aOldLogin: nsILoginInfo; aNewLogin: nsILoginInfo); safecall;
var
  i:Integer;
begin
  for i := 0 to LoginPromptListener.Count - 1 do begin
    if ILoginPromptListener(LoginPromptListener.Items[i])
       .HandlePromptToChangePassword(_window, aOldLogin, aNewLogin) then
      Exit;
  end;
end;

procedure TLoginManagerPrompterImpl.PromptToChangePasswordWithUsernames(const logins_array; count: PRUint32; aNewLogin: nsILoginInfo); safecall;
var
  i:Integer;
begin
  for i := 0 to LoginPromptListener.Count - 1 do begin
    if ILoginPromptListener(LoginPromptListener.Items[i])
       .HandlePromptToChangePasswordWithUsernames(_window, logins_array, count, aNewlogin) then
      Exit;
  end;
end;

procedure InitLoginPromptFactory;
var
  rv: Cardinal;
  factory: nsIFactory;
  compReg: nsiComponentRegistrar;
begin
    rv := GRE_Startup;
    if NS_FAILED(rv) then
      raise Exception.Create('GRE_Startup');

    if not Assigned(sLoginPromptFactory) then
    begin
      factory := TLoginManagerFactory.Create;

      if not Assigned(factory) then
        EOutOfMemory.Create('Cannot create THelperDialogFactory');

      sLoginPromptFactory := factory;

      rv := NS_GetComponentRegistrar(compReg);
      compReg.RegisterFactory(NS_ILOGINMANAGERPROMPTER_IID, 'Bagel LoginManagerPrompter',
                              '@mozilla.org/login-manager/prompter;1', factory);

    end;
end;

procedure TermLoginPromptFactory;
begin
  sLoginPromptFactory._Release;
  sLoginPromptFactory := nil;
  GRE_Shutdown;
end;

initialization
  LoginPromptListener := TInterfaceList.Create;
  InitLoginPromptFactory;

finalization
  LoginPromptListener.Free;
  TermLoginPromptFactory;

end.
