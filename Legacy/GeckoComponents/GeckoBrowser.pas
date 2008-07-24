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
 * Contributor(s): plus7 <ahya365@gmail.com>
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
unit GeckoBrowser;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, nsTypes, nsConsts, nsXPCOM, nsError,
  nsInit, nsGeckoStrings, CallbackInterfaces, nsXPCOMGlue, BrowserSupports,
  nsDocShell, nsMarkupDocumentViewer, nsDocumentCharsetInfo,
  nsDOMEvent, Dialogs;

resourcestring
  SGeckoBrowserInitError = '初期化に失敗しました。';
  SGeckoBrowserCannotGoBack = '履歴を戻ることが出来ません。';
  SGeckoBrowserCannotGoForward = '履歴を進むことが出来ません。';
  SGeckoBrowserLoadURIError = 'URI ''%s'' を読み込むことが出来ません。';
  SGeckoBrowserCannotReload = 'ページの再読み込みが出来ません。';

const
  LOAD_FLAGS_NONE = 0;
  LOAD_FLAGS_IS_REFRESH = 16;
  LOAD_FLAGS_IS_LINK = 32;
  LOAD_FLAGS_BYPASS_HISTORY = 64;
  LOAD_FLAGS_REPLACE_HISTORY = 128;
  LOAD_FLAGS_BYPASS_CACHE = 256;
  LOAD_FLAGS_BYPASS_PROXY = 512;
  LOAD_FLAGS_CHARSET_CHANGE = 1024;

