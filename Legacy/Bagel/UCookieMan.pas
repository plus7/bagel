unit UCookieMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, nsXPCOM, StdCtrls, ExtCtrls, nsPerm
  ,nsXPCOMGlue,nsGeckoStrings,nsNetUtil;

type
  TfrmCookieMan = class(TForm)
    PageControl1: TPageControl;
    StoredCookieSheet: TTabSheet;
    CookieSitesSheet: TTabSheet;
    Panel1: TPanel;
    btnClose: TButton;
    Button1: TButton;
    edtExpSite: TEdit;
    btnAddBlock: TButton;
    btnAddSession: TButton;
    btnAddAllow: TButton;
    lvCookieExpSites: TListView;
    Button2: TButton;
    Button3: TButton;
    lvSavedCookies: TListView;
    Button7: TButton;
    Button8: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblCookieName: TLabel;
    lblCookieContent: TLabel;
    lblCookieHost: TLabel;
    lblCookiePath: TLabel;
    lblCookieSendCondition: TLabel;
    lblCookieExpires: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure lvSavedCookiesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAddBlockClick(Sender: TObject);
    procedure btnAddAllowClick(Sender: TObject);
    procedure btnAddSessionClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  frmCookieMan: TfrmCookieMan;
type
  PCookieData = ^TCookieData;
  TCookieData = record
    Name    :String;
    Value  :String;
    IsDomain :Boolean;
    Host:String;
    Path:String;
    IsSecure:Boolean;
    Expires:Int64;
    Status:Integer;
    Policy:Integer;
  end;

  PSiteData = ^TSiteData;
  TSiteData = record
    DataType    :String;
    Capability  :Integer;
    Host:String;
  end;

implementation

{$R *.dfm}
function NewCookieData(CD:TCookieData):PCookieData;
begin
  New(result);
  result^ := CD;
end;

function NewSiteData(SD:TSiteData):PSiteData;
begin
  New(result);
  result^ := SD;
end;
procedure setCookiePermissions(host:String;action:Integer);
var
  uri:nsIURI;
  pm:nsIPermissionManager;
  permission:Cardinal;
begin
  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  NS_CreateInstance('@mozilla.org/network/standard-url;1',nsIURI,uri);
  uri.SetSpec(NewCString('http://'+host).ACString);
  permission := pm.TestPermission(uri,PChar('cookie'));
  if permission <> action then
  pm.Add(uri,PChar('cookie'),action);
end;

function GetPermStr(Action:Integer):String;
begin
  if Action=1 then Result:='許可'
  else if Action=2 then Result:='拒否'
  else if Action=8 then Result:='セッション';
end;
/// function setCookiePermissions(action)
{
   var site = document.getElementById('cookie-site');
   var url = site.value.replace(/^\s*([-\w]*:\/+)?/, "http://");
   var ioService = Components.classes["@mozilla.org/network/io-service;1"]
                                .getService(Components.interfaces.nsIIOService);604   var uri = ioService.newURI(url, null, null);
605
606   // only set the permission if the permission doesn't already exist
607   if (permissionmanager.testPermission(uri, dialogType) != action)
608     permissionmanager.add(uri, dialogType, action);
609
610   site.focus();
611   site.value = "";
612 }

{[A]
例えば上記の場合だと、1970年1月1日をDelphiのTDateTime型に直し、経
過秒数からTDateTime型の整数部(日数)と小数部(時刻)を計算すれば出来
ます。関数にすると以下のようになります。}

function CTime2Date(DT:Longint):TDateTime;
begin
  Result := EncodeDate(1970,1,1)      //Cの基準日付を変換
            + (DT + 32400) div 86400  //日付の算出
            + (DT mod 86400) / 86400; //時刻の算出
end;

{[補足]
32400はGMTとの時差(9時間)、86400は一日の秒数です。GMTとの時差が異
なる場合32400の部分を変えて下さい。また、基準日付の部分はDelphiの
バージョンによって(Delphiの中での基準日付が)異なるためEncodeDate
でやっておいたほうがいいと思います。}

procedure TfrmCookieMan.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:Integer;
begin
   for i := 0 to lvCookieExpSites.Items.Count-1 do begin
     Dispose(PSiteData(lvCookieExpSites.Items.Item[i].Data));
   end;
   for i := 0 to lvSavedCookies.Items.Count-1 do begin
     Dispose(PCookieData(lvSavedCookies.Items.Item[i].Data));
   end;
  Action:=CAFree;
