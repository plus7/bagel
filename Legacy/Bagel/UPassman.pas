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