type
  //TCtxMenuInfo = BrowserSupports.TCtxMenuInfo;
  //TCtxMenuFlags = BrowserSupports.TCtxMenuFlags;

  TCustomGeckoBrowser = class;
  TCustomGeckoBrowserChrome = class;
  TCustomGeckoBrowserListener = class;
  TGeckoBrowser = class;
  TGeckoBrowserChrome = class;
  TGeckoBrowserListener = class;

  TCtxMenuInfo = class;

  EGeckoBrowserError = class(EGeckoError)
  end;
  EGeckoBrowserNavigationError = class(EGeckoBrowserError)
  end;

  TGeckoBrowserContextMenu = procedure (Sender: TObject; aInfo: TCtxMenuInfo) of object;
  TGeckoBrowserStatusChange = procedure (Sender: TObject; aMessage: WideString) of object;
  TGeckoBrowserNewWindow = procedure (Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser) of object;
  TGeckoBrowserProgressChange = procedure (Sender: TObject; Progress: Integer; ProgressMax: Integer) of object;
  TGeckoBrowserTitleChange = procedure (Sender: TObject; const Text: WideString) of object;
  TGeckoBrowserVisibleChange = procedure (Sender: TObject; Vislble: Bool) of object;
  TGeckoBrowserLocationChange = procedure (Sender: TObject; const uri: AnsiString) of object;
  TGeckoBrowserStateFlagsChange = procedure (Sender: TObject; const aURI: String) of object;
  TGeckoBrowserDOMEventHandler = procedure (Sender: TObject; aEvent:nsIDOMEvent) of object;
  TGeckoBrowserMouseEventHandler = procedure (Sender: TObject; aEvent:nsIDOMMouseEvent) of object;
  TGeckoBrowserKeyEventHandler = procedure (Sender: TObject; aEvent:nsIDOMKeyEvent) of object;
  TGeckoBrowserHistoryMove = procedure (Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean) of object;
  TGeckoBrowserHistoryGoTo = procedure (Sender: TObject; aIndex: Longint; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean) of object;

  TGeckoBrowserHisoty = record
    URI: AnsiString;
    Title: WideString;
    IsSubFrame: Boolean;
  end;

    //TODO 2 -cTCustomGeckoBrowser: DocShell プロパティを追加
  TCustomGeckoBrowser = class(TCustomControl,
                              IGeckoCreateWindowTarget)
  private
    FWebBrowser: nsIWebBrowser;
    FListeners: TCustomGeckoBrowserListener;
    FChrome: TCustomGeckoBrowserChrome;

    // イベント
    // nsIWebProgressListener
    FOnStatusChange: TGeckoBrowserStatusChange;
    FOnProgressChange: TGeckoBrowserProgressChange;
    FOnLocationChange: TGeckoBrowserLocationChange;
    FOnDocumentBegin: TGeckoBrowserStateFlagsChange;
    FOnDocumentComplete: TGeckoBrowserStateFlagsChange;
    FOnDownloadBegin: TGeckoBrowserStateFlagsChange;
    FOnDownloadComplete: TGeckoBrowserStateFlagsChange;
    //FOnSecurityChange: TGeckoBrowserSecurityChange;
    // nsIEmbeddingSiteWindow
    FOnTitleChange: TGeckoBrowserTitleChange;
    FOnVisibleChange: TGeckoBrowserVisibleChange;
    // nsIContextMenuListener
    FOnContextMenu: TGeckoBrowserContextMenu;
    // nsIURIContentListener
    // nsISHistoryListener
    FOnGoBack: TGeckoBrowserHistoryMove;
    FOnGoForward: TGeckoBrowserHistoryMove;
    FOnGoToIndex: TGeckoBrowserHistoryGoTo;
    
    FOnNewWindow: TGeckoBrowserNewWindow;

    procedure InnerLoadURI(uri: WideString; Flags: PRUint32;
      referer: nsIURI; postData, headers: TStream);

    procedure SetChrome(aChrome: TCustomGeckoBrowserChrome);
    procedure SetListener(aListener: TCustomGeckoBrowserListener);

    procedure WMKeyDown(var Msg: TWMKeyDown); message CN_KEYDOWN;
    procedure WMKeyUp(var Msg: TMessage); message CN_CHAR;
    procedure WMEraseBkGnd(var Msg: TMessage); message WM_ERASEBKGND;
    function GetContentDocument: nsIDOMDocument;
    function GetContentWindow: nsIDOMWindow;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    function GetWebBrowserChrome: nsIWebBrowserChrome;
    function GetWebBrowserFind: nsIWebBrowserFind;
    function GetWebBrowserPrint: nsIWebBrowserPrint;
    function GetWebNavigation: nsIWebNavigation;
    function GetMarkupDocumentViewer: nsIMarkupDocumentViewer;
    function GetDocShell: nsIDocShell;
    function GetDocumentCharsetInfo: nsIDocumentCharsetInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadURI(const uri: WideString); overload;
    procedure LoadURI(const uri: WideString; const referer: String);
      overload;
    procedure LoadURIWithFlags(const uri: WideString; Flags: PRUint32);
      overload;
    procedure LoadURIWithFlags(const uri: WideString; Flags: PRUint32;
      referer: String); overload;
    procedure GoBack;
    procedure GoForward;
    procedure GotoIndex(aIndex: Integer);
    procedure Reload;
    procedure ReloadWithFlags(AFlags: PRUint32);
  protected
    procedure InitWebBrowser; virtual;
    procedure ShutdownWebBrowser; virtual;
    function DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome; virtual; abstract;
    // TControl
    procedure Resize; override; //plus7

    // TWinControl
    procedure CreateWnd; override;
    procedure DestroyWnd; override;

  protected
    property Chrome: TCustomGeckoBrowserChrome
        read FChrome write SetChrome;
    property Listener: TCustomGeckoBrowserListener
        read FListeners write SetListener;
  public
    property WebBrowser: nsIWebBrowser //begin plus7
        read FWebBrowser;
    property WebBrowserFind: nsIWebBrowserFind
        read GetWebBrowserFind;
    property WebBrowserPrint: nsIWebBrowserPrint
        read GetWebBrowserPrint;
    property WebNavigation: nsIWebNavigation
        read GetWebNavigation;
    property MarkupDocumentViewer: nsIMarkupDocumentViewer
        read GetMarkupDocumentViewer;
    property DocShell: nsIDocShell
          read GetDocShell;
    property DocumentCharsetInfo: nsIDocumentCharsetInfo
        read GetDocumentCharsetInfo;   //end plus7
    property ContentWindow: nsIDOMWindow
        read GetContentWindow;
    property ContentDocument: nsIDOMDocument
        read GetContentDocument;
    property CanGoBack: Boolean
        read GetCanGoBack;
    property CanGoForward: Boolean
        read GetCanGoForward;
    // イベント
    // nsIWebBrowserChrome
    property OnStatusChange: TGeckoBrowserStatusChange
        read FOnStatusChange write FOnStatusChange;
    property OnProgressChange: TGeckoBrowserProgressChange
        read FOnProgressChange write FOnProgressChange;
    property OnLocationChange: TGeckoBrowserLocationChange
        read FOnLocationChange write FOnLocationChange;
    property OnDocumentBegin: TGeckoBrowserStateFlagsChange
        read FOnDocumentBegin write FOnDocumentBegin;
    property OnDocumentComplete: TGeckoBrowserStateFlagsChange
        read FOnDocumentComplete write FOnDocumentComplete;
    property OnDownloadBegin: TGeckoBrowserStateFlagsChange
        read FOnDownloadBegin write FOnDownloadBegin;
    property OnDownloadComplete: TGeckoBrowserStateFlagsChange
        read FOnDownloadComplete write FOnDownloadComplete;

    // nsIEmbeddingSiteWindow
    property OnTitleChange: TGeckoBrowserTitleChange
      read FOnTitleChange write FOnTitleChange;
    property OnVisibleChange: TGeckoBrowserVisibleChange
      read FOnVisibleChange write FOnVisibleChange;
    // nsIContextMenuListener
    property OnContextMenu: TGeckoBrowserContextMenu
      read FOnContextMenu write FOnContextMenu;
    // nsISHistoryListener
    property OnGoBack:TGeckoBrowserHistoryMove
      read FOnGoBack write FOnGoBack;
    property OnGoForward:TGeckoBrowserHistoryMove
      read FOnGoForward write FOnGoForward;
    property OnGoToIndex:TGeckoBrowserHistoryGoTo
      read FOnGoToIndex write FOnGoToIndex;

    property OnNewWindow: TGeckoBrowserNewWindow
      read FOnNewWindow write FOnNewWindow;
  end;

  TCustomGeckoBrowserChrome = class(TInterfacedObject,
                                    nsIWebBrowserChrome,
                                    nsIWebBrowserChromeFocus,
                                    nsIEmbeddingSiteWindow)
  public
    //constructor Create;
    //destructor Destroy;
  protected
    // nsIWebBrowser
    procedure SetStatus(statusType: PRUint32; const status: PWideChar); virtual; safecall; abstract;
    function GetWebBrowser(): nsIWebBrowser; virtual; safecall; abstract;
    procedure SetWebBrowser(aWebBrowser: nsIWebBrowser); virtual; safecall; abstract;
    function GetChromeFlags(): PRUint32; virtual; safecall; abstract;
    procedure SetChromeFlags(aChromeFlags: PRUint32); virtual; safecall; abstract;
    procedure DestroyBrowserWindow(); virtual; safecall; abstract;
    procedure SizeBrowserTo(aCX: PRInt32; aCY: PRInt32); virtual; safecall; abstract;
    procedure ShowAsModal(); virtual; safecall; abstract;
    function IsWindowModal(): PRBool; virtual; safecall; abstract;
    procedure ExitModalEventLoop(aStatus: nsresult); virtual; safecall; abstract;
    // nsIWebBrowserChromeFocus
    procedure FocusNextElement(); virtual; safecall; abstract;
    procedure FocusPrevElement(); virtual; safecall; abstract;
    // nsIEmbeddingSiteWindow
    procedure SetDimensions(flags: PRUint32; x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32); virtual; safecall; abstract;
    procedure GetDimensions(flags: PRUint32; out x: PRInt32; out y: PRInt32; out cx: PRInt32; out cy: PRInt32); virtual; safecall; abstract;
    procedure nsIEmbeddingSiteWindow.SetFocus = ESWSetFocus;
    procedure ESWSetFocus; virtual; safecall; abstract;
    function GetVisibility(): PRBool; virtual; safecall; abstract;
    procedure SetVisibility(aVisibility: PRBool); virtual; safecall; abstract;
    function GetTitle(): PWideChar; virtual; safecall; abstract;
    procedure SetTitle(const aTitle: PWideChar); virtual; safecall; abstract;
    function GetSiteWindow(): Pointer; virtual; safecall; abstract;
  public
    function SafeCallException(obj: TObject; addr: Pointer): HRESULT; override;
  end;

  TCustomGeckoBrowserListener = class(TSupportsWeakReference,
                                      nsIWebProgressListener)
  public
    //constructor Create;
    //destructor Destroy;
  protected
    procedure AddWebBrowserListener(browser: nsIWebBrowser); safecall;
    procedure RemoveWebBrowserListener(browser: nsIWebBrowser); safecall;
    // nsIWebProgressListener
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult); virtual; safecall;  abstract;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32); virtual; safecall; abstract;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI); virtual; safecall;  abstract;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar); virtual; safecall; abstract;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32); virtual; safecall; abstract;
  public
    function SafeCallException(Obj: TObject; Addr: Pointer): HRESULT; override;
  end;

  TGeckoBrowser = class(TCustomGeckoBrowser, nsIDOMEventListener)
  protected
    FBrowser: nsIWebBrowser;
    FTitle: WideString;
    //ツールチップ
    FHint:THintWindow;
    //DOM イベントハンドラ
    FOnDOMLoad: TGeckoBrowserDOMEventHandler;
    FOnDOMClick: TGeckoBrowserMouseEventHandler;
    FOnDOMMouseUp: TGeckoBrowserMouseEventHandler;
    FOnDOMMouseDown: TGeckoBrowserMouseEventHandler;
    FOnDOMMouseMove: TGeckoBrowserMouseEventHandler;
    FOnDOMMouseScroll: TGeckoBrowserMouseEventHandler;
    FOnDOMKeyUp: TGeckoBrowserKeyEventHandler;
    FOnDOMKeyDown: TGeckoBrowserKeyEventHandler;
    FOnDOMKeyPress: TGeckoBrowserKeyEventHandler;
    FOnDOMLinkAdded: TGeckoBrowserDOMEventHandler;
    FOnDOMDragOver: TGeckoBrowserDOMEventHandler;
    FOnDOMDragGesture: TGeckoBrowserDOMEventHandler;
    FOnDOMDragDrop: TGeckoBrowserDOMEventHandler;
    FOnDOMDragExit: TGeckoBrowserDOMEventHandler;
    FOnDOMFocus: TGeckoBrowserDOMEventHandler;
    //最後にフォーカスされた要素
    FLastFocused: nsIDOMElement;

    function DoCreateChromeWindow(
      chromeFlags: Longword): nsIWebBrowserChrome; override;
    // nsIDOMEventListener by plus7
    procedure HandleEvent(event: nsIDOMEvent); safecall;
    function GetURI():String;
  public
    constructor Create(AOwner: TComponent); override;
    procedure InitWebBrowser; override; //plus7
    procedure ShutdownWebBrowser; override; //plus7
    property Title: WideString read FTitle;
    property URI: String read GetURI;
    property OnDOMLoad: TGeckoBrowserDOMEventHandler
      read FOnDOMLoad write FOnDOMLoad;
    property OnDOMClick: TGeckoBrowserMouseEventHandler
      read FOnDOMClick write FOnDOMClick;
    property OnDOMMouseUp: TGeckoBrowserMouseEventHandler
      read FOnDOMMouseUp write FOnDOMMouseUp;
    property OnDOMMouseDown: TGeckoBrowserMouseEventHandler
      read FOnDOMMouseDown write FOnDOMMouseDown;
    property OnDOMMouseMove: TGeckoBrowserMouseEventHandler
      read FOnDOMMouseMove write FOnDOMMouseMove;
    property OnDOMKeyUp: TGeckoBrowserKeyEventHandler
      read FOnDOMKeyUp write FOnDOMKeyUp;
    property OnDOMKeyDown: TGeckoBrowserKeyEventHandler
      read FOnDOMKeyDown write FOnDOMKeyDown;
    property OnDOMKeyPress: TGeckoBrowserKeyEventHandler
      read FOnDOMKeyPress write FOnDOMKeyPress;
    property OnDOMMouseScroll: TGeckoBrowserMouseEventHandler
      read FOnDOMMouseScroll write FOnDOMMouseScroll;
    property OnDOMLinkAdded: TGeckoBrowserDOMEventHandler
      read FOnDOMLinkAdded write FOnDOMLinkAdded;
    property OnDOMDragOver: TGeckoBrowserDOMEventHandler
      read FOnDOMDragOver write FOnDOMDragOver;
    property OnDOMDragGesture: TGeckoBrowserDOMEventHandler
      read FOnDOMDragGesture write FOnDOMDragGesture;
    property OnDOMDragDrop: TGeckoBrowserDOMEventHandler
      read FOnDOMDragDrop write FOnDOMDragDrop;
    property OnDOMDragExit: TGeckoBrowserDOMEventHandler
      read FOnDOMDragExit write FOnDOMDragExit;
    property OnDOMFocus: TGeckoBrowserDOMEventHandler
      read FOnDOMFocus write FOnDOMFocus;
  published
    // TWinControl
    property Align;
    property TabOrder;
    property TabStop default True;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    //property BorderWidth;

    property ContentDocument;
    property ContentWindow;
    property CanGoBack;
    property CanGoForward;
    
    property OnLocationChange;
    property OnProgressChange;
    property OnStatusChange;
    property OnTitleChange;
    property OnVisibleChange;
    property OnContextMenu;
    property OnNewWindow;
  end;

  TGeckoBrowserChrome = class(TCustomGeckoBrowserChrome,
                              nsIInterfaceRequestor,
                              nsIContextMenuListener2,
                              nsITooltipListener)
  private
    FBrowser: TGeckoBrowser;
  protected
    constructor Create(Browser: TGeckoBrowser);
  public
    destructor Destroy; override;
  protected
    // nsIWebBrowserChrome
    procedure SetStatus(statusType: PRUint32; const status: PWideChar); override;
    function GetWebBrowser(): nsIWebBrowser; override;
    procedure SetWebBrowser(aWebBrowser: nsIWebBrowser); override;
    function GetChromeFlags(): PRUint32; override;
    procedure SetChromeFlags(aChromeFlags: PRUint32); override;
    procedure DestroyBrowserWindow(); override;
    procedure SizeBrowserTo(aCX: PRInt32; aCY: PRInt32); override;
    procedure ShowAsModal(); override;
    function IsWindowModal(): PRBool; override;
    procedure ExitModalEventLoop(aStatus: nsresult); override;
    // nsIWebBrowserChromeFocus
    procedure FocusNextElement(); override;
    procedure FocusPrevElement(); override;
    // nsIEmbeddingSiteWindow
    procedure SetDimensions(flags: PRUint32; x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32); override;
    procedure GetDimensions(flags: PRUint32; out x: PRInt32; out y: PRInt32; out cx: PRInt32; out cy: PRInt32); override;
    procedure ESWSetFocus(); override;
    function GetVisibility(): PRBool; override;
    procedure SetVisibility(aVisibility: PRBool); override;
    function GetTitle(): PWideChar; override;
    procedure SetTitle(const aTitle: PWideChar); override;
    function GetSiteWindow(): Pointer; override;
    // nsIInterfaceRequestor
    procedure GetInterface(const uuid: TGUID; out _result); safecall;
    // nsIContextMenuListener2
    procedure OnShowContextMenu(aContextFlags: PRUint32;
      aUtils: nsIContextMenuInfo); safecall;
    // nsITooltipListener by plus7
    procedure OnShowTooltip(aXCoords: PRInt32; aYCoords: PRInt32; const aTipText: PWideChar); safecall;
    procedure OnHideTooltip(); safecall;
  end;

  //TODO: Implement nsIURIContentListener(by plus7)
  TGeckoBrowserListener = class(TCustomGeckoBrowserListener,
                                nsISHistoryListener)
  private
    FBrowser: TGeckoBrowser;
  protected
    constructor Create(browser: TGeckoBrowser);
    // nsIWebProgressListener
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult); override;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt32; aMaxSelfProgress: PRInt32; aCurTotalProgress: PRInt32; aMaxTotalProgress: PRInt32); override;
    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; location: nsIURI); override;
    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar); override;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; state: PRUint32); override;
    // nsISHistoryListener
    procedure OnHistoryNewEntry(aNewURI: nsIURI); safecall;
    function OnHistoryGoBack(aBackURI: nsIURI): PRBool; safecall;
    function OnHistoryGoForward(aForwardURI: nsIURI): PRBool; safecall;
    function OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: PRUint32): PRBool; safecall;
    function OnHistoryGotoIndex(aIndex: PRInt32; aGotoURI: nsIURI): PRBool; safecall;
    function OnHistoryPurge(aNumEntries: PRInt32): PRBool; safecall;
    // nsIURIContentListener
    function OnStartURIOpen(aURI: nsIURI): PRBool; safecall;
    function DoContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; aRequest: nsIRequest; out aContentHandler: nsIStreamListener): PRBool; safecall;
    function IsPreferred(const aContentType: PAnsiChar; out aDesiredContentType: PAnsiChar): PRBool; safecall;
    function CanHandleContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; out aDesiredContentType: PAnsiChar): PRBool; safecall;
    function GetLoadCookie(): nsISupports; safecall;
    procedure SetLoadCookie(aLoadCookie: nsISupports); safecall;
    property LoadCookie: nsISupports read GetLoadCookie write SetLoadCookie;
    function GetParentContentListener(): nsIURIContentListener; safecall;
    procedure SetParentContentListener(aParentContentListener: nsIURIContentListener); safecall;
    property ParentContentListener: nsIURIContentListener read GetParentContentListener write SetParentContentListener;
  end;

  (*TGeckoBrowser = class(TCustomControl,
                        nsISHistoryListener)
  private
    { Private 宣言 }
    FWebBrowser: nsIWebBrowser;
    FDocTitle: WideString;

    // イベント
    FOnNewWindow: TGeckoBrowserNewWindow;

    // nsISHistoryListener
    function OnHistoryNewEntry(aNewURI: nsIURI): Longword; stdcall;
    function OnHistoryGoBack(aBackURI: nsIURI; out aContinue: LongBool): Longword; stdcall;
    function OnHistoryGoForward(aForwardURI: nsIURI; out aContinue: LongBool): Longword; stdcall;
    function OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: Longword; out aContinue: LongBool): Longword; stdcall;
    function OnHistoryGotoIndex(aIndex: Longint; aGotoURI: nsIURI; out aContinue: LongBool): Longword; stdcall;
    function OnHistoryPurge(aNumEntries: Longint; out aContinue: LongBool): Longword; stdcall;

    function GetHistoryEntry(index: Integer): TGeckoBrowserHisoty;
    function GetHistoryPosition: Integer;
    function GetHistoryCount: Integer;
  protected
    { Protected 宣言 }
    // TControl
    procedure Resize; override;

  public
    { Public 宣言 }
    // ナビゲーション
    // nsIWebNavigation
    procedure GotoIndex(aIndex: Integer);

    property HistoryEntry[index: Integer]: TGeckoBrowserHisoty read GetHistoryEntry;
    property HistoryPosition: Integer read GetHistoryPosition;
    property HistoryCount: Integer read GetHistoryCount;
  published
    { Published 宣言 }
    // TWinControl
    property Align;
    property TabOrder;
    property TabStop default True;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    //property BorderWidth;

    property OnCanResize;
    //property OnCanMove;

    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;

    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;

    property OnStatusTextChange: TGeckoBrowserStatusChange read FOnStatusChange write FOnStatusChange;
    property OnNewWindow: TGeckoBrowserNewWindow read FOnNewWindow write FOnNewWindow;
    property OnProgressChange: TGeckoBrowserProgressChange read FOnProgressChange write FOnProgressChange;
    property OnTitleChange: TGeckoBrowserTitleChange read FOnTitleChange write FOnTitleChange;
    property OnVisible: TGeckoBrowserVisibleChange read FOnVisibleChange write FOnVisibleChange;
    property OnLocationChange: TGeckoBrowserLocationChange read FOnLocationChange write FOnLocationChange;
  end;*)

  TCtxMenuFlags = set of (cmfLink,
                          cmfImage,
                          cmfDocument,
                          cmfText,
                          cmfInput,
                          cmfBGImage );

  TCtxMenuInfo = class(TObject)
  private
    FInfo: nsIContextMenuInfo;
    FFlags: TCtxMenuFlags;

    // function GetMouseEvent: nsIDOMEvent;
    // function GetTargetNode: nsIDOMNode;
    function GetAssociatedLink: WideString;
    // function GetImageContainer: imgContainer;
    // function GetImageSrc: nsIURI;
    function GetImageURL: AnsiString;
    // function GetBGImageContainer: imgIContainer;
    // function GetBGImageSrc: nsIURI;
    function GetBGImageURL: AnsiString;
    function GetMouseEvent: nsIDOMEvent;
    function GetTargetNode: nsIDOMNode;
    function GetImageContainer: imgIContainer;
    function GetImageSrc: nsIURI;
    function GetBGImageContainer: imgIContainer;
    function GetBGImageSrc: nsIURI;
  public
    constructor Create(flags: Longword; info: nsIContextMenuInfo);

    property Flags: TCtxMenuFlags read FFlags;
    property AssociatedLink: WideString read GetAssociatedLink;
    property ImageURL: AnsiString read GetImageURL;
    property BGImageURL: AnsiString read GetBGImageURL;
    property MouseEvent: nsIDOMEvent read GetMouseEvent;
    property TargetNode: nsIDOMNode read GetTargetNode;
    property ImageContainer: imgIContainer read GetImageContainer;
    property ImageSrc: nsIURI read GetImageSrc;
    property BGImageContainer: imgIContainer read GetBGImageContainer;
    property BGImageSrc: nsIURI read GetBGImageSrc;
    property ContextMenuInfo: nsIContextMenuInfo read FInfo;
  end;

