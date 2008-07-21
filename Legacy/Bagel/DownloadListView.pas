(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
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
 * The Original Code is Bagel Support Components.
 *
 * The Initial Developer of the Original Code is NOSE Takafumi.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 *
 * ***** END LICENSE BLOCK ***** *)

unit DownloadListView;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,
  CommCtrl, ComCtrls, nsTypes, nsXPCOM, nsDownload,
  nsGeckoStrings, nsXPCOMGlue, nsInit;
type
  TDLListItem = class(TListItem)
  private
    { Private 宣言 }
    //FId:Cardinal;
    FDownload:nsIDownload;
  protected
    { Protected 宣言 }
    function GetDownload:nsIDownload;
    procedure SetDownload(Value:nsIDownload);
  public
    constructor Create(AOwner: TListItems);
    { Public 宣言 }
  published
    { Published 宣言 }
    //property Id:Cardinal read FId write FId;
    property Download:nsIDownload read GetDownload write SetDownload;
  end;

  TDownloadListView = class(TCustomListView, nsIDownloadProgressListener)
  private
    FDocument : nsIDOMDocument;
    function GetDownload(id:Cardinal):TDLListItem;
    procedure PrependList(aDownload:nsIDownload);

    function GetDocument(): nsIDOMDocument; safecall;
    procedure SetDocument(aDocument: nsIDOMDocument); safecall;
    property Document: nsIDOMDocument read GetDocument write SetDocument;
    procedure OnDownloadStateChange(aState: PRInt16; aDownload: nsIDownload); safecall;
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult; aDownload: nsIDownload); safecall;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64; aDownload: nsIDownload); safecall;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar; aDownload: nsIDownload); safecall;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aLocation: nsIURI; aDownload: nsIDownload); safecall;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aState: PRUint32; aDownload: nsIDownload); safecall;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ViewStyle;
    property OnClick;
    property OnDblClick;
  end;

implementation

function TDownloadListView.GetDownload(id:Cardinal):TDLListItem;
var
  i:Integer;
begin

  Result := nil; {
  for i := 0 to Items.Count - 1 do begin
    if TDLListItem(Items.Item[i]).Id=id then begin
      Result := TDLListItem(Items.Item[i]);
      Exit;
    end;
  end;            }
end;

procedure TDownloadListView.PrependList(aDownload:nsIDownload);
var
  item:TDLListItem;
  str:IInterfacedString;
begin
  item := TDLListItem.Create(Items);
  Items.AddItem(item);
  str := NewString;
  aDownload.GetDisplayName(str.AString);
  item.Caption := str.ToString;
  item.Download := aDownload;
end;

function TDownloadListView.GetDocument(): nsIDOMDocument; safecall;
begin
  Result := FDocument;
end;

procedure TDownloadListView.SetDocument(aDocument: nsIDOMDocument); safecall;
begin
  FDocument := aDocument;
end;

procedure TDownloadListView.OnDownloadStateChange(aState: PRInt16; aDownload: nsIDownload); safecall;
var
  state:Integer;
begin
  state := aDownload.State;
  case state of
    NS_IDOWNLOADMANAGER_DOWNLOAD_QUEUED:
    begin
      PrependList(aDownload);
    end;
    NS_IDOWNLOADMANAGER_DOWNLOAD_FAILED,
    NS_IDOWNLOADMANAGER_DOWNLOAD_CANCELED,
//    NS_IDOWNLOADMANAGER_DOWNLOAD_BLOCKED,
    NS_IDOWNLOADMANAGER_DOWNLOAD_DIRTY,
    NS_IDOWNLOADMANAGER_DOWNLOAD_FINISHED:
    begin
      //DownloadCompleted(aDownload);
      //if aState = NS_IDOWNLOADMANAGER_DOWNLOAD_FINISHED then
      //  AutoRemoveAndClose(aDownload);
    end;
  end;
end;

procedure TDownloadListView.OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64; aDownload: nsIDownload); safecall;
var
  dlitem: TListItem;
begin
  dlitem := GetDownload(aDownload.id);
  if aDownload.PercentComplete=-1 then begin
    //不明
  end
  else begin
    //set to aDownload.PercentComplete %
  end;

  //Fire OnProgress event

end;
procedure TDownloadListView.OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar; aDownload: nsIDownload); safecall;
begin
  //スルー
end;

procedure TDownloadListView.OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aLocation: nsIURI; aDownload: nsIDownload); safecall;
begin
  //スルー
end;

procedure TDownloadListView.OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aState: PRUint32; aDownload: nsIDownload); safecall;
begin
  //スルー
end;

procedure TDownloadListView.OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult; aDownload: nsIDownload); safecall;
begin
  //スルー
end;

constructor TDownloadListView.Create(AOwner: TComponent);
var
  dm:nsIDownloadManager;
begin
  inherited Create(AOwner);
  (*NS_GetService('@mozilla.org/download-manager;1',nsIDownloadManager,dm);
  dm.AddListener(Self);
  Self.ViewStyle := vsReport;
  Self.Columns.Add;
  Self.Columns.Add;
  Self.Columns.Add;*)
end;

destructor TDownloadListView.Destroy;
var
  dm:nsIDownloadManager;
begin
  //NS_GetService('@mozilla.org/download-manager;1',nsIDownloadManager,dm);
  //dm.RemoveListener(Self);
  inherited;
end;

constructor TDLListItem.Create(AOwner: TListItems);
begin
  inherited Create(AOwner);
  //FId := 0;
end;
function TDLListItem.GetDownload:nsIDownload;
var
  dm:nsIDownloadManager;
begin
  (*NS_GetService('@mozilla.org/download-manager;1',nsIDownloadManager,dm);
  if FId<>0 then
    Result := dm.GetDownload(FId);*)
  Result:=FDownload;
end;

procedure TDLListItem.SetDownload(Value:nsIDownload);
var
  dm:nsIDownloadManager;
begin
  (*NS_GetService('@mozilla.org/download-manager;1',nsIDownloadManager,dm);
  if FId<>0 then
    Result := dm.GetDownload(FId);*)
  FDownload:=Value;
end;

initialization
  GRE_Startup();
finalization
  GRE_Shutdown();


end.
