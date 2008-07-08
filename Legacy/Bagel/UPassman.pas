unit UPassman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, nsXPCOM,nsXPCOMGlue, nsPassword,
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
  end;

implementation

{$R *.dfm}
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
  Action:=CAFree;
end;

procedure TfrmPassMan.FormCreate(Sender: TObject);
var
//  password:nsIPassword;
  passwordmanager:nsIPasswordManager;
  passenum:nsISimpleEnumerator;
  rejectenum:nsISimpleEnumerator;
  hasnext:LongBool;
  s:nsISupports;
  strPass:nsAString;
  strUser:nsAString;
  cstrSite:nsACString;
  intfPass:IInterfacedString;
  intfUser:IInterfacedString;
  intfcSite:IInterfacedCString;
  PD:TPasswordData;
  tmpItem:TListItem;
begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);

  intfPass:=NewString;
  strPass:=intfPass.AString;

  intfUser:=NewString;
  strUser:=intfUser.AString;

  intfcSite:=NewCString;
  cstrSite:=intfcSite.ACString;

  passenum := passwordmanager.Enumerator;

  {while passenum.HasMoreElements do begin
    s := passenum.GetNext;
    s.QueryInterface(nsIPassword,password);

    password.GetHost(cstrSite);
    PD.Site:=intfcSite.ToString;

    password.GetUser(strUser);
    PD.User:=intfUser.ToString;

    password.GetPassword(strPass);
    PD.Pass:=intfPass.ToString;

    tmpItem:=lvSavedPassword.Items.Add;
    tmpItem.Caption:=PD.Site;
    tmpItem.SubItems.Add(PD.User);
    tmpItem.Data:=TObject(NewPasswordData(PD));

  end;

  rejectenum := passwordmanager.RejectEnumerator;
  while rejectenum.HasMoreElements do begin
    s:=rejectenum.GetNext;
    s.QueryInterface(nsIPassword,password);

    password.GetHost(cstrSite);
    PD.Site:=intfcSite.ToString;
    
    tmpItem:=lvPasswordNeverSaved.Items.Add;
    tmpItem.Caption:=PD.Site;
    tmpItem.Data:=TObject(NewPasswordData(PD));

  end;   }
  
end;

procedure TfrmPassMan.btnRemoveAllSavedPassClick(Sender: TObject);
var i:Integer;   passwordmanager:nsIPasswordManager;
begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);
  for i := 0 to lvSavedPassword.Items.Count-1 do begin
    passwordmanager.RemoveUser(
      NewCString(PPasswordData(lvSavedPassword.Items.Item[i].Data).Site).ACString
      ,NewString(PPasswordData(lvSavedPassword.Items.Item[i].Data).User).AString
    );
    Dispose(PPasswordData(lvSavedPassword.Items.Item[i].Data));
  end;
  lvSavedPassword.Clear;
end;

procedure TfrmPassMan.btnRemoveAllNeverSavedSiteClick(Sender: TObject);
var
  i:Integer;    passwordmanager:nsIPasswordManager;
begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);
  for i := 0 to lvPasswordNeverSaved.Items.Count-1 do begin
    passwordmanager.RemoveReject(
      NewCString(PPasswordData(lvPasswordNeverSaved.Items.Item[i].Data).Site).ACString
    );
    Dispose(PPasswordData(lvPasswordNeverSaved.Items.Item[i].Data));
  end;
  lvPasswordNeverSaved.Clear;
end;

procedure TfrmPassMan.btnRemoveSelectedPassClick(Sender: TObject);
var
  passwordmanager:nsIPasswordManager;
begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);
  passwordmanager.RemoveUser(
    NewCString(PPasswordData(lvSavedPassword.Selected.Data).Site).ACString
    ,NewString(PPasswordData(lvSavedPassword.Selected.Data).User).AString
  );
  Dispose(PPasswordData(lvSavedPassword.Selected.Data));
  lvSavedPassword.DeleteSelected;
end;

procedure TfrmPassMan.btnRemoveNeverSavedSiteClick(Sender: TObject);
var
  passwordmanager:nsIPasswordManager;
begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);
  passwordmanager.RemoveReject(
    NewCString(PPasswordData(lvPasswordNeverSaved.Selected.Data).Site).ACString
  );
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