procedure Register;

// {$R *.dcr}

implementation

uses
  {nsError,} nsStream, nsMemory, nsNetUtil, {nsInit,}
  Forms;

procedure Register;
begin
  RegisterComponents('Gecko', [TGeckoBrowser]);
end;

(*
// nsISHistoryListener
function TGeckoBrowser.OnHistoryNewEntry(aNewURI: nsIURI): Longword;
begin
  Result := NS_OK;
end;

function TGeckoBrowser.OnHistoryGoBack(aBackURI: nsIURI; out aContinue: LongBool): Longword;
begin
  if @aContinue = nil then
  begin
    Result := NS_ERROR_FAILURE;
    Exit;
  end;
  
  if (HistoryPosition>0) then
    aContinue := True
  else
    aContinue := False;
  Result := NS_OK;
end;

function TGeckoBrowser.OnHistoryGoForward(aForwardURI: nsIURI; out aContinue: LongBool): Longword;
begin
  if @aContinue = nil then
  begin
    Result := NS_ERROR_FAILURE;
    Exit;
  end;

  if (HistoryPosition+1)<HistoryCount then
    aContinue := True
  else
    aContinue := False;

  Result := NS_OK;
end;

function TGeckoBrowser.OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: Longword; out aContinue: LongBool): Longword;
begin
  if @aContinue = nil then
  begin
    Result := NS_ERROR_FAILURE;
    Exit;
  end;

  aContinue := True;
  Result := NS_OK;