end;
          (*
// xpconnect to cookiemanager
// get the cookie manager component in JavaScript 
var cookiemanager = Components.classes["@mozilla.org/ 
     cookiemanager;1"].getService(); 
cookiemanager = cookiemanager.QueryInterface
     (Components.interfaces.nsICookieManager); 
 
// called as part of a largerDeleteAllCookies() function 
function FinalizeCookieDeletions() { 
  for (var c=0; c<deletedCookies.length; c++) { 
    cookiemanager.remove(deletedCookies[c].host, 
                         deletedCookies[c].name, 
                         deletedCookies[c].path); 
                          
  } 
  deletedCookies.length = 0; 
} 


          *)
procedure TfrmCookieMan.FormCreate(Sender: TObject);
var
  cookieman:nsiCookieManager;
  enum:nsISimpleEnumerator;
  cookie:nsICookie;
  s:nsISupports;
//  hasnext:longbool;
  pm:nsIPermissionManager;
  permission:nsIPermission;
//  tmpCardinal:Cardinal;
  tmpItem:TListItem;
  CD:TCookieData;
  SD:TSiteData;
  cstrTmp:nsACString;
  intfTmp:IInterfacedCString;
//  tmpBool:LongBool;
//  tmpInt:Integer;
//  expires:Int64;
  cstrType:nsACString;
  intfType:IInterfacedCString;
  cstrHost:nsACString;
  intfHost:IInterfacedCString;
begin
  lblCookieName.Caption := '';
  lblCookieContent.Caption := '';
  lblCookieHost.Caption := '';
  lblCookiePath.Caption := '';
  lblCookieSendCondition.Caption := '';
  lblCookieExpires.Caption := '';

  NS_GetService('@mozilla.org/cookiemanager;1',nsICookiemanager,cookieman);
  intfTmp:=NewCString;
  cstrTmp:=intfTmp. ACString;
  
  enum := cookieman.Enumerator;
  while enum.HasMoreElements do begin
    s := enum.GetNext();
    s.QueryInterface(nsICookie,cookie);

    cookie.GetName(cstrTmp);
    CD.Name:=intfTmp.ToString;

    cookie.GetValue(cstrTmp);
    CD.Value:=intfTmp.ToString;

    CD.IsDomain:=cookie.IsDomain;

    cookie.GetHost(cstrTmp);
    CD.Host:=intfTmp.ToString;

    cookie.GetPath(cstrTmp);
    CD.Path:=intfTmp.ToString;

    CD.IsSecure:=cookie.IsSecure;

    CD.Expires:=cookie.Expires;

    CD.Status:=cookie.Status;

    CD.Policy:=cookie.Policy;

    tmpItem:=lvSavedCookies.Items.Add;
    tmpItem.Caption:=CD.Host;
    tmpItem.SubItems.Add(CD.Name);
    tmpItem.Data:=TObject(NewCookieData(CD));
  end;

  intfType:=NewCString;
  cstrType:=intfType.ACString;
  intfHost:=NewCString;
  cstrHost:=intfHost.ACString;

  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  enum:=pm.Enumerator;
  while enum.HasMoreElements do
  begin
    s:=enum.GetNext;
    s.QueryInterface(nsIPermission,permission);
    permission.GetType(cstrType);
    if intfType.ToString = 'cookie' then
    begin
      permission.GetHost(cstrHost);
      SD.DataType:='cookie';
      SD.Capability:=permission.Capability;
      SD.Host:=intfHost.ToString;
      
      tmpItem:=lvCookieExpSites.Items.Add;
      tmpItem.Caption:=SD.Host;
      tmpItem.SubItems.Add(GetPermStr(SD.Capability));
      tmpItem.Data:=TObject(NewSiteData(SD));

    end;
  end;
end;

procedure TfrmCookieMan.Button1Click(Sender: TObject);
begin
Self.Close;
end;

procedure TfrmCookieMan.lvSavedCookiesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then begin
    lblCookieName.Caption := PCookieData(Item.Data).Name;
    lblCookieContent.Caption := PCookieData(Item.Data).Value;
    lblCookieHost.Caption := PCookieData(Item.Data).Host;
    lblCookiePath.Caption := PCookieData(Item.Data).Path;
    lblCookieSendCondition.Caption := IntToStr(PCookieData(Item.Data).Policy);
    lblCookieExpires.Caption := DateTimeToStr(CTime2Date(PCookieData(Item.Data).Expires));
  end
  else begin
    lblCookieName.Caption := '';
    lblCookieContent.Caption := '';
    lblCookieHost.Caption := '';
    lblCookiePath.Caption := '';
    lblCookieSendCondition.Caption := '';
    lblCookieExpires.Caption := '';
  end;
end;

procedure TfrmCookieMan.Button8Click(Sender: TObject);
var
  cookieman:nsICookieManager;
{begin
  NS_GetService('@mozilla.org/passwordmanager;1',nsIPasswordManager,passwordmanager);
  passwordmanager.RemoveUser(
    NewCString(PPasswordData(lvSavedPassword.Selected.Data).Site).ACString
    ,NewString(PPasswordData(lvSavedPassword.Selected.Data).User).AString
  );
  Dispose(PPasswordData(lvSavedPassword.Selected.Data));
  lvSavedPassword.DeleteSelected;       }begin
  if lvSavedCookies.Selected<>nil then begin
    NS_GetService('@mozilla.org/cookiemanager;1',nsICookiemanager,cookieman);
    cookieman.Remove(
      NewCString(PCookieData(lvSavedCookies.Selected.Data).Host).ACString,
      NewCString(PCookieData(lvSavedCookies.Selected.Data).Name).ACString,
      NewCString(PCookieData(lvSavedCookies.Selected.Data).Path).ACString,
      false);
    Dispose(PCookieData(lvSavedCookies.Selected.Data));
    lvSavedCookies.DeleteSelected;
  end;
end;

procedure TfrmCookieMan.Button2Click(Sender: TObject);
var
  pm:nsIPermissionManager;
begin
  if lvCookieExpSites.Selected<>nil then begin
    NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
    pm.Remove(NewCString(PSiteData(lvCookieExpSites.Selected.Data).Host).ACString,PChar('cookie'));
    Dispose(PSiteData(lvCookieExpSites.Selected.Data));
    lvCookieExpSites.DeleteSelected;
  end;
end;

procedure TfrmCookieMan.Button7Click(Sender: TObject);
var
  i:Integer;
  cookieman:nsICookieManager;
begin
   for i := 0 to lvSavedCookies.Items.Count-1 do begin
     Dispose(PCookieData(lvSavedCookies.Items.Item[i].Data));
   end;
   NS_GetService('@mozilla.org/cookiemanager;1',nsICookiemanager,cookieman);
   cookieman.RemoveAll;
   lvSavedCookies.Clear;
end;

procedure TfrmCookieMan.Button3Click(Sender: TObject);
var
  i:Integer;
  pm:nsIPermissionManager;
begin
  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  for i:=0 to lvCookieExpSites.Items.Count-1 do begin
    pm.Remove(NewCString(PSiteData(lvCookieExpSites.Items.Item[i].Data).Host).ACString,PChar('cookie'));
    Dispose(PSiteData(lvCookieExpSites.Items.Item[i].Data));
  end;
  lvCookieExpSites.Clear;
end;

procedure TfrmCookieMan.btnAddBlockClick(Sender: TObject);
var
  SD:TSiteData;
  tmpItem:TListItem;
begin
  SetCookiePermissions(edtExpSite.Text,2);
  SD.Host:=edtExpSite.Text;
  SD.DataType:='cookie';
  SD.Capability:=2;
  tmpItem:=lvCookieExpSites.Items.Add;
  tmpItem.Caption:=SD.Host;
  tmpItem.SubItems.Add(GetPermStr(SD.Capability));

  tmpItem.Data:=TObject(NewSiteData(SD));
  
  edtExpSite.Text:='';
  edtExpSite.SetFocus;
      {nsCookieAccess  	 nsICookiePermission.ACCESS_DEFAULT  	= 0
nsCookieAccess 	nsICookiePermission.ACCESS_ALLOW 	= 1
nsCookieAccess 	nsICookiePermission.ACCESS_DENY 	= 2
Additional values for nsCookieAccess, which are not directly used by any methods on this interface, but are nevertheless convenient to define here. these may be relocated somewhere else if we ever consider freezing this interface.
nsCookieAccess 	nsICookiePermission.ACCESS_SESSION 	= 8}
end;

procedure TfrmCookieMan.btnAddAllowClick(Sender: TObject);
var
  SD:TSiteData;
  tmpItem:TListItem;
begin
  SetCookiePermissions(edtExpSite.Text,1);
  SD.Host:=edtExpSite.Text;
  SD.DataType:='cookie';
  SD.Capability:=1;
  tmpItem:=lvCookieExpSites.Items.Add;
  tmpItem.Caption:=SD.Host;
  tmpItem.SubItems.Add(GetPermStr(SD.Capability));
  
  tmpItem.Data:=TObject(NewSiteData(SD));
  
  edtExpSite.Text:='';
  edtExpSite.SetFocus;
end;

procedure TfrmCookieMan.btnAddSessionClick(Sender: TObject);
var
  SD:TSiteData;
  tmpItem:TListItem;
begin
  SetCookiePermissions(edtExpSite.Text,8);
  SD.Host:=edtExpSite.Text;
  SD.DataType:='cookie';
  SD.Capability:=8;
  tmpItem:=lvCookieExpSites.Items.Add;
  tmpItem.Caption:=SD.Host;
  tmpItem.SubItems.Add(GetPermStr(SD.Capability));

  tmpItem.Data:=TObject(NewSiteData(SD));
  
  edtExpSite.Text:='';
  edtExpSite.SetFocus;
end;

end.
