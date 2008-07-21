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
 * The Initial Developer of the Original Code is Takanori Ito.
 * Portions created by the Initial Developer are Copyright (C) 2003
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
unit GeckoChromeWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CallbackInterfaces, nsXPCOM, nsTypes;

type
  TGeckoChromeForm = class(TForm,
                           IGeckoCreateWindowTarget,
                           nsIWebBrowserChrome,
                           nsIEmbeddingSiteWindow,
                           nsIWebProgressListener,
                           nsIInterfaceRequestor,
                           nsIWeakReference,
                           nsISupportsWeakReference)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private êÈåæ }
    FWebBrowser: nsIWebBrowser;
    FChromeFlags: Longword;

    // nsIWebBrowserChrome
    procedure SetStatus(statusType: PRUint32; const status: PWideChar); safecall;
    function GetWebBrowser(): nsIWebBrowser; safecall;
    procedure SetWebBrowser(aWebBrowser: nsIWebBrowser); safecall;
    function GetChromeFlags: PRUint32; safecall;
    procedure SetChromeFlags(aChromeFlags: PRUint32); safecall;
    procedure DestroyBrowserWindow(); safecall;
    procedure SizeBrowserTo(aCX: PRInt32; aCY: PRInt32); safecall;
    procedure ShowAsModal(); safecall;
    function IsWindowModal(): PRBool; safecall;
    procedure ExitModalEventLoop(aStatus: nsresult); safecall;
    // nsIEmbeddingSiteWindow
    procedure SetDimensions(flags: PRUint32; x, y, cx, cy: PRInt32); safecall;
    procedure GetDimensions(flags: Longword; out x, y, cx, cy: PRInt32); safecall;
    procedure SetFocus; reintroduce; safecall;
    function GetVisibility(): PRBool; safecall;
    procedure SetVisibility(Value: PRBool); safecall;
    function GetTitle(): PWideChar; safecall;
    procedure SetTitle(const Value: PWideChar); safecall;
    function GetSiteWindow: Pointer; safecall;
    // nsIWebProgressListener
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult); safecall;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32); safecall;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI); safecall;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar); safecall;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32); safecall;
    // nsIInterfaceRequestor
    procedure GetInterface(const uuid: TGUID; out Intf); safecall;
    // for nsIWeakReference
    procedure QueryReferent(const IID: TGUID; out Obj); safecall;
    // for nsISupportsWeakReference
    function GetWeakReference(): nsIWeakReference; safecall;

    procedure InitWebBrowser;
    procedure UpdateChrome;
    procedure ContentFinishedLoading;
  public
    { Public êÈåæ }
    function SafeCallException(Obj: TObject; Addr: Pointer): HResult; override;

    constructor CreateWithChromeFlags(AOwner: TComponent; aChromeFlags: Longword);

    // IGeckoCreateWindowTarget
    function DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome;
    function GetWebBrowserChrome: nsIWebBrowserChrome;
  end;

var
  GeckoChromeForm: TGeckoChromeForm;

implementation

{$R *.dfm}

uses
  nsXPCOMGlue, nsError, BrowserSupports;

constructor TGeckoChromeForm.CreateWithChromeFlags(AOwner: TComponent; AChromeFlags: Longword);
begin
  inherited Create(AOwner);
  FChromeFlags := aChromeFlags;
  UpdateChrome;
end;

procedure TGeckoChromeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TGeckoChromeForm.InitWebBrowser;
var
  base: nsIBaseWindow;
begin
  NS_CreateInstance(NS_WEBBROWSER_CID, nsIWebBrowser, FWebBrowser);

  FWebBrowser.SetContainerWindow(Self);

  base := FWebBrowser as nsIBaseWindow;
  base.InitWindow(Pointer(Handle), nil, 0, 0, ClientWidth, ClientHeight);
  base.Create;
  FWebBrowser.AddWebBrowserListener(Self, nsIWebProgressListener);
  base.SetVisibility(True);
end;

procedure TGeckoChromeForm.UpdateChrome;
begin
  {if (FChromeFlags and CHROME_WINDOW_BORDERS)<>0 then
    if (FChromeFlags and CHROME_WINDOW_RESIZE)<>0 then
      BorderStyle := bsSizeable
    else
      if (FChromeFlags and CHROME_OPENAS_DIALOG)<>0 then
        BorderStyle := bsDialog
      else
        BorderStyle := bsSingle
  else
    BorderStyle := bsNone;}
  BorderStyle := bsSizeable;

  {
  if (FChromeFlags and CHROME_WINDOW_CLOSE)<>0 then
    BorderIcons := BorderIcons + [biClose]
  else
    BorderIcons := BorderIcons - [biClose];
  }

  if (FChromeFlags and CHROME_SCROLLBARS)<>0 then
    AutoScroll := True
  else
    AutoScroll := False;

  {
  if (FChromeFlags and CHROME_TITLEBAR)<>0 then
    BorderIcons := BorderIcons + [biSystemMenu]
  else
    BorderIcons := BorderIcons - [biSystemMenu];
  }

end;

function TGeckoChromeForm.DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome;
begin
  //Result := nil;
end;

function TGeckoChromeForm.GetWebBrowserChrome: nsIWebBrowserChrome;
begin
  Result := Self;
end;

procedure TGeckoChromeForm.SetStatus(statusType: Longword; const status: PWideChar);
begin
end;

function TGeckoChromeForm.GetWebBrowser: nsIWebBrowser;
begin
  Result := FWebBrowser as nsIWebBrowser;
end;

procedure TGeckoChromeForm.SetWebBrowser(aWebBrowser: nsIWebBrowser);
begin
end;