end;

function TGeckoBrowser.OnHistoryGotoIndex(aIndex: Longint; aGotoURI: nsIURI; out aContinue: LongBool): Longword;
begin
  if @aContinue = nil then
  begin
    Result := NS_ERROR_FAILURE;
    Exit;
  end;

  if aIndex in [0..HistoryCount-1] then
    aContinue := True
  else
    aContinue := False;

  Result := NS_OK;
end;

function TGeckoBrowser.OnHistoryPurge(aNumEntries: Longint; out aContinue: LongBool): Longword;
begin
  if @aContinue = nil then
  begin
    Result := NS_ERROR_FAILURE;
    Exit;
  end;

  aContinue := False;
  Result := NS_OK;
end;

// TControl 継承
procedure TGeckoBrowser.Resize;
var
  BaseWindow: nsIBaseWindow;
  rc: TRect;
begin
  inherited Resize;

  if not Assigned(FWebBrowser) then Exit;
  BaseWindow := FWebBrowser as nsIBaseWindow;
  rc := ClientRect;
  BaseWindow.SetPositionAndSize(rc.Left, rc.Top, rc.Right-rc.left, rc.Bottom-rc.Top, False);
end;

procedure TGeckoBrowser.GotoIndex(aIndex: Integer);
var
  nav: nsIWebNavigation;
begin
  if not Supports(FWebBrowser, nsIWebNavigation, nav) then Exit;
  nav.GotoIndex(aIndex);
end;

function TGeckoBrowser.GetHistoryEntry(index: Integer): TGeckoBrowserHisoty;
var
  rv: Cardinal;
  nav: nsIWebNavigation;
  history: nsISHistory;
  entry: nsIHistoryEntry;
  str: IInterfacedCString;
  wstr: PWideChar;
  uri: nsIURI;
  bool: LongBool;
begin
  Result.URI := '';
  Result.Title := '';
  Result.IsSubFrame := False;

  rv := FWebBrowser.QueryInterface(nsIWebNavigation, nav);
  if NS_FAILED(rv) then Exit;

  rv := nav.GetSessionHistory(history);
  if NS_FAILED(rv) then Exit;

  rv := history.GetEntryAtIndex(index, False, entry);
  if NS_FAILED(rv) then Exit;

  rv := entry.GetURI(uri);
  if NS_FAILED(rv) then Exit;

  str := NewCString;
  rv := uri.GetSpec(str.ACString);
  if NS_FAILED(rv) then Exit;

  rv := entry.GetTitle(wstr);
  if NS_FAILED(rv) then Exit;

  rv := entry.GetIsSubFrame(bool);
  if NS_FAILED(rv) then Exit;

  Result.URI := str.ToString;
  Result.Title := WideString(wstr);
  Result.IsSubFrame := bool;

  nsMemory.Free(wstr);
end;

function TGeckoBrowser.GetHistoryPosition: Integer;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
begin
  Result := -1;
  if NS_FAILED(FWebBrowser.QueryInterface(nsIWebNavigation, nav)) then Exit;
  if NS_FAILED(nav.GetSessionHistory(history)) then Exit;
  history.GetIndex(Result);
end;

function TGeckoBrowser.GetHistoryCount: Integer;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
begin
  Result := 0;
  if NS_FAILED(FWebBrowser.QueryInterface(nsIWebNavigation, nav)) then Exit;
  if NS_FAILED(nav.GetSessionHistory(history)) then Exit;
  history.GetCount(Result);
end;

*)

function TCustomGeckoBrowserChrome.SafeCallException(obj: TObject; addr: Pointer): HRESULT;
begin
  Result := E_FAIL;
end;

procedure TCustomGeckoBrowserListener.AddWebBrowserListener(browser: nsIWebBrowser);
var
  weak: nsIWeakReference;
  procedure FindAndAddListener(cls: TClass);
  var
    table: PInterfaceTable;
    i: Integer;
  begin
    table := cls.GetInterfaceTable;
    if Assigned(table) then
      for i:=0 to table.EntryCount-1 do
        browser.AddWebBrowserListener(weak, table.Entries[i].IID);
    cls := cls.ClassParent;
    if Assigned(cls) then
      FindAndAddListener(cls);
  end;
begin
  weak := GetWeakReference;
  FindAndAddListener(ClassType);
end;

procedure TCustomGeckoBrowserListener.RemoveWebBrowserListener(browser: nsIWebBrowser);
var
  weak: nsIWeakReference;
  procedure FindAndRemoveListener(cls: TClass);
  var
    table: PInterfaceTable;
    i: Integer;
  begin
    table := cls.GetInterfaceTable;
    if Assigned(table) then
      for i:=0 to table.EntryCount-1 do
        browser.RemoveWebBrowserListener(weak, table.Entries[i].IID);
    cls := cls.ClassParent;
    if Assigned(cls) then
      FindAndRemoveListener(cls);
  end;
begin
  weak := GetWeakReference;
  FindAndRemoveListener(ClassType);
end;

function TCustomGeckoBrowserListener.SafeCallException(
                Obj: TObject; Addr: Pointer): HResult;
begin
  Result := HRESULT(NS_ERROR_FAILURE);
end;

constructor TCustomGeckoBrowser.Create(AOwner: TComponent);
var
  rv: Longword;
begin
  inherited;

  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.Create');
  {$ENDIF}
  if not (csDesigning in ComponentState) then
  begin
    rv := GRE_Startup;
    if NS_FAILED(rv) then
      raise EGeckoBrowserError.CreateRes(
        PResStringRec(@SGeckoBrowserInitError));
    AddCreateWindowTarget(Self);
  end;
end;

destructor TCustomGeckoBrowser.Destroy;
begin
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.Destroy');
  {$ENDIF}
  if not (csDesigning in ComponentState) then
  begin
    RemoveCreateWindowTarget(Self);
    ShutdownWebBrowser;
  end;

  //FChrome.Free;
  //FListeners.Free;
  Chrome := nil;
  Listener := nil;

  inherited;
end;

// TControl 継承
procedure TCustomGeckoBrowser.Resize; //plus7
var
  BaseWindow: nsIBaseWindow;
  rc: TRect;
begin
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.Resize');
  {$ENDIF}
  inherited Resize;

  if not Assigned(FWebBrowser) then Exit;
  BaseWindow := FWebBrowser as nsIBaseWindow;
  rc := ClientRect;
  BaseWindow.SetPositionAndSize(rc.Left, rc.Top, rc.Right-rc.left, rc.Bottom-rc.Top, False);
end;

// TWinControl 継承
procedure TCustomGeckoBrowser.CreateWnd;
begin
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.CreateWnd');
  {$ENDIF}
  inherited CreateWnd;

  if not (csDesigning in ComponentState) then
  begin
    InitWebBrowser;
    LoadURI('about:blank'); //plus7
  end;
end;

procedure TCustomGeckoBrowser.DestroyWnd;
begin
  inherited DestroyWnd;
  {$IFDEF DEBUG}
  OutputDebugString('TGeckoBrowser.DestroyWnd');
  {$ENDIF}
end;

procedure TCustomGeckoBrowser.GoBack;
begin
  try
    (FWebBrowser as nsIWebNavigation).GoBack;
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotGoBack));
  end;
end;

procedure TCustomGeckoBrowser.GotoIndex(aIndex: Integer); //plus7
begin
  if Assigned(FWebBrowser) then
  WebNavigation.GotoIndex(aIndex);
end;

procedure TCustomGeckoBrowser.GoForward;
begin
  try
    (FWebBrowser as nsIWebNavigation).GoForward;
  except
    raise EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotGoForward));
  end;
end;

procedure TCustomGeckoBrowser.InitWebBrowser;
var
  baseWin: nsIBaseWindow;
  focus: nsIWebBrowserFocus;
  rc: TRect;
