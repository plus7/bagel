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
 * The Original Code is GeckoComponents for Delphi.
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
unit GeckoSimpleHALDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, nsTypes,
  nsXPCOM, nsHelperApp;

type
  THelperAppLauncherDialogImpl =  class(TInterfacedObject, nsIHelperAppLauncherDialog)
    procedure Show(aLauncher: nsIHelperAppLauncher; aContext: nsISupports; aReason: PRUint32); safecall;
    function PromptForSaveToFile(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; const aDefaultFileName: PWideChar; const aSuggestedFileExtension: PWideChar; aForcePrompt: PRBool): nsILocalFile; safecall;
  end;

  THelperDialogFactory = class(TInterfacedObject, nsIFactory)
    constructor Create;
    destructor Destroy; override;
    procedure CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result); safecall;
    procedure LockFactory(lock: PRBool); safecall;
  end;
  
  TGeckoSimpleHALDialog = class(TComponent)
  private
    { Private éŒ¾ }
  protected
    { Protected éŒ¾ }
  public
    { Public éŒ¾ }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published éŒ¾ }
  end;

implementation

uses
  nsXPCOMGlue, nsError, nsGeckoStrings, nsInit, HelperDlg;

var
  sHALDialogFactory: nsIFactory;
  sRefCnt: Integer = 0;

constructor TGeckoSimpleHALDialog.Create(AOwner: TComponent);
var
  rv: nsresult;
  factory: nsIFactory;
  compReg: nsIComponentRegistrar;
begin
  inherited Create(AOwner);

  if not (csDesigning in ComponentState) then
  begin
    rv := GRE_Startup;
    if NS_FAILED(rv) then
      raise Exception.Create('GRE_Startup');

    if not Assigned(sHALDialogFactory) then
    begin
      factory := THelperDialogFactory.Create;

      if not Assigned(factory) then
        EOutOfMemory.Create('Cannot create THelperDialogFactory');

      sHALDialogFactory := factory;

      rv := NS_GetComponentRegistrar(compReg);
      compReg.RegisterFactory(NS_IHELPERAPPLAUNCHERDIALOG_IID, 'Bagel Helper App Launcher Dialog', '@mozilla.org/helperapplauncherdialog;1', factory);

      Inc(sRefCnt);
    end;
  end;
end;

destructor TGeckoSimpleHALDialog.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
    Dec(sRefCnt);
    if sRefCnt=0 then begin
      sHALDialogFactory._Release;
      sHALDialogFactory := nil;
    end;
  end;

  inherited;
end;

constructor THelperDialogFactory.Create;
begin
  inherited;
end;

destructor THelperDialogFactory.Destroy;
begin
  inherited;
end;

procedure THelperDialogFactory.CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result);
var
  inst: THelperAppLauncherDialogImpl;
begin
  Integer(_result) := 0;

  //TODO:
  inst := THelperAppLauncherDialogImpl.Create;
  if not Assigned(inst) then
  begin
    //Result := NS_ERROR_OUT_OF_MEMORY;
    Exit;
  end;

  //Result :=
  inst.QueryInterface(iid, _result);
  //if NS_FAILED(rv) then inst.Free;
end;

procedure THelperDialogFactory.LockFactory(lock: PRBool);
begin
  //Result := NS_OK;
end;

procedure THelperAppLauncherDialogImpl.Show(aLauncher: nsIHelperAppLauncher; aContext: nsISupports; aReason: PRUint32); safecall;
var
  sHelperForm:THelperDlg;
begin
  sHelperForm := THelperDlg.Create(Application);
  sHelperForm.Show(aLauncher,aContext,aReason);
  sHelperForm.Free;
end;

function THelperAppLauncherDialogImpl.PromptForSaveToFile(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; const aDefaultFileName: PWideChar; const aSuggestedFileExtension: PWideChar; aForcePrompt: PRBool): nsILocalFile; safecall;
var
  sHelperForm:THelperDlg;
begin
  sHelperForm := THelperDlg.Create(Application);
  Result := sHelperForm.PromptForSaveToFile(aLauncher,aWindowContext,aDefaultFileName,aSuggestedFileExtension);
  sHelperForm.Free;
end;

end.
