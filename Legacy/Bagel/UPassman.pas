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
 * The Initial Developer of the Original Code is plus7.
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

unit UPassman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, nsXPCOM,nsXPCOMGlue, nsLogin,
  nsGeckoStrings;

type
  TfrmPassMan = class(TForm)
    PageControl1: TPageControl;
    SavedPassSheet: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    lvSavedPassword: TListView;
    lvPasswordNeverSaved: TListView;
    Button1: TButton;
    btnRemoveSelectedPass: TButton;
    btnRemoveAllSavedPass: TButton;
    btnShowSavedPassword: TButton;
    btnRemoveNeverSavedSite: TButton;
    btnRemoveAllNeverSavedSite: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRemoveAllSavedPassClick(Sender: TObject);
    procedure btnRemoveAllNeverSavedSiteClick(Sender: TObject);
    procedure btnRemoveSelectedPassClick(Sender: TObject);
    procedure btnRemoveNeverSavedSiteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnShowSavedPasswordClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  frmPassMan: TfrmPassMan;
type
  PPasswordData = ^TPasswordData;
  TPasswordData = record
    Site    :String;
    User  :String;
    Pass :String;
    Realm :String;
    SubmitURL:String;
    LoginInfo: nsILoginInfo;
  end;

implementation

{$R *.dfm}
function GetLoginManager:nsILoginManager;
var
  loginmanager : nsILoginManager;
begin
  NS_GetService('@mozilla.org/login-manager;1',nsILoginManager, loginmanager);
  Result := loginmanager;  
end;

function NewPasswordData(PD:TPasswordData):PPasswordData;
begin
  New(result);
  result^ := PD;
end;

procedure TfrmPassMan.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:Integer;
begin
   for i := 0 to lvSavedPassword.Items.Count-1 do begin
     Dispose(PPasswordData(lvSavedPassword.Items.Item[i].Data));
   end;
   for i := 0 to lvPasswordNeverSaved.Items.Count-1 do begin
     Dispose(PPasswordData(lvPasswordNeverSaved.Items.Item[i].Data));
   end;
  Action:=caFree;
end;

procedure TfrmPassMan.FormCreate(Sender: TObject);
var
  logininfo:nsILoginInfo;
  logincount:Cardinal;
  loginarray:array of nsILoginInfo;
  loginmanager:nsILoginManager;

  disabledcount:Cardinal;
  disabledhosts:array of PWideChar;

  host,user,realm,submiturl,password : IInterfacedString;

  PD:TPasswordData;
  tmpItem:TListItem;
  i: Integer;
begin
  loginmanager := GetLoginManager;
  host := NewString;
  user := NewString;
  password := NewString;

  loginmanager.GetAllLogins(logincount, loginarray);
  for i := 0 to logincount - 1 do
  begin
    loginarray[i].GetHostname(host.AString);
    loginarray[i].GetUsername(user.AString);
    loginarray[i].GetPassword(password.AString);
    PD.Site := host.ToString;
    PD.User := user.ToString;
    PD.Pass := password.ToString;
    PD.LoginInfo := loginarray[i];

    tmpItem:=lvSavedPassword.Items.Add;
    tmpItem.Caption:=PD.Site;
    tmpItem.SubItems.Add(PD.User);
    tmpItem.Data:=TObject(NewPasswordData(PD));
  end;

  loginmanager.GetAllDisabledHosts(disabledcount, disabledhosts);
  for i := 0 to disabledcount - 1 do
  begin
    PD.Site := disabledhosts[i];
    tmpItem:=lvPasswordNeverSaved.Items.Add;
    tmpItem.Caption:=PD.Site;
    tmpItem.Data:=TObject(NewPasswordData(PD));
  end;
end;

procedure TfrmPassMan.btnRemoveAllSavedPassClick(Sender: TObject);
var
  i:Integer;
  loginmanager:nsILoginManager;
begin
  loginmanager := GetLoginManager;
  for i := 0 to lvSavedPassword.Items.Count-1 do begin
    Dispose(PPasswordData(lvSavedPassword.Items.Item[i].Data));
  end;
  loginmanager.RemoveAllLogins;
  lvSavedPassword.Clear;
end;

procedure TfrmPassMan.btnRemoveAllNeverSavedSiteClick(Sender: TObject);
var
  i:Integer;
  loginmanager:nsILoginManager;
begin
  loginmanager := GetLoginManager;
  for i := 0 to lvPasswordNeverSaved.Items.Count-1 do begin
    loginmanager.SetLoginSavingEnabled(
      NewString(PPasswordData(lvPasswordNeverSaved.Items.Item[i].Data).Site).AString,
      true);
    Dispose(PPasswordData(lvPasswordNeverSaved.Items.Item[i].Data));
  end;
  lvPasswordNeverSaved.Clear;
end;

procedure TfrmPassMan.btnRemoveSelectedPassClick(Sender: TObject);
var
  loginmanager:nsILoginManager;
begin
  loginmanager := GetLoginManager;
  loginmanager.RemoveLogin(PPasswordData(lvSavedPassword.Selected.Data).LoginInfo);
  Dispose(PPasswordData(lvSavedPassword.Selected.Data));
  lvSavedPassword.DeleteSelected;
end;

procedure TfrmPassMan.btnRemoveNeverSavedSiteClick(Sender: TObject);
var
  loginmanager:nsILoginManager;
begin
  loginmanager := GetLoginManager;
  loginmanager.SetLoginSavingEnabled(NewString(PPasswordData(lvPasswordNeverSaved.Selected.Data).Site).AString,true);
  Dispose(PPasswordData(lvPasswordNeverSaved.Selected.Data));
  lvPasswordNeverSaved.DeleteSelected;
end;

procedure TfrmPassMan.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPassMan.btnShowSavedPasswordClick(Sender: TObject);
var
  i:Integer;
  col:TListColumn;
  CanContinue:Boolean;
begin
  CanContinue := MessageDlg('本当に表示しますか？後ろに変な人がいなければいいんですが…', mtConfirmation,[mbYes, mbNo], 0) = mrYes;
  if not CanContinue then exit;
  col:=lvSavedPassword.Columns.Add;
  col.Caption:='パスワード';
  col.Width:=100;
  for i:=0 to lvSavedPassword.Items.Count-1 do begin
    lvSavedPassword.Items.Item[i].SubItems.Add(PPasswordData(lvSavedPassword.Items.Item[i].Data)^.Pass);
  end;
  btnShowSavedPassword.Enabled:=False;
end;

end.