begin

  // WindowCreatorの初期化
  if not InitWindowCreator then
    raise EGeckoBrowserError.CreateRes(PResStringRec(@SGeckoBrowserInitError));

  // ブラウザオブジェクトの初期化
  NS_CreateInstance(NS_WEBBROWSER_CID, nsIWebBrowser, FWebBrowser);

  try
    // ブラウザウィンドウの初期化
    FWebBrowser.ContainerWindow := FChrome;
    baseWin := FWebBrowser as nsIBaseWindow;

    rc := ClientRect;
    baseWin.InitWindow(Pointer(Handle),
                       nil,
                       rc.Left,
                       rc.Top,
                       rc.Right-rc.Left,
                       rc.Bottom-rc.Top);
    baseWin.Create();

    // Listener の登録
    //FWebBrowser.AddWebBrowserListener(Self, nsIWebProgressListener);
    //FWebBrowser.AddWebBrowserListener(Self, nsISHistoryListener);
    FListeners.AddWebBrowserListener(FWebBrowser);

    // ブラウザの可視化
    baseWin.SetVisibility(True);
    // フォーカス
    focus := FWebBrowser as nsIWebBrowserFocus;
    focus.Activate;
  except
    raise EGeckoBrowserError.CreateRes(PResStringRec(@SGeckoBrowserInitError));
  end;
end;

procedure TCustomGeckoBrowser.InnerLoadURI(uri: WideString;
  Flags: PRUint32; referer: nsIURI; postData, headers: TStream);
var
  nav: nsIWebNavigation;
  post: nsIInputStream;
  head: nsIInputStream;
begin
  try
    HandleNeeded; //plus7
    nav := FWebBrowser as nsIWebNavigation;
    if Assigned(postData) then
      post := NS_NewInputStreamFromTStream(postData, True);
    if Assigned(headers) then
      head := NS_NewInputStreamFromTStream(headers, True);
    if (nav<>nil) then nav.LoadURI(PWideChar(uri), Flags, referer, post, head);
  except
    raise EGeckoBrowserNavigationError.CreateResFmt(
      PResStringRec(@SGeckoBrowserLoadURIError),
      [String(uri)]);
  end;
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString);
begin
  InnerLoadURI(uri, 0, nil, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURI(const uri: WideString;
  const referer: String);
var
  ref: nsIURI;
  refStr: IInterfacedCString;
begin
  refStr := NewCString(referer);
  ref := NS_NewURI(refStr.ACString);
  InnerLoadURI(uri, 0, ref, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString;
  Flags: PRUint32);
begin
  InnerLoadURI(uri, Flags, nil, nil, nil);
end;

procedure TCustomGeckoBrowser.LoadURIWithFlags(const uri: WideString;
  Flags: PRUint32; referer: String);
var
  ref: nsIURI;
  refStr: IInterfacedCString;
begin
  if (referer='') then InnerLoadURI(uri, Flags, nil, nil, nil)
  else begin
    refStr := NewCString(referer);
    ref := NS_NewURI(refStr.ACString);
    InnerLoadURI(uri, Flags, ref, nil, nil);
  end;
end;

procedure TCustomGeckoBrowser.Reload;
begin
  ReloadWithFlags(NS_IWEBNAVIGATION_LOAD_FLAGS_NONE);
end;

procedure TCustomGeckoBrowser.ReloadWithFlags(AFlags: PRUint32);
var
  nav: nsIWebNavigation;
begin
  try
    nav := FWebBrowser as nsIWebNavigation;
    nav.Reload(AFlags);
  except
    EGeckoBrowserNavigationError.CreateRes(
      PResStringRec(@SGeckoBrowserCannotReload));
  end;
end;

procedure TCustomGeckoBrowser.ShutdownWebBrowser;
begin
  if Assigned(FWebBrowser) then
  begin
    //FListeners.RemoveWebBrowserListener(FWebBrowser);
    FWebBrowser.SetContainerWindow(nil);
    FWebBrowser := nil;
  end;
end;

procedure TCustomGeckoBrowser.SetChrome(aChrome: TCustomGeckoBrowserChrome);
var
  old: TCustomGeckoBrowserChrome;
begin
  old := FChrome;
  FChrome := aChrome;
  if Assigned(FChrome) then
    FChrome._AddRef;
  if Assigned(old) then old._Release;
end;

procedure TCustomGeckoBrowser.SetListener(aListener: TCustomGeckoBrowserListener);
var
  old: TCustomGeckoBrowserListener;
begin
  old := FListeners;
  FListeners := aListener;
  if Assigned(FListeners) then
    FListeners._AddRef;
  if Assigned(old) then old._Release;
end;

procedure TCustomGeckoBrowser.WMKeyDown(var Msg: TWMKeyDown);
begin
  if Msg.CharCode <> 9 then
    inherited;
end;

procedure TCustomGeckoBrowser.WMKeyUp(var Msg: TMessage);
begin

end;

constructor TGeckoBrowserChrome.Create(Browser: TGeckoBrowser);
begin
  inherited Create;
  FBrowser := Browser;
end;

destructor TGeckoBrowserChrome.Destroy;
begin
  inherited Destroy;
end;

procedure TGeckoBrowserChrome.SetStatus(
                statusType: PRUint32;
                const status: PWideChar);
begin
  {$IFDEF DEBUG}
  OutputDebugString(PChar(
    'GeckoBrowser.SetStatus('+status+')'
  ));
  {$ENDIF}
  if Assigned(FBrowser.OnStatusChange) then
    FBrowser.OnStatusChange(FBrowser, status);
end;

function TGeckoBrowserChrome.GetWebBrowser
                : nsIWebBrowser;
begin
  Result := FBrowser.FWebBrowser;
end;

procedure TGeckoBrowserChrome.SetWebBrowser(
                aWebBrowser: nsIWebBrowser);
begin
  FBrowser.FWebBrowser := aWebBrowser;
end;

function TGeckoBrowserChrome.GetChromeFlags
                : PRUint32;
begin
  //TODO 2 -cTGeckoBrowserChrome: Chrome フラグの扱いをどうしようか
  Result := NS_IWEBBROWSERCHROME_CHROME_DEFAULT;
end;

procedure TGeckoBrowserChrome.SetChromeFlags(
                aChromeFlags: PRUint32);
begin
end;

procedure TGeckoBrowserChrome.DestroyBrowserWindow;
begin
  //TODO 2 -cTGeckoBrowserChrome: TGeckoBrowserChrome.OnDestroyBrowser イベントの追加
end;

procedure TGeckoBrowserChrome.SizeBrowserTo(
                aCX: PRInt32;
                aCY: PRInt32);
begin
  FBrowser.Width := aCX;
  FBrowser.Height:= aCY;
end;

procedure TGeckoBrowserChrome.ShowAsModal;
begin
end;

function TGeckoBrowserChrome.IsWindowModal
                : PRBool;
begin
  Result := False;
end;

procedure TGeckoBrowserChrome.ExitModalEventLoop(
                aStatus: nsresult);
begin
end;

procedure TGeckoBrowserChrome.SetDimensions(
                flags: PRUint32;
                x: PRInt32;
                y: PRInt32;
                cx: PRInt32;
                cy: PRInt32);
const
  FLAGS_POSITION   = ns_IEmbeddingSiteWindow_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = ns_IEmbeddingSiteWindow_DIM_FLAGS_SIZE_OUTER;
var
  bounds: TRect;
  clientrect: TRect;
  w, h: Integer;
begin
  bounds := FBrowser.BoundsRect;
  clientrect := FBrowser.ClientRect;
  w := bounds.Right - bounds.Left;
  h := bounds.Bottom - bounds.Top;
  if (flags and FLAGS_POSITION)<>0 then
  begin
    if (flags and FLAGS_SIZE_INNER)<>0 then
    begin
      SetRect(bounds, x, y, x+(w-clientrect.Right)+cx, y+(h-clientrect.Bottom)+cy);
    end else
    if (flags and FLAGS_SIZE_OUTER)<>0 then
    begin
      SetRect(bounds, x, y, x+cx, y+cy);
    end else
    begin
      SetRect(bounds, x, y, x+w, y+h);
    end;
  end else
  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    bounds.Right := bounds.Left + x+(w-clientrect.Right)+cx;
    bounds.Bottom := bounds.Top + y+(h-clientrect.Bottom)+cy;
  end else
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    bounds.Right := bounds.Left + cx;
    bounds.Bottom := bounds.Top + cy;
  end;
  FBrowser.BoundsRect := bounds;
end;

procedure TGeckoBrowserChrome.GetDimensions(
                flags: PRUint32;
                out x: PRInt32;
                out y: PRInt32;
                out cx: PRInt32;
                out cy: PRInt32);
const
  FLAGS_POSITION   = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_POSITION;
  FLAGS_SIZE_INNER = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_SIZE_INNER;
  FLAGS_SIZE_OUTER = NS_IEMBEDDINGSITEWINDOW_DIM_FLAGS_SIZE_OUTER;
begin
  if (flags and FLAGS_POSITION)<>0 then
  begin
    x := FBrowser.Left;
    y := FBrowser.Top;
  end;

  if (flags and FLAGS_SIZE_INNER)<>0 then
  begin
    cx := FBrowser.ClientWidth;
    cy := FBrowser.ClientHeight;
  end;
  if (flags and FLAGS_SIZE_OUTER)<>0 then
  begin
    cx := FBrowser.Width;
    cy := FBrowser.Height;
  end;
end;

procedure TGeckoBrowserChrome.ESWSetFocus;
begin
  if FBrowser.Enabled then FBrowser.SetFocus;
end;

function TGeckoBrowserChrome.GetVisibility: PRBool;
begin
  // TODO 1 -cTGeckoBrowserChrome: TGeckoBrowserChrome.GetVisibility はどうすべきか
  Result := True;
end;

procedure TGeckoBrowserChrome.SetVisibility(
                aVisibility: PRBool);
begin
  //TODO 1 -cTGeckoBrowserChrome: TGeckoBrowserChrome.SetVisibility の実装
end;

function TGeckoBrowserChrome.GetTitle: PWideChar;
var
  pstr: PWideChar;
  title: WideString;
  len: Integer;
begin
  title := FBrowser.FTitle;
  len := Length(title);
  pstr := PWideChar(title);
  Result := nsMemory.Clone(pstr, (len+1)*2);
  if not Assigned(Result) then
    OutOfMemoryError;
end;

procedure TGeckoBrowserChrome.SetTitle(
                const aTitle: PWideChar);
begin
  FBrowser.FTitle := aTitle;
  if Assigned(FBrowser.OnTitleChange) then
    FBrowser.OnTitleChange(FBrowser, FBrowser.FTitle);
end;

function TGeckoBrowserChrome.GetSiteWindow: Pointer;
begin
  Result := Pointer(FBrowser.Handle);
end;

constructor TGeckoBrowserListener.Create(browser: TGeckoBrowser);
begin
  inherited Create;
  FBrowser := browser;
end;

procedure TGeckoBrowserListener.OnStateChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aStateFlags: PRUint32;
                aStatus: PRUint32);
{$IFDEF DEBUG}