function TGeckoChromeForm.GetChromeFlags: PRUint32;
begin
  Result := FChromeFlags;
end;

procedure TGeckoChromeForm.SetChromeFlags(aChromeFlags: Longword);
begin
  FChromeFlags := aChromeFlags;
  UpdateChrome;
end;

procedure TGeckoChromeForm.DestroyBrowserWindow;
begin
  Close;
end;

procedure TGeckoChromeForm.SizeBrowserTo(aCX, aCY: Integer);
var
  dx, dy: Integer;
begin
  dx := Width - ClientWidth;
  dy := Height - ClientHeight;
  SetBounds(Left, Top, aCX+dx, aCY+dy);
end;

procedure TGeckoChromeForm.ShowAsModal;
begin
  Visible := False;
  ShowModal;
end;

function TGeckoChromeForm.IsWindowModal: PRBool;
begin
  Result := False;
end;

procedure TGeckoChromeForm.ExitModalEventLoop(aStatus: PRUint32);
begin
  ModalResult := 1;
end;

procedure TGeckoChromeForm.SetDimensions(flags: Longword; x, y, cx, cy: Longint);
const
  FLAGS_POSITION   = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_OUTER;
var
  dx, dy: Integer;
begin
  dx := Width - ClientWidth;
  dy := Height - ClientHeight;

  if (flags and FLAGS_POSITION)<>0 then
  begin
    if (flags and FLAGS_SIZE_INNER)<>0 then
    begin
      Bounds(x, y, cx+dx, cy+dy);
    end else
    if (flags and FLAGS_SIZE_OUTER)<>0 then
    begin
      Bounds(x, y, cx, cy);
    end else
    begin
      Bounds(x, y, Width, Height);
    end;
  end else
  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    Bounds(Left, Top, cx+dx, cy+dy);
  end else
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    Bounds(Left, Top, cx, cy);
  end;
end;

procedure TGeckoChromeForm.GetDimensions(flags: Longword; out x, y, cx, cy: Longint);
const
  FLAGS_POSITION   = ns_IEmbeddingSiteWindow_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_OUTER;
begin
  if (flags and FLAGS_POSITION)<>0 then
  begin
    x := Left;
    y := Top;
  end;

  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    cx := ClientWidth;
    cy := ClientHeight;
  end else
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    cx := Width;
    cy := Height;
  end;
end;

procedure TGeckoChromeForm.SetFocus();
begin
end;

function TGeckoChromeForm.GetVisibility: PRBool;
begin
  Result := True;
end;

procedure TGeckoChromeForm.SetVisibility(Value: LongBool);
begin
  //Visible := Value;
end;

function TGeckoChromeForm.GetTitle: PWideChar;
begin
  Result := nil;
end;

procedure TGeckoChromeForm.SetTitle(const Value: PWideChar);
begin
  Caption := WideString(Value);
end;

function TGeckoChromeForm.GetSiteWindow: Pointer;
begin
  Result := Pointer(Handle);
end;

procedure TGeckoChromeForm.OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult);
begin
  if ((aStateFlags and NS_IWEBPROGRESSLISTENER_STATE_STOP)<>0) and
     ((aStateFlags and NS_IWEBPROGRESSLISTENER_STATE_IS_DOCUMENT)<>0) then
  begin
    ContentFinishedLoading();
  end;
end;

procedure TGeckoChromeForm.OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32);
begin
end;

procedure TGeckoChromeForm.OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI);
begin
end;

procedure TGeckoChromeForm.OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar);
begin
end;

procedure TGeckoChromeForm.OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32);
begin
end;


procedure TGeckoChromeForm.GetInterface(const uuid: TGUID; out Intf);
var
  domwin: nsIDOMWindow;
  rv: nsresult;
begin
  if IsEqualGUID(uuid, nsIDOMWindow) then
  begin
    if Assigned(FWebBrowser) then
    begin
      domwin := FWebBrowser.ContentDOMWindow;
      nsIDOMWindow(Intf) := domwin as nsIDOMWindow;
    end else
      raise EGeckoError.Create('GetInterface Error');
  end else
  begin
    rv := QueryInterface(uuid, Intf);
    if NS_FAILED(rv) then
      System.Error(reIntfCastError);
  end;
end;

procedure TGeckoChromeForm.QueryReferent(const IID: TGUID; out Obj);
var
  rv: nsresult;
begin
  rv := QueryInterface(IID, Obj);
  if NS_FAILED(rv) then
    raise EIntfCastError.Create('QueryReferent');
end;

function TGeckoChromeForm.GetWeakReference: nsIWeakReference;
begin
  Result := Self as nsIWeakReference;
end;

procedure TGeckoChromeForm.FormCreate(Sender: TObject);
begin
  InitWebBrowser;
end;

procedure TGeckoChromeForm.FormResize(Sender: TObject);
var
  baseWin: nsIBaseWindow;
begin
  //
  baseWin:=FWebBrowser as nsIBaseWindow;
  baseWin.SetPositionAndSize(0, 0, ClientWidth, ClientHeight, True);
  baseWin.SetVisibility(True);
end;

procedure TGeckoChromeForm.ContentFinishedLoading;
var
  contentWin: nsIDOMWindow;
begin
  try
    contentWin := FWebBrowser.ContentDOMWindow;
    contentWin.SizeToContent;
    Visible := True;
  except
  end;
end;

function TGeckoChromeForm.SafeCallException(Obj: TObject; Addr: Pointer): HResult;
begin
  if Obj is EIntfCastError then
    Result := E_NOINTERFACE
  else
    Result := E_FAIL;
end;

end.
