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
unit GeckoSimplePrompt;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Dialogs, nsTypes, nsMemory,
  nsXPCOM, PromptSupports{, nsHelperAppLauncher};

type
  TPromptServiceImpl =  class(TInterfacedObject, nsIPromptService, nsIPromptService2)
    procedure Alert(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar); safecall;
    procedure AlertCheck(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool); safecall;
    function Confirm(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar): PRBool; safecall;
    function ConfirmCheck(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool; safecall;
    function ConfirmEx(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aButtonFlags: PRUint32; const aButton0Title: PWideChar; const aButton1Title: PWideChar; const aButton2Title: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRInt32; safecall;
    function Prompt(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aValue: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool; safecall;
    function PromptUsernameAndPassword(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aUsername: PWideChar; out aPassword: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool; safecall;
    function PromptPassword(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aPassword: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool; safecall;
//    function Select(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aCount: PRUint32; const aSelectList: PPWideCharArray; out aOutSelection: PRInt32): PRBool; safecall;
    function Select(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aCount: PRUint32; const aSelectList_array; out aOutSelection: PRInt32): PRBool; safecall;
    function PromptAuth(aParent: nsIDOMWindow; aChannel: nsIChannel; level: PRUint32; authInfo: nsIAuthInformation; const checkboxLabel: PWideChar; out checkValue: PRBool): PRBool; safecall;
    function AsyncPromptAuth(aParent: nsIDOMWindow; aChannel: nsIChannel; aCallback: nsIAuthPromptCallback; aContext: nsISupports; level: PRUint32; authInfo: nsIAuthInformation; const checkboxLabel: PWideChar; out checkValue: PRBool): nsICancelable; safecall;
  end;

  TPromptFactory = class(TInterfacedObject, nsIFactory)
    constructor Create;
    destructor Destroy; override;
    procedure CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result); safecall;
    procedure LockFactory(lock: PRBool); safecall;
  end;
  
  TGeckoSimplePrompt = class(TComponent)
  private
    { Private 宣言 }
  protected
    { Protected 宣言 }
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published 宣言 }
  end;

implementation

uses
  nsXPCOMGlue, nsError, nsGeckoStrings, nsInit, PromptDlg;

var
  sPromptFactory: nsIFactory;
  sRefCnt: Integer = 0;

constructor TGeckoSimplePrompt.Create(AOwner: TComponent);
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

    if not Assigned(sPromptFactory) then
    begin
      factory := TPromptFactory.Create;

      if not Assigned(factory) then
        EOutOfMemory.Create('Cannot create TPromptFactory');

      sPromptFactory := factory;

      rv := NS_GetComponentRegistrar(compReg);
      compReg.RegisterFactory(NS_IPROMPTSERVICE_IID, 'Prompt Service', '@mozilla.org/embedcomp/prompt-service;1', factory);

      Inc(sRefCnt);
    end;
  end;
end;

destructor TGeckoSimplePrompt.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
    Dec(sRefCnt);
    if sRefCnt=0 then begin
      sPromptFactory._Release;
      sPromptFactory := nil;
    end;
  end;

  inherited;
end;

constructor TPromptFactory.Create;
begin
  inherited;
end;

destructor TPromptFactory.Destroy;
begin
  inherited;
end;

procedure TPromptFactory.CreateInstance(aOuter: nsISupports; const iid: TGUID; out _result);
var
  inst: TPromptServiceImpl;
begin
  Integer(_result) := 0;

  //TODO:
  inst := TPromptServiceImpl.Create;
  if not Assigned(inst) then
  begin
    //Result := NS_ERROR_OUT_OF_MEMORY;
    Exit;
  end;

  //Result :=
  inst.QueryInterface(iid, _result);
  //if NS_FAILED(rv) then inst.Free;
end;

procedure TPromptFactory.LockFactory(lock: PRBool);
begin
  //Result := NS_OK;
end;

procedure TPromptServiceImpl.Alert(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar);
begin
  MessageBoxW(0, aText, aDialogTitle, MB_OK or MB_ICONEXCLAMATION);
end;

procedure TPromptServiceImpl.AlertCheck(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool);
var
  sPromptForm:TPromptDlg;
begin
  sPromptForm := TPromptDlg.Create(Application);
  sPromptForm.AlertCheck(aDialogTitle, aText, aCheckMsg, aCheckState);
  sPromptForm.Free;
end;

function TPromptServiceImpl.Confirm(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar): PRBool;
begin
  Result := (MessageBoxW(0, aText, aDialogTitle, MB_OKCANCEL or MB_ICONQUESTION) <> IDCANCEL);
end;

function TPromptServiceImpl.ConfirmEx(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aButtonFlags: PRUint32; const aButton0Title: PWideChar; const aButton1Title: PWideChar; const aButton2Title: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRInt32;
var
  sPromptForm:TPromptDlg;
begin
  Result := NS_OK;
  {if CheckValue then
  begin
  end;}
  sPromptForm := TPromptDlg.Create(Application);
  Result := sPromptForm.ConfirmEx(aDialogTitle, aText, aButtonFlags, aButton0Title, aButton1Title, aButton2Title, aCheckMsg, aCheckState);
  sPromptForm.Free;
end;

function TPromptServiceImpl.ConfirmCheck(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool;
var
  sPromptForm:TPromptDlg;
begin
  sPromptForm := TPromptDlg.Create(Application);
  Result := sPromptForm.ConfirmCheck(aDialogTitle, aText, aCheckMsg, aCheckState);
  sPromptForm.Free;
end;

function GetWork(work: PWideChar; Str: WideString): PWideChar;
begin
  Result := Work;
  MoveMemory(work, PWideChar(Str), Length(Str)*2+2);
end;

function TPromptServiceImpl.Prompt(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aValue: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool;
var
  sPromptForm:TPromptDlg;
  Str: String;
  temp: PWideChar;
begin
  sPromptForm := TPromptDlg.Create(Application);
  Str := aValue;
  Result := sPromptForm.Prompt(aDialogTitle, aText, aCheckMsg, Str, aCheckState);

  temp := PWideChar(nsMemory.Alloc(sizeof(PRUnichar) * (Length(Str) + 1)));
  GetWork(temp, Str);
  nsMemory.Free(aValue);
  aValue := temp;

  sPromptForm.Free;
end;

function TPromptServiceImpl.PromptUsernameAndPassword(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aUsername: PWideChar; out aPassword: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool;
var
  sPromptForm:TPromptDlg;
  User, Pass: String;
  temp: PWideChar;
begin
  sPromptForm := TPromptDlg.Create(Application);
  User := aUsername;
  Pass := aPassword;
  Result := sPromptForm.PromptUserAndPass(aDialogTitle, aText, aCheckMsg, User, Pass, aCheckState);

  temp := PWideChar(nsMemory.Alloc(sizeof(PRUnichar) * (Length(User) + 1)));
  GetWork(temp, User);
  nsMemory.Free(aUsername);
  aUsername := temp;

  temp := PWideChar(nsMemory.Alloc(sizeof(PRUnichar) * (Length(Pass) + 1)));
  GetWork(temp, Pass);
  nsMemory.Free(aPassword);
  aPassword := temp;

  sPromptForm.Free;
end;

function TPromptServiceImpl.PromptPassword(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; out aPassword: PWideChar; const aCheckMsg: PWideChar; out aCheckState: PRBool): PRBool;
var
  sPromptForm:TPromptDlg;
  Pass: String;
  temp: PWideChar;
begin
  sPromptForm := TPromptDlg.Create(Application);
  Pass := aPassword;
  Result := sPromptForm.PromptPass(aDialogTitle, aText, aCheckMsg, Pass, aCheckState);
  
  temp := PWideChar(nsMemory.Alloc(sizeof(PRUnichar) * (Length(Pass) + 1)));
  GetWork(temp, Pass);
  nsMemory.Free(aPassword);
  aPassword := temp;

  sPromptForm.Free;
end;

function TPromptServiceImpl.Select(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aCount: PRUint32; const aSelectList_array; out aOutSelection: PRInt32): PRBool; safecall;
//Select(aParent: nsIDOMWindow; const aDialogTitle: PWideChar; const aText: PWideChar; aCount: PRUint32; const aSelectList: PPWideCharArray; out aOutSelection: PRInt32): PRBool;
var
  sPromptForm:TPromptDlg;
begin
  sPromptForm := TPromptDlg.Create(Application);
  Result := sPromptForm.Select(aDialogTitle, aText, aCount, PWideCharArray(aSelectList_array), aOutSelection);
  sPromptForm.Free;
end;

function TPromptServiceImpl.PromptAuth(aParent: nsIDOMWindow;
                                       aChannel: nsIChannel;
                                       level: PRUint32;
                                       authInfo: nsIAuthInformation;
                                       const checkboxLabel: PWideChar;
                                       out checkValue: PRBool): PRBool; safecall;
var
  sPromptForm:TPromptDlg;
  realm, user, pass, domain:IInterfacedString;
  dsUser, dsPass: String;
begin
  sPromptForm := TPromptDlg.Create(Application);

  realm := NewString;
  user := NewString;
  pass := NewString;
  domain := NewString;

  authInfo.GetRealm(realm.AString);
  authInfo.GetUsername(user.AString);
  authInfo.GetPassword(pass.AString);
  authInfo.GetDomain(domain.AString);

  dsUser := user.ToString; //dsはDelphi Stringの略。命名規則もへったくれもねーなウヘァ 
  dsPass := pass.ToString;

  Result := sPromptForm.PromptUserAndPass('ユーザー名とパスワードを入力してください',
                                          '"' + domain.ToString + '"の' +
                                          realm.ToString + 'に対するユーザー名とパスワードを入力してください',
                                          checkboxLabel,
                                          dsUser, dsPass, checkValue);
  authInfo.SetUsername(NewString(dsUser).AString);
  authInfo.SetPassword(NewString(dsPass).AString);  

  sPromptForm.Free;
end;

function TPromptServiceImpl.AsyncPromptAuth(aParent: nsIDOMWindow; aChannel: nsIChannel; aCallback: nsIAuthPromptCallback; aContext: nsISupports; level: PRUint32; authInfo: nsIAuthInformation; const checkboxLabel: PWideChar; out checkValue: PRBool): nsICancelable; safecall;
begin
  //TODO:
end;


end.