{$ENDIF}
var
  uri: nsIURI;
  str: IInterfacedCString;
  channel: nsIChannel;
const
  STATE_IS_DOCUMENT = NS_IWEBPROGRESSLISTENER_STATE_IS_DOCUMENT;
  STATE_IS_NETWORK  = NS_IWEBPROGRESSLISTENER_STATE_IS_NETWORK;
  STATE_START       = NS_IWEBPROGRESSLISTENER_STATE_START;
  STATE_STOP        = NS_IWEBPROGRESSLISTENER_STATE_STOP;
begin
  if (aStateFlags and STATE_IS_DOCUMENT)<>0 then
  begin
    // 状態の変化はドキュメントに対してである
    if (aStateFlags and STATE_START)<>0 then
    begin
      // ドキュメントの読み込みが開始された
      str := NewCString;
      channel := aRequest as nsIChannel;
      uri := channel.URI;
      uri.GetSpec(str.ACString);
      {$IFDEF DEBUG}
      OutputDebugString('GeckoBrowser.OnDocumentBegin');
      {$ENDIF}
      if Assigned(FBrowser.OnDocumentBegin) then
        FBrowser.OnDocumentBegin(Self, str.ToString);
    end else
    if (aStateFlags and STATE_STOP)<>0 then
    begin
      // ドキュメントの読み込みが完了した
      str := NewCString;
      channel := aRequest as nsIChannel;
      uri := channel.URI;
      uri.GetSpec(str.ACString);
      {$IFDEF DEBUG}
      OutputDebugString('GeckoBrowser.OnDocumentComplete');
      {$ENDIF}
      if Assigned(FBrowser.OnDocumentComplete) then
        FBrowser.OnDocumentComplete(Self, str.ToString);
    end;
  end;
  if (aStateFlags and STATE_IS_NETWORK)<>0 then
  begin
    // 状態の変化はネットワークに対してである
    if (aStateFlags and STATE_START)<>0 then
    begin
      // ネットワークの転送が開始された場合
      str := NewCString;
      channel := aRequest as nsIChannel;
      uri := channel.URI;
      uri.GetSpec(str.ACString);
      {$IFDEF DEBUG}
      OutputDebugString(
        PChar('GeckoBrowser.OnDownloadBegin('+str.ToString+')'));
      {$ENDIF}
      if Assigned(FBrowser.OnDownloadBegin) then
        FBrowser.OnDownloadBegin(Self, str.ToString);
    end else
    if (aStateFlags and STATE_STOP)<>0 then
    begin
      // ネットワークの転送が終了した場合
      str := NewCString;
      channel := aRequest as nsIChannel;
      uri := channel.URI;
      uri.GetSpec(str.ACString);
      {$IFDEF DEBUG}
      OutputDebugString(
        PChar('GeckoBrowser.OnDownloadComplete('+str.ToString+')'));
      {$ENDIF}
      if Assigned(FBrowser.OnDownloadComplete) then
        FBrowser.OnDownloadComplete(Self, str.ToString);
      if Assigned(FBrowser.OnStatusChange) then
        FBrowser.OnStatusChange(FBrowser, '');
    end;
  end;
end;

procedure TGeckoBrowserListener.OnProgressChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aCurSelfProgress: PRInt32;
                aMaxSelfProgress: PRInt32;
                aCurTotalProgress: PRInt32;
                aMaxTotalProgress: PRInt32);
begin
  if Assigned(FBrowser.OnProgressChange) then
  begin
    {$IFDEF DEBUG}
    OutputDebugString(PChar(
      'OnProgressListener('+IntToStr(aCurTotalProgress)+'/'+IntToStr(aMaxTotalProgress)+')'
    ));
    {$ENDIF}
    FBrowser.OnProgressChange(FBrowser, aCurTotalProgress, aMaxTotalProgress);
  end;
end;

procedure TGeckoBrowserListener.OnLocationChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                location: nsIURI);
var
  str: IInterfacedCString;
begin
  str := NewCString;
  location.GetSpec(str.ACString);
  {$IFDEF DEBUG}
  OutputDebugString(PChar(
    'GeckoBrowser.LocationChange('+str.ToString+')'
  ));
  {$ENDIF}
  if Assigned(FBrowser.OnLocationChange) then
    FBrowser.OnLocationChange(FBrowser, str.ToString);
end;

procedure TGeckoBrowserListener.OnStatusChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                aStatus: PRUint32;
                const aMessage: PWideChar);
begin
{$IFDEF DEBUG}
  OutputDebugString(PChar(
    'GeckoBrowser.OnStatusChange('+aMessage+')'
  ));
{$ENDIF}
  if Assigned(FBrowser.OnStatusChange) then
    FBrowser.OnStatusChange(FBrowser, aMessage);
end;

procedure TGeckoBrowserListener.OnSecurityChange(
                aWebProgress: nsIWebProgress;
                aRequest: nsIRequest;
                state: PRUint32);
begin
  //TODO 1 -cTGeckoBrowserListner: TGeckoBrowserListener.OnSecurityChange の記述
end;

constructor TGeckoBrowser.Create(AOwner: TComponent);
begin
  inherited;
  Chrome := TGeckoBrowserChrome.Create(Self);
  Listener := TGeckoBrowserListener.Create(Self);
end;

procedure TGeckoBrowser.InitWebBrowser;
var
  domWin: nsIDOMWindow;
  target: nsIDOMEventTarget;
begin
  inherited;
  //DOMイベントリスナの登録
  if Assigned(FWebBrowser) then
  begin
    domWin := FWebBrowser.GetContentDOMWindow;
    target := (domWin as nsIDOMWindow2).GetWindowRoot;
    target.AddEventListener(NewString('load').AString, Self, False);
    target.AddEventListener(NewString('click').AString, Self, False);
    target.AddEventListener(NewString('mouseup').AString, Self, False);
    target.AddEventListener(NewString('mousedown').AString, Self, False);
    target.AddEventListener(NewString('mousemove').AString, Self, False);
    target.AddEventListener(NewString('keyup').AString, Self, False);
    target.AddEventListener(NewString('keydown').AString, Self, False);
    target.AddEventListener(NewString('keypress').AString, Self, False);
    target.AddEventListener(NewString('DOMMouseScroll').AString, Self, False);
    target.AddEventListener(NewString('DOMLinkAdded').AString, Self, False);
    target.AddEventListener(NewString('dragover').AString, Self, False);
    target.AddEventListener(NewString('draggesture').AString, Self, False);
    target.AddEventListener(NewString('dragdrop').AString, Self, False);
    target.AddEventListener(NewString('dragexit').AString, Self, False);
    target.AddEventListener(NewString('focus').AString, Self, False);
  end;
end;

procedure TGeckoBrowser.ShutdownWebBrowser;
var
  domWin: nsIDOMWindow;
  target: nsIDOMEventTarget;
begin
  //DOMイベントリスナの解除
  if Assigned(FWebBrowser) then
  begin
    domWin := FWebBrowser.GetContentDOMWindow;
    target := (domWin as nsIDOMWindow2).GetWindowRoot;
    target.RemoveEventListener(NewString('load').AString, Self, False);
    target.RemoveEventListener(NewString('click').AString, Self, False);
    target.RemoveEventListener(NewString('mouseup').AString, Self, False);
    target.RemoveEventListener(NewString('mousedown').AString, Self, False);
    target.RemoveEventListener(NewString('mousemove').AString, Self, False);
    target.RemoveEventListener(NewString('keyup').AString, Self, False);
    target.RemoveEventListener(NewString('keydown').AString, Self, False);
    target.RemoveEventListener(NewString('keypress').AString, Self, False);
    target.RemoveEventListener(NewString('DOMMouseScroll').AString, Self, False);
    target.RemoveEventListener(NewString('DOMLinkAdded').AString, Self, False);
    target.RemoveEventListener(NewString('dragover').AString, Self, False);
    target.RemoveEventListener(NewString('draggesture').AString, Self, False);
    target.RemoveEventListener(NewString('dragdrop').AString, Self, False);
    target.RemoveEventListener(NewString('dragexit').AString, Self, False);
    target.RemoveEventListener(NewString('focus').AString, Self, False);
  end;
  inherited;
end;

procedure TGeckoBrowserChrome.GetInterface(const uuid: TGUID; out _result);
var
  window:nsIDOMWindow;
begin
  if IsEqualGUID(uuid, nsIDOMWindow) then
  begin
    // nsIDOMWindow を処理しないと nsIWindowCreator.CreateChromeWindow でエラーになる
    window := FBrowser.FWebBrowser.ContentDOMWindow;
    window.QueryInterface(nsIDOMWindow, _result);
  end
  else
  begin
    if not Supports(Self, uuid, _Result) then
    begin
      System.Error(reIntfCastError);
    end;
  end;
end;

procedure TGeckoBrowserChrome.OnShowContextMenu(aContextFlags: PRUint32;
  aUtils: nsIContextMenuInfo);
const
  CONTEXT_NONE             = NS_ICONTEXTMENULISTENER2_CONTEXT_NONE;
  CONTEXT_LINK             = NS_ICONTEXTMENULISTENER2_CONTEXT_LINK;
  CONTEXT_IMAGE            = NS_ICONTEXTMENULISTENER2_CONTEXT_IMAGE;
  CONTEXT_DOCUMENT         = NS_ICONTEXTMENULISTENER2_CONTEXT_DOCUMENT;
  CONTEXT_TEXT             = NS_ICONTEXTMENULISTENER2_CONTEXT_TEXT;
  CONTEXT_INPUT            = NS_ICONTEXTMENULISTENER2_CONTEXT_INPUT;
  CONTEXT_BACKGROUND_IMAGE = NS_ICONTEXTMENULISTENER2_CONTEXT_BACKGROUND_IMAGE;
var
  cmenu: TCtxMenuInfo;
begin
    if Assigned(FBrowser.OnContextMenu) then
  begin
    cmenu := TCtxMenuInfo.Create(aContextFlags, aUtils);
    try
      FBrowser.OnContextMenu(FBrowser, cmenu);
    finally
      cmenu.Free;
    end;
  end;
end;

function TGeckoBrowser.DoCreateChromeWindow(
  chromeFlags: Longword): nsIWebBrowserChrome;
var
  newWin: TCustomGeckoBrowser;
begin
  if Assigned(OnNewWindow) then
  begin
    newWin := nil;
    OnNewWindow(Self, chromeFlags, newWin);
    if Assigned(newWin) then
      Result := newWin.WebBrowser.ContainerWindow;
  end;
end;

function TCustomGeckoBrowser.GetWebBrowserChrome: nsIWebBrowserChrome;
begin
  Result := FChrome;
end;

function TCustomGeckoBrowser.GetContentDocument: nsIDOMDocument;
begin
  Result := FWebBrowser.ContentDOMWindow.Document;
end;

function TCustomGeckoBrowser.GetContentWindow: nsIDOMWindow;
begin
  Result := FWebBrowser.ContentDOMWindow;
end;

function TCustomGeckoBrowser.GetWebBrowserFind: nsIWebBrowserFind;
begin
  Result := FWebBrowser as nsIWebBrowserFind;
end;
function TCustomGeckoBrowser.GetWebBrowserPrint: nsIWebBrowserPrint;
var
  ir:nsIInterfaceRequestor;
  wbp:nsIWebBrowserPrint;
begin
  ContentWindow.QueryInterface(nsIInterfaceRequestor,ir);
  ir.GetInterface(nsIWebBrowserPrint, wbp);
  Result := wbp;
end;
function TCustomGeckoBrowser.GetWebNavigation: nsIWebNavigation;
begin
  Result := FWebBrowser as nsIWebNavigation;
end;
function TCustomGeckoBrowser.GetMarkupDocumentViewer: nsIMarkupDocumentViewer;
var
  mdv:nsIMarkupDocumentViewer;
begin
  Result:=nil;
  (DocShell as nsIInterfaceRequestor).GetInterface(
    ns_IMarkupDocumentViewer_iid, mdv
  );
  Result:=mdv;
end;
function TCustomGeckoBrowser.GetDocShell: nsIDocShell;
var
  ds: nsIDocShell;
begin
  Result := nil;
  NS_GetInterface(FWebBrowser, NS_IDOCSHELL_IID, ds);
  Result := ds;
end;

function TCustomGeckoBrowser.GetDocumentCharsetInfo: nsIDocumentCharsetInfo;
begin
  Result := DocShell.GetDocumentCharsetInfo;
end;

procedure TCustomGeckoBrowser.WMEraseBkGnd(var Msg: TMessage);
begin
  // ちらつき防止
  //Msg.Result := 0;
end;

function TCustomGeckoBrowser.GetCanGoBack: Boolean;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
  index: PRInt32;
begin
  nav := FWebBrowser as nsIWebNavigation;
  history := nav.SessionHistory;
  index := history.Index;

  Result := (index > 0);
end;

function TCustomGeckoBrowser.GetCanGoForward: Boolean;
var
  nav: nsIWebNavigation;
  history: nsISHistory;
  count, index: PRInt32;
begin
  nav := FWebBrowser as nsIWebNavigation;
  history := nav.SessionHistory;
  count := history.Count;
  index := history.Index;

  Result := (index+1<count);
end;

procedure TGeckoBrowserChrome.FocusPrevElement();
var
  Ancestor: TWinControl;
begin
  Ancestor := FBrowser.Parent;
  while Assigned(Ancestor) and (not(Ancestor is TForm)) do
    Ancestor := Ancestor.Parent;
  if Assigned(Ancestor) then
    PostMessage(Ancestor.Handle, WM_NEXTDLGCTL, 1, 0);
end;

procedure TGeckoBrowserChrome.FocusNextElement();
var
  Ancestor: TWinControl;
begin
  Ancestor := FBrowser.Parent;
  while Assigned(Ancestor) and (not(Ancestor is TForm)) do
    Ancestor := Ancestor.Parent;
  if Ancestor <> nil then
    PostMessage(Ancestor.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TGeckoBrowserListener.OnHistoryNewEntry(aNewURI: nsIURI);
begin
end;

function TGeckoBrowserListener.OnHistoryGoBack(aBackURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoBack) then
    FBrowser.FOnGoBack(Self,aBackURI,aContinue,Handled);
  if Handled then begin
    Result := aContinue;
  end
  else {if not Handled then }begin
    {if (HistoryPosition>0) then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryGoForward(aForwardURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoForward) then
    FBrowser.FOnGoForward(Self,aForwardURI,aContinue,Handled);
  if Handled then begin
    Result := aContinue;
  end
  else {if not Handled then} begin
    {if (HistoryPosition+1)<HistoryCount then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryReload(aReloadURI: nsIURI; aReloadFlags: PRUint32): PRBool;
begin
  Result := True;
end;

function TGeckoBrowserListener.OnHistoryGotoIndex(aIndex: PRInt32; aGotoURI: nsIURI): PRBool;
var
  Handled:Boolean;
  aContinue:PRBool;
begin
  if Assigned(FBrowser.FOnGoToIndex) then
    FBrowser.FOnGoToIndex(Self,aIndex,aGotoURI,aContinue,Handled);

  if Handled then begin
    Result := aContinue;
  end
  else begin
    {if aIndex in [0..HistoryCount-1] then
      Result := True
    else
      Result := False;}
    Result := True;
  end;
end;

function TGeckoBrowserListener.OnHistoryPurge(aNumEntries: PRInt32): PRBool;
begin
  Result := True;
end;

// nsITooltipListener
procedure TGeckoBrowserChrome.OnShowTooltip(aXCoords: PRInt32; aYCoords: PRInt32; const aTipText: PWideChar); safecall;
var
  r:TRect;
  p,ap:TPoint;
//  height:Integer;
begin
  if FBrowser.FHint = nil then
  FBrowser.FHint := THintWindow.Create(FBrowser);
  r := FBrowser.FHint.CalcHintRect(400,aTipText,nil);
//  height := r.Bottom;
  ap.X := aXCoords;
  ap.Y := aYCoords;
  p := FBrowser.ClientToScreen(ap);
  r.Left:=p.x;
  r.Top:=p.y-r.Bottom;
  r.Right:=r.Right +p.x;
  r.Bottom:=p.y;
  FBrowser.FHint.ActivateHint(r,aTipText);
end;

procedure TGeckoBrowserChrome.OnHideTooltip(); safecall;
begin
  FBrowser.FHint.ReleaseHandle;
end;

// nsIURIContentListener
function TGeckoBrowserListener.OnStartURIOpen(aURI: nsIURI): PRBool; safecall;
begin
  //
end;

function TGeckoBrowserListener.DoContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; aRequest: nsIRequest; out aContentHandler: nsIStreamListener): PRBool; safecall;
begin
  //
end;

function TGeckoBrowserListener.IsPreferred(const aContentType: PAnsiChar; out aDesiredContentType: PAnsiChar): PRBool; safecall;
begin
  //
end;

function TGeckoBrowserListener.CanHandleContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; out aDesiredContentType: PAnsiChar): PRBool; safecall;
begin
  //
end;

function TGeckoBrowserListener.GetLoadCookie(): nsISupports; safecall;
begin
  //
end;

procedure TGeckoBrowserListener.SetLoadCookie(aLoadCookie: nsISupports); safecall;
begin
  //
end;

function TGeckoBrowserListener.GetParentContentListener(): nsIURIContentListener; safecall;
begin
  //
end;

procedure TGeckoBrowserListener.SetParentContentListener(aParentContentListener: nsIURIContentListener); safecall;
begin
  //
end;

// nsIDOMEventListener
procedure TGeckoBrowser.HandleEvent(event: nsIDOMEvent); safecall;
var
  str:IInterfacedString;
  EventType:String;
  doc:nsIDOMDocument;
  elm:nsIDOMElement;
  target:nsIDOMEventTarget;
begin

  str :=NewString('');
  event.GetType(str.AString);
  EventType:=str.ToString;

  if EventType = 'load' then
  begin
    if Assigned(Self.FOnDOMLoad) then
    begin
      self.FOnDOMLoad(self,event);
    end;
  end
  else if EventType = 'click' then
  begin
    if Assigned(Self.FOnDOMClick) then
    begin
      Self.FOnDOMClick(self,event as nsIDOMMouseEvent);
    end;
  end
  else if EventType = 'mouseup' then
  begin
    if Assigned(Self.FOnDOMMouseUp) then
    begin
      Self.FOnDOMMouseUp(self,event as nsIDOMMouseEvent);
    end;
  end
  else if EventType = 'mousedown' then
  begin
    if Assigned(Self.FOnDOMMouseDown) then
    begin
      Self.FOnDOMMouseDown(self,event as nsIDOMMouseEvent);
    end;
  end
  else if EventType = 'mousemove' then
  begin
    if Assigned(Self.FOnDOMMouseMove) then
    begin
      Self.FOnDOMMouseMove(self,event as nsIDOMMouseEvent);
    end;
  end
  else if EventType = 'keyup' then
  begin
    if Assigned(Self.FOnDOMKeyUp) then
    begin
      self.FOnDOMKeyUp(self,event as nsIDOMKeyEvent);
    end;
  end
  else if EventType = 'keydown' then
  begin
    if Assigned(Self.FOnDOMKeyDown) then
    begin
      self.FOnDOMKeyDown(self,event as nsIDOMKeyEvent);
    end;
  end
  else if EventType = 'keypress' then
  begin
    if Assigned(Self.FOnDOMKeyPress) then
    begin
      self.FOnDOMKeyPress(self,event as nsIDOMKeyEvent);
    end;
  end
  else if EventType = 'DOMMouseScroll' then
  begin
    if Assigned(Self.FOnDOMMouseScroll) then
    begin
      Self.FOnDOMMouseScroll(self,event as nsIDOMMouseEvent);
    end;
  end
  else if EventType = 'DOMLinkAdded' then
  begin
    if Assigned(Self.FOnDOMLinkAdded) then
    begin
      Self.FOnDOMLinkAdded(self,event);
    end;
  end
  else if (EventType = 'dragover') then begin
    if Assigned(Self.FOnDOMDragOver) then
    begin
      self.FOnDOMDragOver(self,event);
    end;
  end
  else if (EventType = 'draggesture') then
  begin
    if Assigned(Self.FOnDOMDragGesture) then
    begin
      self.FOnDOMDragGesture(self,event);
    end;
  end
  else if (EventType = 'dragdrop')  then
  begin
    if Assigned(Self.FOnDOMDragDrop) then
    begin
      self.FOnDOMDragDrop(self,event);
    end;
  end
  else if (EventType = 'dragexit')  then
  begin
    if Assigned(Self.FOnDOMDragExit) then
    begin
      self.FOnDOMDragExit(self,event);
    end;
  end
          {
  else if EventType = 'PopupWindow' then
  begin
    if Assigned(Self.FOnPopupWindow) then
    begin
      self.FOnPopupWindow(self,event);
    end;
  end         }
  else if EventType = 'focus' then
  begin
      target := event.Target;
      if Supports(target, nsIDOMDocument, doc) then
      begin
        Self.FLastFocused := nil;
      end
      else if Supports(target, nsIDOMElement, elm) then
      begin
        Self.FLastFocused := elm;
      end;
      if Assigned(FOnDOMFocus) then FOnDOMFocus(Self,event);
  end;
end;

function TGeckoBrowser.GetURI:String;
var
  str: IInterfacedCString;
begin
  Result:='';
  str :=NewCString('');
//URI
  Self.WebNavigation.CurrentURI.GetSpec(str.ACString);
  Result := str.ToString;
end;

constructor TCtxMenuInfo.Create(flags: Longword; info: nsIContextMenuInfo);
begin
  inherited Create;

  FInfo := info;
  FFlags := [];

  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_LINK) then
    FFlags := FFlags + [cmfLink];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_IMAGE) then
    FFlags := FFlags + [cmfImage];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_DOCUMENT) then
    FFlags := FFlags + [cmfDocument];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_TEXT) then
    FFlags := FFlags + [cmfText];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_INPUT) then
    FFlags := FFlags + [cmfInput];
  if 0<>(flags and ns_IContextMenuListener2_CONTEXT_BACKGROUND_IMAGE) then
    FFlags := FFlags + [cmfBGImage];
end;

function TCtxMenuInfo.GetAssociatedLink: WideString;
var
  str: IInterfacedString;
begin
  Result := '';
  if cmfLink in FFlags then
  try
    str := NewString;
    FInfo.GetAssociatedLink(str.AString);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetImageURL: String;
var
  str: IInterfacedCString;
  uri: nsIURI;
begin
  Result := '';
  if cmfImage in FFlags then
  try
    str := NewCString;
    uri := FInfo.GetImageSrc();
    uri.GetSpec(str.ACString);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetBGImageURL: String;
var
  str: IInterfacedCString;
  uri: nsIURI;
begin
  Result := '';
  if cmfBGImage in FFlags then
  try
    str := NewCString;
    uri := FInfo.GetBackgroundImageSrc();
    uri.GetSpec(str.ACString);
    Result := str.ToString;
  except
  end;
end;

function TCtxMenuInfo.GetMouseEvent: nsIDOMEvent;
begin
  Result := FInfo.MouseEvent;
end;

function TCtxMenuInfo.GetTargetNode: nsIDOMNode;
begin
  Result := FInfo.TargetNode;
end;

function TCtxMenuInfo.GetImageContainer: imgIContainer;
begin
  Result := FInfo.ImageContainer;
end;

function TCtxMenuInfo.GetImageSrc: nsIURI;
begin
  Result := FInfo.ImageSrc;
end;

function TCtxMenuInfo.GetBGImageContainer: imgIContainer;
begin
  Result := FInfo.BackgroundImageContainer;
end;

function TCtxMenuInfo.GetBGImageSrc: nsIURI;
begin
  Result := FInfo.BackgroundImageSrc;
end;

{$ifopt D+} {If compiled with "project / options / compiler / debug info off" 
the PatchINT3 code disappears. After changing the option, I had to go "project 
/ build" to make it "take".} 

procedure PatchINT3; 
var 
NOP: Byte; 
NTDLL: THandle; 
BytesWritten: DWORD; 
ADDRESS: Pointer; 
begin 
if DebugHook=0 then 
exit; 


if Win32Platform <> VER_PLATFORM_WIN32_NT then 
exit; 

NTDLL := GetModuleHandle('NTDLL.DLL'); 

if NTDLL = 0 then 
exit; 

ADDRESS := GetProcAddress(NTDLL, 'DbgBreakPoint'); 
if ADDRESS = nil then 
exit; 

try 
if Char(Address^) <> #$CC 
then exit; 

NOP := $90; 

if WriteProcessMemory(GetCurrentProcess,ADDRESS,@NOP, 1,BytesWritten) and 
(BytesWritten = 1) then 
FlushInstructionCache(GetCurrentProcess, ADDRESS, 1); 

except 
// DO emergency panic if you lake at EAccessViolation here, it is 
// perfectly harmless! 
on EAccessViolation DO; 
else raise; 
end; 

end ; 
{$endif} 

initialization 
{$ifopt D+} {only compiled if debug info on.} 
PatchInt3; 
{$endif}

end.

