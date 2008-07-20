unit UBagel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ToolWin, Buttons, StdActns,
  ActnList, ActnMan, ActnCtrls, XPStyleActnCtrls, XPMan, StdStyleActnCtrls,Clipbrd,
  ImgList, AboutBagel, Menus, AppEvnts, TabbedToolBar, BagelPref,
  {GlobalHotkey,} ShellCtrls, BrwsFldr, StatusWidget, (*ActnGen,*)

  nsInit,  BagelBrowser, nsXPCOM, nsDOMEvent,
  nsXPCOMGlue,  GeckoBrowser, nsGeckoStrings, nsNetUtil,
  BrowserSupports, nsPerm, nsFileProtocolHandler,nsTextToURI,
  nsMemory, nsStyleSheetService, nsDocumentCharsetInfo,
  nsAtom, nsFind, nsDOM, nsSelection,  nsSHistory, nsCache,
  nsDownload, //nsIDownload
  nsGlobalHistory, //nsIGlobalHistory2
  nsPlaces, //History, Bookmark
  nsDocShell, //nsIDocShell
  nsPrintSettingsService, //nsIPrintSettingService
  GeckoSimpleProfile, //Profile
  GeckoSimpleHALDialog, //Helper Application Dialog
  GeckoSimplePrompt, //Prompt Service
  StyleSheetUtils, //CSS関連のユーティリティー関数
  DOMUtils, //DOM関連のユーティリティー関数
  WindowUtils, //nsIDOMWindow関連のユーティリティー関数

  ActiveX,          //OleInitialize
  buinIntelliMouse, //マウス関連の定数
  StrUtils,         //AnsiEndsStr
  CommandAction,    //Bagel独自のアクション
  ScriptAction,
  SkRegExpW,         //正規表現
  unique,           //二重起動防止
  NkMemIniFile,     //速いMemIniFile
  ShellAPI,         //ShellExecute
  CommCtrl,         //TReBarBandInfo
  ShlObj,           //SHGetSpecialFolderPath
  SplitJoin,        //文字列の連結と分離
  BookmarkListView, //ブックマーク用ウィジェット
  BookmarkTreeView,
  DownloadListView, //Downloader
  HistoryTreeView,  //履歴ツリー
  AutoExec,
  //JvDragDrop,//TJvDropTarget from JVCL
  IniFiles,UBookmark,
  BagelActnMan,BagelToolbar,
  UTabList, //タブのセッション
  NkDropTarget, //検索バーをドロップターゲットにする
  ContentAreaUtils //保存関連のUtils
  ;

const
  NOPROXY = '直接接続';
  NOOVERRIDEAGENT = 'デフォルト';
  BOOKMARKS_DAT='bookmarks.dat';
  BAGEL_HILIGHT_CLASS='_bagel_hilight_class';
  SEARCH_NORMAL=0;
  SEARCH_MIGEMO=1;
  SEARCH_TYPEAHEADFIND=2;
  RANGE_MODE_ALL=0;
  RANGE_MODE_NEXT=1;
  RANGE_MODE_BACK=2;
  RANGE_MODE_INCREMENT=3;
type
  TBagelBookmarkRecord = record
    Name:String;
    URI:String;
    Docshell:String;
    Reload:String;
    Expanded:Boolean;
    IsFolder:Boolean;
    Level:Integer;
  end;

  PGrepResult = ^TGrepResult;
  TGrepResult = record        //Grep結果の保持
    Browser:TGeckoBrowser;
    Range:nsIDOMRange;
    startContainer:nsIDOMNode;
    startOffset:Integer;
    endContainer:nsIDOMNode;
    endOffset:Integer;
    isLink:Boolean;
  end;


  TBagelExtSSAction = class(TBagelActionContainer)
  private
    FSSType:Integer;
    FSSName:String;
    FFileName:String;
  public
    property SSType:Integer read FSSType write FSSType;
    property SSname:String read FSSName write FSSName;
    property FileName:String read FFileName write FFileName;
    constructor Create(AOwner: TComponent); override;
  end;

  TBagelExtCharsetAction = class(TAction)
  private
    FCharset:String;
  public
    property Charset:String read FCharset write FCharset;
    constructor Create(AOwner: TComponent); override;
  end;

  TBagelCharsetAction = class(TAction)
  private
    FCharset:String;
  public
    property Charset:String read FCharset write FCharset;
    constructor Create(AOwner: TComponent); override;
  end;

  TBagelMainForm = class(TForm)
    ActionList1: TActionList;
    AddToMemo: TMenuItem;
    AllowAllCookie: TMenuItem;
    AllowThisSiteCookie: TMenuItem;
    AllowThisSiteSessionCookie: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    AutoScrollTimer: TTimer;
    BackHistoryPopup: TPopupMenu;
    Bagel1: TMenuItem;
    BagelTrayIcon: TTrayIcon;
    BasePanel: TPanel;
    Bevel1: TBevel;
    BookMarkPProps: TMenuItem;
    BookmarkPCopy: TMenuItem;
    BookmarkPCut: TMenuItem;
    BookmarkPDelete: TMenuItem;
    BookmarkPNewFolder: TMenuItem;
    BookmarkPOpen: TMenuItem;
    BookmarkPPaste: TMenuItem;
    BookmarkSheet: TTabSheet;
    BookmarksPopup: TPopupMenu;
    Bulkfeeds1: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    ChevronLinkMenu: TPopupMenu;
    ChevronPopupMenu: TPopupMenu;
    ClipSheet: TTabSheet;
    ComboBox2: TComboBox;
    CookieLifetimeAskEach: TMenuItem;
    CookieLifetimeNormal: TMenuItem;
    CookieLifetimeSession: TMenuItem;
    CookieP3PCustom: TMenuItem;
    CookieP3PHigh: TMenuItem;
    CookieP3PLow: TMenuItem;
    CookieP3PMedium: TMenuItem;
    CookiePLifeTime: TMenuItem;
    CopyLinkForDownloader: TMenuItem;
    CopyLinkListBoth: TMenuItem;
    CopyLinkListText: TMenuItem;
    CopyLinkListURL: TMenuItem;
    CreateMemo: TMenuItem;
    CreateMemoItem: TMenuItem;
    DLAllImages: TMenuItem;
    DLPopupMenu: TPopupMenu;
    DLSheet: TTabSheet;
    DLToolPopup: TPopupMenu;
    DelayedSearchButtonCreator: TTimer;
    DelayedSidebarToggler: TTimer;
    Delete1: TMenuItem;
    DeleteMemo: TMenuItem;
    DeleteMemoItem: TMenuItem;
    DenyAllCookie: TMenuItem;
    DenyOtherSiteCookie: TMenuItem;
    DenyThisSiteCookie: TMenuItem;
    DisabledImageList: TImageList;
    Edit1: TEdit;
    ExtractPopup: TPopupMenu;
    ExtractSavePopup: TPopupMenu;
    FForwardPopup: TPopupMenu;
    FindDialog1: TFindDialog;
    Flash1: TMenuItem;
    ForwardHistoryPopup: TPopupMenu;
    GPICopy: TMenuItem;
    GPICut: TMenuItem;
    GPIPaste: TMenuItem;
    GPISelectAll: TMenuItem;
    GPISep1: TMenuItem;
    GeckoInputPopup: TPopupMenu;
    GoButtonPopup: TPopupMenu;
    GoMenu: TMenuItem;
    GoUpDummyMenu: TMenuItem;
    GoUpListMenu: TMenuItem;
    GoUpPopup: TPopupMenu;
    Google1: TMenuItem;
    Grep1: TMenuItem;
    GrepList: TListView;
    GrepSheet: TTabSheet;
    HistoryOrderPopup: TPopupMenu;
    HistorySheet: TTabSheet;
    HistorySortByDate: TMenuItem;
    HistorySortBySite: TMenuItem;
    HistorySortByVisit: TMenuItem;
    HistoryToolBar: TToolBar;
    Image1: TImage;
    ImageList1: TImageList;
    InsertPointofMemoList1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LargeImageList: TImageList;
    LinkListPopup: TPopupMenu;
    LinkListView: TListView;
    LinkSheet: TTabSheet;
    MainMenu1: TMainMenu;
    MemoSheet: TTabSheet;
    MenuToggleSearchBar: TMenuItem;
    MenuTrackerToolbar: TToolBar;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N2: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N3: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N4: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N59: TMenuItem;
    N5: TMenuItem;
    N60: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N68: TMenuItem;
    N6: TMenuItem;
    ObeyDefaultThisSiteCookie: TMenuItem;
    ObserveClipList: TListBox;
    Open1: TMenuItem;
    Open2: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenLinkListItem: TMenuItem;
    OpenSearchPopup: TPopupMenu;
    PageControl1: TPageControl;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupMenu1: TPopupMenu;
    Property1: TMenuItem;
    RandomProxySelector: TTimer;
    RewindPopup: TPopupMenu;
    SaveDialog1: TSaveDialog;
    ScriptList: TListBox;
    ScriptSheet: TTabSheet;
    SideBasePanel: TPanel;
    SideMemoPopup: TPopupMenu;
    SideMemoTabPopup: TPopupMenu;
    SidePanel: TPanel;
    SideSplitter: TPanel;
    SidebarCloseButton: TSpeedButton;
    SidebarHeaderButtonbar: TToolBar;
    SidebarHeaderPanel: TPanel;
    SidebarHeaderToolbar: TToolBar;
    SidebarPopup: TPopupMenu;
    SidebarSelector: TToolButton;
    SidebarTogglePanel: TPanel;
    Splitter3: TSplitter;

    StatusCheckedImageList: TImageList;
    StatusImageList: TImageList;
    TabControl2: TTabControl;
    TabSheet1: TTabSheet;
    TaskTrayPopup: TPopupMenu;
    TimerFireSetfocus: TTimer;
    TmpPopup: TPopupMenu;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    ToolBar5: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton1: TToolButton;
    ToolButton22: TToolButton;
    ToolButton27: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolPCmdExt: TMenuItem;
    ToolPCookieConfig: TMenuItem;
    ToolPOpenCookieMan: TMenuItem;
    ToolPScript: TMenuItem;
    ToolbarPPref: TMenuItem;
    ToolbarPopup: TPopupMenu;
    ToolsMenu: TMenuItem;
    URI1: TMenuItem;
    URL1: TMenuItem;
    URL2: TMenuItem;
    URL3: TMenuItem;
    URL4: TMenuItem;
    URL5: TMenuItem;
    UpMenuPopup: TPopupMenu;
    UsrTabSheet: TTabSheet;
    ViewPanel: TPanel;
    Web2: TMenuItem;
    WebPanelSheet: TTabSheet;
    XPToolBar1: TToolBar;
    a1: TMenuItem;
    actAboutBagel: TAction;
    actAddBookmark: TAction;
    actAddDenyTitle: TAction;
    actAddDenyURI: TAction;
    actAddPanel: TAction;
    actAddTab: TControlAction;
    actAddTabBlank: TAction;
    actAddTabClip: TAction;
    actAddTabCurr: TAction;
    actAddTabHome: TAction;
    actAllowFrames: TAction;
    actAllowImg: TAction;
    actAllowJS: TAction;
    actAllowPlugins: TAction;
    actAllowRedirect: TAction;
    actBagelHelp: TAction;
    actBagelSite: TAction;
    actBlockCtxImage: TAction;
    actBookmarkEditor: TAction;
    actBookmarkProperty: TAction;
    actBookmarkSidebar: TAction;
    actClearCache: TAction;
    actClearCookie: TAction;
    actClearHistory: TAction;
    actClipboardSidebar: TAction;
    actCloseAll: TAction;
    actCloseLeft: TAction;
    actCloseRight: TAction;
    actCloseTab: TAction;
    actCloseWithout: TAction;
    actCopy: TEditCopy;
    actCopyBookmark: TAction;
    actCopyCtxURI: TAction;
    actCopyTitle: TAction;
    actCopyTitleAndURI: TAction;
    actCopyURI: TAction;
    actCtxProperty: TAction;
    actCut: TEditCut;
    actCutBookmark: TAction;
    actDefaultTabs: TAction;
    actDeleteBookmark: TAction;
    actDoSearch: TAction;
    actDropdownAddressbar: TAction;
    actFastForward: TControlAction;
    actFindDialog: TAction;
    actFocusLocationBox: TAction;
    actFocusSearch: TAction;
    actFocusSearchEngine: TAction;
    actFocusSidebar: TAction;
    actFocusTab: TAction;
    actForDonutUsers: TAction;
    actFullScreen: TAction;
    actGo: TControlAction;
    actGoBack: TControlAction;
    actGoForward: TControlAction;
    actGoHome: TAction;
    actGoUp: TControlAction;
    actGrepSidebar: TAction;
    actHistorySidebar: TAction;
    actIEView: TAction;
    actLinkSidebar: TAction;
    actMemoSidebar: TAction;
    actNextTab: TAction;
    actOpenAboutConfig: TAction;
    actOpenBookmark: TAction;
    actOpenCtxLink: TAction;
    actOpenCtxLinkNewTab: TAction;
    actOpenFile: TAction;
    actOpenSelection: TAction;
    actOutputSidebar: TAction;
    actPageEnd: TAction;
    actPageHome: TAction;
    actPaste: TEditPaste;
    actPasteBookmark: TAction;
    actPrevTab: TAction;
    actPrint: TAction;
    actPrintPreview: TAction;
    actQuit: TAction;
    actReOpenMostRecent: TAction;
    actReload: TAction;
    actReloadAll: TAction;
    actRewind: TControlAction;
    actSaveAs: TAction;
    actScriptSidebar: TAction;
    actSearchSelection: TAction;
    actSelectAll: TEditSelectAll;
    actSelectNone: TAction;
    actSettings: TAction;
    actShowAdblockMan: TAction;
    actShowCookieMan: TAction;
    actShowCookieP3PCustomSetting: TAction;
    actShowCtxBgImage: TAction;
    actShowCtxImage: TAction;
    actShowExtGoEditor: TAction;
    actShowImgMan: TAction;
    actShowPageInfo: TAction;
    actShowPageSetup: TAction;
    actShowPassMan: TAction;
    actShowPopupMan: TAction;
    actShowSidebarIcons: TAction;
    actShowUAMan: TAction;
    actShowWebPanelEditor: TAction;
    actStartAutoScroll: TAction;
    actStop: TAction;
    actStopAll: TAction;
    actTaskTray: TAction;
    actToggleGoButtonVisible: TAction;
    actToggleLinkbarVisible: TAction;
    actToggleMainbarVisible1: TMenuItem;
    actToggleMainbarVisible: TAction;
    actToggleMenubarVisible: TAction;
    actToggleMultilineTab: TAction;
    actToggleNoGripper: TAction;
    actToggleSearchBarVisible: TAction;
    actToggleSearchBtnVisible: TAction;
    actToggleSidebarVisible: TAction;
    actToggleStatusbarVisible: TAction;
    actToggleTabbarVisible: TAction;
    actToggleURIbarVisible: TAction;
    actTransferSidebar: TAction;
    actUserDefinedSidebar: TAction;
    actViewSource: TAction;
    actWebPanel: TAction;
    actWorkOffline: TAction;
    actZoomIn: TAction;
    actZoomNormal: TAction;
    actZoomOut: TAction;
    bbgSaveTimer: TTimer;
    bkmkSearchEdit: TEdit;
    btnPPClose: TButton;
    btnPageSetup: TButton;
    btnPrint: TButton;
    cboExtractDetType: TComboBox;
    cboExtractPattern: TComboBox;
    cboGrepTarget: TComboBox;
    chkObsNotLoaded: TCheckBox;
    chkObserveClipboard: TCheckBox;
    cmbGrepKeyword: TComboBox;
    cmbGrepKind: TComboBox;
    d1: TMenuItem;
    edtHistorySearch: TEdit;
    edtMemoSearch: TEdit;
    edtMemoTitle: TEdit;
    embed1: TMenuItem;
    hiddenMenu: TMenuItem;
    hiddenNextTab: TMenuItem;
    hiddenPrevTab: TMenuItem;
    img1: TMenuItem;
    lstOutPut: TListBox;
    lvMemo: TListView;
    memoMemo: TMemo;
    miTaskTray: TMenuItem;
    object1: TMenuItem;
    tbCopyExtract: TToolButton;
    tbDoExclude: TToolButton;
    tbDoExtract: TToolButton;
    tbDoSelection: TToolButton;
    tbExtractReverse: TToolButton;
    tbExtractSelectAll: TToolButton;
    tbExtractSetting: TToolButton;
    tbFixExtract: TToolButton;
    tbHistorySearch: TToolButton;
    tbHistoryShowType: TToolButton;
    tbMenuTracker: TToolButton;
    tbOpenExtract: TToolButton;
    tbSaveExtract: TToolButton;
    tbUsrDefSetting: TToolButton;
    Action1: TAction;
    actShowBkmkImportForm: TAction;
    actShowIEImportForm: TAction;
    actToggleLockTab: TAction;
    NewTabPopup: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    LocationBar: TToolBar;
    LocationBox: TComboBoxEx;
    GoButton: TToolButton;
    SearchBar: TToolBar;
    SearchBox: TComboBoxEx;
    Splitter2: TSplitter;
    EngineBox: TComboBoxEx;
    ToolButton6: TToolButton;
    HighLightButton: TToolButton;
    tbGrepSearchBarText: TToolButton;
    actPopupUASelector: TAction;
    actPopupProxySelector: TAction;
    actEditMainMenu: TAction;
    actEditCtxMenu: TAction;
    actEditTabMenu: TAction;
    actEditToolbar: TAction;
    actFind: TAction;
    NotificationPanel: TPanel;

    function GetLinkBkmkList:TBookmarkList;
    function GetPrintSettings:nsIPrintSettings;
    function GetNewTabPos(OpenMode:Integer):Integer;
    function GetMDITabPos(OpenMode:Integer):Integer;
    function GetLink(node:nsIDOMNode):String;
    procedure SetSelectionAndScroll(aRange:nsIDOMRange;selCon:nsISelectionController);
    function GetDocShellForFrame(aFrame:nsIDOMAbstractView):nsIDocShell;
    function GetCurrentBrowser:TBagelBrowser;
    function GetBrowser(Index:Integer):TBagelBrowser;
    function GetBrowserById(Id:Cardinal):TBagelBrowser;

    procedure SideSplitterMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SideSplitterMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SideSplitterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1Resize(Sender: TObject);
    procedure actAboutBagelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure OnURIEnter;
    procedure LoadURI(URI:String);
    procedure LocationBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LocationBarResize(Sender: TObject);
    procedure DoPrintPreview;
    procedure ExitPrintPreview;
    procedure PrepareForPP;
    procedure RestorePrePPState;



    //LoadURI
    //OnURIEnter

    //Tab関連
    //InsertTab
    //GetCloneOfTab
    procedure ApplyEvtHandlersToBrowser(brwsr:TBagelBrowser);
    procedure BrowserContextMenu(Sender: TObject; aInfo: TCtxMenuInfo);
    procedure BrowserNewWindow(Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser);
    procedure BrowserDOMClick(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserDOMKeyPress(Sender: TObject; aEvent:nsIDOMKeyEvent);
    procedure BrowserDOMLinkAdded(Sender: TObject; aEvent:nsIDOMEvent);
    procedure BrowserDOMDragOver(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserDOMDragGesture(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserDOMDragDrop(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserDOMDragExit(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserDOMFocus(Sender: TObject; aEvent:nsIDOMEvent);
    procedure BrowserDOMMouseDown(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserStatusTextChange(Sender: TObject; aMessage: WideString);
    procedure BrowserProgressChange(Sender: TObject; Progress: Integer; ProgressMax: Integer);
    procedure BrowserDOMMouseScroll(Sender: TObject; aEvent:nsIDOMMouseEvent);
    procedure BrowserTitleChange(Sender: TObject; const Text: WideString);
    procedure BrowserLocationChange(Sender: TObject; const uri: AnsiString);
    procedure BrowserDocumentBegin(Sender: TObject; const aURI: String);
    procedure BrowserDownloadComplete(Sender: TObject; const aURI: String);
    procedure BrowserGoBack(Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
    procedure BrowserGoForward(Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
    procedure BrowserGoToIndex(Sender: TObject; aIndex: LongInt; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
    procedure WebPanelNewWindow(Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser);
    procedure WebPanelDOMClick(Sender: TObject; event: nsIDOMMouseEvent);

    function IsValidIndex(i:Integer):Boolean;
    function FindAction(name:String): TCustomAction;
    function FindScrollToCenter(win:nsIDOMWindow):Boolean;
    procedure FireGesture(Str:String);
    procedure FireShortcut(Str:String);
    procedure FireCommand(Str:String);
    function AddTab( uri       : String ;
                     OpenMode  : Integer ;
                     loadFlags : Integer = 0 ;
                     Referrer  : String  = '';
                     DocShell  : Integer = 0 ;//0のとき指定なし。デフォルト値を使う。
                     Reload    : Integer = 0 ):TBagelBrowser; overload;
    procedure SelectTab(Browser:TBagelBrowser); overload;
    procedure ReloadTab(Browser:TBagelBrowser); overload;
    procedure StopTab(Browser:TBagelBrowser); overload;
    procedure CloseTab(Browser:TBagelBrowser); overload;
    procedure CloneTab(b:TBagelBrowser;loadFlags:Integer=1);
    procedure LoadSession(fileName:String);
    procedure FormDestroy(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure TabControlContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabControlDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure TabControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TabControlDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TabControlDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TabControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actGoBackExecute(Sender: TObject);
    procedure actGoForwardExecute(Sender: TObject);
    procedure actCloseTabExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure actReloadExecute(Sender: TObject);
    procedure actCloseAllExecute(Sender: TObject);
    procedure actCloseLeftExecute(Sender: TObject);
    procedure actCloseRightExecute(Sender: TObject);
    procedure actCloseWithoutExecute(Sender: TObject);
    procedure actAddTabExecute(Sender: TObject);
    procedure actAddTabClipExecute(Sender: TObject);
    procedure actAddTabCurrExecute(Sender: TObject);
    procedure actAddTabBlankExecute(Sender: TObject);
    procedure actAddTabHomeExecute(Sender: TObject);
    procedure actBagelHelpExecute(Sender: TObject);
    procedure actBagelSiteExecute(Sender: TObject);
    procedure actClearCacheExecute(Sender: TObject);
    procedure actClearCookieExecute(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure OnGestureMessage(var Msg: TMsg; var Handled: boolean);
    procedure MoveGesture(pt: TPoint);
    procedure DelayedSidebarTogglerTimer(Sender: TObject);
    procedure WordFindButtonClick(Sender: TObject);
    procedure ClearWordSearchButtons;
    procedure TabControlDblClick(Sender: TObject);
    procedure TabControlOLEDrop(Sender: TObject; Str: String);
    procedure actClearHistoryExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function IsDenyTitle(Title:String):Boolean;
    function IsHilighted(b:TBagelBrowser):Boolean;
    procedure actGoHomeExecute(Sender: TObject);
    procedure actReloadAllExecute(Sender: TObject);
    procedure actStopAllExecute(Sender: TObject);
    procedure actZoomInExecute(Sender: TObject);
    procedure actZoomOutExecute(Sender: TObject);
    procedure actZoomNormalExecute(Sender: TObject);
    procedure actPageEndExecute(Sender: TObject);
    procedure actPageHomeExecute(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure AutoScrollTimerTimer(Sender: TObject);
    procedure actStartAutoScrollExecute(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actShowPageSetupExecute(Sender: TObject);
    procedure actPrintPreviewExecute(Sender: TObject);
    procedure btnPageSetupClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure btnPPCloseClick(Sender: TObject);
    procedure actNextTabExecute(Sender: TObject);
    procedure actPrevTabExecute(Sender: TObject);
    procedure TimerFireSetfocusTimer(Sender: TObject);
    procedure actOpenSelectionExecute(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    function ExtractUp(URI: string):String;
    procedure SwitchUA(UAStr:String);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actAddDenyTitleExecute(Sender: TObject);
    procedure actAddDenyURIExecute(Sender: TObject);
    procedure actToggleSidebarVisibleExecute(Sender: TObject);
    procedure actBookmarkSidebarExecute(Sender: TObject);
    procedure actHistorySidebarExecute(Sender: TObject);
    procedure actLinkSidebarExecute(Sender: TObject);
    procedure actGrepSidebarExecute(Sender: TObject);
    procedure actClipboardSidebarExecute(Sender: TObject);
    procedure actScriptSidebarExecute(Sender: TObject);
    procedure actMemoSidebarExecute(Sender: TObject);
    procedure actTransferSidebarExecute(Sender: TObject);
    procedure actOutputSidebarExecute(Sender: TObject);
    procedure actUserDefinedSidebarExecute(Sender: TObject);
    procedure actWebPanelExecute(Sender: TObject);
    procedure actShowPageInfoExecute(Sender: TObject);
    procedure actShowPageInfoUpdate(Sender: TObject);
    procedure actToggleStatusbarVisibleExecute(Sender: TObject);
    procedure actForDonutUsersExecute(Sender: TObject);
    procedure actViewSourceExecute(Sender: TObject);
    procedure actCtxPropertyExecute(Sender: TObject);
    procedure ViewPanelResize(Sender: TObject);
    procedure actShowCookieManExecute(Sender: TObject);
    procedure actShowPassManExecute(Sender: TObject);
    procedure WMDRAWCLIPBOARD( Var Msg :TMessage)         ; message  WM_DRAWCLIPBOARD;
    procedure WMCHANGECBCHAIN( Var Msg :TWMCHANGECBCHAIN) ; message  WM_CHANGECBCHAIN;
    procedure WMSYSCOMMAND(var Msg : TWMSYSCOMMAND);Message WM_SYSCOMMAND;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure actToggleMainbarVisibleExecute(Sender: TObject);
    procedure actToggleSearchBarVisibleExecute(Sender: TObject);
    procedure actToggleMenubarVisibleExecute(Sender: TObject);
    procedure actToggleLinkbarVisibleExecute(Sender: TObject);
    procedure actToggleTabbarVisibleExecute(Sender: TObject);
    procedure actToggleURIbarVisibleExecute(Sender: TObject);
    procedure SidebarTogglePanelClick(Sender: TObject);
    procedure actToggleGoButtonVisibleExecute(Sender: TObject);
    procedure bbgSaveTimerTimer(Sender: TObject);
    procedure actAllowJSExecute(Sender: TObject);
    procedure actAllowImgExecute(Sender: TObject);
    procedure actAllowPluginsExecute(Sender: TObject);
    procedure actAllowFramesExecute(Sender: TObject);
    procedure actAllowRedirectExecute(Sender: TObject);
    procedure actWorkOfflineExecute(Sender: TObject);
    procedure actOpenAboutConfigExecute(Sender: TObject);
    procedure actWorkOfflineUpdate(Sender: TObject);
    procedure actDefaultTabsExecute(Sender: TObject);
    procedure actShowCookieP3PCustomSettingExecute(Sender: TObject);
    procedure BrowserSetForcedCharacterSet(aCharset:String);
    procedure BuildCharsetMenu;
    procedure CharsetMenuItemClick(Sender: TObject);
    procedure SaveSnapshot(Filename:String);
    procedure ObserveClipListClick(Sender: TObject);
    procedure chkObserveClipboardClick(Sender: TObject);
    procedure LinkListViewDblClick(Sender: TObject);
    procedure OpenLinkListItemClick(Sender: TObject);
    procedure CopyLinkListURLClick(Sender: TObject);
    procedure CopyLinkListTextClick(Sender: TObject);
    procedure CopyLinkListBothClick(Sender: TObject);
    procedure actShowWebPanelEditorExecute(Sender: TObject);
    procedure ShowMenuIcon(Flag:Boolean);
    procedure GPICopyClick(Sender: TObject);
    procedure GPICutClick(Sender: TObject);
    procedure GPIPasteClick(Sender: TObject);
    procedure MenuToolbarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel5Resize(Sender: TObject);
    procedure GPISelectAllClick(Sender: TObject);
    procedure HilightBrowser(b:TBagelBrowser;style:String;patText:String;hilight:Boolean);
    procedure ChangeSelectionColor(win:nsIDOMWindow;attention:Boolean);
    procedure actShowSidebarIconsExecute(Sender: TObject);
    procedure Panel6Resize(Sender: TObject);
    procedure BackHistoryPopupPopup(Sender: TObject);
    procedure HistGotoIndex(Sender: TObject);
    procedure ForwardHistoryPopupPopup(Sender: TObject);
    procedure actFindDialogExecute(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Panel7Resize(Sender: TObject);
    procedure SidePanelResize(Sender: TObject);
    procedure SidebarHeaderButtonbarResize(Sender: TObject);
    procedure lvMemoSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure TabControl2Change(Sender: TObject);
    procedure MemoSheetShow(Sender: TObject);
    procedure CreateMemoClick(Sender: TObject);
    procedure CreateMemoItemClick(Sender: TObject);
    procedure lvMemoEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure edtMemoSearchChange(Sender: TObject);
    procedure memoMemoChange(Sender: TObject);
    procedure GoButtonPopupPopup(Sender: TObject);
    procedure GoButtonExtMenuClick(Sender: TObject);
    procedure actShowExtGoEditorExecute(Sender: TObject);
    procedure DeleteMemoClick(Sender: TObject);
    procedure TabControl2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DeleteMemoItemClick(Sender: TObject);
    procedure TabControl2Resize(Sender: TObject);
    procedure AddToMemoClick(Sender: TObject);
    procedure AddToMemoItemClick(Sender: TObject);
    procedure edtMemoSearchKeyPress(Sender: TObject; var Key: Char);
    procedure lvMemoDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
    procedure lvMemoDblClick(Sender: TObject);
    procedure actTaskTrayExecute(Sender: TObject);
    procedure BagelTrayIconDblClick(Sender: TObject);
    procedure ApplySysFontToMenu;
    procedure LoadExtensions;
    procedure ScriptExec(Sender: TObject);
    procedure CommandExtExec(Sender: TObject);
    procedure ExtCopyMenuClick(Sender: TObject);
    procedure ExtAppMenuClick(Sender: TObject);
    procedure actGoUpExecute(Sender: TObject);
    procedure actGoExecute(Sender: TObject);
    procedure ToolPCookieConfigClick(Sender: TObject);
    procedure ThisSiteCookieClick(Sender: TObject);
    procedure CookiePLifeTimeClick(Sender: TObject);
    procedure CookieLifetimeNormalClick(Sender: TObject);
    procedure CookieLifetimeSessionClick(Sender: TObject);
    procedure CookieLifetimeAskEachClick(Sender: TObject);
    procedure DenyAllCookieClick(Sender: TObject);
    procedure DenyAllowCookieMenuClick(Sender: TObject);
    procedure cmbGrepKeywordKeyPress(Sender: TObject; var Key: Char);
    procedure FireGrep(aWord:String; mode:Integer; Browser:TBagelBrowser);
    procedure GrepListClick(Sender: TObject);
    procedure tbGrepSearchBarTextClick(Sender: TObject);
    procedure actToggleSearchBtnVisibleExecute(Sender: TObject);
    function RegExpFind(Range:nsIDOMRange;patRegExp:String):nsIDOMRange;
    procedure actToggleNoGripperExecute(Sender: TObject);
    procedure ViewPEncodeClick(Sender: TObject);
    procedure actAddBookmarkExecute(Sender: TObject);
    procedure RegisterBookmark(URI:String;Title:String; parent: TBookmarkList =nil; index: integer =0;docshell:String='';reload:String='');
    procedure UnRegisterBookmark(bkmk:TBkmkBase);
    procedure SaveBookmarks(save: boolean=true);
    procedure BookmarksTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HistoryItemClicked(Sender: TObject);
    procedure HistoryTreeMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BookmarksTreeClick(Sender: TObject);
    procedure BookmarksTreeMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actAddPanelExecute(Sender: TObject);
    procedure actSearchSelectionExecute(Sender: TObject);
    procedure SearchByEngine(keyword:String;Engine:String);
    procedure DoSearch(Keyword:String; Index:Integer = -1);
    procedure actFocusSearchExecute(Sender: TObject);
    procedure actFocusSearchEngineExecute(Sender: TObject);
    procedure EngineBoxSelect(Sender: TObject);
    procedure SearchBoxSelect(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure SearchBoxKeyPress(Sender: TObject; var Key: Char);
    procedure DelayedSearchButtonCreatorTimer(Sender: TObject);
    procedure actDropdownAddressbarExecute(Sender: TObject);
    procedure GoUpListMenuClick(Sender: TObject);
    procedure GoUpListItemClick(Sender: TObject);
    procedure actDoSearchExecute(Sender: TObject);
    procedure actFocusLocationBoxExecute(Sender: TObject);
    procedure actCopyURIExecute(Sender: TObject);
    procedure actCopyTitleAndURIExecute(Sender: TObject);
    procedure actCopyTitleExecute(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure actCopyCtxURIExecute(Sender: TObject);
    procedure actOpenCtxLinkExecute(Sender: TObject);
    procedure actOpenCtxLinkNewTabExecute(Sender: TObject);
    procedure actShowCtxImageExecute(Sender: TObject);
    procedure actShowCtxBgImageExecute(Sender: TObject);
    procedure actFullScreenExecute(Sender: TObject);
    procedure actIEViewExecute(Sender: TObject);
    procedure actBlockCtxImageExecute(Sender: TObject);
    procedure ToolPUASwitchClick(Sender: TObject);
    procedure UASwitchChildClick(Sender: TObject);
    procedure StyleSheetSwitchClick(Sender: TObject);
    procedure CookieConfigMenuClick(Sender: TObject);
    procedure actToggleMultilineTabExecute(Sender: TObject);
    procedure ToolPProxySwitchClick(Sender: TObject);
    procedure ChangeProxy(Sender:TObject);
    procedure SSSMenuClick(Sender: TObject);
    procedure SSSExMenuClick(Sender: TObject);
    procedure LoadSaveUserCSS(load:Boolean);
    procedure actToggleMultilineTabUpdate(Sender: TObject);
    procedure actRewindExecute(Sender: TObject);
    procedure actFastForwardExecute(Sender: TObject);
    procedure actFocusTabExecute(Sender: TObject);
    procedure RecentClosedURIMenuClick(Sender: TObject);
    procedure RecentOpenedURIMenuClick(Sender: TObject);
    procedure MenuRecentCClick(Sender: TObject);
    procedure MenuRecentOClick(Sender: TObject);
    procedure actReOpenMostRecentExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure actSelectNoneExecute(Sender: TObject);
    function WildcardMatch(Exp:String;S:String):Boolean;
    procedure FormShow(Sender: TObject);
    procedure actFocusSidebarExecute(Sender: TObject);
    procedure actBookmarkEditorExecute(Sender: TObject);
    procedure actBookmarkPropertyExecute(Sender: TObject);
    procedure actBookmarkPropertyUpdate(Sender: TObject);
    procedure actDeleteBookmarkExecute(Sender: TObject);
    procedure actDeleteBookmarkUpdate(Sender: TObject);
    procedure actCopyBookmarkUpdate(Sender: TObject);
    procedure actCutBookmarkUpdate(Sender: TObject);
    procedure actCutBookmarkExecute(Sender: TObject);
    procedure actOpenBookmarkUpdate(Sender: TObject);
    procedure actOpenBookmarkExecute(Sender: TObject);
    procedure AddLinkToBookmarks;
    procedure OpenAllBookmarks(Sender:TObject);
    procedure OpenAllBookmarksInternal(l:TBookmarkList);
    procedure actPasteBookmarkUpdate(Sender: TObject);
    procedure actCopyBookmarkExecute(Sender: TObject);
    procedure actPasteBookmarkExecute(Sender: TObject);
//    procedure BkmkMenuCreate(Sender: TObject);
    procedure BookmarkPNewFolderClick(Sender: TObject);
    procedure AddBookmarkHere(Sender:TObject);
    procedure OnBookmarkShortcutMenuClick(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actShowImgManExecute(Sender: TObject);
    procedure actShowPopupManExecute(Sender: TObject);
    procedure actShowUAManExecute(Sender: TObject);
    procedure actShowAdblockManExecute(Sender: TObject);
    procedure HighLightButtonClick(Sender: TObject);
    procedure SecPAllowJSClick(Sender: TObject);
    procedure SecPAllowMetaRedClick(Sender: TObject);
    procedure SecPAllowPluginsClick(Sender: TObject);
    procedure SecPAllowFramesClick(Sender: TObject);
    procedure SecPAllowImgClick(Sender: TObject);
    procedure TabPSecurityClick(Sender: TObject);
    procedure tbCopyExtractClick(Sender: TObject);
    procedure tbDoExtractClick(Sender: TObject);
    procedure tbDoSelectionClick(Sender: TObject);
    procedure tbDoExcludeClick(Sender: TObject);
    procedure tbExtractReverseClick(Sender: TObject);
    procedure tbExtractSelectAllClick(Sender: TObject);
    procedure tbOpenExtractClick(Sender: TObject);
    procedure tbFixExtractClick(Sender: TObject);
    procedure LoadLinkSidebar;
    procedure Extract_CheckByPattern(Check:Boolean);
    procedure cboExtractPatternKeyPress(Sender: TObject; var Key: Char);
    procedure SearchByNickname(keyword:String;Nickname:String);
    procedure TabPAutoReloadClick(Sender: TObject);
    procedure AReloadClick(Sender: TObject);
    procedure GlobalHotkeyPressed(Sender: TObject; Modifiers, virtkey: Word);
    procedure actShowBkmkImportFormExecute(Sender: TObject);
    procedure RandomProxySelectorTimer(Sender: TObject);
    procedure actShowIEImportFormExecute(Sender: TObject);
    procedure ViewMenuSidebarClick(Sender: TObject);
    procedure WebPanelItemClick(Sender: TObject);
    procedure tbUsrDefSettingClick(Sender: TObject);
    procedure FileTreeViewDblClick(Sender:TObject);
    procedure actToggleLockTabExecute(Sender: TObject);
    procedure actToggleLockTabUpdate(Sender: TObject);
    procedure RewindPopupPopup(Sender: TObject);
    procedure FForwardPopupPopup(Sender: TObject);
    procedure DoBackUp;
    function FireOperaKey(Str:String):Boolean;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure lvTransferDblClick(Sender: TObject);
{    procedure FormFileDropped(Sender: TJvDropTarget; var Effect: TJvDropEffect;
        Shift: TShiftState; X, Y: Integer);}
    procedure bkmkSearchEditChange(Sender: TObject);
    procedure bkmkSearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BookmarksTreeDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure BookmarksTreeDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure SearchBoxDragEnter(var Res: HRESULT;      const dataObj: IDataObject; KeyState: TNkKeyState; pt: TPoint;      var dwEffect: Integer);
    procedure SearchBoxDragLeave(var Res: HRESULT);
    procedure SearchBoxDragOver(var Res: HRESULT;      KeyState: TNkKeyState; pt: TPoint; var dwEffect: Integer);
    procedure SearchBoxDrop(var Res: HRESULT;      const dataObj: IDataObject; KeyState: TNkKeyState; pt: TPoint;      var dwEffect: Integer);
    procedure ToolButton6Click(Sender: TObject);
    procedure MenuToolbarResize(Sender: TObject);
    procedure ControlToolbarResize(Sender: TObject);
    procedure LinkbarResize(Sender: TObject);
    procedure BookmarkMenuClick(Sender: TObject);
    procedure BookmarkItemClick(Sender: TObject);
    procedure actEditMainMenuExecute(Sender: TObject);
    procedure actEditCtxMenuExecute(Sender: TObject);
    procedure actEditTabMenuExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actEditToolbarExecute(Sender: TObject);
    procedure HistorySortByVisitClick(Sender: TObject);
    procedure HistorySortByDateClick(Sender: TObject);
    procedure HistorySortBySiteClick(Sender: TObject);
    procedure DummyProc(Sender: TObject);
  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure CreateParams(var Params: TCreateParams); override;

  private
    { Private 宣言 }
    SplitterPressed:Boolean;  //サイドバーのスプリッタが押されているかどうか
    SplitterStptROffset:Integer; //クリックしはじめたX座標
    TabZOrder:TList; // タブのZ-Orderを記憶する
    StatusWidgetList:TList; //ステータスバーのウィジェットを記憶する
    moveGestureTemp: String; //マウスジェスチャの経過を記憶
    prevPoint: TPoint; //マウスジェスチャにおける直前のマウスの位置
    //mouseGestureEnable: Boolean;
    restrainContext: Boolean; //コンテキストメニューを出さない
    clickGestureStandby: boolean;
    tabDragSourceIndex:Integer; //ドラッグ中のタブのindex
    tabDblClicked:Boolean;
    FNowPrintPreviewing:Boolean; //PrintPreview中か？
    FOldSidebarVisible:Boolean;//印刷プレビューからの復帰用
    FOldStatusbarVisible:Boolean;//印刷プレビューからの復帰用
    hNextViewer :integer;//クリップボード監視関連
    PrevSearchType:Integer; //直前にどういう検索をしたか？
    PrevNormalSearchStr:String;
    //ドロップターゲット
    InternalTargetList:TStringList;
    memoBarCtxTarget:Integer; //どのMemoが選択されているか
    STPOriginalProc:TWndMethod; //Download
    SearchBoxHighlighted: Boolean;//検索バーがハイライトされているか
    SearchBoxDropTarget: TNkDropTarget;
    SimpleProfile:TGeckoSimpleProfile;
    SimpleHALDialog: TGeckoSimpleHALDialog;
    SimplePrompt: TGeckoSimplePrompt;
    FAutoExec:TAutoExecManager;
    mSelfLeft:Integer;
    mSelfTop: Integer;
    mSelfWidth:Integer;
    mSelfHeight:Integer;
    //
    FBookmarkSearchFlag:Boolean;
    //スタイルシート
    processedStyleSheets:TStringList;
    //FULLSCREEN
    mKioskTabBarVisible:Boolean;
    mKioskSearchBarVisible:Boolean;
    mKioskLinkBarVisible:Boolean;
    mKioskAddressBarVisible:Boolean;
    mKioskMainBarVisible:Boolean;
    mKioskMenuBarVisible:Boolean;
    mKioskStatusBarVisible:Boolean;
    procedure STPSubClassProc(var Msg:TMessage);//サイドバー切り替えパネルの新しいWndProc
  public
    { Public 宣言 }
    AutoScrolling:Boolean; //オートスクロール中か？
    AutoScrollOrigPt:TPoint;
    //コンテキストメニュー
    tabBarCtxTarget:Integer; //タブバーの右クリックで選択されたタブ
    //historyCtxTarget:xxx;  //履歴サイドバーで選択された履歴
    bkmkCtxTarget:TBkmkBase; //ブックマークサイドバーまたはリンクバーで選択されたブックマーク

    ExtGoList:TStringList; //アドレスバー拡張の文字列
    ExtAppList:TList; //連携するアプリのリスト
    ExtCopyList:TList;//拡張コピーのリスト
    TabControl: TTabbedToolBar; //タブコントロール

    StatusBar: TStatusBar;      //ステータスバー
    swProxySelector:TStatusWidget;
    swAgentSelector:TStatusWidget;

    ProgressBar : TProgressBar; //プログレスバー
    MyLabel: TStatusWidget;
    Linkbar : TBagelLinkbar;
    WebPanel: TGeckoBrowser; //WebPanel
    lvTransfer: TDownloadListView;
//    FormDropTarget: TJvDropTarget;
    currentCtxURI:WideString;
    currentCtxImg:WideString;
    currentCtxBGImg:WideString;
    currentCtxTargetNode:nsIDOMNode;
    currentCtxSel:Boolean;
    currentCtxWindow:Boolean;
    currentCtxQuote:Boolean;
    currentCtxTextBox:Boolean;
    LoadCompleted:Boolean;
    bookmarks:TBookmarks;
    BookmarksTree:TBookmarkTreeView;
//    GlobalHotkey:TGlobalHotkey;
    HistoryTree: THistoryTreeView;
    WebPanelList:TStringList; //WebPanelのURIリスト
    FileTreeView:TShellTreeView;
    ControlToolbar:TBagelToolbar;
    MenuToolbar:TBagelToolbar;
    MainCoolbar:TBagelCoolbar;
    CtrlTbActionContainer,TestActionContainer2,TestActionContainer3:TBagelActionContainer;
    TabMenu, ContextMenu: TBagelActionContainer;
    BookmarkMenu: TBagelBookmarkContainer;
    RecentClosedURIMenu: TBagelActionContainer;
    RecentOpenedURIMenu: TBagelActionContainer;
    WebPanelListMenu: TBagelActionContainer;//New
    EncodeMenu: TBagelActionContainer;//Assigned
    AutoReloadMenu: TBagelActionContainer;//New
    TabSecurityMenu: TBagelActionContainer;//New
    ExtCopyMenu : TBagelActionContainer;//Assigned
    ExtAppMenu : TBagelActionContainer;//Assigned
    UASwitchMenu: TBagelActionContainer;//Fixed
    ProxySwitchMenu: TBagelActionContainer;//New
    StyleSwitchMenu: TBagelActionContainer;//Assigned
    CookieConfigMenu: TBagelActionContainer;//New
    TabPopup, GeckoPopup: TBagelPopupMenu;
    actPopupDisableDuringLoad,
    actDisableCtxMenuEvt,
    actBlockTargetNewWin,
    actDisableFrames,
    actEnableFrameResize,
    actRefererDontSend,
    actRefererLink,
    actRefererAll: TGeckoPrefAction;
    function AddTab( uri       : String):TBagelBrowser; overload;
    procedure SelectTab(index:Integer); overload;
    procedure ReloadTab(index:Integer); overload;
    procedure StopTab(index:Integer); overload;
    procedure CloseTab(Index:integer); overload;
    procedure UpdatePrefs;
    procedure UpdateSearch;
  end;

var
  BagelMainForm: TBagelMainForm;

implementation

uses UPageSetup,UPageInfo,PropertiesForm,UCookieMan,
     UPassman, UCookieP3P, UWebPanelEdit, UBagelMemo,
     UExtGoEdit, BookmarkUnit,  UBookmarkEditor, UBagelPref,
     UImportNetscape, UImportIE, UMenuEdit;

{$R *.dfm}

constructor TBagelExtSSAction.Create(AOwner: TComponent);
begin
  FSSType:=0;
  FSSName:='';
  FFileName:='';
  inherited;
end;

constructor TBagelExtCharsetAction.Create(AOwner: TComponent);
begin
  FCharset:='';
  inherited;
end;

constructor TBagelCharsetAction.Create(AOwner: TComponent);
begin
  FCharset:='';
  inherited;
end;

function GetDocShellSettingForB(b:TBagelBrowser):Integer;
var
  plugins:LongBool;
  js:LongBool;
  frames:LongBool;
  meta:LongBool;
  img:LongBool;
begin
  Result := 0;
  plugins := b.DocShell.AllowPlugins;
  js      := b.DocShell.AllowJavascript;
  meta    := b.DocShell.AllowMetaRedirects;
  frames  := b.DocShell.AllowSubframes;
  img     := b.DocShell.AllowImages;
  if plugins then Result:=Result+1;
  if js then Result:=Result+2;
  if frames then Result:=Result+4;
  if meta then Result:=Result+8;
  if img then Result:=Result+16;
end;
{リファラを送信するかどうか}
function IsSendReferrer(Referrer:String):String;
const                       
  HTTP_REF_PREF='network.http.sendRefererHeader';
var
  gp:TGeckoPref;
begin
  gp:=TGeckoPref.Create;
  if gp.GetRootBranch.GetIntPref(HTTP_REF_PREF)=0 then
    Result:='http://unko.jp/'
  else Result:=Referrer;
  gp.Free;
end;

function Max(i1:Integer; i2:Integer):Integer;
begin
  Result:=i1;
  if i2>i1 then Result:=i2;
end;

function min(i1:Integer; i2:Integer):Integer;
begin
  Result:=i1;
  if i2<i1 then Result:=i2;
end;

function Doc2Win(doc:nsIDOMDocument):nsIDOMWindow;
begin
  Result := ((doc as nsIDOMDocumentView).DefaultView as nsIDOMWindow);
end;

// from OpenJane
function GetMouseInPane(control: TControl): boolean;
var
  point: TPoint;
begin
  Result := False;
  if GetCursorPos(point) then
  begin
    point := control.ScreenToClient(point);
    result := (0 <= point.X) and (point.X < control.Width) and
              (0 <= point.Y) and (point.Y < control.Height);
  end;
end;

//from gikonavi
function GetWidthAllToolButton(ToolBar: TToolBar): Integer;
var
	i: Integer;
begin
	Result := 0;
	for i := 0 to ToolBar.ButtonCount - 1 do
		if ToolBar.Buttons[i].Visible then
			Result := Result + ToolBar.Buttons[i].Width;
end;



function URIToStr(aURI:nsIURI):String;
var
  cstr: IInterfacedCString;
begin
  cstr :=NewCString('');
  aURI.GetSpec(cstr.ACString);
  Result := cstr.ToString;
end;


function StrToURI(aStr:String):nsIURI;
var
  uri:nsIURI;
begin
  NS_CreateInstance('@mozilla.org/network/standard-url;1',nsIURI,uri);
  uri.SetSpec(NewCString(aStr).ACString);
  Result := uri;
end;


procedure SetSelection(aRange:nsIDOMRange;selCon:nsISelectionController);
var
  selection:nsISelection;
//  a:nsIContentViewer;
begin
//  selection.
//selCon.getSelection(selCon.SELECTION_NORMAL);

  selection := selCon.GetSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
  selection.RemoveAllRanges;
  selection.AddRange(aRange);
  (*selCon.ScrollSelectionIntoView(
  NS_ISELECTIONCONTROLLER_SELECTION_NORMAL,
  NS_ISELECTIONCONTROLLER_SELECTION_FOCUS_REGION,
  true);*)
end;
{Rangeを画面の中央に持ってくる}
procedure DoCenterRange(aFrame:nsIDOMWindow;aRange:nsIDOMRange);
var
  myRange:nsIDOMRange;
  myElem:nsIDOMElement;
  y_Offset:Integer;
  tmpNode:nsIDOMNode;
  tmpNode2:nsIDOMNode;
  tmpOffset:Integer;
  pageXOffset:Integer;
  FrameHeight:Integer;
begin
  myElem := aFrame.Document.CreateElement(NewString('span').AString);
  myRange := (aFrame.Document as nsIDOMDocumentRange).CreateRange;
  {aRange.GetStartContainer(tmpNode);
  aRange.GetStartOffset(tmpOffset);}
  tmpNode := aRange.EndContainer;
  tmpOffset := aRange.EndOffset;
  myRange.SetStart(tmpNode,tmpOffset);
  myRange.SetEnd(tmpNode,tmpOffset);
  myRange.InsertNode(myElem as nsIDOMNode);

  FrameHeight := (aFrame as nsIDOMWindowInternal).InnerHeight;
  y_Offset := GetPageOffsetTop(myElem) - (FrameHeight div 2);
  pageXOffset := (aFrame as nsIDOMWindowInternal).PageXOffset;
  (aFrame as nsIDOMWindowInternal).Scroll(pageXOffset,y_Offset);

  tmpNode := myElem.ParentNode;
  tmpNode2:=tmpNode.RemoveChild(myElem as nsIDOMNode);
  myRange.DeleteContents;
  myRange.Detach;
  tmpNode.Normalize;
end;

function convertURIToFilePath(aURI:nsIURI):String;
var
  ioService:nsIIOService;
  URI:nsIURI;
  spec:IInterfacedCString;
  isfile:LongBool;
  handler:nsIProtocolHandler;
  fileHandler:nsIFileProtocolHandler;
  filefile:nsIFile;
  path:IInterfacedString;
begin
  Result:='';
  ioService := NS_GetIOService;
  spec:=NewCString;
  aURI.GetSpec(spec.ACString);
  URI := NS_NewURI(spec.ToString);
  isfile := URI.SchemeIs(PChar('file'));
  path:=NewString;
  if not isfile then Exit;
  handler := ioService.GetProtocolHandler(PChar('file'));
  handler.QueryInterface(nsIFileProtocolHandler,fileHandler);
  filefile := fileHandler.GetFileFromURLSpec(spec.ACString);// 「 URL 文字列からファイルを得る」機能
  filefile.GetPath(path.AString);
  Result:=path.ToString;// ファイルのパスを帰す
end;

function TBagelMainForm.GetLinkBkmkList:TBookmarkList;
var
  i:Integer;
begin
  for i := 0 to bookmarks.Count - 1 do
  begin
    if bookmarks.Items[i].name = 'リンク' then
      break;
  end;
  if bookmarks.Items[i] is TBookmarkList then
    Result:=TBookmarkList(bookmarks.Items[i])
  else
    Result := nil;
end;



function TBagelMainForm.IsHilighted(b:TBagelBrowser):Boolean;
begin
  Result:=IsHilightedWin(b.ContentWindow);
end;

function TBagelMainForm.IsDenyTitle(Title:String):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i:=0 to Pref.DenyTitleList.Count-1 do
  begin
    if Pos(UpperCase(Pref.DenyTitleList.Strings[i]),UpperCase(Title))>0 then
    begin
      Result:=true;
      exit;
    end;
  end;
end;

procedure TBagelMainForm.FireGesture(Str:String);
var
  gestObj:TObject;
  gestName:String;
begin
  tabBarCtxTarget:=TabControl.TabIndex;
  gestName:=Pref.GestList.Values[Str];
  gestObj:=FindAction(gestName);
  if (TabControl.Tabs.Count>0) and GetMouseInPane(ViewPanel) then begin end;
        restrainContext:=true;
  if (gestObj<>nil) and (gestObj is TCustomAction) then
  begin
    TCustomAction(gestObj).Execute;
    StatusBar.Panels[0].Text:=TCustomAction(gestObj).Caption;
    if TCustomAction(gestObj)=actCloseTab then begin end;//restrainContext:=false;
  end
  else
  begin
    StatusBar.Panels[0].Text:='対応するジェスチャがありません:'+Str;
  end;
end;

procedure TBagelMainForm.FireShortcut(Str:String);
var
  kbdObj:TObject;
  kbdName:String;
begin
  tabBarCtxTarget:=TabControl.TabIndex;
  kbdName:=Pref.KbdList.Values[Str];
  kbdObj:=FindAction(kbdName);
  if (kbdObj<>nil) and (kbdObj is TCustomAction) then
  begin
    TCustomAction(kbdObj).Execute;
  end;
end;

procedure TBagelMainForm.FireCommand(Str:String);
var
//  index:Integer;
  obj:TObject;
//  kbdName:String;
begin
  tabBarCtxTarget:=TabControl.TabIndex;
  obj:=FindAction(str);
  if (obj<>nil) and (obj is TCustomAction) then
  begin
    TCustomAction(obj).Execute;
  end;
end;

function TBagelMainForm.GetNewTabPos(OpenMode:Integer):Integer;
var
  PosMode:Integer;
begin
  Result := TabControl.Tabs.Count;
  PosMode:= OpenMode shr 2;
  case PosMode of
    0:Result:=TabControl.Tabs.Count;
    1:Result:=0;
    2:Result:=TabControl.TabIndex+1;
    3:Result:=Max(TabControl.TabIndex,0);
  end;
end;

function TBagelMainForm.GetMDITabPos(OpenMode:Integer):Integer;
begin
  Result:=TabZOrder.Count;
  if (OpenMode and 2)=0 then begin
  //  omote
  end
  else begin
  //  ura
    Result:=0;
  end;
end;

function TBagelMainForm.GetLink(node:nsIDOMNode):String;
var
  tmpNode:nsIDOMNode;
  HrefStr:IInterfacedString;
  a:nsIDOMHTMLAnchorElement;
  area:nsIDOMHTMLAreaElement;
  link:nsIDOMHTMLLinkElement;
begin
  Result:='';
  HrefStr:=NewString('');
  while node<>nil do
  begin
    if Supports(node, nsIDOMHTMLAnchorElement, a) then begin
      a.GetHref(HrefStr.AString);
      Result:=HrefStr.ToString;
      Exit;
    end
    else if Supports(node, nsIDOMHTMLAreaElement, area) then begin
      area.GetHref(HrefStr.AString);
      Result:=HrefStr.ToString;
      Exit;
    end
    else if Supports(node, nsIDOMHTMLLinkElement, link) then begin
      link.GetHref(HrefStr.AString);
      Result:=HrefStr.ToString;
      Exit;
    end;
    tmpNode := node.ParentNode;
    node:=tmpNode;
  end;
end;

procedure TBagelMainForm.SearchByEngine(keyword:String;Engine:String);
var
  conv:nsITextToSubURI;
  listCount:Integer;
  listNumStr:String;
  i:Integer;
  encode:String;
  pquery:PChar;
  text:PWideChar;
  b:TBagelBrowser;
  front,back:String;
begin

  if Pref.IniFile2.ReadInteger(Engine,'Group',0)=0 then
  begin
    //実際に検索する
    encode:=Pref.IniFile2.ReadString(Engine,'Encode','UTF-8');
    if encode='' then encode:='UTF-8';

    NS_GetService('@mozilla.org/intl/texttosuburi;1',nsITextToSubURI,conv);
    text:=PWideChar(WideString(keyword));

    pquery := conv.ConvertAndEscape(PChar(encode),text);

    front := Pref.IniFile2.ReadString(Engine,'FrontURL','');
    back := Pref.IniFile2.ReadString(Engine,'BackURL','');

    b:=AddTab(front+String(pquery)+back,0,0,'',Pref.DocShellDefault);

    nsMemory.Free(pquery);

    if Pref.AutoHighlightAfterSearch then
    b.AutoHighlight:=true;
    if Pref.AutoTabLockAfterSearch then
    b.Locked:=true;
  end
  else
  begin
    //グループなのでメタ検索
    listCount := Pref.IniFile2.ReadInteger(Engine,'ListCount',0);
    if listCount>0 then for i:=1 to listCount do begin
      listNumStr:=IntToStr(i);
      if i<10 then listNumStr:= '0' + listNumStr;
      SearchByEngine(keyword, Pref.IniFile2.ReadString(Engine,listNumStr,''));
    end;
  end;
end;

procedure TBagelMainForm.DoSearch(Keyword:String; Index:Integer = -1);
begin
  if Pref.ReplaceZenkakuSpace then Keyword:=StringReplace(Keyword , '　' , ' ',[rfReplaceAll]);
  if Index < 0 then
  begin
    //使うエンジンはツールバーで選択されたもの
    SearchByEngine(Keyword, EngineBox.Items.Strings[EngineBox.ItemIndex]);
  end
  else begin
    SearchByEngine(Keyword, EngineBox.Items.Strings[Index]);
  end;
end;

procedure TBagelMainForm.GoButtonExtMenuClick(Sender: TObject);
var
  tag,barpos:Integer;
  str,uri:WideString;
begin
  tag:=TMenuItem(Sender).Tag;
  str:=ExtGoList.Strings[tag];
  barpos:=Pos('|',str);
  uri:=Copy(str,barpos+1,Length(str)-barpos);
  uri:=StringReplace(uri,'%addr%',LocationBox.Text,[rfReplaceAll]);
  AddTab(uri,Pref.OpenModeLocation,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.GoButtonPopupPopup(Sender: TObject);
var
  tmpItem:TMenuItem;
  i:Integer;
//  act:TCommandAction;
  barpos:Integer;
  cap:WideString;
begin
  while GoButtonPopup.Items.Count>2 do GoButtonPopup.Items[2].Free;
  for i:=0 to ExtGoList.Count-1 do begin
    tmpItem:=TMenuItem.Create(nil);
    tmpItem.Tag:=i;
    cap:=ExtGoList.Strings[i];
    barpos:=Pos('|',cap);
    cap:=Copy(cap,1,barpos-1);
    tmpitem.Caption:=cap;
    tmpItem.OnClick:=GoButtonExtMenuClick;
    GoButtonPopup.Items.Add(tmpItem);
  end;
  tmpItem:=TMenuItem.Create(nil);
  tmpItem.Caption:='-';
  GoButtonPopup.Items.Add(tmpItem);
  tmpItem:=TMenuItem.Create(nil);
  tmpItem.Action:=actShowExtGoEditor;
  GoButtonPopup.Items.Add(tmpItem);
end;

procedure TBagelMainForm.GoUpListItemClick(Sender: TObject);
var
  i:Integer;
  uri:String;
  bnf:Integer;
begin
  if GetCurrentBrowser=nil then Exit;
  uri := GetCurrentBrowser.URI;
  bnf:=TMenuItem(Sender).Tag;
  for i:=1 to bnf do begin
    uri:=ExtractUp(uri);
  end;
  GetCurrentBrowser.LoadURI(uri);
end;

procedure TBagelMainForm.GoUpListMenuClick(Sender: TObject);
var
  u:nsIURI;
  str: IInterfacedCString;
  prepath: WideString;
  path: WideString;
  item: TMenuItem;
  cnt:Integer;
begin
  while GoUpListMenu.Count>1 do begin
   GoUpListMenu.Items[1].Free;
  end;
  cnt:=0;
  if GetCurrentBrowser <> nil then begin
  //文字列
    str :=NewCString('');
  //URI
//    NS_NewURI(u,'');
    u := (GetCurrentBrowser.WebBrowser as nsIWebNavigation).CurrentURI;
    if u=nil then exit;
    u.GetPrePath(str.ACString);
    PrePath:=str.ToString;
    u.GetSpec(str.ACString);
    Path:=str.ToString;
    if ExtractUp(Path) = '' then exit;
    while (Prepath<>Path) do
    begin
      Path:=ExtractUp(Path);
      Inc(cnt);
      item:=TMenuItem.Create(Self);
      item.Caption:=Path;
      item.OnClick:=GoUpListItemClick;
      item.Tag:=cnt;
//      item.ImageIndex:=10;
      GoUpListMenu.Add(item);
    end;
  end;
end;

procedure TBagelMainForm.SetSelectionAndScroll(aRange:nsIDOMRange;selCon:nsISelectionController);
var
  selection:nsISelection;
begin
  selection := selCon.GetSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
  selection.RemoveAllRanges;
  selection.AddRange(aRange);
  selCon.ScrollSelectionIntoView(
  NS_ISELECTIONCONTROLLER_SELECTION_NORMAL,
  NS_ISELECTIONCONTROLLER_SELECTION_FOCUS_REGION,
  true);
end;


procedure TBagelMainForm.GPICopyClick(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
begin
  NS_GetInterface(GetCurrentBrowser.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.CopySelection;
end;

procedure TBagelMainForm.GPICutClick(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
begin
  NS_GetInterface(GetCurrentBrowser.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.CutSelection;
end;

procedure TBagelMainForm.GPIPasteClick(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
begin
  NS_GetInterface(GetCurrentBrowser.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.Paste;
end;

procedure TBagelMainForm.GPISelectAllClick(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
begin
  NS_GetInterface(GetCurrentBrowser.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.SelectAll;
end;

function TBagelMainForm.GetDocShellForFrame(aFrame:nsIDOMAbstractView):nsIDocShell;
var
  ir:nsIInterfaceRequestor;
  webNav:nsIWebNavigation;
  ds:nsIDocShell;
begin
  aFrame.QueryInterface(NS_IInterfaceRequestor_IID,ir);
  ir.GetInterface(nsIWebNavigation,webNav);
  webNav.QueryInterface(ns_IDocShell_IID,ds);
  Result:=ds;
end;                    

function TBagelMainForm.IsValidIndex(i:Integer):Boolean;
begin
  Result:=False ;
  if (i>=0) and (i < TabControl.Tabs.Count) then Result:=True;
end;

procedure TBagelMainForm.FForwardPopupPopup(Sender: TObject);
var
  histPos,histCount:Integer;
  i:Integer;
  b:TGeckoBrowser;
  hostStr:IInterfacedCString;
  oldHost:String;
  entry:nsIHistoryEntry;
  m:TMenuItem;
begin
  oldHost:='';
  hostStr:=NewCString;
  b:=GetCurrentBrowser;
  FForwardPopup.Items.Clear;
  if b<>nil then
  begin
    histCount := b.WebNavigation.SessionHistory.Count;
    histPos := b.WebNavigation.SessionHistory.Index;
    entry := b.WebNavigation.SessionHistory.GetEntryAtIndex(histPos,False);
    entry.URI.GetHost(hostStr.ACString);
    oldHost:=hostStr.ToString;
    for i:=histPos+1 to histCount-1 do
    begin
      b.WebNavigation.SessionHistory.
      GetEntryAtIndex(i,False).URI.GetHost(hostStr.ACString);
      if hostStr.ToString <> oldHost then
      begin
        m := TMenuItem.Create(Self);
        m.Caption :=  b.WebNavigation.SessionHistory.
                      GetEntryAtIndex(i,False).Title;
        m.Tag := i;
        m.OnClick := HistGotoIndex;
        FForwardPopup.Items.Add(m);
        oldHost:=hostStr.ToString;
      end;
    end;
  end;
end;

procedure TBagelMainForm.RecentClosedURIMenuClick(Sender: TObject);
var
  i:Integer;
  a:TBagelActionContainer;
begin
  RecentClosedURIMenu.Clear;
  for i:=0 to Pref.RecentClosedURL.Count-1 do
  begin
    a:=TBagelActionContainer.Create(Self);
    if Pref.RecentClosedURLStyle=0 then begin
      a.Caption:=LeftStr(Pref.RecentClosedURL.Tabs[i].URI,40);
    end
    else if Pref.RecentClosedURLStyle=1 then begin
      a.Caption:=Pref.RecentClosedURL.Tabs[i].Title;
    end
    else if Pref.RecentClosedURLStyle=2 then begin
      a.Caption:=Pref.RecentClosedURL.Tabs[i].Title+' - '+LeftStr(Pref.RecentClosedURL.Tabs[i].URI,40);
    end;

    a.Tag:=i;
    a.OnClick := MenuRecentCClick;
    RecentClosedURIMenu.Add(a);
  end;
end;

procedure TBagelMainForm.RecentOpenedURIMenuClick(Sender: TObject);
var
  i:Integer;
  a:TBagelActionContainer;
begin
  RecentOpenedURIMenu.Clear;
  for i:=0 to Pref.RecentOpenedURL.Count-1 do
  begin
    a:=TBagelActionContainer.Create(Self);
    a.Caption := Pref.RecentOpenedURL.Strings[i];
    a.Tag:=i;
    a.OnClick := MenuRecentOClick;
    RecentOpenedURIMenu.Add(a);
  end;
end;

procedure TBagelMainForm.MenuRecentCClick(Sender: TObject);
var
  brwsr:TBagelBrowser;
  i:integer;
  j:Integer;
//  sh:nsISHistory;
//  shi:nsISHistoryInternal;
  newSHI:nsISHistoryInternal;
  newEntry:nsISHEntry;
  newURI:nsIURI;
//  histcount:Integer;
  title:IInterfacedString;
begin
  if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;
  brwsr:=TBagelBrowser.Create(Self);
  brwsr.Visible := false;
  brwsr.Parent:=self.ViewPanel;
  brwsr.Align := alClient;
  ApplyEvtHandlersToBrowser(brwsr);
  brwsr.TabStop:=true;
  TabControl.Tabs.InsertObject(GetNewtabPos(0),'',TObject(brwsr));
  TabZOrder.Insert(GetMDITabPos(0),TObject(brwsr));

  i := TabControl.Tabs.IndexOfObject(TObject(brwsr));
  TabControl.TabIndex:=i;
  tabBarCtxTarget:=i;
  brwsr.Visible := true;
  if Application.Active then
  begin
    //brwsr.ShouldFocus:=true;
    brwsr.SetFocus;
    brwsr.IsRead:=true;
  end;
  brwsr.WebNavigation.SessionHistory.QueryInterface(NS_ISHISTORYINTERNAL_IID,newSHI);

  for j:=0 to Pref.RecentClosedURL.Tabs[TBagelActionContainer(Sender).Tag].HistoryCount-1 do
  begin
    NS_CreateInstance('@mozilla.org/browser/session-history-entry;1',nsISHEntry,newEntry);
    newURI := NS_NewURI(Pref.RecentClosedURL.Tabs[TBagelActionContainer(Sender).Tag].HistoryItem[j].URI);
    newEntry.SetURI(newURI);
    title:=NewString(Pref.RecentClosedURL.Tabs[TBagelActionContainer(Sender).Tag].HistoryItem[j].Title);
    newEntry.SetTitle(title.AString);
    newSHI.AddEntry(newEntry,true);
  end;
  brwsr.WebNavigation.GotoIndex(Pref.RecentClosedURL.Tabs[TBagelActionContainer(Sender).Tag].HistoryPosition);

end;

procedure TBagelMainForm.MenuRecentOClick(Sender: TObject);
begin
  AddTab(Pref.RecentOpenedURL.Strings[TBagelActionContainer(Sender).Tag],0,0,'',Pref.DocShellDefault);
end;


function TBagelMainForm.FindAction(name:String): TCustomAction;
var
  i: integer;
begin
  result := nil;
  for i:=0 to ActionList1.ActionCount-1 do begin
    if ActionList1.Actions[i].Name=name then begin
      Result:=TCustomAction(ActionList1.Actions[i]);
      Exit;
    end;
  end;
end;

procedure TBagelMainForm.FindDialog1Find(Sender: TObject);
//var
//  ret:LongBool;
//  ir:nsIInterfaceRequestor;
begin
  GetCurrentBrowser.WebBrowserFind.SetSearchString(PWideChar(WideString(FindDialog1.FindText)));

  PrevSearchType:=0;
  PrevNormalSearchStr:=FindDialog1.FindText;

  if frDown in FindDialog1.Options then
  GetCurrentBrowser.WebBrowserFind.FindBackwards := False
  else
  GetCurrentBrowser.WebBrowserFind.FindBackwards := True;

  {ret := }GetCurrentBrowser.WebBrowserFind.FindNext;
end;

function TBagelMainForm.GetCurrentBrowser:TBagelBrowser;
var
  i:integer;
  b:TBagelBrowser;
begin
    Result:=nil;
    i:=TabControl.TabIndex;
    if i=-1 then Exit;
    b:=TBagelBrowser(TabControl.Tabs.Objects[i]);
    Result:=b;
end;

function TBagelMainForm.GetBrowser(Index:Integer):TBagelBrowser;
var
  b:TBagelBrowser;
begin
  Result:=nil;
  if (Index<0) or (index>TabControl.Tabs.Count-1) then exit;
  b:=TBagelBrowser(TabControl.Tabs.Objects[Index]);
  Result:=b;
end;

function TBagelMainForm.GetBrowserById(Id:Cardinal):TBagelBrowser;
var
  b:TBagelBrowser;
  i:Integer;
begin
  //Result:=nil;
  b := nil;
  for i:=0 to TabControl.Tabs.Count-1 do begin
    b:=GetBrowser(i);
    if id=b.Id then break;
  end;
  Result:=b;
end;

{Bagelについて}
procedure TBagelMainForm.actAboutBagelExecute(Sender: TObject);
var
  f:TAboutBagelForm;
begin
  f:=TAboutBagelForm.Create(Application);
  f.ShowModal;
end;

{タブの追加}
function TBagelMainForm.AddTab( uri       : String):TBagelBrowser;
begin
  Result := AddTab(uri, 0, 0, '', Pref.DocShellDefault, 0);
end;

procedure TBagelMainForm.actCloseTabExecute(Sender: TObject);
begin
  CloseTab(tabBarCtxTarget);
end;

//ブックマークにターゲットのブラウザのページを追加
procedure TBagelMainForm.actAddBookmarkExecute(Sender: TObject);
var
  f:TBookmarkForm;
begin
  f:=TBookmarkForm.Create(Self);
  f.mode:='create';
  f.ParentBkmk:=bookmarks;
  if GetBrowser(tabBarCtxTarget)<>nil then begin
    f.Title:=GetBrowser(tabBarCtxTarget).Title;
    f.URI:=GetBrowser(tabBarCtxTarget).URI;
  end;
  if (f.ShowModal=mrOk) then begin
    RegisterBookmark(f.URI,f.Title,bookmarks,bookmarks.Count,f.DocShellState);
  end;
  f.Free;
end;

//拒否するタイトルにブラウザのタイトルを追加
procedure TBagelMainForm.actAddDenyTitleExecute(Sender: TObject);
var
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if B=nil then Exit;
  Pref.DenyTitleList.Add(b.Title);
end;

//拒否するURIにブラウザのURIを追加
procedure TBagelMainForm.actAddDenyURIExecute(Sender: TObject);
var
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if B=nil then Exit;
  Pref.DenyURLList.Add(b.URI);
end;

//Webパネルにターゲットのブラウザのページを登録
procedure TBagelMainForm.actAddPanelExecute(Sender: TObject);
var
  f:TBookmarkForm;
begin
  f:=TBookmarkForm.Create(Self);
  f.mode:='panelcreate';
  if GetBrowser(tabBarCtxTarget)<>nil then begin
    f.Title:=GetBrowser(tabBarCtxTarget).Title;
    f.URI:=GetBrowser(tabBarCtxTarget).URI;
  end;
  if f.ShowModal = mrOk then begin
    //
  end;
  f.Free;
end;

//空白の式タブを追加
procedure TBagelMainForm.actAddTabBlankExecute(Sender: TObject);
begin
  AddTab('about:blank',0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actAddTabClipExecute(Sender: TObject);
begin
  AddTab(Clipboard.AsText,Pref.OpenModeClipboard,0,'',Pref.DocShellDefault);
end;

//今表示しているページのクローンを作成
procedure TBagelMainForm.actAddTabCurrExecute(Sender: TObject);
begin
  if GetCurrentBrowser=nil then
    actAddTabBlank.Execute
  else
    CloneTab(GetCurrentBrowser);
end;

//新規タブを作成
procedure TBagelMainForm.actAddTabExecute(Sender: TObject);
begin
  case Pref.NewTabMode of
    0: actAddTabBlank.Execute;
    1: actAddTabCurr.Execute;
    2: actAddTabHome.Execute;
  end;
end;

//キャッシュを削除
procedure TBagelMainForm.actClearCacheExecute(Sender: TObject);
var
  cs:nsICacheService;
begin
  NS_GetService('@mozilla.org/network/cache-service;1',nsICacheService,cs);
  cs.EvictEntries(NS_ICACHE_STORE_ON_DISK);
  cs.EvictEntries(NS_ICACHE_STORE_IN_MEMORY);
end;

//Cookieを削除
procedure TBagelMainForm.actClearCookieExecute(Sender: TObject);
var
  cookieman :nsICookieManager;
begin
  NS_GetService('@mozilla.org/cookiemanager;1',nsICookieManager,cookieman);
  cookieman.removeAll;
end;

//履歴を削除
procedure TBagelMainForm.actClearHistoryExecute(Sender: TObject);
var
  browserHistory:nsIBrowserHistory;
begin
  NS_GetService('@mozilla.org/browser/global-history;2',nsIBrowserHistory,browserHistory);
  browserHistory.RemoveAllPages;
end;

//クリップボードサイドバーを表示
procedure TBagelMainForm.actClipboardSidebarExecute(Sender: TObject);
begin
  if actClipboardSidebar.Checked then begin
    PageControl1.ActivePage:=ClipSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//すべて閉じる
procedure TBagelMainForm.actCloseAllExecute(Sender: TObject);
var
  i: Integer;
begin
  if Pref.OnCloseAll=true then
  begin
    if MessageDlg('全て閉じてもよろしいですか？', mtConfirmation,[mbYes, mbNo], 0) = mrNo then
      exit;
  end;

  for i := 0 to TabControl.Tabs.Count-1 do
    CloseTab(0);
end;

//左のタブを閉じる
procedure TBagelMainForm.actCloseLeftExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to tabBarCtxTarget-1 do
  begin
    CloseTab(0);
  end;
end;

//右を閉じる
procedure TBagelMainForm.actCloseRightExecute(Sender: TObject);
var
  i: Integer;
  c: Integer;
  c2: Integer;
begin
  c:=tabBarCtxTarget+1;//TabControl1.TabIndex+1;
  c2:=TabControl.Tabs.Count-1;
  for i := c to c2 do
  begin
    CloseTab(c);
  end;
end;

//ターゲット以外のタブを閉じる
procedure TBagelMainForm.actCloseWithoutExecute(Sender: TObject);
var
  i: Integer;
  c: Integer;
  c2:Integer;
  M: String;
begin
  if Pref.OnCloseOther=true then
  begin
    M := '他を全て閉じてもよろしいですか？';
    if MessageDlg(M, mtConfirmation,[mbYes, mbNo], 0) = mrNo then
    begin
      exit;
    end;
  end;


  c:=tabBarCtxTarget;//TabControl1.TabIndex;
  c2:=TabControl.Tabs.Count;
  for i := 0 to c-1 do
  begin
    CloseTab(0);
  end;
  for i := c to c2-2 do
  begin
    CloseTab(1);
  end;
end;

//選択した要素のURIをコピー
procedure TBagelMainForm.actCopyCtxURIExecute(Sender: TObject);
begin
  Clipboard.AsText := currentCtxURI;
end;

//ブラウザの選択部分をコピー
procedure TBagelMainForm.actCopyExecute(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  NS_GetInterface(b.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  if clipCmd.CanCopySelection then clipCmd.CopySelection;
end;

//ブラウザのタイトルとURIをコピー
procedure TBagelMainForm.actCopyTitleAndURIExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  Clipboard.AsText := b.Title+#13+b.URI;
end;

//ブラウザのタイトルをコピー
procedure TBagelMainForm.actCopyTitleExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  Clipboard.AsText := b.Title;
end;

//ブラウザのURIをコピー
procedure TBagelMainForm.actCopyURIExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  Clipboard.AsText := b.URI;
end;

//選択要素に関するプロパティを表示
procedure TBagelMainForm.actCtxPropertyExecute(Sender: TObject);
var
  f:TfrmProperties;
  CurNode:nsIDOMNode;
//  tmpBool:longBool;
  anchor:nsIDOMHTMLAnchorElement;
  img:nsIDOMHTMLImageElement;
  insdel:nsIDOMHTMLModElement;
  q:nsIDOMHTMLQuoteElement;
//  bq:nsIDOMHTMLBlockquoteElement;
  table:nsIDOMHTMLTableElement;
  elm:nsIDOMHTMLElement;
  str:IInterfacedString;
  astr:nsAString;

  cacheService:nsICacheService;
  httpSession:nsICacheSession;
  ftpSession:nsICacheSession;
  desc:nsICacheEntryDescriptor;
  cacheKey:IInterfacedCString;

begin

  if currentCtxTargetNode<>nil then begin
    f:=TfrmProperties.Create(nil);
    CurNode := currentCtxTargetNode;

    str:=NewString;
    astr:=str.AString;

    while CurNode<>nil do begin
      if Supports(CurNode, nsIDOMHTMLElement, elm) then begin

        if Supports(CurNode, nsIDOMHTMLAnchorElement, anchor) then begin

          f.gbLinkProps.Visible:=true;

          anchor.GetHref(astr);
          f.edtLinkURI.Text:=str.ToString;
          anchor.GetTarget(astr);

          if str.ToString='_top' then begin
            f.edtLinkWillOpenTo.Text := '同じタブ';
          end
          else if str.ToString='_parent' then begin
            f.edtLinkWillOpenTo.Text := '親フレーム';
          end
          else if (str.ToString='_blank') or (str.ToString='_new') then begin
            f.edtLinkWillOpenTo.Text := '新しいタブ';
          end
          else if (str.ToString='') or (str.ToString='_self') then begin
            //要修正　「同じタブ」と「同じフレーム」が混同
            f.edtLinkWillOpenTo.Text := '同じタブ';
  (*
  326       if (elem.ownerDocument.defaultView) {
  327         if (elem.ownerDocument != elem.ownerDocument.defaultView.content.document)
  328           setInfo("link-target", gMetadataBundle.getString("sameFrameText"));
  329         else
  330           setInfo("link-target", gMetadataBundle.getString("sameWindowText"));
  331       } else {
  332         hideNode("link-target");
  333       }
  *)
          end
          else begin
            f.edtLinkWillOpenTo.Text := '"' + str.ToString + '"';
          end;

        end
        else if Supports(CurNode, nsIDOMHTMLImageElement, img) then begin
          f.gbImgProps.Visible:=true;

          img.GetSrc(astr);
          f.edtImgAddr.Text:=str.ToString;
          f.edtImgHeight.Text:=IntToStr(img.Height)+'ピクセル';
          f.edtImgWidth.Text:=IntToStr(img.Width)+'ピクセル';
          img.GetAlt(astr);
          f.edtImgAlt.Text:=str.ToString;

          NS_GetService('@mozilla.org/network/cache-service;1',nsICacheService,cacheService);
          httpSession := cacheService.CreateSession(PChar('HTTP'),0,true);
          ftpSession := cacheService.CreateSession(PChar('FTP'),0,true);
          httpSession.DoomEntriesIfExpired:=false;
          ftpSession.DoomEntriesIfExpired:=false;

          cacheKey:=NewCString;
          cacheKey.Assign(f.edtImgAddr.Text);

          desc := httpSession.OpenCacheEntry(cachekey.ACString,ns_ICache_ACCESS_READ,false);
          if desc=nil then begin
            desc := ftpSession.OpenCacheEntry(cachekey.ACString,ns_ICache_ACCESS_READ,false);
          end;

          if desc<>nil then begin
            f.edtImgFilesize.Text:=IntToStr(desc.DataSize div 1024) + 'KB';
          end;
        end
        else if Supports(CurNode, nsIDOMHTMLModElement, insdel) then begin
          f.gbInsDelProps.Visible:=true;
          insdel.GetCite(astr);
          f.edtInsDelCite.Text:=str.ToString;
          insdel.GetDatetime(astr);
          f.edtInsDelDatetime.Text:=str.ToString;
        end
        else if Supports(CurNode, nsIDOMHTMLQuoteElement, q) then begin
          f.gbQuoteProps.Visible:=true;
          q.GetCite(astr);
          f.edtQuoteCite.Text:=str.ToString;
        end
        else if Supports(CurNode, nsIDOMHTMLTableElement, table) then begin
        end;

  //      elm.GetLang()
  //      elm.GetTitle()
      end;
      CurNode := CurNode.ParentNode;
    end;
    f.Show;
  end;
end;

//ブックマークをコピー
procedure TBagelMainForm.actCutBookmarkExecute(Sender: TObject);
begin
  actCopyBookmark.Execute;
  UnregisterBookmark(BookmarksTree.Selected.Data);
end;

//ブックマークを切り取り
procedure TBagelMainForm.actCutBookmarkUpdate(Sender: TObject);
begin
  if BookmarksTree.Selected = nil then actCutBookmark.Enabled := false
  else actCutBookmark.Enabled := true;
end;

//ブックマークリスト中のページをすべて開く
procedure TBagelMainForm.OpenAllBookmarksInternal(l:TBookmarkList);
var
  c:Integer;//カウンタ
  CanContinue:Boolean;
  M:String;

  i:Integer;
  j:Integer;
begin
  c:=0;

  if Pref.OnOpeningManyItems then
  begin
    for j:=0 to l.Count-1 do
    begin
      if (l.Items[j] is TBookmarkList) then continue;
      Inc(c);
    end;

    if c >= Pref.WarnItemCount then begin
      M:=IntToStr(Pref.WarnItemCount)+'以上あるけど開いてもよろしい？';
      CanContinue := MessageDlg(M, mtConfirmation,[mbYes, mbNo], 0) = mrYes;
      if not CanContinue then exit;
    end;
  end;

  for i:=0 to l.Count-1 do
  begin
    if (l.Items[i] is TBookmarkList) then continue;
    AddTab(TBookmark(l.Items[i]).URI,
       Pref.OpenModeBookmarks,
       0,
       '',
       StrToIntDef(TBookmark(l.Items[i]).DocShell,Pref.DocShellDefault),
       StrToIntDef(TBookmark(l.Items[i]).ReloadIntv,0));
  end;
end;

//ブックマークをOpenAllBookmarksInternalに渡す
procedure TBagelMainForm.OpenAllBookmarks(Sender:TObject);
var
  l:TBookmarkList;
begin
  l:=TBookmarkList(TMenuItem(Sender).Tag);
  OpenAllBookmarksInternal(l);
end;

//ページ内で切り取る
procedure TBagelMainForm.actCutExecute(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  NS_GetInterface(b.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  if clipCmd.CanCutSelection then clipCmd.CutSelection;
end;

//すべて閉じた後デフォルトのタブグループを開く
procedure TBagelMainForm.actDefaultTabsExecute(Sender: TObject);
begin
  actCloseAll.Execute;
  LoadSession( GetSettingDir() + 'Default.bbg');
end;

//検索バーから検索を実行
procedure TBagelMainForm.actDoSearchExecute(Sender: TObject);
var
  tmp:Char;
begin
  tmp := chr(VK_RETURN);
  SearchBoxKeyPress(Self, tmp);
end;

//アドレスバーの候補を表示
procedure TBagelMainForm.actDropdownAddressbarExecute(Sender: TObject);
begin
  LocationBox.SetFocus;
  LocationBox.DroppedDown := true;
end;

//メニュー設定を保存
procedure SaveMenu(c:TBagelActionContainer;name:String);
begin
  c.SaveToFile(GetSettingDir() + name + '.dat');
end;


//タブメニュー編集ダイアログを表示し、編集結果を反映
procedure TBagelMainForm.actEditTabMenuExecute(Sender: TObject);
var
  f:TfrmMenuEdit;
  c:TBagelActionContainer;
begin
  f:=TfrmMenuEdit.Create(Self);
  f.Source:=Self.TabMenu;
  if f.ShowModal=mrOk then begin
    c := f.GetNewContainer(Self);
    TabPopup.Container := c;
    Self.TabMenu.Free;
    Self.TabMenu := c;
  end;
  f.Free;
  SaveMenu(Self.TabMenu,'tabmenu');
end;

//ツールバー編集ダイアログを表示し、編集結果を反映
procedure TBagelMainForm.actEditToolbarExecute(Sender: TObject);
var
  f:TfrmMenuEdit;
  c:TBagelActionContainer;
begin
  f:=TfrmMenuEdit.Create(Self);
  f.Source:=Self.CtrlTbActionContainer;
  if f.ShowModal=mrOk then begin
    c := f.GetNewContainer(Self);
    ControlToolbar.Container := c;
    Self.CtrlTbActionContainer.Free;
    Self.CtrlTbActionContainer := c;
  end;
  f.Free;
  SaveMenu(Self.CtrlTbActionContainer,'tabmenu');
end;

//コンテキストメニュー編集
procedure TBagelMainForm.actEditCtxMenuExecute(Sender: TObject);
var
  f:TfrmMenuEdit;
  c:TBagelActionContainer;
begin
  f:=TfrmMenuEdit.Create(Self);
  f.Source:=Self.ContextMenu;
  if f.ShowModal=mrOk then begin
    c := f.GetNewContainer(Self);
    GeckoPopup.Container := c;
    Self.ContextMenu.Free;
    Self.ContextMenu := c;
  end;
  f.Free;
  SaveMenu(Self.ContextMenu,'ctxmenu');
end;

//メインメニュー編集
procedure TBagelMainForm.actEditMainMenuExecute(Sender: TObject);
var
  f:TfrmMenuEdit;
  c:TBagelActionContainer;
begin
  f:=TfrmMenuEdit.Create(Self);
  f.Source:=Self.TestActionContainer2;
  if f.ShowModal=mrOk then begin
    c := f.GetNewContainer(Self);
    MenuToolbar.Container := c;
    Self.TestActionContainer2.Free;
    Self.TestActionContainer2 := c;
  end;
  f.Free;
  SaveMenu(Self.TestActionContainer2,'mainmenu');
end;


//「早送り」
procedure TBagelMainForm.actFastForwardExecute(Sender: TObject);
var
  histCount:Integer;
  histPos:Integer;
  i:Integer;
  b:TGeckoBrowser;
  hostStr:IInterfacedCString;
  oldHost:String;
  entry:nsIHistoryEntry;
begin
  oldHost:='';
  hostStr:=NewCString;
  b:=GetCurrentBrowser;
  if b<>nil then
  begin
    histCount := b.WebNavigation.SessionHistory.Count;
    histPos := b.WebNavigation.SessionHistory.Index;
    entry := b.WebNavigation.SessionHistory.GetEntryAtIndex(histPos,False);
    entry.URI.GetHost(hostStr.ACString);
    oldHost:=hostStr.ToString;
    for i:=histPos+1 to histCount-1 do
    begin
      b.WebNavigation.SessionHistory.
      GetEntryAtIndex(i,False).URI.GetHost(hostStr.ACString);
      if hostStr.ToString <> oldHost then
      begin
        b.GotoIndex(i);
        exit;
      end;
      //oldHost:=hostStr.ToString;
    end;
  end;
end;

//検索ダイアログを表示
procedure TBagelMainForm.actFindDialogExecute(Sender: TObject);
begin
  FindDialog1.Execute;
end;

//次を検索
procedure TBagelMainForm.actFindExecute(Sender: TObject);
var
  b:TBagelBrowser;
  SearchStr:String;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;

  //TODO:
  //if isMigemoActive then begin
    {LastMigemoedWin.GetSelection(sel);
    QueryStr:=FMigemoObj.Query(ISearchBuffer);
    if QueryStr<>'' then
    MigemoFind(QueryStr,RANGE_MODE_NEXT);
    MigemoTimeouter.Interval:=0;
    MigemoTimeouter.Interval:=4000;}

  //end;
  //else begin

    if PrevSearchType=1 then begin//Migemo
      if PrevNormalSearchStr<>SearchStr then begin
        PrevNormalSearchStr := SearchStr;
        PrevSearchType := 0;
        b.WebBrowserFind.SetSearchString(PWideChar(WideString(PrevNormalSearchStr)));
        b.WebBrowserFind.SetFindBackwards(false);
        b.WebBrowserFind.FindNext;
        if Pref.ScrollToCenterOnFind then
        FindScrollToCenter(GetCurrentBrowser.ContentWindow);
      end
      else begin
        {
        QueryStr:=FMigemoObj.Query(ISearchBuffer);
        if QueryStr<>'' then
        //isMigemoActive := true;
        MigemoFind(QueryStr,RANGE_MODE_NEXT);
        MigemoTimeouter.Enabled:=true;
        MigemoTimeouter.Interval:=0;
        MigemoTimeouter.Interval:=4000;}
      end;
    end
    else begin
      b.WebBrowserFind.SetSearchString(PWideChar(WideString(PrevNormalSearchStr)));
      b.WebBrowserFind.SetFindBackwards(false);
      b.WebBrowserFind.FindNext;
      if Pref.ScrollToCenterOnFind then
      FindScrollToCenter(GetCurrentBrowser.ContentWindow);
    end;
  //end;
end;

//アドレスバーにフォーカス
procedure TBagelMainForm.actFocusLocationBoxExecute(Sender: TObject);
begin
  LocationBox.SetFocus;
end;

//検索エンジンボックスにフォーカス
procedure TBagelMainForm.actFocusSearchEngineExecute(Sender: TObject);
begin
  EngineBox.SetFocus;
end;

//検索ボックスにフォーカス
procedure TBagelMainForm.actFocusSearchExecute(Sender: TObject);
begin
  SearchBox.SetFocus;
end;

//ブラウザにフォーカス
procedure TBagelMainForm.actFocusTabExecute(Sender: TObject);
begin
  if GetCurrentBrowser<>nil then GetCurrentBrowser.SetFocus;
end;

//「Donutユーザのために」 とかいう痛いページに誘導
procedure TBagelMainForm.actForDonutUsersExecute(Sender: TObject);
begin
  AddTab('http://bagel.tnose.net/forundonutusers.html');
end;

//全画面表示
procedure TBagelMainForm.actFullScreenExecute(Sender: TObject);
var
  dwStyle: DWORD;         //ウィンドウスタイル
begin

  if TAction(Sender).Checked=true then
  begin
    mSelfLeft:= Self.Left;
    mSelfTop := Self.Top ;
    mSelfWidth := Self.Width;
    mSelfHeight := Self.Height;
    //現在のフォームのスタイルからキャプションと縁を除く
    dwStyle := GetWindowLong(Self.Handle, GWL_STYLE);
    dwStyle := dwStyle xor (WS_CAPTION or WS_THICKFRAME);
    SetWindowLong(Self.Handle, GWL_STYLE, dwStyle);

    Self.Left := 0;
    Self.Top := 0;
    Self.Width := Screen.Width;
    Self.Height := Screen.Height;

    mKioskTabBarVisible    :=TabControl.Visible;
    mKioskSearchBarVisible :=SearchBar.Visible;
    mKioskLinkBarVisible   :=LinkBar.Visible;
    mKioskAddressBarVisible:=LocationBar.Visible;
    mKioskMainBarVisible   :=ControlToolbar.Visible;
    mKioskMenuBarVisible   :=MenuToolbar.Visible;
    mKioskStatusBarVisible :=StatusBar.Visible;
  //  MainCoolbar.Bands.FindBand(TabControl).Visible

  {  TabControl.Visible   := Pref.KioskTabBarVisible;
    SearchBar.Visible     := Pref.KioskSearchBarVisible;
    LinkBar.Visible       := Pref.KioskLinkBarVisible;
    URLbar.Visible        := Pref.KioskAddressBarVisible;
    ControlToolbar.Visible:= Pref.KioskMainBarVisible;
    MenuToolbar.Visible   := Pref.KioskMenuBarVisible;}

    StatusBar.Visible    := Pref.KioskStatusBarVisible;
    MainCoolbar.Bands.FindBand(TabControl).Visible := Pref.KioskTabBarVisible;
    MainCoolbar.Bands.FindBand(SearchBar).Visible := Pref.KioskSearchBarVisible;
    MainCoolbar.Bands.FindBand(LinkBar).Visible := Pref.KioskLinkBarVisible;
    MainCoolbar.Bands.FindBand(LocationBar).Visible := Pref.KioskAddressBarVisible;
    MainCoolbar.Bands.FindBand(ControlToolbar).Visible := Pref.KioskMainBarVisible;
    MainCoolbar.Bands.FindBand(MenuToolbar).Visible := Pref.KioskMenuBarVisible;

  end
  else begin
    //現在のフォームのスタイルにキャプションと縁を加える
    dwStyle := GetWindowLong(Self.Handle, GWL_STYLE);
    dwStyle := dwStyle xor (WS_CAPTION or WS_THICKFRAME);
    SetWindowLong(Self.Handle, GWL_STYLE, dwStyle);

    Self.Left:= mSelfLeft;
    Self.Top := mSelfTop ;
    Self.Width := mSelfWidth;
    Self.Height := mSelfHeight;

  {  TabControl.Visible   := mKioskTabBarVisible;
    SearchBar.Visible     := mKioskSearchBarVisible;
    LinkBar.Visible       := mKioskLinkBarVisible;
    URLbar.Visible        := mKioskAddressBarVisible;
    ControlToolbar.Visible:= mKioskMainBarVisible;
    MenuToolbar.Visible   := mKioskMenuBarVisible;}
    MainCoolbar.Bands.FindBand(TabControl).Visible   := mKioskTabBarVisible;
    MainCoolbar.Bands.FindBand(SearchBar).Visible     := mKioskSearchBarVisible;
    MainCoolbar.Bands.FindBand(LinkBar).Visible       := mKioskLinkBarVisible;
    MainCoolbar.Bands.FindBand(LocationBar).Visible        := mKioskAddressBarVisible;
    MainCoolbar.Bands.FindBand(ControlToolbar).Visible:= mKioskMainBarVisible;
    MainCoolbar.Bands.FindBand(MenuToolbar).Visible   := mKioskMenuBarVisible;
    StatusBar.Visible    := mKioskStatusBarVisible;
  end;
  //bsSizable
  //[biSystemMenu,biMinimize,biMaximize]
end;

//戻る
procedure TBagelMainForm.actGoBackExecute(Sender: TObject);
begin
  if TabControl.Tabs.Count<1 then Exit;
  if GetCurrentBrowser.CanGoBack then
  begin
    GetCurrentBrowser.GoBack;
  end;
end;

//進む
procedure TBagelMainForm.actGoForwardExecute(Sender: TObject);
begin
  if TabControl.Tabs.Count<1 then Exit;
  if GetCurrentBrowser.CanGoForward then
  begin
    GetCurrentBrowser.GoForward;
  end;
end;

//入力されたアドレスから開く
procedure TBagelMainForm.actGoExecute(Sender: TObject);
begin
  OnURIEnter;
end;

//ホームを開く
procedure TBagelMainForm.actGoHomeExecute(Sender: TObject);
begin
  if GetCurrentBrowser<>nil then GetCurrentBrowser.LoadURI(Pref.Homepage)
  else actAddTabHome.Execute;
end;

//上の階層へ
procedure TBagelMainForm.actGoUpExecute(Sender: TObject);
var
  str:String;
begin
  if TabControl.Tabs.Count<1 then Exit;
  str:=GetBrowser(tabBarCtxTarget).uri;
  str:=ExtractUp(str);
  if (str<>'') or (str<>'http:/')then GetBrowser(tabBarCtxTarget).LoadURI(str);
end;

//Grepサイドバーを表示
procedure TBagelMainForm.actGrepSidebarExecute(Sender: TObject);
begin
  if actGrepSidebar.Checked then begin
    PageControl1.ActivePage:=GrepSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
    cmbGrepKeyword.SetFocus;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//履歴サイドバーを表示
procedure TBagelMainForm.actHistorySidebarExecute(Sender: TObject);
begin
  if actHistorySidebar.Checked then begin
    PageControl1.ActivePage:=HistorySheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//IEを起動して表示
procedure TBagelMainForm.actIEViewExecute(Sender: TObject);
var
  Buf: array[0..MAX_PATH] of char;
  IEPath:String;
const
  CSIDL_PROGRAM_FILES = $0026;
begin
  SHGetSpecialFolderPath(Handle, Buf, CSIDL_PROGRAM_FILES, FALSE);
  IEPath:=String(Buf)+'\Internet Explorer\IEXPLORE.EXE';
  if not FileExists(IEPath) then exit;
  ShellExecute(Handle,
    'open',
    PChar(IEPath),
    PChar(GetCurrentBrowser.URI),
    nil,
    SW_SHOW);
end;

//ブックマークをコピー
procedure TBagelMainForm.actCopyBookmarkExecute(Sender: TObject);
  procedure WriteChildren(WR :TWriter; parent:TBookmarkList; level:Integer);
  var
    item:TBkmkBase;
    i:Integer;
  begin
    for i:=0 to parent.Count-1 do begin
      item:=parent.Items[i];
      if item is TBookmark then
      begin
        WR.WriteInteger(1);
        WR.WriteInteger(level);
        WR.WriteString(TBookmark(item).name);
        WR.WriteString(TBookmark(item).URI);
        WR.WriteString(TBookmark(item).DocShell);
        WR.WriteString(TBookmark(item).ReloadIntv);
      end
      else if item is TBookmarkList then
      begin
        WR.WriteInteger(0);
        WR.WriteInteger(level);
        WR.WriteString(TBookmarkList(item).name);
        WR.WriteBoolean(TBookmarkList(item).expanded);
        WriteChildren(WR,TBookmarkList(item),level+1);
      end;
    end;
  end;

var
  node: TTreeNode;
  hBuf:THandle;
  p:pointer;
  FDataFormat:UINT;
//  FDataName:string;
  FCopyData:TMemoryStream;
  WR:TWriter;
begin

  node := BookmarksTree.Selected;
  if (node <> nil) and (node = BookmarksTree.Selected) then
  begin
    FCopyData:=TMemoryStream.Create;
    FDataFormat := RegisterClipboardFormat(PChar('BagelBkmkClipbrdItem'));
    FCopyData.Clear;


    if TObject(node.Data) is TBookmark then
    begin
      WR:=TWriter.Create(FCopyData,1000);
      WR.WriteInteger(1);
      WR.WriteInteger(1);
      WR.WriteString(TBookmark(node.Data).name);
      WR.WriteString(TBookmark(node.Data).URI);
      WR.WriteString(TBookmark(node.Data).DocShell);
      WR.WriteString(TBookmark(node.Data).ReloadIntv);
      WR.WriteInteger(2);
      WR.Free;
      hBuf := GlobalAlloc(GPTR,FCopyData.Size);
      p := GlobalLock(hBuf);
      FCopyData.Position := 0;
      FCopyData.ReadBuffer(p^,FCopyData.Size);

      Clipboard.Open;
      Clipboard.Clear;
      Clipboard.SetAsHandle(FDataFormat,hBuf);
      GlobalUnlock(hBuf);
      Clipboard.Close;
    end
    else if TObject(node.Data) is TBookmarkList then
    begin
      WR:=TWriter.Create(FCopyData,1000);
      WR.WriteInteger(0);
      WR.WriteInteger(1);
      WR.WriteString(TBookmarkList(node.Data).name);
      WR.WriteBoolean(TBookmarkList(node.Data).expanded);
      WriteChildren(WR,TBookmarkList(TBookmarkList(node.Data)),2);
      WR.WriteInteger(2);
      WR.Free;

      hBuf := GlobalAlloc(GPTR,FCopyData.Size);
      p := GlobalLock(hBuf);
      FCopyData.Position := 0;
      FCopyData.ReadBuffer(p^,FCopyData.Size);

      Clipboard.Open;
      Clipboard.Clear;
      Clipboard.SetAsHandle(FDataFormat,hBuf);
      GlobalUnlock(hBuf);
      Clipboard.Close;
    end;
    FCopyData.Free;
  end;
end;

procedure TBagelMainForm.actCopyBookmarkUpdate(Sender: TObject);
begin
  if BookmarksTree.Selected = nil then actCopyBookmark.Enabled := false
  else actCopyBookmark.Enabled := true;
end;

//ブックマークを削除
procedure TBagelMainForm.actDeleteBookmarkExecute(Sender: TObject);
	function DelOK:Boolean;
	begin
	  Result:=True;
	  if Pref.OnDeleteBookmark then
	  begin
	    Result:=(MessageDlg('削除します', mtWarning, mbOKCancel, -1) = mrOk);
	  end;
	end;
begin
  if (BookmarksTree.Selected <> nil) and
     (BookmarksTree.Selected.Data <> bookmarks) and
    DelOK then
  begin
    UnregisterBookmark(BookmarksTree.Selected.Data);
  end;
end;

procedure TBagelMainForm.actDeleteBookmarkUpdate(Sender: TObject);
begin
  if BookmarksTree.Selected = nil then actDeleteBookmark.Enabled := false
  else actDeleteBookmark.Enabled := true;
end;

//サイドバーにフォーカス
procedure TBagelMainForm.actFocusSidebarExecute(Sender: TObject);
begin
  if PageControl1.ActivePage.ControlCount>0 then begin
    TWinControl(PageControl1.ActivePage.Controls[0]).SetFocus;
  end;
end;

//パスワードマネージャ
//TODO:nsILoginManagerへの対応、情報バー
procedure TBagelMainForm.actShowPassManExecute(Sender: TObject);
var
  f:TfrmPassMan;
begin
  f:=TfrmPassMan.Create(Application);
  f.ShowModal;
end;

//ポップアップブロックの設定
procedure TBagelMainForm.actShowPopupManExecute(Sender: TObject);
var
  f:TBagelSettingForm;
begin
  f:=TBagelSettingForm.Create(nil);
  f.SetCurrentSheet(f.PopupSheet);
  f.ShowModal;
end;

//サイドバー上部のアイコンを表示するかどうか
procedure TBagelMainForm.actShowSidebarIconsExecute(Sender: TObject);
begin
  Pref.ShowSidebarTabs:=actShowSidebarIcons.Checked;
  SidebarHeaderToolbar.Visible:=Pref.ShowSidebarTabs;
  Panel1.OnResize(Self);
end;

//UAマネージャ
procedure TBagelMainForm.actShowUAManExecute(Sender: TObject);
var
  f:TBagelSettingForm;
begin
  f:=TBagelSettingForm.Create(nil);
  f.SetCurrentSheet(f.UASheet);
  f.ShowModal;
end;

//Webパネルの編集
procedure TBagelMainForm.actShowWebPanelEditorExecute(Sender: TObject);
var
  f:TfrmWebPanelEditor;
begin
  f:=TfrmWebPanelEditor.Create(Self);
  f.ShowModal;
//  ViewMenuSidebar.Click;
end;

//リンクサイドバーを表示
procedure TBagelMainForm.actLinkSidebarExecute(Sender: TObject);
begin
  if actLinkSidebar.Checked then begin
    PageControl1.ActivePage:=LinkSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//メモサイドバーを表示
procedure TBagelMainForm.actMemoSidebarExecute(Sender: TObject);
begin
  if actMemoSidebar.Checked then begin
    PageControl1.ActivePage:=MemoSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//次のタブを選択
procedure TBagelMainForm.actNextTabExecute(Sender: TObject);
var
  i:Integer;
  brwsr:TBagelBrowser;
begin
  if TabControl.Tabs.Count > 1 then
  begin

    //GetCurrentBrowser.Blur2;
    i:=TabControl.TabIndex;

    if i < TabControl.Tabs.Count-1 then
    begin
      brwsr:=TBagelBrowser(TabControl.Tabs.Objects[i+1]);
    end
    else begin
      brwsr:=TBagelBrowser(TabControl.Tabs.Objects[0]);
    end;
    SelectTab(brwsr);
  end;

end;

//about:configをタブで開く
procedure TBagelMainForm.actOpenAboutConfigExecute(Sender: TObject);
begin
  AddTab('about:config');
end;

//ブックマークを開く
procedure TBagelMainForm.actOpenBookmarkExecute(Sender: TObject);
var
  node:TTreenode;
begin
  node := BookmarksTree.Selected;
  if node =nil then exit;
    if TObject(node.Data) is TBookmark then
    begin
      with TBookmark(node.Data) do
      begin
        AddTab(URI,pref.OpenModeBookmarks,0,'',StrToIntDef(TBookmark(node.Data).DocShell,Pref.DocShellDefault));
      end;
    end
    else if TObject(node.Data) is TBookmarkList then
    begin
      OpenAllBookmarksInternal(TBookmarkList(node.Data));
    end;
end;

procedure TBagelMainForm.actOpenBookmarkUpdate(Sender: TObject);
begin
  if BookmarksTree.Selected = nil then actOpenBookmark.Enabled := false
  else actOpenBookmark.Enabled := true;
end;

//履歴をクリック
procedure TBagelMainForm.HistoryItemClicked(Sender: TObject);
var
  node: TTreeNode;
  cstr: IInterfacedCString;
  dummy:nsINavHistoryContainerResultNode;
begin
  node := HistoryTree.Selected;
  if (node <> nil) then
    if TObject(node.Data) is THistoryData then
    begin
      if not Supports(THistoryData(node.Data).ResultNode,nsINavHistoryContainerResultNode,dummy) then
      begin
        cstr := NewCString;
        THistoryData(node.Data).ResultNode.GetUri(cstr.ACString);
        AddTab(cstr.ToString,pref.OpenModeHistory,0,'',Pref.DocShellDefault);
      end;
    end;
end;

//履歴が意図せず開くのを防止
procedure TBagelMainForm.HistoryTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	node:TTreeNode;
begin
  Node := HistoryTree.GetNodeAt(X,Y);
  if (Button = mbRight) and (Node <> nil) then
  begin
    Node.Selected := True;
  end;
  if Node = nil then
  begin
    HistoryTree.Selected := nil;
  end;
end;

procedure TBagelMainForm.BookmarksTreeClick(Sender: TObject);
var
  node: TTreeNode;
begin
    if (GetKeyState(VK_SHIFT) < 0) or
     (GetKeyState(VK_CONTROL) < 0) then
    exit;
  //▼ドラッグ開始時に開くのを抑止
  if GetKeyState(VK_LBUTTON) < 0 then
    exit;
  (*  *)
  node := BookmarksTree.Selected;//TreeViewGetNode(Sender);
  if (node <> nil) and (node = BookmarksTree.Selected) then
  begin
    if TObject(node.Data) is TBookmark then
    begin
      with TBookmark(node.Data) do
      begin
        AddTab(URI,pref.OpenModeBookmarks,0,'',StrToIntDef(TBookmark(node.Data).DocShell,Pref.DocShellDefault));
      end;
    end;{
    else begin
      if Config.oprCatBySingleClick then
        node.Expanded := not node.Expanded;
    end; }
  end;
end;

procedure TBagelMainForm.BookmarksTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
	function DelOK:Boolean;
	begin
	 //
	 Result:=True;
	  if Pref.OnDeleteBookmark then
	  begin
	    Result:=(MessageDlg('削除します', mtWarning, mbOKCancel, -1) = mrOk);
	  end;
	end;
var
  node, node2: TTreeNode;
  bkmk1, bkmk2:TBkmkBase;
begin
  //▼アイテム名変更時は無効
  if BookmarksTree.IsEditing then
   	exit;

  case Key of
  VK_F2:
    begin
      if BookmarksTree.Selected <> nil then
        BookmarksTree.Selected.EditText;
    end;
  //▼Deleteを警告付きで復活
  VK_DELETE:
    begin
      if (BookmarksTree.Selected <> nil) and
         (BookmarksTree.Selected.Data <> bookmarks) and
        DelOK then
       begin
         UnregisterBookmark(BookmarksTree.Selected.Data);
       end;
    end;
  VK_INSERT:
    begin
//      PopupFavNewClick(Sender);
    end;
  VK_RETURN:
    begin
      node := BookmarksTree.Selected;
      if (node <> nil) and
         (TObject(node.Data) is TBookmark) then
      begin
        with TBookmark(node.Data) do
        begin
          actOpenBookmark.Execute;
                                     {
          NavigateIntoView(host, bbs, datName, -1, false, gtOther, //▼Shiftで逆転
                           (Config.oprOpenFavWNewView xor (GetKeyState(VK_SHIFT) < 0)),
                           false, Config.oprFavBgOpen);
                           }
          //AddTab(uri,Pref.OpenModeBookmarks,0,'',Pref.DocShellDefault);
        end;
      end;
    end;
  VK_PRIOR:
    begin      {
      if ssCtrl	in Shift then
      begin
        SetTabSetIndex(TreeTabControl.TabIndex - 1);
        Key := 0;
      end;      }
    end;
  VK_NEXT:
    begin    {
      if ssCtrl in Shift then
      begin
        SetTabSetIndex(TreeTabControl.TabIndex + 1);
        Key := 0;
      end;    }
    end;
  //▼Ctrl+Tabでツリー切り替えを追加
  VK_TAB:
    begin  {
      if ssCtrl	in Shift then
      begin
        SetTabSetIndex(TreeTabControl.TabIndex - 1);
        Key := 0;
      end;  }
    end;
  //▼お気に入りの順序がえ
  VK_UP:
    begin
      if ssAlt in Shift then
      begin
        key := 0;
        node := BookmarksTree.Selected;
        if node = nil then
          exit;
        node2 := node.getPrevSibling;
        if node2 = nil then
          exit;
        bkmk1 := node.Data;
        bkmk2 := node2.Data;
        bkmk1.Remove;
        with TBookmarkList(bkmk1.Parent) do
          Insert(IndexOf(bkmk2), bkmk1);
        //TODO:
        //BookmarksTree.Selected := node;
      	//node.Focused := true;
        SaveBookmarks(false);
      end;
    end;
  VK_DOWN:
    begin
      if ssAlt in Shift then
      begin
        key := 0;
        node := BookmarksTree.Selected;
        if node = nil then
          exit;
        node2 := node.getNextSibling;
        if node2 = nil then
          exit;
        bkmk1 := node.Data;
        bkmk2 := node2.Data;
        bkmk1.Remove;
        with TBookmarkList(bkmk1.Parent) do
          Insert(IndexOf(bkmk1), bkmk2);
        //TODO:
        //BookmarksTree.Selected := node;
        //node.Focused := true;
        SaveBookmarks(false);
      end;
    end;
  end;
end;

procedure TBagelMainForm.BookmarksTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	node:TTreeNode;
begin
  Node := BookmarksTree.GetNodeAt(X,Y);
  if (Button = mbRight) and (Node <> nil) then
  begin
    Node.Selected := True;
  end;
  if Node = nil then
  begin
    BookmarksTree.Selected := nil;
  end;
end;

procedure TBagelMainForm.actOpenCtxLinkExecute(Sender: TObject);
begin
  GetBrowser(TabControl.TabIndex).LoadURI(currentCtxURI);
end;

procedure TBagelMainForm.actOpenCtxLinkNewTabExecute(Sender: TObject);
begin
  if currentCtxURI='' then exit;
  AddTab(currentCtxURI,Pref.OpenModeMiddleClick,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actOpenFileExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then AddTab(Opendialog1.FileName,0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actOpenSelectionExecute(Sender: TObject);
var
  win:nsIDOMWindow;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  win := (b.WebBrowser as nsIWebBrowserFocus).FocusedWindow;
  if win=nil then Exit;
  AddTab(GetSelectionStrFromWin(win));
end;

procedure TBagelMainForm.actOutputSidebarExecute(Sender: TObject);
begin
  if actOutputSidebar.Checked then begin
    PageControl1.ActivePage:=TabSheet1;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

procedure TBagelMainForm.actPageHomeExecute(Sender: TObject);
var
  focusedwin:nsIDOMWindow;
begin
  if GetBrowser(tabBarCtxTarget)=nil then exit;
  focusedwin:=(GetBrowser(tabBarCtxTarget).WebBrowser as nsIWebBrowserFocus).FocusedWindow;
  if focusedwin<>nil then begin
    GetSelConByWin(focusedwin)
    .CompleteScroll(false);
  end
  else begin
    GetSelConByWin(GetBrowser(tabBarCtxTarget).ContentWindow)
    .CompleteScroll(false);
  end;
end;

procedure TBagelMainForm.actPasteBookmarkExecute(Sender: TObject);
var
  i:integer;
  RD:TReader;
  hBuf:THandle;
  p:pointer;
  FDataFormat:UINT;
  FPasteData:TMemoryStream;
//  tmp:String;
  isfolder:Integer;
  expanded:Boolean;
  level:Integer;
  name,uri,ds,rld:String;
  root,parent,curl:TBookmarkList;
  curi:TBookmark;
  curlevel:Integer;
  node:TTreeNode;
begin
  FDataFormat := RegisterClipboardFormat(PChar('BagelBkmkClipbrdItem'));
  if not Clipboard.HasFormat(FDataFormat) then exit;
  FPasteData:=TMemoryStream.Create;

  FPasteData.Clear;

  ClipBoard.Open;
  hBuf := Clipboard.GetAsHandle(FDataFormat);
  p := GlobalLock(hBuf);
  FPasteData.Clear;
  FPasteData.WriteBuffer(p^,GlobalSize(hBuf));
  FPasteData.Position := 0;
  GlobalUnlock(hBuf);
  Clipboard.Close;

  RD := TReader.Create(FPasteData,1000);
  (*count := RD.ReadInteger;
  for i := 0 to count-1 do begin
    MA[i].No := RD.ReadInteger;
    MA[i].Name := RD.ReadString;
    MA[i].Handle := RD.ReadInteger;
  end;*)
  root:=TBookmarkList.Create(nil);
  parent:=root;
  curlevel:=1;
  while true do begin
    isfolder:=RD.ReadInteger;

    if isfolder = 0 then begin
      level:=RD.ReadInteger;
      if level<curlevel then begin
        parent:=TBookmarkList(parent.parent);
        Dec(curlevel);
      end;
      name:=RD.ReadString;
      expanded:=RD.ReadBoolean;

      curl:=TBookmarkList.Create(parent);
      parent.Add(curl);
      curl.name:=name;
      curl.expanded:=expanded;
      
      parent:=curl;
      Inc(level);
      
    end
    else if isfolder = 1 then begin
      level:=RD.ReadInteger;
      if level<curlevel then begin
        parent:=TBookmarkList(parent.parent);
        Dec(curlevel);
      end;
      name:=RD.ReadString;
      uri:=RD.ReadString;
      ds:=RD.ReadString;
      rld:=RD.ReadString;
      
      curi:=TBookmark.Create(parent);
      parent.Add(curi);
      curi.name:=name;
      curi.URI:=uri;
      curi.DocShell:=ds;
      curi.ReloadIntv:=rld;

    end
    else begin
      break;
    end;
    //tmp:=tmp+name+#13#10;
  end;
  node:=BookmarksTree.Selected;
  if node<> nil then begin
    if TBkmkBase(node.Data).parent = nil then begin
      for i:=0 to root.Count-1 do begin
        bookmarks.Add(root.Items[i]);
      end;
    end
    else begin
      for i:=0 to root.Count-1 do begin
        parent := TBookmarkList(node.Parent.Data);
        parent.Insert(parent.IndexOf(node.Data)+i, root.Items[i]);
        (*TBookmarkList(TBkmkBase(node.Data).parent).Insert(
          TBookmarkList(TBkmkBase(node.Data).parent).Count,
          root.Items[i]
        );*)
      end;
    end;
  end
  else begin
    for i:=0 to root.Count-1 do begin
      bookmarks.Add(root.Items[i]);
    end;
  end;
  for i:=root.Count-1 downto 0 do begin
    root.Delete(root.Items[i]);
  end;
  root.Free;
  SaveBookmarks(true);
  //UpdateBookmarksTree;
  RD.Free;
end;


procedure TBagelMainForm.actPasteBookmarkUpdate(Sender: TObject);
var
	FDataFormat:UINT;
begin
  FDataFormat := RegisterClipboardFormat(PChar('BagelBkmkClipbrdItem'));
  if Clipboard.HasFormat(FDataFormat) then actPasteBookmark.Enabled:=true
  else actPasteBookmark.Enabled:=false;
end;

procedure TBagelMainForm.actPasteExecute(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  NS_GetInterface(b.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  if clipCmd.CanPaste then clipCmd.Paste;
end;

procedure TBagelMainForm.actPrevTabExecute(Sender: TObject);
var
  i:Integer;
  brwsr:TBagelBrowser;
begin
  if TabControl.Tabs.Count > 1 then
  begin
    //GetCurrentBrowser.Blur2;
    i:=TabControl.TabIndex;
    if i > 0 then
    begin
      brwsr:=TBagelBrowser(TabControl.Tabs.Objects[i-1]) ;
    end
    else begin
      brwsr:=TBagelBrowser(TabControl.Tabs.Objects[TabControl.Tabs.Count-1]) ;
    end;
    SelectTab(brwsr);
    TimerFireSetfocus.Enabled:=True;
  end;
end;

procedure TBagelMainForm.actPrintExecute(Sender: TObject);
var
  Settings:nsIPrintSettings;
  PrintService:nsIPrintSettingsService;
  Print:nsIWebBrowserPrint;
begin
  if GetBrowser(tabBarCtxTarget)<>nil then begin
    Print:=GetBrowser(tabBarCtxTarget).WebBrowserPrint;
    Settings:=GetPrintSettings;
    Print.Print(Settings,nil);
    NS_GetService('@mozilla.org/gfx/printsettings-service;1',nsIPrintSettingsService,PrintService);
    Printservice.SavePrintSettingsToPrefs(Settings,true,NS_IPRINTSETTINGS_kInitSaveAll);
    PrintService.SavePrintSettingsToPrefs(Settings,false,NS_IPRINTSETTINGS_kInitSavePrinterName);
  end;
end;

procedure TBagelMainForm.actPrintPreviewExecute(Sender: TObject);
begin
  DoPrintPreview;
  PrepareForPP;
end;

procedure TBagelMainForm.actQuitExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TBagelMainForm.actPageEndExecute(Sender: TObject);
var
  focusedwin:nsIDOMWindow;
begin
  if GetBrowser(tabBarCtxTarget)=nil then exit;
  focusedwin:=(GetBrowser(tabBarCtxTarget).WebBrowser as nsIWebBrowserFocus).FocusedWindow;
  if focusedwin<>nil then begin
    GetSelConByWin(focusedwin)
    .CompleteScroll(true);
  end
  else begin
    GetSelConByWin(GetBrowser(tabBarCtxTarget).ContentWindow)
    .CompleteScroll(true);
  end;
end;

procedure TBagelMainForm.actReloadAllExecute(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to TabControl.Tabs.Count - 1 do
  begin
    GetBrowser(i).Reload;
  end;
end;

procedure TBagelMainForm.actReloadExecute(Sender: TObject);
begin
  if TabControl.Tabs.Count<1 then Exit;
  GetBrowser(tabBarCtxTarget).Reload;
end;


procedure TBagelMainForm.actReOpenMostRecentExecute(Sender: TObject);
begin
  RecentClosedURIMenu.Click;
  if RecentClosedURIMenu.Count>0 then
  RecentClosedURIMenu.Item[1].Click;
end;

procedure TBagelMainForm.actRewindExecute(Sender: TObject);
var
  histPos:Integer;
  i:Integer;
  b:TGeckoBrowser;
  hostStr:IInterfacedCString;
  oldHost:String;
  j:Integer;
  entry:nsIHistoryEntry;
begin
  oldHost:='';
  hostStr:=NewCString;
  b:=GetCurrentBrowser;
  j := 0;
  if b<>nil then
  begin
//    histCount := b.WebNavigation.SessionHistory.Count;
    histPos := b.WebNavigation.SessionHistory.Index;
    entry := b.WebNavigation.SessionHistory.GetEntryAtIndex(histPos,False);
    entry.URI.GetHost(hostStr.ACString);
    oldHost:=hostStr.ToString;
    for i:=histPos-1 downto 0 do
    begin
      b.WebNavigation.SessionHistory.
      GetEntryAtIndex(i,False).URI.GetHost(hostStr.ACString);
      if hostStr.ToString <> oldHost then
      begin
        if i=histPos-1 then j:=i
        else j := i+1;
        Break;
      end;
    end;
    b.GotoIndex(j);
  end;
end;

procedure TBagelMainForm.actStartAutoScrollExecute(Sender: TObject);
begin
  GetCursorPos(AutoScrollOrigPt);
  AutoScrolling:=true;
  Self.MouseCapture:=true;
  AutoScrollTimer.Enabled:=true;
  Panel10.Left:=ViewPanel.ScreenToClient(AutoScrollOrigPt).X-14;
  Panel10.top:=ViewPanel.ScreenToClient(AutoScrollOrigPt).y-14;
  Panel10.Visible:=true;
  Panel10.BringToFront;
end;

procedure TBagelMainForm.actStopAllExecute(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to TabControl.Tabs.Count - 1 do
  begin
    StopTab(i);
  end;
end;

procedure TBagelMainForm.actStopExecute(Sender: TObject);
begin
  if TabControl.Tabs.Count<1 then Exit;
  StopTab(tabBarCtxTarget);
end;

procedure TBagelMainForm.actToggleSearchBarVisibleExecute(Sender: TObject);
begin

  MainCoolbar.Bands.FindBand(SearchBar).Visible:=actToggleSearchbarVisible.Checked;

end;

procedure TBagelMainForm.actToggleSearchBtnVisibleExecute(Sender: TObject);
begin
  ToolButton6.Visible := actToggleSearchBtnVisible.Checked;
  tbGrepSearchBarText.Visible := actToggleSearchBtnVisible.Checked;
  HighLightButton.Visible := actToggleSearchBtnVisible.Checked;
  Pref.ShowSearchButtons := actToggleSearchBtnVisible.Checked;
  if Pref.ShowSearchButtons then DelayedSearchButtonCreator.Enabled:=true
  else ClearWordSearchButtons;
end;

procedure TBagelMainForm.actToggleTabbarVisibleExecute(Sender: TObject);
begin
  MainCoolbar.Bands.FindBand(TabControl).Visible:=actToggleTabbarVisible.Checked;
end;

procedure TBagelMainForm.actToggleMenubarVisibleExecute(Sender: TObject);
begin
  MainCoolbar.Bands.FindBand(MenuToolbar).Visible:=actToggleMenubarVisible.Checked;
end;

procedure TBagelMainForm.actToggleMultilineTabExecute(Sender: TObject);
begin
  Pref.TabMultiLine:= actToggleMultilineTab.Checked;
  TabControl.MultiLine:=actToggleMultilineTab.Checked;
  if not TabControl.MultiLine then TabControl.Height:=22;
end;

procedure TBagelMainForm.actToggleMultilineTabUpdate(Sender: TObject);
begin
  actToggleMultilineTab.Checked:=TabControl.MultiLine;
end;

procedure TBagelMainForm.actToggleNoGripperExecute(Sender: TObject);
var
  bandinfo:TREBARBANDINFO;
  i:Integer;
begin
//  MainCoolbar.Handle
//REBARBANDINFO
//  RB_GETBANDINFO                                                //  RBBS_BREAK or

    for i := 0 to MainCoolbar.Bands.Count - 1 do
    begin
       FillChar(BandInfo, SizeOf(TReBarBandInfo), 0);
       BandInfo.cbSize := SizeOf(TReBarBandInfo);
       BandInfo.fMask := RBBIM_SIZE or RBBIM_CHILD or
                         RBBIM_CHILDSIZE or RBBIM_STYLE;
       MainCoolbar.Perform(RB_GETBANDINFO, i, Integer(@BandInfo));
       //RBBS_GRIPPERALWAYS;

       if actToggleNoGripper.Checked then begin
         BandInfo.fStyle := BandInfo.fStyle or RBBS_NOGRIPPER;
         BandInfo.fStyle := BandInfo.fStyle and (not RBBS_GRIPPERALWAYS);
       end
       else begin
         BandInfo.fStyle := BandInfo.fStyle or RBBS_GRIPPERALWAYS;
         BandInfo.fStyle := BandInfo.fStyle and (not RBBS_NOGRIPPER);
       end;

       //BandInfo.hwndChild := MainCoolbar.Bands[i].Control.Handle;
       MainCoolbar.Perform(RB_SETBANDINFO, i, Integer(@BandInfo));
    end;

    Pref.FixToolbar:=actToggleNoGripper.Checked;
end;

procedure TBagelMainForm.actToggleURIbarVisibleExecute(Sender: TObject);
begin
  MainCoolbar.Bands.FindBand(LocationBar).Visible:=actToggleURIbarVisible.Checked;
end;

procedure TBagelMainForm.actTaskTrayExecute(Sender: TObject);
begin
  if actTaskTray.Checked then
  begin
    //トレイのアイコンを表示し、自身を隠す
    BagelTrayIcon.Icon.Assign(Application.Icon);
    BagelTrayIcon.Visible := True;
    ShowWindow(Application.Handle,SW_HIDE);
    Self.Hide;
  end
  else
  begin
    //トレイのアイコンを削除
    BagelTrayIcon.Visible := False;
    Visible := true;
    ShowWindow(Application.Handle,SW_SHOW);
  end;
end;

procedure TBagelMainForm.actToggleGoButtonVisibleExecute(Sender: TObject);
begin
  GoButton.Visible := actToggleGoButtonVisible.Checked;
  if Pref.ShowGoButtonCaption then GoButton.Style := tbsTextButton
  else GoButton.Style := tbsButton;
  Pref.ShowGoButton := actToggleGoButtonVisible.Checked;
  LocationBar.OnResize(Self);
end;

procedure TBagelMainForm.actToggleLinkbarVisibleExecute(Sender: TObject);
begin
  MainCoolbar.Bands.FindBand(Linkbar).Visible:=actToggleLinkbarVisible.Checked;
end;

procedure TBagelMainForm.actToggleLockTabExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then GetBrowser(tabBarCtxTarget).Locked:= actToggleLockTab.Checked;
end;

procedure TBagelMainForm.actToggleLockTabUpdate(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then actToggleLockTab.Checked := GetBrowser(tabBarCtxTarget).Locked;
end;

procedure TBagelMainForm.actToggleMainbarVisibleExecute(Sender: TObject);
begin
  MainCoolbar.Bands.FindBand(ControlToolbar).Visible:=actToggleMainbarVisible.Checked;
end;

procedure TBagelMainForm.actToggleSidebarVisibleExecute(Sender: TObject);
begin
  if actToggleSidebarVisible.Checked then  //表示
  begin
    SideBasePanel.Visible:=True;
    if PageControl1.ActivePage=BookmarkSheet then actBookmarkSidebar.Checked:=true
    else if PageControl1.ActivePage=HistorySheet then actHistorySidebar.Checked:=true
    else if PageControl1.ActivePage=LinkSheet then actLinkSidebar.Checked:=true
    else if PageControl1.ActivePage=GrepSheet then actGrepSidebar.Checked:=true
    else if PageControl1.ActivePage=WebPanelSheet then actWebPanel.Checked:=true
    else if PageControl1.ActivePage=ScriptSheet then actScriptSidebar.Checked:=true
    else if PageControl1.ActivePage=ClipSheet then actClipboardSidebar.Checked:=true
    else if PageControl1.ActivePage=MemoSheet then actMemoSidebar.Checked:=true
    else if PageControl1.ActivePage=DLSheet then actTransferSidebar.Checked:=true
    else if PageControl1.ActivePage=TabSheet1 then actOutputSidebar.Checked:=true
    else if PageControl1.ActivePage=UsrTabSheet then actUserDefinedSidebar.Checked:=true;
  end
  else
  begin                            //非表示
    SideBasePanel.Visible:=False;
    if actBookmarkSidebar.Checked then actBookmarkSidebar.Checked:=false
    else if actHistorySidebar.Checked then actHistorySidebar.Checked:=false
    else if actLinkSidebar.Checked then actLinkSidebar.Checked:=false
    else if actGrepSidebar.Checked then actGrepSidebar.Checked:=false
    else if actWebPanel.Checked then actWebPanel.Checked:=false
    else if actScriptSidebar.Checked then actScriptSidebar.Checked:=false
    else if actClipboardSidebar.Checked then actClipboardSidebar.Checked:=false
    else if actMemoSidebar.Checked then actMemoSidebar.Checked:=false
    else if actTransferSidebar.Checked then actTransferSidebar.Checked:=false
    else if actOutputSidebar.Checked then actOutputSidebar.Checked:=false
    else if actUserDefinedSidebar.Checked then actUserDefinedSidebar.Checked:=false;
  end;

  Pref.SidebarVisible:=actToggleSidebarVisible.Checked;
end;

procedure TBagelMainForm.actToggleStatusbarVisibleExecute(Sender: TObject);
begin
  StatusBar.Visible:=TAction(Sender).Checked;
end;


procedure TBagelMainForm.actTransferSidebarExecute(Sender: TObject);
begin
  if actTransferSidebar.Checked then begin
    PageControl1.ActivePage:=DLSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

procedure TBagelMainForm.actUserDefinedSidebarExecute(Sender: TObject);
begin
  if actUserDefinedSidebar.Checked then begin
    PageControl1.ActivePage:=UsrTabSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

procedure TBagelMainForm.actViewSourceExecute(Sender: TObject);
begin
  AddTab('view-source:' + GetBrowser(tabBarCtxTarget).URI,Pref.OpenModeViewsource,0,'',Pref.DocShellDefault)
end;

procedure TBagelMainForm.actWebPanelExecute(Sender: TObject);
begin
  if actWebPanel.Checked then begin
    PageControl1.ActivePage:=WebPanelSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

procedure TBagelMainForm.actWorkOfflineExecute(Sender: TObject);
var
  ioService:nsIIOService;
begin
  ioService := NS_GetIOService;
  ioService.Offline := actWorkOffline.Checked;
  actWorkOffline.Update;
end;

procedure TBagelMainForm.actWorkOfflineUpdate(Sender: TObject);
var
  ioService:nsIIOService;
begin
  ioService:=NS_GetIOService;
  actWorkOffline.Checked := ioService.Offline;
  //TODO:swOffline.Checked := retval;
  StatusBar.Refresh;
end;

procedure TBagelMainForm.actZoomInExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then exit;
  b.ContentWindow.TextZoom := b.ContentWindow.TextZoom * 1.2;
end;

procedure TBagelMainForm.actZoomNormalExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then exit;
  b.ContentWindow.TextZoom := 1;
end;

procedure TBagelMainForm.actZoomOutExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  b.ContentWindow.TextZoom := b.ContentWindow.TextZoom * 5 / 6;
end;

function TBagelMainForm.AddTab(uri:String ;
                       OpenMode: Integer ;
                       loadFlags:Integer = 0 ;
                       Referrer:String = '';
                       DocShell:Integer = 0;
                       Reload:Integer = 0):TBagelBrowser;
  procedure SetSecurity(brwsr:TBagelBrowser;DocShell:Integer);
  begin
    if brwsr.DocShell<>nil then begin
      brwsr.DocShell.AllowPlugins       := (DocShell and 1)<>0;
      brwsr.DocShell.AllowJavascript    := (DocShell and 2)<>0;
      brwsr.DocShell.AllowSubframes     := (DocShell and 4)<>0;
      brwsr.DocShell.AllowMetaRedirects := (DocShell and 8)<>0;
      brwsr.DocShell.AllowImages        := (DocShell and 16)<>0;

      actAllowJS.Checked:=brwsr.DocShell.AllowJavascript;
      actAllowJS.Update;
      actAllowImg.Checked:=brwsr.DocShell.AllowImages;
      actAllowImg.Update;
      actAllowFrames.Checked:=brwsr.DocShell.AllowSubframes;
      actAllowFrames.Update;
      actAllowPlugins.Checked:=brwsr.DocShell.AllowPlugins;
      actAllowPlugins.Update;
      actAllowRedirect.Checked:=brwsr.DocShell.AllowMetaRedirects;
      actAllowRedirect.Update;
      StatusBar.Refresh;
    end;
  end;

var
  brwsr:TBagelBrowser;
  i:integer;
  newtab,bground:Boolean;
begin
  Result:=nil;
  if uri='' then exit; // 何もないので終了
  if Pos('javascript:', uri)=1 then // JavaScriptスキームは特例
  begin
    if GetCurrentBrowser<>nil then
      GetCurrentBrowser.LoadURIWithFlags(uri,loadFlags, IsSendReferrer(Referrer));
  end
  else
  begin
    if (TabControl.Tabs.Count = 0) then begin
      //ひとつもタブがない場合は問答無用で追加する。
      newtab := True;
      bground := False;
    end
    else begin
      //OpenMode and 1 =0 ならば新しいタブで開く。
      //ただし、現在のタブがabout:blankならば現在のタブで開く。
      if ((OpenMode and 1) = 0){ and
         //TODO: Load中だとabout:blankなので、上書きされてしまうのを直す
         ((GetCurrentBrowser.URI <> 'about:blank') or GetCurrentBrowser.Busy)}then begin
        newtab := True;
        if (OpenMode and 2) <> 0 then bground := True
        else bground := False;
      end
      else begin
        newtab := False;
        bground := False;
      end;
    end;

    if newtab then begin
      //新しいタブで開く
      if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;
      brwsr:=TBagelBrowser.Create(Self);
      ApplyEvtHandlersToBrowser(brwsr);
      brwsr.Visible := false;
      brwsr.Parent:= Self.ViewPanel;
      brwsr.Align := alClient;
      brwsr.ReloadTime:=Reload;
      brwsr.TabStop:=true;
      Result:=brwsr;
      TabControl.Tabs.InsertObject(GetNewtabPos(OpenMode),'',TObject(brwsr));
      TabZOrder.Insert(GetMDITabPos(OpenMode),TObject(brwsr));
      if not bground then // backgroundか否か
      begin
        i := TabControl.Tabs.IndexOfObject(TObject(brwsr));
        brwsr.Visible := true;
        SelectTab(i);
        if Application.Active then
        begin
          brwsr.SetFocus;
        end
        else begin
          Self.ActiveControl:=brwsr;
        end;
        SetSecurity(brwsr,DocShell);
        brwsr.LoadURIWithFlags(uri,loadFlags, IsSendReferrer(Referrer));
      end
      else begin
        brwsr.SendToBack;
        brwsr.Visible := true;
        SetSecurity(brwsr,DocShell);
        brwsr.LoadURIWithFlags(uri,loadFlags, IsSendReferrer(Referrer));
      end;
      if brwsr.DocShell<>nil then
        brwsr.DocShell.UseErrorPages := True;
    end
    else begin
    //現在のタブで開く
      if GetCurrentBrowser<>nil then GetCurrentBrowser.LoadURIWithFlags(uri,loadFlags, IsSendReferrer(Referrer));
    end;
  end;

end;
procedure TBagelMainForm.AddToMemoClick(Sender: TObject);
var
  i:Integer;
  memo:TBagelMemo;
  mi:TMenuItem;
begin
  if MemoSheet.Tag=0 then MemoSheetShow(nil);
  while AddToMemo.Count>1 do AddToMemo.Items[1].Free;
  for i:=0 to TabControl2.Tabs.Count-1 do begin
    memo:=TBagelmemo(TabControl2.Tabs.Objects[i]);
    mi:=TMenuItem.Create(Self);
    mi.Caption:=TabControl2.Tabs.Strings[i]; //memo.Title;
    mi.Tag:=Integer(Memo);
    mi.OnClick:=AddToMemoItemClick;
    AddToMemo.Add(mi);
  end;
end;

procedure TBagelMainForm.AddToMemoItemClick(Sender: TObject);
var
//  i:Integer;
  memo:TBagelMemo;
  item:TBagelMemoItem;
  litem:TListItem;
  b:TBagelBrowser;
  aDOMW:nsIDOMWindow;
begin
  if TabControl2.Tabs.Count>0 then begin
    b:=GetCurrentBrowser;
    if b=nil then Exit;

    memo:=TBagelMemo(TMenuitem(Sender).Tag);

    if SearchBox.Text<>'' then
      item:=TBagelmemoItem.Create(FormatDateTime('yyyy/mm/dd hh:nn',Now)+' '+StringReplace(SearchBox.Text,'　',' ',[rfReplaceAll])+':'+b.Title)
    else item:=TBagelmemoItem.Create(FormatDateTime('yyyy/mm/dd hh:nn',Now)+' '+b.Title);

    aDOMW := (b.WebBrowser as nsIWebBrowserFocus).FocusedWindow;
    if aDOMW=nil then Exit;

    item.Content:=GetSelectionStrFromWin(aDOMW);

    memo.Add(item);

    if TBagelmemo(TabControl2.Tabs.Objects[TabControl2.TabIndex])=memo then begin
      lItem:=lvMemo.Items.Add;
      litem.Caption:=item.Title;
      litem.Data:=item;
      lvMemo.Selected:=litem;
      litem.MakeVisible(true);
    end;
  end;
end;



procedure TBagelMainForm.ApplySysFontToMenu;
var
  NonClientMetrics: TNonClientMetrics;  //NONCLIENTMETRICS構造体
  FFont:TFont;
  FontName :String;
begin

  FontName := '';
  NonClientMetrics.cbSize := Sizeof(TNONCLIENTMETRICS);

  SystemParametersInfo(SPI_GETNONCLIENTMETRICS,0,
                         @NonClientMetrics, 0);

  FFont:=TFont.Create;
  if Pref.OverrideToolbarFont then begin
    FFont.Name:=Pref.ToolbarFont;
    MainCoolbar.Font.Assign(FFont);
    Self.Font.Assign(FFont);
    ControlToolBar.Font.Assign(FFont);
  end
  else begin
  end;

  if Pref.OverrideSidebarFont then begin
    FFont.Name:=Pref.SidebarFont;
    SidePanel.Font.Assign(FFont);
  end
  else begin
  end;

  if Pref.OverrideMenubarFont then begin
    FFont.Name:=Pref.MenubarFont;
    MenuToolbar.Font.Assign(FFont);
  end
  else begin
    FFont.Name:=NonClientMetrics.lfMenuFont.lfFaceName;
    FFont.Height:=NonClientMetrics.lfMenuFont.lfHeight;
    MenuToolbar.Font.Assign(FFont);
  end;


  if Pref.OverrideSidebarFont then begin
{    FFont.Name:=Pref.SidebarFont;
    ControlToolBar.Font.Assign(FFont);
    MainCoolbar.Font.Assign(FFont);}
  end
  else begin
  end;

  FFont.Free;
       //	MenuToolBar.Buttons[0].AutoSize := False;
       //MenuToolbar.ButtonHeight:=30;
       // MenuToolBar.Buttons[0].Height := 10;
       //	MenuToolBar.Buttons[0].AutoSize := True;
  //
        //MenuToolBar.Height:=MenuToolBar.Height-5; Pref.SidebarOverlap
  //if true then
end;

procedure TBagelMainForm.LoadExtensions;
var
  SearchRec: TSearchRec;
  DirectoryName:String;
  DirnameButBSlash:String;
  sl:TStringList;
  IniFile:TMemIniFile;
  ExtName:String;
  ExtCaption:String;
  ExtSrc:String;
  ExtType:String;
  ExtCommand:String;
  ExtOption:String;
//  IniFile:TIniFile;
  i:Integer;
  ExtAction:TAction;
  ExtCmdAction:TCommandAction;
  CmdMenu:TMenuItem;

//  newMI:TMenuItem;
begin
  {拡張機能フォルダ覗き}
  DirnameButBSlash:=GetSettingDir()+'extensions';
  DirectoryName:=DirnameButBSlash+'\';
  sl:=TStringList.Create;
//  ScriptList.Items.Clear;
//  GeckoPActions.Clear;
  if not DirectoryExists(DirectoryName) then
  ForceDirectories(DirectoryName);

  //ShellChangeNotifier1.Root:=DirnameButBSlash;
                                                            {
  // 一番後ろに '\' がついていなければ付ける
    DirectoryName:= IncludeTrailingBackslash(DirectoryName); }

    //========================================//
   //     スクリプト型の拡張を読み込み       //
  //========================================//

  // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
  {if 0=FindFirst(DirectoryName+'*.*', faDirectory	, SearchRec) then try
    repeat
      if SearchRec.Attr and faDirectory <> 0 then begin
        // カレントディレクトリや親ディレクトリをスキップ
        if (SearchRec.Name='.') or (SearchRec.Name='..') then
          Continue;
        // ディレクトリに対する処理
        // SearchRec.Name にディレクトリ名が入っている
        // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
        if FileExists(DirectoryName+SearchRec.Name+'\content.ini') then begin
          IniFile:=TMemIniFile.Create(DirectoryName+SearchRec.Name+'\content.ini');
          try
            sl.CommaText:=IniFile.ReadString('manifest','items','');
            For i:=0 to sl.Count-1 do begin
              if IniFile.SectionExists(sl.Strings[i]) then begin
                ExtName:=sl.Strings[i];
                ExtType:=IniFile.ReadString(ExtName,'type','');
                if ExtType='Script' then begin
                  ExtSrc:=IniFile.ReadString(ExtName,'src','');
                  ExtCaption:=IniFile.ReadString(ExtName,'caption','');
                  ExtAction:=TScriptAction.Create(Self);
                  (ExtAction as TScriptAction).ScriptPath:=DirectoryName+SearchRec.Name+'\'+ExtSrc;
                  ExtAction.Caption:=ExtCaption;
                  ExtAction.Name:=ExtName;
                  ExtAction.Category:='拡張 '+SearchRec.Name;
                  ExtAction.ActionList:=ActionList1;
                  ExtAction.OnExecute:=Self.ScriptExec;
                  //ActionList1.
                end;
              end;
            end;
          finally
            IniFile.Free;
          end;
          if Pref.InstalledExtensions.IndexOf(SearchRec.Name)=-1 then begin
            //見つからない、つまり新しく入荷した拡張である
            Pref.InstalledExtensions.Add(SearchRec.Name+'=1');
          end
          else begin
            //見つかった、つまりもう入っている拡張である
            Pref.InstalledExtensions.Values[SearchRec.Name]:='2'
          end;
          //どのフラグもついていないものは削除されたものとみなす

          //ああもう意味不明な仕様だよな
          //自分でうんざりするぜ

        end;

      end else begin
        // ファイルに対する処理
        // SearchRec.Name にファイル名が入っている
        // たとえば、Memo1.Lines.Add('File:'+DirectoryName+SearchRec.Name);
        {ScriptList.Items.Add(SearchRec.Name);
        newMI:=TMenuItem.Create(GeckoPActions);
        newMI.Caption:=SearchRec.Name;
        newMI.OnClick := ScriptListMenuClick;
        newMI.Tag := GeckoPActions.Count;
        GeckoPActions.Insert(GeckoPActions.Count,newMI);
      end;
    until 0<>FindNext(SearchRec);
  finally
    FindClose(SearchRec);
  end;}

    //========================================//
   //      コマンド型の拡張を読み込み        //
  //========================================//
  IniFile:=TMemIniFile.Create(GetSettingDir()+'Commands.ini');
  try
    sl.Clear;
    IniFile.ReadSections(sl);
    for i:=0 to sl.Count-1 {コマンドの数-1} do begin
      ExtName:=sl.Strings[i];
      ExtCaption:=IniFile.ReadString(ExtName,'caption','');
      ExtCommand:=IniFile.ReadString(ExtName,'commandname','');
      ExtOption:=IniFile.ReadString(ExtName,'option','');
      ExtCmdAction:=TCommandAction.Create(Self);
      ExtCmdAction.Name:=ExtName;
      ExtCmdAction.Caption:=ExtCaption;
      ExtCmdAction.Command:=ExtCommand;
      ExtCmdAction.Option:=ExtOption;
      ExtCmdAction.Category:='コマンド型拡張';
      ExtCmdAction.ActionList:=ActionList1;
      ExtCmdAction.OnExecute:=Self.CommandExtExec;
      CmdMenu:=TMenuItem.Create(Self);
      ToolPCmdExt.Add(CmdMenu);
      CmdMenu.Action:=ExtCmdAction;
      if lowerCase(ExtCommand)='copy' then begin
        ExtCopyList.Add(ExtCmdAction);
      end
      else if lowerCase(ExtCommand)='run' then begin
        ExtAppList.Add(ExtCmdAction);
      end;{
      else if (lowerCase(ExtCommand)='loaduri') and (Pos('%addressbar%',ExtOption)>0) then begin
        ExtGoList.Add(ExtCmdAction);
      end; }
    end;
  finally
    IniFile.Free;
  end;
{

}
  sl.Free;
end;  //LoadExtensions終わり

{タブの選択}
procedure TBagelMainForm.SelectTab(Browser:TBagelBrowser);
var
//  u:nsIURI;
  str: IInterfacedCString;
//  astr: nsACString;
  Index:Integer;
begin
  if browser=nil then exit;
  //Cancelmigemo;
  AutoScrolling:=False;
  //GetCurrentBrowser.Blur2;
  GetCurrentBrowser.TabStop:=False;
  //GetCurrentBrowser.ShouldFocus:=False;

  Index:=TabControl.Tabs.IndexOfObject(Browser);
  Browser.IsRead:=true;
  TabZOrder.Move(TabZOrder.IndexOf(Browser),TabZOrder.Count-1);
  TabControl.TabIndex:=Index;

  Browser.BringToFront;

  Browser.Enabled := true;
  //Browser.ShouldFocus := true;
  Browser.TabStop := true;
  //tabBarCtxTarget:=Index;
  //FGBProgress.Position:=0;

//文字列
  str :=NewCString('');
//URI
  LocationBox.Text := URIToStr(Browser.WebNavigation.CurrentURI);
  Self.Caption := Browser.Title + IfThen(Pref.ShowAppNameInTitle,'- Bagel') ;
  Application.Title := Self.Caption;
  actGoBack.Enabled:=Browser.CanGoBack;
  actRewind.Enabled:=actGoBack.Enabled;
  actGoForward.Enabled:=Browser.CanGoForward;
  actFastForward.Enabled:=actGoForward.Enabled;


  actAllowJS.Checked:=Browser.DocShell.AllowJavascript;
  actAllowJS.Update;
  actAllowImg.Checked:=Browser.DocShell.AllowImages;
  actAllowImg.Update;
  actAllowFrames.Checked:=Browser.DocShell.AllowSubframes;
  actAllowFrames.Update;
  actAllowPlugins.Checked:=Browser.DocShell.AllowPlugins;
  actAllowPlugins.Update;
  actAllowRedirect.Checked:=Browser.DocShell.AllowMetaRedirects;
  actAllowRedirect.Update;
  StatusBar.Refresh;

  //HighlightButton.Down := IsHilighted(Browser);

  Browser.Enabled:=true;

  Browser.SetFocus;
  //Self.ActiveControl:=Browser;
end;

procedure TBagelMainForm.SearchBoxChange(Sender: TObject);
begin
  if Pref.ShowSearchButtons then begin
    if DelayedSearchButtonCreator.Enabled then DelayedSearchButtonCreator.Enabled:=false;
    DelayedSearchButtonCreator.Enabled:=true;
  end;
end;

procedure TBagelMainForm.SearchBoxKeyPress(Sender: TObject; var Key: Char);
var
	already:Integer;
begin
	if Key=chr(VK_RETURN) then
	begin
	   if Pref.ReplaceZenkakuSpace then SearchBox.Text:=StringReplace( SearchBox.Text , '　' , ' ',[rfReplaceAll]);
	   DoSearch(SearchBox.Text);

	   already:=SearchBox.Items.IndexOf(SearchBox.Text);
	   if already=-1 then
	   begin
	     SearchBox.Items.Insert(0,SearchBox.Text);
	     Pref.SearchHistory.Insert(0,SearchBox.Text);
	   end
	   else
	   begin
	     SearchBox.Items.Move(already,0);
	     Pref.SearchHistory.Move(already,0);
	   end;
	   while SearchBox.ItemsEx.Count>Pref.SearchBarSaveCount do
	     SearchBox.ItemsEx.Delete(Pref.SearchBarSaveCount);
	end;

end;

procedure TBagelMainForm.SearchBoxSelect(Sender: TObject);
begin
  if Pref.SearchOnKeywordChange then
  DoSearch(SearchBox.Text);
end;

procedure TBagelMainForm.SecPAllowFramesClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  ds:=b.DocShell;
  ds.AllowSubFrames:=TMenuItem(Sender).Checked;
end;

procedure TBagelMainForm.SecPAllowImgClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  ds:=b.DocShell;
  ds.AllowImages:=TMenuItem(Sender).Checked;
end;

procedure TBagelMainForm.SecPAllowJSClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  ds:=b.DocShell;
  ds.AllowJavascript:=TMenuItem(Sender).Checked;
end;

procedure TBagelMainForm.SecPAllowMetaRedClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  ds:=b.DocShell;
  ds.AllowMetaRedirects:=(TMenuItem(Sender).Checked);
end;

procedure TBagelMainForm.SecPAllowPluginsClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  ds:=b.DocShell;
  ds.AllowPlugins:=(TMenuItem(Sender).Checked);
end;

procedure TBagelMainForm.SelectTab(Index:Integer);
var
  b:TBagelBrowser;
begin
  AutoScrolling:=False;
  //CancelMigemo;
  b:=GetBrowser(index);
  if b=nil then exit
  else SelectTab(b);
end;
{ブラウザを止める}
procedure TBagelMainForm.StopTab(Index:integer);
var
  b:TBagelBrowser;
begin
  b:=GetBrowser(index);
  b.WebNavigation.Stop(NS_IWEBNAVIGATION_STOP_ALL);
end;
procedure TBagelMainForm.StatusBarResize(Sender: TObject);
var
  i:Integer;
  mywidth:Integer;
begin
  for i := 0 to StatusWidgetList.Count - 1 do begin
    StatusBar.Panels[i+1].Width := 3 + TControl(StatusWidgetList.Items[i]).Width;
  end;
  mywidth:=0;
  for i:=1 to StatusBar.Panels.Count-1 do begin
    mywidth:=mywidth+StatusBar.Panels[i].Width;
  end;
  StatusBar.Panels[0].Width:=StatusBar.Width-mywidth;

    mywidth := 0;
    for i := 0 to StatusWidgetList.Count - 1 do begin
      mywidth := mywidth + StatusBar.Panels[i].width;
      TControl(StatusWidgetList.Items[i]).Left := mywidth + 3;
    end;

end;

procedure TBagelMainForm.StopTab(Browser:TBagelBrowser);
begin
  Browser.WebNavigation.Stop(NS_IWEBNAVIGATION_STOP_ALL);
end;

procedure TBagelMainForm.ReloadTab(Index:integer);
var
  b:TBagelBrowser;
begin
  b:=GetBrowser(index);
  b.Reload;
end;

procedure TBagelMainForm.ReloadTab(Browser:TBagelBrowser);
begin
  Browser.Reload;
end;
procedure TBagelMainForm.CloseTab(Browser:TBagelBrowser);
var
  Index:Integer;
  i,i2:integer;
  c,j:Integer;
  item:TTabListItem;
  entry:TTabHistoryItem;
begin
  index := TabControl.Tabs.IndexOfObject(Browser);
  if (Index<0) or (index>=TabControl.Tabs.Count) then exit;

  //Grepサイドバーの項目を削除。解放。
  c:=GrepList.Items.Count-1;
  GrepList.Items.BeginUpdate;
  for i:=0 to grepList.Items.Count-1 do
  begin
    j:=c-i;
    if PGrepResult(GrepList.Items[j].Data)^.Browser=Browser then
    begin
      Dispose(GrepList.Items[j].Data);
      GrepList.Items[j].Delete;
    end;
  end;
  GrepList.Items.EndUpdate;

  //最近閉じたURLに追加

  item:=TTabListItem.Create;

  for i:=0 to Browser.WebNavigation.SessionHistory.Count-1 do begin
    entry:=TTabHistoryItem.Create;
    entry.URI := URIToStr(Browser.WebNavigation.
                          SessionHistory.
                          GetEntryAtIndex(i,False).URI);
    entry.Title:=Browser.WebNavigation.SessionHistory.
                GetEntryAtIndex(i,False).Title;
    item.AddHistoryItem(entry);
  end;
  item.URI:=Browser.URI;
  item.Title:=Browser.Title;
  item.HistoryPosition:=Browser.WebNavigation.SessionHistory.Index;
  Pref.RecentClosedURL.Insert(item,0);
  while Pref.RecentClosedURL.Count>Pref.RecentClosedMaxCount do begin
    item:=Pref.RecentClosedURL.Tabs[Pref.RecentClosedMaxCount];
    Pref.RecentClosedURL.Delete(Pref.RecentClosedMaxCount);
    item.Free;
  end;


  if TabControl.Tabs.Count=0 then begin
    //actShowPageInfo.Enabled:= false;
    actGoBack.Enabled:=false;
    actRewind.Enabled:=false;
    actGoForward.Enabled:=false;
    actFastForward.Enabled:=false;
  end
  else if TabControl.Tabs.Count=1 then //タブがひとつしかないとき
  begin
    TabControl.Tabs.Delete(Index);
    TabZOrder.Delete(TabZOrder.IndexOf(Browser));
    Browser.Free;
    ActiveControl:=LocationBox;
    LocationBox.Text:='';
    HighlightButton.Marked:=False;
    Self.Caption := 'Bagel';
    Application.Title := 'Bagel';
    //tabBarCtxTarget:=-1;
  end
  else begin
    if (Pref.WhenCloseTabChoose = 0) then
    begin //右
      if Index=TabControl.Tabs.Count-1 then i2:=Index-1
      else i2:=Index+1;
    end
    else if Pref.WhenCloseTabChoose=1 then
    begin //左
      if Index<=0 then i2:=1
      else i2:=Index-1;
    end
    else begin// if Pref.WhenCloseTabChoose=2 then begin
      TabZOrder.Delete(TabZOrder.IndexOf(Browser));
      i2:=TabControl.Tabs.IndexOfObject(TBagelBrowser(TabZOrder.Items[TabZOrder.Count-1]));
    end;
    if TabControl.TabIndex = Index then SelectTab(i2);

    TabControl.Tabs.Delete(Index);

    //tabBarCtxTarget:=TabControl.TabIndex;
    Browser.Free;
  end;
  
  if TabControl.Tabs.Count<>0 then
  begin
    //actShowPageInfo.Enabled:= true;
    actGoBack.Enabled := GetCurrentBrowser.CanGoBack;
    actRewind.Enabled := actGoBack.Enabled;
    actGoForward.Enabled := GetCurrentBrowser.CanGoForward;
    actFastForward.Enabled := actGoForward.Enabled;
  end

end;
procedure TBagelMainForm.CloseTab(Index:integer);
begin
  CloseTab(GetBrowser(Index));
end;

procedure TBagelMainForm.CopyLinkListBothClick(Sender: TObject);
begin     
  if LinkListView.Items.Count<1 then Exit;
  Clipboard.AsText:=LinkListView.Selected.Caption+#13#10+LinkListView.Selected.SubItems.Strings[0];
end;

procedure TBagelMainForm.CopyLinkListTextClick(Sender: TObject);
begin
  if LinkListView.Items.Count<1 then Exit;
  Clipboard.AsText:=LinkListView.Selected.Caption;
end;

procedure TBagelMainForm.CopyLinkListURLClick(Sender: TObject);
begin
  if LinkListView.Items.Count<1 then Exit;
  Clipboard.AsText:=LinkListView.Selected.SubItems.Strings[0];
end;

procedure TBagelMainForm.CreateMemoClick(Sender: TObject);
var
  memoname:String;
  memo:TBagelMemo;
  memoitem:TBagelMemoItem;
  i:Integer;
  tmpStr:String;
begin
  memoname:='New Memo';
   //<>/\:*|"?
  while InputQuery('新規メモ作成' ,'名前を入力してください'+#13#10+'(次の文字は使えませんので注意してください : <>/\:*|"? )',memoname) do begin
    if (Pos('<',memoname)>0) or
       (Pos('>',memoname)>0) or
       (Pos('?',memoname)>0) or
       (Pos('/',memoname)>0) or
       (Pos('\',memoname)>0) or
       (Pos('*',memoname)>0) or
       (Pos(':',memoname)>0) or
       (Pos('|',memoname)>0) or
       (Pos('"',memoname)>0) then begin  //無効な名前
      continue;
    end
    else if FileExists(GetSettingDir()+'memo\'+memoname+'.txt') then begin
    //すでに存在する
      continue;
    end
    else begin
      memo:=TBagelMemo.Create;
      memoitem:=TBagelMemoItem.Create(FormatDateTime('yyyy/mm/dd hh:nn',Now)+' 新規アイテム');
      memo.Path := IncludeTrailingBackslash( GetSettingDir()+'memo')+memoname+'.txt';
      memo.Add(memoitem);
      TabControl2.Tabs.AddObject(memoname+'.txt',memo);
      TabControl2.TabIndex:=TabControl2.Tabs.Count-1;
      TabControl2Change(nil);

      //TODO:復活
      //pnlDropTarget.TargetList:=nil;
      InternalTargetList.Clear;
      InternalTargetList.Assign(Pref.DropTargetList);
      if TabControl2.Tabs.Count>0 then
        for i:=0 to TabControl2.Tabs.Count-1 do begin
          memo:=TBagelMemo(TabControl2.Tabs.Objects[i]);
          tmpStr:=ExtractFileName(memo.Path);
          InternalTargetList.Add('text'+#9+'memo'+#9+memo.Title+#9+tmpStr);
        end;

      //TODO:復活
      //pnlDropTarget.TargetList:=InternalTargetList;

      break;
    end;
  end;
end;

procedure TBagelMainForm.CreateMemoItemClick(Sender: TObject);
var
  memo:TBagelMemo;
  item:TBagelMemoitem;
  litem:TListItem;
begin
  if TabControl2.Tabs.Count>0 then begin
    memo:=TBagelmemo(TabCOntrol2.Tabs.Objects[TabControl2.TabIndex]);
    item:=TBagelmemoItem.Create(FormatDateTime('yyyy/mm/dd hh:nn',Now)+' 新規アイテム');
    memo.Add(item);
    lItem:=lvMemo.Items.Add;
    litem.Caption:=item.Title;
    litem.Data:=item;
    lvMemo.Selected:=litem;
    litem.MakeVisible(true);
    edtMemoTitle.SetFocus;
  end;
end;

procedure TBagelMainForm.CloneTab(b:TBagelBrowser;loadFlags:Integer=1);    //
var
  brwsr:TBagelBrowser;
  i:integer;
  j:Integer;
  sh:nsISHistory;
  shi:nsISHistoryInternal;
  newSH:nsISHistory;
  newSHI:nsISHistoryInternal;
  newEntry:nsISHEntry;
  newURI:nsIURI;
  histcount:Integer;
  title:nsAString;
  Ititle:IInterfacedString;
begin
  if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;
  brwsr:=TBagelBrowser.Create(Self);
  brwsr.Visible := false;
  brwsr.Parent:=self.ViewPanel;
  brwsr.Align := alClient;
  if brwsr.DocShell<>nil then
    brwsr.DocShell.UseErrorPages := True;
  ApplyEvtHandlersToBrowser(brwsr);
//    brwsr.DoubleBuffered:=true;
  brwsr.TabStop:=true;
  //TabControl1.Tabs.AddObject('',TObject(brwsr));
  TabControl.Tabs.InsertObject(GetNewtabPos(0),'',TObject(brwsr));
  TabZOrder.Insert(GetMDITabPos(0),TObject(brwsr));

  if loadFlags=1 then
  begin
    i := TabControl.Tabs.IndexOfObject(TObject(brwsr));
    TabControl.TabIndex:=i;
    tabBarCtxTarget:=i;
    brwsr.Visible := true;
    if Application.Active then
    begin
            //brwsr.ShouldFocus:=true;
            //(brwsr.WebBrowser as nsIWebBrowserFocus).SetFocusedElement(brwsr.LastFocused);
            brwsr.SetFocus;
    end;
    if not Pref.AddTabCurrCopyHistory then
      brwsr.LoadURI(b.URI)
    else
    begin
      sh:=b.WebNavigation.SessionHistory;
      sh.QueryInterface(NS_ISHISTORYINTERNAL_IID,shi);
      histcount:=sh.Count;
      newSH:=brwsr.WebNavigation.SessionHistory;
      newSH.QueryInterface(NS_ISHISTORYINTERNAL_IID,newSHI);
      for j:=0 to histCount-1 do
      begin

        NS_CreateInstance('@mozilla.org/browser/session-history-entry;1',NS_ISHENTRY_IID,newEntry);
        newURI:=sh.GetEntryAtIndex(j,False).URI;
        newEntry.SetURI(newURI);
        Ititle:=NewString(sh.GetEntryAtIndex(j,False).Title);
        title:=Ititle.AString;
        newEntry.SetTitle(title);
        newSHI.AddEntry(newEntry,true);
      end;
      brwsr.WebNavigation.GotoIndex(sh.Index);
     end;
  end
  else if loadFlags=2 then
  begin
    brwsr.SendToBack;
    brwsr.Visible := true;
    //brwsr.ShouldFocus:=false;

    //こぴぺ。後で変えよう。
    if not Pref.AddTabCurrCopyHistory then
      brwsr.LoadURI(b.URI)
    else begin
      sh := b.WebNavigation.SessionHistory;
      sh.QueryInterface(NS_ISHISTORYINTERNAL_IID,shi);
      histcount:=sh.Count;
      newSH := brwsr.WebNavigation.SessionHistory;
      newSH.QueryInterface(NS_ISHISTORYINTERNAL_IID,newSHI);

      for j:=0 to histCount-1 do
      begin

        NS_CreateInstance('@mozilla.org/browser/session-history-entry;1',NS_ISHENTRY_IID,newEntry);
        newURI:=sh.GetEntryAtIndex(j,False).URI;
        newEntry.SetURI(newURI);
        Ititle:=NewString(sh.GetEntryAtIndex(j,False).Title);
        title:=Ititle.AString;
        //newEntry.SetTitle(PWideChar(b.HistoryEntry[j].Title));
        newEntry.SetTitle(title);
        newSHI.AddEntry(newEntry,true);
      end;
      brwsr.WebNavigation.GotoIndex(sh.Index);
    end;

    //brwsr.Blur2;
    //RestoreFocus(GetCurrentBrowser);
  end;
end;

procedure TBagelMainForm.DelayedSearchButtonCreatorTimer(Sender: TObject);
  function innerWidth(TB:TToolbar):Integer;
  var i:Integer;
  begin
    Result:=0;
    for i:=0 to TB.ControlCount-1 do
    begin
      Result:=Result+TB.Controls[i].Width;
    end;
  end;

var
  i:Integer;
  buf:String;
  ch:String;
  wordButton:TToolButton;
  SrcText:WideString;
  list:TList;
begin
  DelayedSearchButtonCreator.Enabled:=false;
  SrcText:=WideString(SearchBox.Text);

        {wordButton := TToolButton.Create(SearchBar);
        wordButton.Caption := 'numa';
        wordButton.ImageIndex := 5;
        wordButton.Enabled := true;
        wordButton.ForceShowCaption:=true;
        wordButton.Tag:=1;
        wordButton.AutoSize:=True;
        wordButton.OnClick:=WordFindButtonClick;
        wordButton.Left := innerWidth(SearchBar);
        wordButton.Parent := SearchBar;
        wordButton.Visible:=true;}

  //ワードサーチボタン

  list:=TList.Create;
  buf:='';
  try
    for i:=SearchBar.ControlCount-1 downto 0 do   //
    begin
      if  (SearchBar.Controls[i] is TToolButton) and (SearchBar.Controls[i].Tag=1) then list.Add(SearchBar.Controls[i]);
    end;

    for i:=1 to Length(SrcText) do
    begin
      ch:=SrcText[i];
      if (ch=' ') or (ch='　') then
      begin
        if list.count>0 then begin
          wordButton := TToolButton(list.Items[0]);
          list.Delete(0);
          wordButton.Caption := buf;
        end else begin
          wordButton := TToolButton.Create(SearchBar);
          wordButton.Caption := buf;
          wordButton.ImageIndex := 5;
          wordButton.Enabled := true;
          wordButton.Style:=tbsTextButton;
          wordButton.Tag:=1;
          wordButton.AutoSize:=True;
          wordButton.OnClick := WordFindButtonClick;
          wordButton.Left := innerWidth(SearchBar);
          wordButton.Parent := SearchBar;
          wordButton.Visible:=true;
        end;
        buf:='';
      end
      else
      begin
        buf:=buf+ch;
        continue;
      end;
    end;
    if buf<>'' then begin
      if list.count>0 then begin
        wordButton := TToolButton(list.Items[0]);
        list.Delete(0);
        wordButton.Caption := buf;
      end else begin
        wordButton := TToolButton.Create(SearchBar);
        wordButton.Caption := buf;
        wordButton.ImageIndex := 5;
        wordButton.Enabled := true;
        wordButton.Style := tbsTextButton;
        wordButton.Tag:=1;
        wordButton.AutoSize:=True;
        wordButton.OnClick:=WordFindButtonClick;
        wordButton.Left := innerWidth(SearchBar);
        wordButton.Parent := SearchBar;
        wordButton.Visible:=true;
      end;
    end;

    while list.Count>0 do begin
      wordButton := TToolButton(list.Items[0]);
      list.Delete(0);
      wordBUtton.Free;
    end;
  
  finally
    list.Free;
  end;
end;

procedure TBagelMainForm.WordFindButtonClick(Sender: TObject);
var
  wbf:nsIWebBrowserFind;
  ir:nsIInterfaceRequestor;
begin
  if GetCurrentBrowser<>nil then
  begin

    GetCurrentBrowser.DocShell.QueryInterface(ns_IInterfaceRequestor_iid,ir);
    ir.GetInterface(ns_IWebBrowserFind_iid,wbf);
    wbf.SetSearchString(PWideChar(WideString(TSpeedButton(Sender).Caption)));
    PrevSearchType:=0;
    PrevNormalSearchStr:=TSpeedButton(Sender).Caption;
    wbf.SetFindBackwards(false);
    //ret :=
    wbf.FindNext;
    if Pref.ScrollToCenterOnFind then
    FindScrollToCenter(GetCurrentBrowser.ContentWindow);

  end;
end;

procedure TBagelMainForm.ClearWordSearchButtons;
var
  i:Integer;
begin
  for i:=SearchBar.ControlCount-1 downto 0 do
  begin
    if  (SearchBar.Controls[i] is TToolButton) and (SearchBar.Controls[i].Tag=1) then
      SearchBar.Controls[i].Free;
  end;
end;

procedure TBagelMainForm.DelayedSidebarTogglerTimer(Sender: TObject);
begin
  if actToggleSidebarVisible.Checked then begin
    if not (GetMouseInPane(SideBasePanel) or GetMouseInPane(SidebarTogglepanel)) then //サイドバー領域外
      actToggleSidebarVisible.Execute;
{
MouseInPane(SidebarTogglepanel) then //サイドバー開閉バーの上
    begin
      if Pref.SidebarAutoHide and (not actToggleSidebarVisible.Checked) then
      begin
        if Pref.SidebarAutoOpenDelay=0 then
          actToggleSidebarVisible.Execute
        else DelayedSidebarToggler.Enabled:=true;
      end;
    end
    else if MouseInPane(SideBasePanel) then //サイドバー領域内
}
  end
  else begin
    if GetMouseInPane(SidebarTogglepanel) then actToggleSidebarVisible.Execute;
  end;
  DelayedSidebarToggler.Enabled:=false;
end;

procedure TBagelMainForm.DeleteMemoClick(Sender: TObject);
var
  memo:TBagelMemo;
  i:Integer;
  tmpStr:String;
begin
  if (memoBarCtxTarget>=0) and (memoBarCtxTarget<TabControl2.Tabs.Count) then begin
    memo:=TBagelMemo(TabControl2.Tabs.Objects[memoBarCtxTarget]);
    DeleteFile(memo.Path);
    TabControl2.Tabs.Delete(memobarCtxtarget);
    memo.Free;
    if TabControl2.TabIndex=-1 then begin
      if memobarCtxtarget<TabControl2.Tabs.Count then
      TabControl2.TabIndex:=memobarCtxtarget
      else TabControl2.TabIndex:=TabControl2.Tabs.Count-1;
      TabControl2Change(nil);
    end;

    //TODO:復活
    //pnlDropTarget.TargetList:=nil;
    InternalTargetList.Clear;
    InternalTargetList.Assign(Pref.DropTargetList);
    if TabControl2.Tabs.Count>0 then
      for i:=0 to TabControl2.Tabs.Count-1 do begin
        memo:=TBagelMemo(TabControl2.Tabs.Objects[i]);
        tmpStr:=ExtractFileName(memo.Path);
        InternalTargetList.Add('text'+#9+'memo'+#9+memo.Title+#9+tmpStr);
      end;

    //TODO:復活
    //pnlDropTarget.TargetList:=InternalTargetList;
  end;
end;

procedure TBagelMainForm.DeleteMemoItemClick(Sender: TObject);
var
  mitem:TBagelMemoItem;
  memo:TBagelMemo;
  litem:TListItem;
begin
  litem:=lvMemo.Selected;
  if litem=nil then exit;
  mitem:=TBagelMemoItem(litem.Data);
  memo:=TBagelmemo(TabControl2.Tabs.Objects[TabControl2.TabIndex]);
  memo.Remove(mitem);
  mitem.Free;
  litem.Free;
end;


procedure TBagelMainForm.DenyAllCookieClick(Sender: TObject);
begin

end;

{ブラウザにイベントハンドラをつける}
procedure TBagelMainForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  case Msg.message of
  {  WM_EXITMENULOOP:begin
    ToolButton16.Down:=False;
  end;}
  //▼タブ上ホイール回転でタブ切り替え
  WM_MOUSEWHEEL: begin
   {if FAutoComplete.Visible and ComboBox1.Focused then begin
     Handled:=true;
     if msg.wParam<0 then begin
     //下にスクロール
       FAutoComplete.Scroll(true);
     end
     else begin
     //上にスクロール
       FAutoComplete.Scroll(false);
     end;
   end
   else }if GetMouseInPane(TabControl) and Pref.EnableWheelTabChange then
   begin
     if Msg.wParam < 0 then
     begin
       actNextTab.Execute;
       Handled:=true;
     end
     else
     begin
       actPrevTab.Execute;
       Handled:=true;
     end;
   end
   //Grep検索
   else if (PageControl1.ActivePage=GrepSheet) and GetMouseInPane(GrepList) then
   begin
     if Msg.wParam < 0 then
     begin
       if GrepList.ItemIndex <> GrepList.Items.Count-1 then
       GrepList.ItemIndex := GrepList.ItemIndex + 1;
       GrepListClick(nil);
       Handled:=true;
     end
     else
     begin
       if GrepList.ItemIndex <> -1 then
       GrepList.ItemIndex := GrepList.ItemIndex - 1;
       GrepListClick(nil);
       Handled:=true;
     end;
   end
   else OnGestureMessage(Msg, Handled);
  end
  else
    OnGestureMessage(Msg, Handled);
  end;
  //▼マウスジェスチャー
  //if mouseGestureEnable then


  //ポップアップメニュー抑止
  if restrainContext and (Msg.message = WM_RBUTTONUP) then
  begin
    Handled := True;
    restrainContext := False;
  end;
end;

procedure TBagelMainForm.ApplyEvtHandlersToBrowser(brwsr:TBagelBrowser);
begin
  brwsr.OnNewWindow  := Self.BrowserNewWindow;
  brwsr.OnStatusChange := Self.BrowserStatusTextChange;
  {
  brwsr.OnStateFlagsChange:=self.GeckoBrowser1StateFlagsChange;
  }
  brwsr.OnContextMenu      := Self.BrowserContextMenu;
  brwsr.OnDOMClick         := Self.BrowserDOMClick;
  brwsr.OnTitleChange      := Self.BrowserTitleChange;
  brwsr.OnLocationChange   := Self.BrowserLocationChange;
  brwsr.OnProgressChange   := Self.BrowserProgressChange;
  brwsr.OnDOMMouseScroll   := Self.BrowserDOMMouseScroll;
  brwsr.OnDownloadComplete := Self.BrowserDownloadComplete;
  brwsr.OnGoBack           := Self.BrowserGoBack;
  brwsr.OnGoForward        := Self.BrowserGoForward;
  brwsr.OnGoToIndex        := Self.BrowserGoToIndex;
  brwsr.OnDOMKeyPress      := Self.BrowserDOMKeyPress;
  brwsr.OnDOMLinkAdded     := Self.BrowserDOMLinkAdded;
  brwsr.OnDOMDragOver      := Self.BrowserDOMDragOver;
  brwsr.OnDOMDragGesture   := Self.BrowserDOMDragGesture;
  brwsr.OnDOMDragDrop      := Self.BrowserDOMDragDrop;
  brwsr.OnDOMDragExit      := Self.BrowserDOMDragExit;
  brwsr.OnDOMFocus         := Self.BrowserDOMFocus;
  {
  brwsr.OnGeckoMouseMove:=self.GeckoBrowser1OnGeckoMouseMove;
  brwsr.OnGeckoMouseDown:=self.GeckoBrowser1OnGeckoMouseDown;
  brwsr.OnGeckoMouseScroll := self.GeckoBrowser1OnGeckoMouseScroll;
  brwsr.OnGeckoLinkAdded := Self.GeckoBrowser1OnGeckoLinkAdded;
  brwsr.OnGeckoFocus := Self.GeckoBrowser1OnGeckoFocus;
  brwsr.OnURIOpen := Self.GeckoBrowser1OnURIOpen;
  brwsr.OnCloseQuery := Self.GeckoBrowser1OnCloseQuery;
  }
end;
{ブラウザのコンテキストメニュー}
procedure TBagelMainForm.BrowserContextMenu(Sender: TObject; aInfo: TCtxMenuInfo);
var
  scrX:integer;
  scrY:integer;
  Event:nsIDOMMouseEvent;
  elm:nsIDOMElement;
  //clipCmd:nsIClipboardCommands;
begin
  if restrainContext then
  begin
   restrainContext:=false;
   exit;
  end;
  restrainContext:=false;

  Event := (aInfo.MouseEvent as nsIDOMMouseEvent);
  scrX := Event.ScreenX;
  scrY := Event.ScreenY;
  if Supports(Event.Target, nsIDOMElement, elm) then begin
    currentCtxTargetNode := elm;
  end;
  currentCtxURI:=aInfo.AssociatedLink;
  currentCtxImg:=aInfo.ImageURL;
  currentCtxBGImg:=aInfo.BGImageURL;
  currentCtxTextBox:=(cmfInput in aInfo.Flags) or (cmfText in aInfo.Flags);
//  NS_GetInterface(TBagelBrowser(Sender).WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
//  clipCmd.CanCopySelection(cancopy);
  //currentCtxSel:=cancopy;
  //currentCtxWindow:=TBagelBrowser(Sender).ContentWindow <> win;
  currentCtxQuote:= IsNodeInsideQuote(currentCtxTargetNode) <> nil;

(*
    * global   1
    * document 2
    * frame    4
    * link     8
    * image    16
    * bgimg     32
    * selection 64
    * input     128
    * textarea  256
    * table     512
    * quote    1024
    * mail     2048
*)

  if (cmfInput in aInfo.Flags) or (cmfText in aInfo.Flags) then begin
    GeckoInputPopup.Popup(scrX,scrY);
  end
  else begin
    GeckoPopup.ShowFlags := 0;
    if currentCtxURI<>'' then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+1;
    if currentCtxImg<>'' then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+2;
    if currentCtxBgImg<>'' then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+4;
    if currentCtxSel then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+8;
    if currentCtxWindow then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+16;
    if currentCtxTextBox then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+32;
    if currentCtxQuote then GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+64;
    GeckoPopup.ShowFlags:=GeckoPopup.ShowFlags+128;
    GeckoPopup.Popup(scrX,scrY);
  end;
end;
{ブラウザから新しいWindowを要求された}
procedure TBagelMainForm.BrowserNewWindow(Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser);
var
  brwsr:TBagelBrowser;
  i:integer;
//  item:nsIDocShellTreeItem;
//  owner:nsIDocShellTreeOwner;
begin
  if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;

//  if (aChromeFlags and NS_IWEBBROWSERCHROME_CHROME_WINDOW_POPUP)<>0 then LogProc('Popup');

  brwsr:=TBagelBrowser.Create(Self);
//  TabControl1.Tabs.AddObject('',TObject(brwsr));
  TabControl.Tabs.InsertObject(GetNewtabPos(Pref.OpenModePopup),'',TObject(brwsr));
  TabZOrder.Insert(GetMDITabPos(Pref.OpenModePopup),TObject(brwsr));

  brwsr.Align := alClient;
  brwsr.Visible := false;
//  brwsr.Enabled:=false;
  brwsr.Parent:=self.viewpanel;
  ApplyEvtHandlersToBrowser(brwsr);
//  brwsr.Preferred := true;
  brwsr.TabStop:=true;
//      brwsr.DoubleBuffered:=true;
  if (Pref.OpenModePopup and 2) <> 0 then
  begin
    brwsr.SendToBack;
  end
  else
  begin
    i := TabControl.Tabs.IndexOfObject(TObject(brwsr));
    TabControl.TabIndex:=i;
    tabBarCtxTarget:=i;
//    brwsr.Enabled:=true;
    //brwsr.ShouldFocus:=true;
  end;
  brwsr.Visible := true;
  brwsr.LoadURI('about:blank');
  if brwsr.DocShell<>nil then
    brwsr.DocShell.UseErrorPages := True;

  if Pref.InheritDocShell and (brwsr.DocShell<>nil) then begin
    brwsr.DocShell.AllowPlugins:=TBagelBrowser(Sender).DocShell.AllowPlugins;
    brwsr.DocShell.AllowJavascript:=TBagelBrowser(Sender).DocShell.AllowJavascript;
    brwsr.DocShell.AllowMetaRedirects:=TBagelBrowser(Sender).DocShell.AllowMetaRedirects;
    brwsr.DocShell.AllowSubframes:=TBagelBrowser(Sender).DocShell.AllowSubframes;
    brwsr.DocShell.AllowImages:=TBagelBrowser(Sender).DocShell.AllowImages;
  end;

  if Pref.inheritAutoHighlight then begin
    brwsr.AutoHighlight:=TBagelBrowser(Sender).AutoHighlight;
  end;

  newWindow:=brwsr;

end;
{ブラウザがクリックされた}
procedure TBagelMainForm.BrowserDOMClick(Sender: TObject; aEvent:nsIDOMMouseEvent);
var
  targetNode:nsIDOMNode;
  docshell:Integer;
  uri:String;
  b:TBagelBrowser;
  input: nsIDOMHTMLInputElement;
  t:nsIDOMHTMLTextAreaElement;
  button:nsIDOMHTMLButtonElement;
  s:nsIDOMHTMLSelectElement;
begin
  targetNode:=aEvent.Target as nsIDOMNode;
  if (aEvent.Button = 1) then
  begin
    uri:=GetLink(targetNode);
    //新しいタブで開くか？
    if (uri<>'') and (Pos('javascript:',uri)<>1) then begin
      if Pref.InheritDocShell then
        docshell := GetDocShellSettingForB(TBagelBrowser(Sender))
      else
        docshell := Pref.DocShellDefault;
      b:=AddTab(uri,
                Pref.OpenModeMiddleClick,
                0,
                TGeckoBrowser(Sender).URI,
                docshell
             );
      b.AutoHighlight:=TBagelBrowser(Sender).AutoHighlight;
    end
    else if not(
     Supports(targetNode,nsIDOMHTMLInputElement,input) or
     Supports(targetNode,nsIDOMHTMLTextAreaElement,t) or
     Supports(targetNode,nsIDOMHTMLButtonElement,button) or
     Supports(targetNode,nsIDOMHTMLSelectElement,s)
     ) then
    begin
      //オートスクロールする
      actStartAutoScroll.Execute;
    end;
  end;
end;

procedure TBagelMainForm.BrowserDOMKeyPress(Sender: TObject; aEvent:nsIDOMKeyEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMLinkAdded(Sender: TObject; aEvent:nsIDOMEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMDragOver(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMDragGesture(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMDragDrop(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMDragExit(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  //
end;

procedure TBagelMainForm.BrowserDOMFocus(Sender: TObject; aEvent:nsIDOMEvent);
begin
  //
end;

{ステータスバーのテキストが変わった}
procedure TBagelMainForm.BrowserStatusTextChange(Sender: TObject; aMessage: WideString);
begin
  if TabControl.Tabs.IndexOfObject(TObject(Sender))<>TabControl.TabIndex then Exit;
  if StatusBar.Visible then
    StatusBar.Panels[0].Text:=aMessage
  else begin
    if Length(String(aMessage))=0 then begin
      if TabControl.Tabs.Count>1 then begin
        Self.Caption:=GetCurrentBrowser.Title + IfThen(Pref.ShowAppNameInTitle, ' - Bagel');
        Application.Title:=self.Caption;
      end
      else begin
        Self.Caption := 'Bagel';
        Application.Title := self.Caption;
      end;
    end
    else begin
      Self.Caption:=aMessage + IfThen(Pref.ShowAppNameInTitle,' - Bagel');
      Application.Title:=self.Caption;
    end;
  end;
end;
{ブラウザの読み込み状況が変わった}
procedure TBagelMainForm.BrowserProgressChange(Sender: TObject; Progress: Integer; ProgressMax: Integer);
var
	percentage:Integer;
begin
  percentage := (Progress * 100) div ProgressMax;
  //Index := TabControl.Tabs.IndexOfObject(Sender);
  TBagelBrowser(Sender).Progress := percentage;
  TabControl.Refresh;
  if TGeckoBrowser(Sender)<>GetCurrentBrowser then begin
    //TabControl.OnDrawTab(TabControl,Index,TabControl.TabRect(Index),false);
  end
  else begin
    //TabControl.OnDrawTab(TabControl,Index,TabControl.TabRect(Index),true);
    ProgressBar.Visible:=true;
    ProgressBar.Position:=percentage;
  end;
end;
{マウスがスクロールした}
procedure TBagelMainForm.BrowserDOMMouseScroll(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  if aEvent.CtrlKey then
  begin
    if aEvent.Detail>0 then
    begin
      actZoomIn.Execute;
    end
    else
    begin
      actZoomOut.Execute;
    end;
    aEvent.StopPropagation;
    aEvent.PreventDefault;
  end;
end;
{マウスが押された}
procedure TBagelMainForm.BrowserDOMMouseDown(Sender: TObject; aEvent:nsIDOMMouseEvent);
begin
  //TODO:
  //CancelMigemo;
end;
{ブラウザのタイトルが変わった}
procedure TBagelMainForm.BrowserTitleChange(Sender: TObject; const Text: WideString);
  function CutRight(Max: Integer; Str: WideString):String;
  begin
    Result:=Str;
    If Length(Str)>Max then
    begin
      Result:=Copy(Str,1,Max)+'...';
    end;
  end;
var
  i:integer;
  tmpTitle:WideString;
begin
  i := TabControl.Tabs.IndexOfObject(TObject(Sender));
  if Pref.EnableDenyTitle and
      (not TGeckoBrowser(Sender).CanGoBack) and
      (not TGeckoBrowser(Sender).CanGoForward) and
      IsDenyTitle(String(Text)) then
  begin
    CloseTab(i);
    exit;
  end;
  tmpTitle:=Text;
  if tmpTitle = '' then tmpTitle:=TGeckoBrowser(Sender).URI;

  if i<>-1 then TabControl.Tabs.Strings[i]:=CutRight(Pref.TabMaxStrCount,tmpTitle);
  if i=TabControl.TabIndex then
    Self.Caption:=tmpTitle + IfThen(Pref.ShowAppNameInTitle, ' - Bagel');
    Application.Title:=Self.Caption;
end;
procedure TBagelMainForm.btnPageSetupClick(Sender: TObject);
begin
  actShowPageSetupExecute(Self);
  DoPrintPreview;
end;

procedure TBagelMainForm.btnPPCloseClick(Sender: TObject);
begin
  ExitPrintPreview;
  RestorePrePPState;
end;

{ブラウザのURIが変わった}
procedure TBagelMainForm.BrowserLocationChange(Sender: TObject; const uri: AnsiString);
begin
  Pref.RecentOpenedURL.Insert(0,uri);
  while Pref.RecentOpenedURL.Count>Pref.RecentOpenedMaxCount do
    Pref.RecentOpenedURL.Delete(Pref.RecentOpenedMaxCount);

  if TabControl.Tabs.IndexOfObject(TObject(Sender))=TabControl.TabIndex then begin
    LocationBox.Text:=uri;
    //restrainContext:=false;
    actGoBack.Enabled := TGeckoBrowser(Sender).CanGoBack;
    actRewind.Enabled := actGoBack.Enabled;
    actGoForward.Enabled := TGeckoBrowser(Sender).CanGoForward;
    actFastForward.Enabled := actGoForward.Enabled;
  end
  else begin
    TBagelBrowser(Sender).IsRead:=False;
  end;

end;
procedure TBagelMainForm.WebPanelNewWindow(Sender: TObject; aChromeFlags: Longword; var newWindow: TCustomGeckoBrowser);
//var
//  brwsr:TBagelBrowser;
//  i:integer;
begin
  if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;
//  brwsr:=TBagelBrowser.Create(Self);
  {TabControl.Tabs.InsertObject(GetNewtabPos(0),'',TObject(brwsr));
  TabZOrder.Insert(GetMDITabPos(0),TObject(brwsr));
  brwsr.Align := alClient;
  brwsr.Parent:= Self.viewpanel;
  ApplyEvtHandlersToBrowser(brwsr);
  //brwsr.Preferred := true;
  //brwsr.ShouldFocus:=true;
  brwsr.TabStop:=true;

  //RestoreFocus(brwsr);

  i := TabControl.Tabs.IndexOfObject(TObject(brwsr));
  SelectTab(i);}
                     {
  (WebPanel1.DocShell as nsIDocShellTreeItem).GetTreeOwner(owner);
  item:=(brwsr.docshell as nsIDocShellTreeItem);
  owner.ContentShellAdded(item,true,PWideChar(WideString('_content')));
                      }
  newWindow:=AddTab('about:blank');
end;
procedure TBagelMainForm.WebPanelDOMClick(Sender: TObject; event: nsIDOMMouseEvent);
var
  {str:IInterfacedString;
  astr:nsAString;}
  curUri:nsIURI;
  clickedUri:nsIURI;
  cstr:IInterfacedCString;
  cstr2:IInterfacedCString;
begin
  cstr:=NewCString('');
  cstr2:=NewCString('');

  if (event.Button<>2) then
  begin
    if GetLink(event.Target as nsIDOMNode)='' then exit; {
    NS_NewURI(curUri,WebPanel.URI);
    NS_NewURI(clickedUri,getLink(tgt));
    curUri.GetHost(acstr);
    clickedUri.GetHost(acstr2);
    if (cstr.ToString <> cstr2.ToString) or IsTargetNew(tgt) then
    begin                        }
      AddTab(GetLink(event.Target as nsIDOMNode),Pref.OpenModeMiddleClick,0,WebPanel.URI,Pref.DocShellDefault);
      event.PreventDefault;
      event.StopPropagation ;
//    end;
  end;

end;

procedure TBagelMainForm.BrowserDocumentBegin(Sender: TObject; const aURI: String);
var
  str,str2:IInterfacedString;
begin
  if not Pref.ConsiderTarget then begin
    str:=NewString;
    TGeckoBrowser(Sender).ContentWindow.GetName(str.AString);
    if str.Length<>0 then begin
      str2:=NewString;
      TGeckoBrowser(Sender).ContentWindow.SetName(str2.AString);
    end;
    //TODO:
    {while OpenSearchPopup.Items.Count>0 do begin
      OpenSearchPopup.Items.Items[0].Free;
    end;
    ToolButton6.DropdownMenu:=nil;
    ToolButton6.ImageIndex:=5;}
  end;
end;

procedure TBagelMainForm.BrowserDownloadComplete(Sender: TObject; const aURI: String);
var
  regex:TSkRegExp;
  filteredSearchWord:String;
  searchWords:TStrArray;
  i, cnt:Integer;
  obj:TObject;
  //uri:String;
begin
  cnt := 0;
  TBagelBrowser(Sender).Progress:=0;
  if TGeckoBrowser(Sender)=GetCurrentBrowser then
  begin
    ProgressBar.Position:=0;
    ProgressBar.Visible:=False;
    StatusBar.Panels[0].Text:='完了';
  {end
  else begin}
  end;
  TabControl.Refresh;

  if TBagelBrowser(Sender).AutoHighlight then begin
    filteredSearchWord := StringReplace(SearchBox.Text,'　',' ',[rfReplaceAll]);
    searchWords := btSplitToArray(filteredSearchWord,' ');
    for i:=0 to High(searchWords) do begin
      HilightBrowser(TBagelBrowser(Sender),
                     Pref.GetHighLightStyle(cnt mod Pref.HighLightPref.Count),
                     searchWords[i],
                     true);
      Inc(cnt);
    end;
  end;

  //UserScript
  regex:=TSkRegExp.Create;
  try
  for i:=0 to FAutoExec.Count-1 do begin
  case FAutoExec.Items[i].MatchType of
    0:begin //部分一致
      if Pos(FAutoExec.Items[i].Pattern,aURI)>0 then begin
        obj:=FindAction(FAutoExec.Items[i].Commands);
        if obj is TScriptAction then
        begin
          TScriptAction(obj).Parameters:=IntToStr(TBagelBrowser(Sender).Id);
          TScriptAction(obj).Execute;
        end;
      end;
    end;
    1:begin //完全一致
      if FAutoExec.Items[i].Pattern=aURI then begin
        obj:=FindAction(FAutoExec.Items[i].Commands);
        if obj is TScriptAction then
        begin
          TScriptAction(obj).Parameters:=IntToStr(TBagelBrowser(Sender).Id);
          TScriptAction(obj).Execute;
        end;
      end;
    end;
    2:begin //前方一致
      if Pos(FAutoExec.Items[i].Pattern,aURI)=1 then begin
        obj:=FindAction(FAutoExec.Items[i].Commands);
        if obj is TScriptAction then
        begin
          TScriptAction(obj).Parameters:=IntToStr(TBagelBrowser(Sender).Id);
          TScriptAction(obj).Execute;
        end;
      end;
    end;
    3:begin //後方一致
      if Pos(FAutoExec.Items[i].Pattern,aURI)=Length(aURI) - Length(FAutoExec.Items[i].Pattern)+1 then begin
        obj:=FindAction(FAutoExec.Items[i].Commands);
        if obj is TScriptAction then
        begin
          TScriptAction(obj).Parameters:=IntToStr(TBagelBrowser(Sender).Id);
          TScriptAction(obj).Execute;
        end;
      end;
    end;
    4:begin //正規表現
      regex.Expression:=FAutoExec.Items[i].Pattern;
      if regex.Exec(aURI) then begin
        obj:=FindAction(FAutoExec.Items[i].Commands);
        if obj is TScriptAction then
        begin
          TScriptAction(obj).Parameters:=IntToStr(TBagelBrowser(Sender).Id);
          TScriptAction(obj).Execute;
        end;
      end;
    end;
  end;
  end;
  finally
    regex.Free;
  end;
end;

procedure TBagelMainForm.BrowserGoBack(Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
begin
  if (Sender is TBagelBrowser) and TBagelBrowser(Sender).Locked then begin
    Handled:=true;
    aContinue:=False;
    Addtab(uritostr(aURI),Pref.OpenModePopup,0,'',GetDocShellSettingForB(TBagelBrowser(Sender)));
  end;
end;

procedure TBagelMainForm.BrowserGoForward(Sender: TObject; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
begin
  if (Sender is TBagelBrowser) and TBagelBrowser(Sender).Locked then begin
    Handled:=true;
    aContinue:=False;
    Addtab(uritostr(aURI),Pref.OpenModePopup,0,'',GetDocShellSettingForB(TBagelBrowser(Sender)));
  end;
end;

procedure TBagelMainForm.BrowserGoToIndex(Sender: TObject; aIndex: Longint; aURI: nsIURI; out aContinue: LongBool; var Handled: Boolean);
begin
  if (Sender is TBagelBrowser) and TBagelBrowser(Sender).Locked then begin
    Handled:=true;
    aContinue:=False;
    Addtab(uritostr(aURI),Pref.OpenModePopup,0,'',GetDocShellSettingForB(TBagelBrowser(Sender)));
  end;
end;
{フォームの作成}
procedure TBagelMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  memo:TBagelMemo;
  i:Integer;
  inifile:TIniFile;
begin
  //Bagel設定保存
  if Ord(Self.WindowState)=0 then
  begin
    Pref.WndTop:=Self.Top;
    Pref.WndLeft:=Self.Left;
    Pref.WndWidth:=Self.Width;
    Pref.WndHeight:=Self.Height;
  end;
  Pref.WndState:=Ord(Self.WindowState);

  if Pref.StartuptabBehavior=3 then SaveSnapshot(GetSettingDir()+'Default.bbg');
  SaveBookmarks(true);
  //panellist.SaveToFile(GetSettingDir() + 'panels.dat');

  if Pref.DelCookie then actClearCookie.Execute;
  if Pref.DelHistory then actClearHistory.Execute;
  if Pref.DelCache then actClearCache.Execute;

  Pref.Sidebar:=PageControl1.ActivePageIndex;
  Pref.StatusbarVisible:=StatusBar.Visible;
  Pref.SearchBoxWidth:=SearchBox.Width;
  Pref.MainBarCaption := MainCoolbar.Bands.FindBand(ControlToolbar).Text;
  Pref.AddressBarCaption := MainCoolbar.Bands.FindBand(LocationBar).Text;
  Pref.SearchBarCaption := MainCoolbar.Bands.FindBand(SearchBar).Text;
  Pref.LinkBarCaption := MainCoolbar.Bands.FindBand(Linkbar).Text;
  Pref.TabBarCaption := MainCoolbar.Bands.FindBand(TabControl).Text;
  Pref.TabMiddleClickAct := Pref.TabMiddleClickAct;
  Pref.RememberedEngineIndex:=EngineBox.ItemIndex;

  //Memo
  for i:=0 to TabControl2.Tabs.Count-1 do begin
    memo:=TBagelMemo(TabControl2.Tabs.Objects[i]);
    memo.SaveToFile(memo.Path);
    memo.Free;
  end;

  //Coolbar
  inifile := TIniFile.Create(GetSettingDir + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini')));
  try
    for i := 0 to MainCoolbar.Bands.Count - 1 do
    begin
      iniFile.WriteInteger('TOOLBAR', 'Band' + IntToStr(i) + 'ID', MainCoolbar.Bands[i].id);
      iniFile.WriteInteger('TOOLBAR', 'Band' + IntToStr(i) + 'Width', MainCoolbar.Bands[i].Width);
      iniFile.WriteBool('TOOLBAR', 'Band' + IntToStr(i) + 'Break', MainCoolbar.Bands[i].Break);
      iniFile.WriteBool('TOOLBAR', 'Band' + IntToStr(i) + 'Visible', MainCoolbar.Bands[i].Visible);
    end;
  finally
    IniFile.Free;
  end;

end;

procedure TBagelMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  M:String;
begin
  if FNowPrintPreviewing then begin
    CanClose:=false;
    btnPPClose.Click;
  end
  else if Pref.OnAppQuit=true then
  begin
    M := '終了してもよろしいですか？';
    CanClose := MessageDlg(M, mtConfirmation,[mbYes, mbNo], 0) = mrYes;
  end;
end;

procedure LoadIcon;
begin
//
end;

procedure TBagelMainForm.FormCreate(Sender: TObject);

  procedure LoadDataSources;
  begin
  //
  end;

  procedure CreateToolbarItems;
  begin

    TabMenu := TBagelActionContainer.Create(Self);
    TabMenu.Name := 'TabMenu';
    TabMenu.Caption := 'タブ(&T)';

    if FileExists(GetSettingDir+'tabmenu.dat') then
      TabMenu.LoadFromFile(GetSettingDir+'tabmenu.dat')
    else if FileExists(GetDefaultsDir+'tabmenu.dat') then
      TabMenu.LoadFromFile(GetDefaultsDir+'tabmenu.dat');

    TabPopup.Container := TabMenu;

    ContextMenu := TBagelActionContainer.Create(Self);
    ContextMenu.ShowFlags := 0;
    if FileExists(GetSettingDir+'ctxmenu.dat') then
      ContextMenu.LoadFromFile(GetSettingDir+'ctxmenu.dat')
    else if FileExists(GetDefaultsDir+'ctxmenu.dat') then
      ContextMenu.LoadFromFile(GetDefaultsDir+'ctxmenu.dat');
    ContextMenu.Name :='ContextMenu';
    GeckoPopup.Container := ContextMenu;

    CtrlTbActionContainer := TBagelActionContainer.Create(Self);
    if FileExists(GetSettingDir+'maintoolbar.dat') then
      CtrlTbActionContainer.LoadFromFile(GetSettingDir+'maintoolbar.dat')
    else if FileExists(GetDefaultsDir+'maintoolbar.dat') then
      CtrlTbActionContainer.LoadFromFile(GetDefaultsDir+'maintoolbar.dat');

    TestActionContainer2 := TBagelActionContainer.Create(Self);
    if FileExists(GetSettingDir+'mainmenu.dat') then
      TestActionContainer2.LoadFromFile(GetSettingDir+'mainmenu.dat')
    else if FileExists(GetDefaultsDir+'mainmenu.dat') then
      TestActionContainer2.LoadFromFile(GetDefaultsDir+'mainmenu.dat');

    TestActionContainer3 := TBagelActionContainer.Create(Self);
    TestActionContainer3.LoadFromFile(GetSettingDir+'statusbar.dat');

    ControlToolbar.IsMenu:=False;
    ControlToolbar.Container := CtrlTbActionContainer;

    MenuToolbar.IsMenu:=True;
    MenuToolbar.Container := TestActionContainer2;

  end;
  procedure CreateControls;
  var
    i:Integer;
//    hi:THotkeyItem;
    tmpItem:TBagelActionContainer;
  begin

    GeckoPopup := TBagelPopupMenu.Create(Self);
    GeckoPopup.Name := 'GeckoPopup';

    TabPopup := TBagelPopupMenu.Create(Self);
    TabPopup.Name := 'TabPopup';

    MainCoolbar := TBagelCoolbar.Create(Self);
    MainCoolbar.Parent := Self;
    MainCoolbar.Align := alTop;
    MainCoolbar.AutoSize := True;
    //MenuToolBar生成
    MenuToolbar := TBagelToolBar.Create(Self);
    MenuToolbar.Parent := MainCoolbar;
    //MainCoolbar.Bands[0].Control := MenuToolbar;
    MainCoolbar.Bands[0].UseChevron := True;
    //MenuToolbar.Images := ImageList1;
    MenuToolbar.Visible := True;
    MenuToolbar.ShowHint := False;
    //MenuToolbar.AllowTextButtons := True;
    MenuToolbar.Wrapable := False;
    MenuToolbar.Images := nil;
    //MenuToolbar.List := True;
    MenuToolbar.Flat := True;
    MenuToolbar.ShowCaptions := True;
    MenuToolbar.AutoSize := True;
    MenuToolbar.OnResize := Self.MenuToolbarResize;

    SearchBar.Parent := MainCoolbar;
    //MainCoolbar.Bands[1].Control := Searchbar;

    //ControlToolBar生成
    ControlToolbar := TBagelToolBar.Create(Self);
    ControlToolbar.Parent := MainCoolbar;
    //MainCoolbar.Bands[2].Control := ControlToolbar;
    MainCoolbar.Bands[2].UseChevron := True;
    ControlToolbar.Images := ImageList1;
    ControlToolbar.Visible := True;
    ControlToolbar.ShowHint := True;
    ControlToolbar.AllowTextButtons := True;
    ControlToolbar.Wrapable := False;
    ControlToolbar.AutoSize := True;
    ControlToolbar.OnResize := ControlToolbarResize;

    LocationBar.Parent := MainCoolbar;
    //MainCoolbar.Bands[3].Control := LocationBar;

    //Linkbar生成
    Linkbar := TBagelLinkbar.Create(MainCoolbar);
    Linkbar.Parent := MainCoolbar;
    //MainCoolbar.Bands[4].Control := Linkbar;
    MainCoolbar.Bands[4].UseChevron := True;
    Linkbar.Visible := True;
    Linkbar.AutoSize := True;
    Linkbar.Images := Self.ImageList1;
    Linkbar.Wrapable := False;
    Linkbar.OnResize := LinkbarResize;

    //TabControl生成
    TabControl := TTabbedToolbar.Create(MainCoolbar);
    TabControl.Parent := MainCoolbar;
    //MainCoolbar.Bands[5].Control := TabControl;
    TabControl.Visible := True;
    TabControl.DoubleBuffered:=true;
    TabControl.OnChange    := Self.TabControlChange;
    TabControl.OnDrawTab   := Self.TabControlDrawTab;
    TabControl.OnMouseMove := Self.TabControlMouseMove;
    TabControl.OnDragOver  := Self.TabControlDragOver;
    TabControl.OnDblClick  := Self.TabControlDblClick;
    TabControl.OnMouseDown   := Self.TabControlMouseDown;
    TabControl.OnMouseUp   :=Self.TabControlMouseUp;
    TabControl.OnDragDrop  :=Self.TabControlDragDrop;
//    TabControl.OnContextPopup :=
    TabControl.PopupMenu   := Self.TabPopup;

    //Profile
    SimpleProfile := TGeckoSimpleProfile.Create(Self);
    SimpleProfile.ProfileBaseDirectory := GetSettingDir()+'Gecko';
    //Helper App Launcher Dialog
    SimpleHALDialog := TGeckoSimpleHALDialog.Create(Self);
    //PromptService
    SimplePrompt := TGeckoSimplePrompt.Create(Self);
    //DropTarget(検索ボックス)
    SearchBoxDropTarget := TNkDropTarget.Create(Self);
    SearchBoxDropTarget.OnDragEnter := Self.SearchBoxDragEnter;
    SearchBoxDropTarget.OnDragOver := Self.SearchBoxDragOver;
    SearchBoxDropTarget.OnDragLeave := Self.SearchBoxDragLeave;
    SearchBoxDropTarget.OnDrop := Self.SearchBoxDrop;
    SearchBoxDropTarget.Window := MainCoolbar;
    //DropTarget(フォーム)
//    FormDropTarget := TJvDropTarget.Create(Self);
    //TODO:
    //FormDropTarget.Control := Self;
//    FormDropTarget.OnDragDrop := Self.FormFileDropped;

    //ステータスバー生成
    StatusBar := TStatusBar.Create(Self);
    StatusBar.Align := alBottom;
    StatusBar.Height:=22;
    StatusBar.Parent:=Self;
    StatusBar.OnResize := Self.StatusBarResize;
    //プログレスバー生成
    ProgressBar:=TProgressBar.Create(Self);
    ProgressBar.DoubleBuffered:=true;
    ProgressBar.Parent:=StatusBar;
    ProgressBar.Visible:=False;
    ProgressBar.Position:=0;
    {ProgressBar.Left:=StatusBar.Panels[0].width+2;
    ProgressBar.Width:=StatusBar.Panels[1].Width-2;}
    ProgressBar.Top := 2;
    ProgressBar.Height := StatusBar.Height-2;
    ProgressBar.Smooth:=true;
    ProgressBar.DoubleBuffered:=true;
    //WebPanel生成
    WebPanel := TGeckoBrowser.Create(Self);
    WebPanel.Parent := WebPanelSheet;
    WebPanel.Align := alClient;
    WebPanel.Visible := True;
    WebPanel.OnNewWindow:=WebPanelNewWindow;
    WebPanel.OnDOMClick := WebPanelDOMClick;
    //BookmarksTree生成
    BookmarksTree := TBookmarkTreeView.Create(Self);
    BookmarksTree.Parent      := BookmarkSheet;
    BookmarksTree.Align       := alClient;
    BookmarksTree.Visible     := True;
    BookmarksTree.Images      := ImageList1;
    BookmarksTree.HideSelection := False;
    BookmarksTree.HotTrack    := True;
    BookmarksTree.RowSelect   := True;
    BookmarksTree.ShowButtons := False;
    BookmarksTree.ShowLines   := False;
    BookmarksTree.ShowRoot    := False;
    BookmarksTree.DragMode    := dmAutomatic;
    BookmarksTree.OnKeyDown   := Self.BookmarksTreeKeyDown;
    BookmarksTree.OnClick     := Self.BookmarksTreeClick;
    BookmarksTree.OnMouseDown := Self.BookmarksTreeMouseDown;
    BookmarksTree.OnDragDrop  := Self.BookmarksTreeDragDrop;
    BookmarksTree.OnDragOver  := Self.BookmarksTreeDragOver;
    BookmarksTree.PopupMenu   := BookmarksPopup;
    //GlobalHotkey生成
//    GlobalHotkey := TGlobalHotkey.Create(Self);
//    hi := GlobalHotkey.Items.Add;
//    hi.Hotkey:=TextToHotkey('Alt+F1');
    //ダウンロードサイドバー生成
    lvTransfer := TDownloadListView.Create(Self);
    lvTransfer.Align := alClient;
    lvTransfer.Parent := DLSheet;
    lvTransfer.Visible := True;
    lvTransfer.OnDblClick := lvTransferDblClick;
    //履歴ツリー生成
    HistoryTree := THistoryTreeView.Create(Self);
    HistoryTree.Align := alClient;
    HistoryTree.Parent := HistorySheet;
    HistoryTree.Visible := True;
    HistoryTree.SortingType := hstLastVisited;
    HistoryTree.OnClick := HistoryItemClicked;
    HistoryTree.OnMouseDown := HistoryTreeMouseDown;
    HistoryTree.HideSelection := False;
    HistoryTree.HotTrack    := True;
    HistoryTree.RowSelect   := True;
    //HistoryTree.DoSearch('e');
    //ファイルツリー生成
    FileTreeView:=TShellTreeView.Create(Self);
    FileTreeView.Parent := UsrTabSheet;
    FileTreeView.HideSelection:=false;
    FileTreeView.BorderStyle:=bsNone;
    FileTreeView.Align:=alClient;
    FileTreeView.OnDblClick:=Self.FileTreeViewDblClick;
    FileTreeView.ObjectTypes := [otFolders,otNonFolders];
    if Pref.UserDefinedFolder<>'' then
      FileTreeView.Root := Pref.UserDefinedFolder;

    swProxySelector:=TStatusWidget.Create(Self);
    swProxySelector.Visible := False;
    swProxySelector.Caption:=NOPROXY;
    swProxySelector.Name:='swProxySelector';
    swProxySelector.ImageIndex:=-1;
    swProxySelector.ShowCaption:=true;
    //swProxySelector.Style:=1;//selector
    //swProxySelector.Width:=200;
    //swProxySelector.Left:=0;
    //swProxySelector.ImageList:=StatusImageList;

    swAgentSelector:=TStatusWidget.Create(Self);
    swAgentSelector.Visible := False;
    swAgentSelector.Caption:=NOOVERRIDEAGENT;
    swAgentSelector.Name:='swAgentSelector';
    swAgentSelector.ImageIndex:=-1;
    swAgentSelector.ShowCaption:=true;

    BookmarkMenu := TBagelBookmarkContainer.Create(Self);
    BookmarkMenu.Name := 'BookmarkMenu';
    BookmarkMenu.Caption := 'ブックマーク(&B)';
    BookmarkMenu.OnClick := BookmarkMenuClick;

    AutoReloadMenu := TBagelActionContainer.Create(Self);
    AutoReloadMenu.Name := 'AutoReloadMenu';
    AutoReloadMenu.Caption := '自動再読み込み';
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'なし';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '5秒おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '10秒おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '30秒おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '1分おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '5分おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '10分おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '30分おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '1時間おき';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '-';
    AutoReloadMenu.Add(tmpItem);
    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'ユーザー設定';
    AutoReloadMenu.Add(tmpItem);

    TabSecurityMenu := TBagelActionContainer.Create(Self);
    TabSecurityMenu.Name := 'TabSecurityMenu';
    TabSecurityMenu.Caption := 'セキュリティ';

    UASwitchMenu := TBagelActionContainer.Create(Self);
    UASwitchMenu.Name := 'UASwitchMenu';
    UASwitchMenu.Caption := 'ユーザーエージェント';
    UASwitchMenu.OnClick := ToolPUASwitchClick;

    ProxySwitchMenu := TBagelActionContainer.Create(Self);
    ProxySwitchMenu.Name := 'ProxySwitchMenu';
    ProxySwitchMenu.Caption := 'プロクシ';
    ProxySwitchMenu.OnClick := ToolPProxySwitchClick;

    StyleSwitchMenu := TBagelActionContainer.Create(Self);
    StyleSwitchMenu.Name := 'StyleSwitchMenu';
    StyleSwitchMenu.Caption := 'スタイルシート';
    StyleSwitchMenu.OnClick := StyleSheetSwitchClick;

    CookieConfigMenu := TBagelActionContainer.Create(Self);
    CookieConfigMenu.Name := 'CookieConfigMenu';
    CookieConfigMenu.Caption := 'Cookieマネージャ';
    CookieConfigMenu.OnClick := CookieConfigMenuClick;

    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'デフォルトのCookie設定に従う';
    tmpItem.OnClick := ThisSiteCookieClick;
    tmpItem.Tag := 0;
    CookieConfigMenu.Add(tmpItem);

    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'このサイトからのCookieを許可する';
    tmpItem.OnClick := ThisSiteCookieClick;
    tmpItem.Tag := 1;
    CookieConfigMenu.Add(tmpItem);

    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'このサイトからのCookieをセッション間だけ許可';
    tmpItem.OnClick := ThisSiteCookieClick;
    tmpItem.Tag := 8;
    CookieConfigMenu.Add(tmpItem);

    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := 'このサイトからのCookieを拒否する';
    tmpItem.OnClick := ThisSiteCookieClick;
    tmpItem.Tag := 2;
    CookieConfigMenu.Add(tmpItem);

    tmpItem := TBagelActionContainer.Create(Self);
    tmpItem.Caption := '-';
    CookieConfigMenu.Add(tmpItem);

    actPopupDisableDuringLoad := TGeckoPrefAction.Create(Self);
    actPopupDisableDuringLoad.Name := 'actPopupDisableDuringLoad';
    actPopupDisableDuringLoad.Caption := 'ロード中のポップアップを禁止する';
    actPopupDisableDuringLoad.PrefName := 'dom.disable_open_during_load';
    actPopupDisableDuringLoad.PrefType := gpBool;
    actPopupDisableDuringLoad.OnVal := 'True';
    actPopupDisableDuringLoad.OnExecute := DummyProc;

    actDisableCtxMenuEvt := TGeckoPrefAction.Create(Self);
    actDisableCtxMenuEvt.Name := 'actDisableCtxMenuEvt';
    actDisableCtxMenuEvt.Caption := '右クリック禁止を無効化';
    actDisableCtxMenuEvt.PrefName := 'dom.event.contextmenu.enabled';
    actDisableCtxMenuEvt.PrefType := gpBool;
    actDisableCtxMenuEvt.OnVal := 'False';
    actDisableCtxMenuEvt.OnExecute := DummyProc;

    actBlockTargetNewWin := TGeckoPrefAction.Create(Self);
    actBlockTargetNewWin.Name := 'actBlockTargetNewWin';
    actBlockTargetNewWin.Caption := 'Targetを無効にする';
    actBlockTargetNewWin.PrefName := 'browser.block.target_new_window';
    actBlockTargetNewWin.PrefType := gpBool;
    actBlockTargetNewWin.OnVal := 'True';
    actBlockTargetNewWin.OnExecute := DummyProc;

    actDisableFrames := TGeckoPrefAction.Create(Self);
    actDisableFrames.Name := 'actDisableFrames';
    actDisableFrames.Caption := 'フレームを無効にする';
    actDisableFrames.PrefName := 'browser.frames.enabled';
    actDisableFrames.PrefType := gpBool;
    actDisableFrames.OnVal := 'False';
    actDisableFrames.OnExecute := DummyProc;

    actEnableFrameResize  := TGeckoPrefAction.Create(Self);
    actEnableFrameResize.Name := 'actEnableFrameResize';
    actEnableFrameResize.Caption := 'フレームのリサイズを強制的にできるようにする';
    actEnableFrameResize.PrefName := 'layout.frames.force_resizability';
    actEnableFrameResize.PrefType := gpBool;
    actEnableFrameResize.OnVal := 'True';
    actEnableFrameResize.OnExecute := DummyProc;

    actRefererDontSend := TGeckoPrefAction.Create(Self);
    actRefererDontSend.Name := 'actRefererDontSend';
    actRefererDontSend.Caption := 'リファラを付加しない';
    actRefererDontSend.PrefName := 'network.http.sendRefererHeader';
    actRefererDontSend.PrefType := gpInt;
    actRefererDontSend.OnVal := '0';
    actRefererDontSend.OnExecute := DummyProc;

    actRefererLink := TGeckoPrefAction.Create(Self);
    actRefererLink.Name := 'actRefererLink';
    actRefererLink.Caption := 'リファラをリンクをクリックしたときのみ付加';
    actRefererLink.PrefName := 'network.http.sendRefererHeader';
    actRefererLink.PrefType := gpInt;
    actRefererLink.OnVal := '1';
    actRefererLink.OnExecute := DummyProc;

    actRefererAll := TGeckoPrefAction.Create(Self);
    actRefererAll.Name := 'actRefererAll';
    actRefererAll.Caption := 'リファラを画像等のダウンロード時にも付加';
    actRefererAll.PrefName := 'network.http.sendRefererHeader';
    actRefererAll.PrefType := gpInt;
    actRefererAll.OnVal := '2';
    actRefererAll.OnExecute := DummyProc;

    //swAgentSelector.Style:=1;//selector
    //swAgentSelector.Width:=200;
    //swAgentSelector.Left:=0;
    //swAgentSelector.ShowText:=True;
    //swAgentSelector.ImageList:=StatusImageList;

  end;
var
  ASRgn:HRgn;
  tmpStr:String;
  memo:TBagelMemo;
  i:Integer;
  inifile:TMemIniFile;
  hMen : hMenu;
//  StatusPanel:TBagelStatusPanel;
  act:TCustomAction;
  tmpObj:TObject;
  tmpName,tmpAct:String;
  tmpSW:TStatusWidget;
begin
  //Backupを実行
  DoBackUp;

  //ステータスバーのウィジェットを格納するリスト
  StatusWidgetList := TList.Create;

  //Windowの状態を復元
  Self.Top    := Pref.WndTop;
  Self.Left   := Pref.WndLeft;
  Self.Width  := Pref.WndWidth;
  Self.Height := Pref.WndHeight;
  Self.WindowState := TWindowState(Pref.WndState);

  //コマンド用リスト
  ExtAppList:=Tlist.Create;
  ExtCopyList:=Tlist.Create;
  LoadExtensions;

  //コントロールを作成
  CreateControls;
  //アクションジェネレータを生成
  RecentClosedURIMenu := TBagelActionContainer.Create(Self);
  RecentClosedURIMenu.OnClick := RecentClosedURIMenuClick;
  RecentClosedURIMenu.Name := 'RecentClosedURIMenu';
  RecentClosedURIMenu.Caption := '最近閉じたタブ';
  RecentOpenedURIMenu := TBagelActionContainer.Create(Self);
  RecentOpenedURIMenu.OnClick := RecentOpenedURIMenuClick;
  RecentOpenedURIMenu.Name := 'RecentOpenedURIMenu';
  RecentOpenedURIMenu.Caption := '最近開いたURI';
  WebPanelListMenu := TBagelActionContainer.Create(Self);
  WebPanelListMenu.OnClick := ViewMenuSidebarClick;
  WebPanelListMenu.Name := 'WebPanelListMenu';
  WebPanelListMenu.Caption := 'WebPanel';

  EncodeMenu := TBagelActionContainer.Create(Self);
  EncodeMenu.Name := 'EncodeMenu';
  EncodeMenu.Caption := '文字コード';
  EncodeMenu.OnClick := ViewPEncodeClick;

  ExtCopyMenu := TBagelActionContainer.Create(Self);
  ExtCopyMenu.Name := 'ExtCopyMenu';
  ExtCopyMenu.Caption := '拡張コピー';
  ExtCopyMenu.OnClick := ExtCopyMenuClick;

  ExtAppMenu := TBagelActionContainer.Create(Self);
  ExtAppMenu.Name := 'ExtAppMenu';
  ExtAppMenu.Caption := '外部アプリケーション';
  ExtAppMenu.OnClick := ExtAppMenuClick;

  //ブックマークの生成
  bookmarks:=TBookmarks.Create;
  bookmarks.name:='ブックマーク';
  if FileExists(GetSettingDir() + 'bookmarks.dat') then
    bookmarks.Load(GetSettingDir() + 'bookmarks.dat')
  else if FileExists(GetDefaultsDir() + 'bookmarks.dat') then
    bookmarks.Load(GetDefaultsDir() + 'bookmarks.dat');

  BookmarksTree.Root := bookmarks;
  BookmarkMenu.Bookmark:=bookmarks;
  BookmarkMenu.Click;
  
  //ツールバーを構築
  CreateToolbarItems;
  if MenuToolbar.ButtonCount <> 0 then
    with MenuToolbar.Buttons[MenuToolbar.ButtonCount-1] do
      MainCoolbar.Bands.FindBand(MenuToolbar).DealWidth := Left + Width + 5;
  if ControlToolbar.ButtonCount <> 0 then
    with ControlToolbar.Buttons[ControlToolbar.ButtonCount-1] do
      MainCoolbar.Bands.FindBand(ControlToolbar).DealWidth := Left + Width + 5;

  //ステータスバーの構築
  StatusBar.Panels.Add;
  StatusBar.Panels.Add;
  StatusWidgetList.Add(ProgressBar);
  for i := 0 to TestActionContainer3.Count - 1 do begin
    StatusBar.Panels.Add;
    if TestActionContainer3.Item[i].Action is TBasicAction then begin
      tmpSW := TStatusWidget.Create(Self);
      tmpSW.Action := TBasicAction(TestActionContainer3.Item[i].Action);
    end
    else if TestActionContainer3.Item[i].Action is TStatusWidget then begin
      tmpSW := TStatusWidget(TestActionContainer3.Item[i].Action);
    end
    else
      tmpSW := nil;
    if Assigned(tmpSW) then
    begin
      tmpSW.Parent := StatusBar;
      tmpSW.Visible := True;
      tmpSW.Top := 3;
      tmpSW.Height := StatusBar.Height - 4;
      tmpSW.AutoSize := True;
      tmpSW.ShowCaption := TestActionContainer3.Item[i].Caption<>'';
      StatusWidgetList.Add(tmpSW);
    end;
  end;
  StatusBar.Panels.Add.Width:=22;


  //キーボードショートカットの設定
  for i:=0 to Pref.KbdList.Count -1 do
  begin
    tmpName:=Pref.KbdList.Names[i];
    tmpAct:=Pref.KbdList.Values[tmpName];
    tmpObj:=FindAction(tmpAct);
    if (tmpObj<>nil) and (tmpObj is TCustomAction) then
    begin
      act:=TCustomAction(tmpObj);
      if act.ShortCut = 0 then
        act.ShortCut:=TextToShortCut(tmpName)
      else
        act.SecondaryShortCuts.Add(tmpName);
    end;
  end;

  SearchBox.Width := Pref.SearchBoxWidth;

  //SidebarTogglePanelのWndProcを変更
  STPOriginalProc := SidebarTogglePanel.WindowProc;
  SidebarTogglePanel.WindowProc := STPSubClassProc;

  //Coolbar関連
  if Pref.FixToolbar then actToggleNoGripper.Execute;
  with MainCoolbar.Bands do begin
    BeginUpdate;
    inifile := TMemIniFile.Create(GetSettingDir + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini')));
    try
      for i:=Count - 1 downto 0 do
      begin
        FindItemID(iniFile.ReadInteger('TOOLBAR', 'Band' + IntToStr(i) + 'ID', i)).Index := i;
        MainCoolbar.Bands[i].Break := Boolean(iniFile.ReadInteger('TOOLBAR', 'Band' + IntToStr(i) + 'Break', Integer(MainCoolbar.Bands[i].Break)));
        MainCoolbar.Bands[i].Width := iniFile.ReadInteger('TOOLBAR', 'Band' + IntToStr(i) + 'Width', MainCoolbar.Bands[i].Width);
      end;
      for i:=0 to MainCoolbar.Bands.Count - 1 do
      begin
        MainCoolbar.Bands[i].Visible := Boolean(iniFile.ReadInteger('TOOLBAR', 'Band' + IntToStr(i) + 'Visible', Integer(MainCoolbar.Bands[i].Visible)));
      end;
    finally
      IniFile.Free;
    end;
    FindBand(ControlToolbar).Text := Pref.MainBarCaption;
    FindBand(LocationBar).Text := Pref.AddressBarCaption;
    FindBand(SearchBar).Text := Pref.SearchBarCaption;
    FindBand(Linkbar).Text := Pref.LinkBarCaption;
    FindBand(TabControl).Text := Pref.TabBarCaption;
    actToggleMainbarVisible.Checked   := FindBand(ControlToolbar).Visible;
    actToggleURIbarVisible.Checked    := FindBand(LocationBar).Visible;
    actToggleSearchBarVisible.Checked := FindBand(SearchBar).Visible;
    actToggleLinkbarVisible.Checked   := FindBand(Linkbar).Visible;
    actToggleTabbarVisible.Checked    := FindBand(TabControl).Visible;
    actToggleMenubarVisible.Checked   := FindBand(MenuToolbar).Visible;
    EndUpdate;
  end;
  //TabZOrder生成
  TabZOrder:=TList.Create;
  //オートスクロール基点マーカー初期化
  ASRgn := CreateEllipticRgn(0, 0, 29,29);
  SetWindowRgn(Panel10.Handle, ASRgn, True);
  Panel10.Visible:=False;
  //クリップボードビューアのチェインに自ウインドウを追加する
  hNextViewer := SetClipboardViewer(Handle);
  //文字コードメニュー
  BuildCharsetMenu;
  //ドロップターゲット
  InternalTargetList:=TStringList.Create;
  InternalTargetList.Assign(Pref.DropTargetList);
  if TabControl2.Tabs.Count>0 then
    for i:=0 to TabControl2.Tabs.Count-1 do begin
      memo:=TBagelMemo(TabControl2.Tabs.Objects[i]);
      tmpStr:=ExtractFileName(memo.Path);
      InternalTargetList.Add('text'+#9+'memo'+#9+tmpStr+#9+tmpStr);
    end;

  //アドレスバー拡張
  ExtGolist:=TStringList.Create;
  if FileExists(GetSettingDir()+'ExtGo.dat') then ExtGolist.LoadFromFile(GetSettingDir()+'ExtGo.dat')
  else if FileExists(GetDefaultsDir()+'ExtGo.dat') then ExtGolist.LoadFromFile(GetDefaultsDir()+'ExtGo.dat');

  //自動実行用リスト
  FAutoExec:=TAutoExecManager.Create;
  if FileExists(GetSettingDir()+'AutoExec.dat') then FAutoExec.LoadFromFile(GetSettingDir()+'AutoExec.dat')
  else if FileExists(GetDefaultsDir()+'AutoExec.dat') then FAutoExec.LoadFromFile(GetDefaultsDir()+'AutoExec.dat');  


  Linkbar.Root := bookmarks;
  if Linkbar.ButtonCount <> 0 then
    with Linkbar.Buttons[Linkbar.ButtonCount-1] do
      MainCoolbar.Bands.FindBand(Linkbar).DealWidth := Left + Width + 5;

  {l := TBookmarkListView.Create(Self);
  l.Parent := BookmarkSheet;
  l.Align := alClient;
  l.Visible := True;
  l.SmallImages := ImageList1;
  l.ViewStyle := vsReport;
  l.HideSelection := False;
  l.MultiSelect := True;
  l.RowSelect := True;
  l.Root := bookmarks;}

  //WebPanelのロード
  WebPanelList:=TStringList.Create;

  if FileExists(GetSettingDir() + 'panels.dat') then
  WebPanelList.LoadFromFile(GetSettingDir() + 'panels.dat')
  else if FileExists(GetDefaultsDir() + 'panels.dat') then
  WebPanelList.LoadFromFile(GetDefaultsDir() + 'panels.dat');
  ViewMenuSidebarClick(Self);

  //サイドバーの復元
  SideBasePanel.Width:=Pref.SidebarWidth;
  PageControl1.ActivePageIndex := Pref.Sidebar;
  //チェック状態の反映
  if actToggleSidebarVisible.Checked then begin
    if PageControl1.ActivePage=BookmarkSheet then actBookmarkSidebar.Checked:=true
    else if PageControl1.ActivePage=HistorySheet then actHistorySidebar.Checked:=true
    else if PageControl1.ActivePage=LinkSheet then actLinkSidebar.Checked:=true
    else if PageControl1.ActivePage=GrepSheet then actGrepSidebar.Checked:=true
    else if PageControl1.ActivePage=WebPanelSheet then actWebPanel.Checked:=true
    else if PageControl1.ActivePage=ScriptSheet then actScriptSidebar.Checked:=true
    else if PageControl1.ActivePage=ClipSheet then actClipboardSidebar.Checked:=true
    else if PageControl1.ActivePage=MemoSheet then actMemoSidebar.Checked:=true
    else if PageControl1.ActivePage=DLSheet then actTransferSidebar.Checked:=true
    else if PageControl1.ActivePage=TabSheet1 then actOutputSidebar.Checked:=true
    else if PageControl1.ActivePage=UsrTabSheet then actUserDefinedSidebar.Checked:=true;
  end;

  //ステータスバー
  {
  StatusPanel := TBagelStatusPanel.Create(StatusBar.Panels);
  StatusBar.Panels.AddItem(StatusPanel);
  }
  //CSS
  processedStyleSheets:=TStringList.Create;

  UpdatePrefs;
  UpdateSearch;

  EngineBox.ItemIndex:=Pref.RememberedEngineIndex;

  //システムメニューのハンドルを取得
  hMen := GetSystemMenu(Handle,False);
  //システムメニューの「元に戻す」の上に追加
  InsertMenu(hMen, SC_CLOSE, MF_BYPOSITION, 1, 'メインツールバーの表示') ;
  //システムメニューの「閉じる」の下に追加
  InsertMenu(hMen,SC_CLOSE, MF_BYPOSITION,2,'メニューの表示');

  ControlToolbar.Height := ControlToolbar.ButtonHeight;
  LocationBar.Height := LocationBar.ButtonHeight;
//  ShowMessage(IntToStr());

end;
{フォームの破棄}
procedure TBagelMainForm.FormDestroy(Sender: TObject);
begin
  StatusWidgetList.Free;

  //プロファイルのクローズ
  SimpleProfile.Free;

  SimpleHALDialog.Free;

  SimplePrompt.Free;

  //ブックマークの破棄
  bookmarks.Free;

  //CSS
  processedStyleSheets.Free;

  //自動実行の破棄
  FAutoExec.Free;

  //クリップボードチェインから消える
  ChangeClipBoardChain(Handle, hNextViewer);
  InternalTargetList.Free;
  ExtAppList.Free;
  ExtCopyList.Free;
  ExtGolist.SaveToFile(GetSettingDir()+'ExtGo.dat');
  ExtGoList.Free;
  WebPanelList.Free;
  TabZOrder.Free;
end;

procedure TBagelMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.MouseCapture:=false;
  AutoScrolling:=false;
  AutoScrollTimer.Enabled:=false;
  Panel10.Visible:=False;
end;

procedure TBagelMainForm.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  //if (Msg.CharCode=27) and isMigemoActive then Exit;
  Handled := Handled or ActionList1.IsShortCut(Msg);
end;

procedure TBagelMainForm.FormShow(Sender: TObject);
var
  i:Integer;
begin
  //StatusBarResize(Self);
  if LoadCompleted then Exit;

  SidebarSelector.Caption:=PageControl1.Pages[PageControl1.ActivePageIndex].Caption;

  if Pref.StartupTabBehavior=0 then begin end
  else if Pref.StartupTabBehavior=1 then begin
    actAddTabBlank.Execute;
  end
  else if Pref.StartupTabBehavior=2 then begin
    actAddTabHome.Execute;
  end
  else if Pref.StartupTabBehavior=3 then begin
    LoadSession(GetSettingDir() + 'Default.bbg');
  end
  else if Pref.StartupTabBehavior=4 then begin
    LoadSession(Pref.StartupGroup);
  end;

  if Pref.SidebarOverlap then SideBasePanel.Align:= alNone
  else SideBasePanel.Align:= alLeft;
  SidePanel.Align:=alClient;

  if ParamCount>0 then begin
    for i:=1 to ParamCount do
    begin
      AddTab(ParamStr(i),0,0,'',Pref.DocShellDefault);
    end;
  end;

  MainCoolbar.Realign;

  LoadCompleted := True;
end;

{タブが変わった}
procedure TBagelMainForm.TabControl2Change(Sender: TObject);
var
  memo:TBagelMemo;
  i:Integer;
  item:TListItem;
begin
  memo:=TBagelMemo(TabControl2.Tabs.Objects[TabControl2.TabIndex]);
  lvMemo.Clear;
  for i:=0 to memo.Count-1 do begin
    item:=lvMemo.Items.Add;
    item.Caption:=memo.Items[i].Title;
    item.Data:=memo.Items[i];
  end;
//  Self.lvMemoSelectItem(nil,memo.Item[0,],true);
  if lvMemo.Items.Count>0 then
  lvMemo.Selected:=lvMemo.Items.Item[0];
  lvMemoSelectItem(nil,lvMemo.Items.Item[0],true);

end;

procedure TBagelMainForm.TabControl2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  memoBarCtxTarget:=TabControl2.IndexOfTabAt(X,Y);
end;

procedure TBagelMainForm.TabControl2Resize(Sender: TObject);
begin
  TabControl2.Height:=22*TabControl2.RowCount;
end;

procedure TBagelMainForm.TabControlChange(Sender: TObject);
var
  i:integer;
begin
  i:=TabControl.TabIndex;
  SelectTab(i);
end;

procedure TBagelMainForm.TabControlContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  actName:String;
  obj:TObject;
begin
  tabBarCtxTarget:=TabControl.IndexOfTabAt(MousePos.X,MousePos.Y);
  currentCtxURI:='';
  currentCtxImg:='';
  currentCtxBgImg:='';
  currentCtxTargetNode:=Nil;
  currentCtxSel:=    false;
  currentCtxWindow:= false;
  currentCtxQuote:=  false;
  currentCtxTextBox:=false;

  actName:=Pref.TabRightClickAct;
  obj:=FindAction(actName);

  if (obj<>nil) and (obj is TCustomAction) then
  begin
    TCustomAction(obj).Execute;
    StatusBar.Panels[0].Text:=TCustomAction(obj).Caption;
    Handled:=True;
  end;
end;

{タブを描画}
procedure TBagelMainForm.TabControlDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  r,r2:TRect;
  bmp:TBitmap;
  // hbmGray:HBRUSH;
  // hBm:HBITMAP;
  i,j:Integer;
  w{,h}:Integer;
  textleft:Integer;
begin


(*
HBRUSH GetHalftoneBrush()
{
  static WORD grayPattern[8]={0x5555,0xAAAA,0x5555,0xAAAA,0x5555,0xAAAA,0x5555,0xAAAA};
  HBRUSH hBrush=NULL;
  HBITMAP grayBitmap = CreateBitmap(8, 8, 1, 1, &grayPattern);
  if (grayBitmap != NULL)
  {
	hBrush=::CreatePatternBrush(grayBitmap);
	DeleteObject(grayBitmap);
  }
  return hBrush;
}

const
  BitmapPattern: array [0..7] of Word =
    ($8000,$0000,$0000,$0000,$0000,$0000,$0000,$0000);
var
  HBm: HBITMAP;
begin

  HBm := CreateBitmap(8,8,1,1,@BitmapPattern[0]);
  try
    Canvas.Brush.Handle := CreatePatternBrush(HBm);

    // 描画処理

  finally
    DeleteObject(hBm);
  end;
*)

  if TabIndex<0 then Exit;
  CopyRect(r,Rect);
  with TabControl.Canvas do begin
    w:=r.Right-r.Left;
//    h:=r.Bottom-r.Top;
    textleft:=r.Left+(r.Right-r.Left-TextWidth(TabControl.Tabs.Strings[TabIndex])) div 2;
    textleft:=Max(textleft,r.left+2);
    if active then begin
      bmp := TBitmap.Create;
      try
        if TabControl.TabStyle=btsFlatButtons then begin
          bmp.Width:=8;
          bmp.Height:=8;
          r2.Left:=0;
          r2.Top:=0;
          r2.Right:=8;
          r2.Bottom:=8;
          bmp.Canvas.Brush.Color:=clBtnHighlight;
          bmp.Canvas.FillRect(r2);
          for i:=0 to 7 do begin
            for j:=0 to 7 do begin
              if (i+j) mod 2 =0 then
              bmp.Canvas.Pixels[j,i]:=clBtnFace;
            end;
          end;

          Brush.Bitmap := bmp;
          FillRect(r);
          Brush.Bitmap:=nil;
          Brush.Style:=bsClear;
          if TBagelBrowser(TabControl.Tabs.Objects[TabIndex]).IsRead then Font.Color:=clPurple
          else Font.Color:=clBlue;
          SetBkMode(Handle, TRANSPARENT);
          TextRect(r,
            textleft + 1,
            r.Top + ((r.Bottom-r.Top)-TextHeight(TabControl.Tabs.Strings[TabIndex])) div 2 + 1,
            TabControl.Tabs.Strings[TabIndex]
          );
        end
        else begin
          {Brush.Color:=clBtnFace;
          Brush.Style:=bsSolid;
          FillRect(r);}
          Brush.Style:=bsClear;
          if Pref.ViewIsRead then begin
            if TBagelBrowser(TabControl.Tabs.Objects[TabIndex]).IsRead then Font.Color:=clPurple
            else Font.Color:=clBlue;
          end
          else begin
            Font.Color:=clBtnText;
          end;
          SetBkMode(Handle, TRANSPARENT);
          TextRect(r,
            textleft + 1,
            r.Top + ((r.Bottom-r.Top)-TextHeight(TabControl.Tabs.Strings[TabIndex])) div 2 - 1,
            TabControl.Tabs.Strings[TabIndex]
          );
        end;

      finally
        //Brush.Bitmap := nil;
        bmp.Free;
      end;
    end
    else begin
      {if TabControl1.TabStyle=btsTabs then begin
        Brush.Style:=bsSolid;
        Brush.Color:=clBtnFace;
        FillRect(r);
      end
      else Brush.Style:=bsClear;}
      Brush.Style:=bsClear;
      if Pref.ViewIsRead then begin
        if TBagelBrowser(TabControl.Tabs.Objects[TabIndex]).IsRead then Font.Color:=clPurple
        else  Font.Color:=clBlue;
      end
      else begin
        Font.Color:=clBtnText;
      end;
      //SetBkMode(TabControl1.Canvas.Handle, TRANSPARENT);
      TextRect(r,
        textleft,
        r.Top + ((r.Bottom-r.Top)-TextHeight(TabControl.Tabs.Strings[TabIndex])) div 2,
        TabControl.Tabs.Strings[TabIndex]
      );
    end;
    {
    Brush.Color:=clHighlight;
    Font.Color:=clHighlightText;
    r.Right:=r.Left + w * min(TBagelBrowser(TabControl.Tabs.Objects[TabIndex]).Progress,100) div 100;
    FillRect(r);
    TextRect(r,
      textleft,
      r.Top + ((r.Bottom-r.Top)-TextHeight(TabControl.Tabs.Strings[TabIndex])) div 2,
      TabControl.Tabs.Strings[TabIndex]
    );}
  end;
end;
procedure TBagelMainForm.TabControlMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if TabControl.IndexOfTabAt(X,Y)>=0 then begin
    TabControl.Hint:=GetBrowser(TabControl.IndexOfTabAt(X,Y)).Title+#13#10+GetBrowser(TabControl.IndexOfTabAt(X,Y)).URI;
  end;
end;

procedure TBagelMainForm.TabControlDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = TabControl);
end;


procedure TBagelMainForm.TabControlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  obj:TObject;
  gestName:String;
begin
  if Button=mbMiddle then
  begin
    tabBarCtxTarget := TabControl.IndexOfTabAt(X, Y);
    gestName:=Pref.TabMiddleClickAct;
    obj:=FindAction(gestName);
    //gestIndex:=cmdTable.IndexOf(gestName);
    if (obj<>nil) and (obj is tCustomAction) then
    begin
      TCustomAction(obj).Execute;
      StatusBar.Panels[0].Text:=TCustomAction(obj).Caption;
    end
    else
    begin
      StatusBar.Panels[0].Text:='対応するコマンドがありません:'+gestName;
    end;
  end;
end;


procedure TBagelMainForm.TabControlDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  index: integer;
begin
  index := TabControl.IndexOfTabAt(X, Y);
  if index >= 0 then
  begin
    TabControl.Tabs.Move(tabDragSourceIndex, index);
  end;
end;

procedure TBagelMainForm.TabControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

//var
//elm:nsIDOMElement;
begin
//self.Caption:='TabControl1MouseDown';
  case Button of
  mbLeft:
    begin

      tabDragSourceIndex := TabControl.IndexOfTabAt(X, Y);
      //(GetBrowser(tabDragSourceIndex).WebBrowser as nsIWebBrowserFocus).GetFocusedElement(elm);
      if tabDblClicked = true then
      begin
        tabDblClicked:=false;
        exit;
      end
      else
      begin
        TabControl.BeginDrag(false, 5);
      end;
    end;
  end;
end;

procedure TBagelMainForm.TabControlDblClick(Sender: TObject);
var
  actName:String;
  obj:TObject;
begin
  tabDblClicked:=true;
  actName:=Pref.TabDblClickAct;
  obj:=FindComponent(actName);
  if obj is TCustomAction then
  begin
    TCustomAction(obj).Execute;
    StatusBar.Panels[0].Text:=TCustomAction(obj).Caption;
  end
  else
  begin
    StatusBar.Panels[0].Text:='対応するコマンドがありません:'+actName;
  end;
end;

procedure TBagelMainForm.TabControlOLEDrop(Sender: TObject; Str: String);
begin
  Addtab(Str);//,0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.AReloadClick(Sender: TObject);
var
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  b.ReloadTime:=TMenuItem(Sender).Tag*1000;
end;

procedure TBagelMainForm.TabPAutoReloadClick(Sender: TObject);
var
  b:TBagelBrowser;
  intv:Integer;
  i:Integer;
begin
if TabControl.Tabs.Count<1 then begin
  {for i:=0 to TabPAutoReload.Count-1 do
  begin
    TabPAutoReload.Items[i].Enabled:=false;
  end;}
  exit;
end
else begin
  {for i:=0 to TabPAutoReload.Count-1 do
  begin
    TabPAutoReload.Items[i].Enabled:=True;
  end;}
end;
{
AReloadCustom.Caption:='ユーザー設定('+IntToStr(Pref.AutoReloadCustomIntv)+'秒)';
AReloadCustom.Tag:=Pref.AutoReloadCustomIntv;
b:=GetBrowser(tabBarCtxTarget);
intv:=b.ReloadTime;
for i:=0 to TabPAutoReload.Count-1 do
begin
  if TabPAutoReload.Items[i].Checked then TabPAutoReload.Items[i].Checked := false;
  if TabPAutoReload.Items[i].Tag*1000 = intv then TabPAutoReload.Items[i].Checked :=true;
end;
}
end;


procedure TBagelMainForm.TabPSecurityClick(Sender: TObject);
var
  b:TGeckoBrowser;
  ds:nsIDocShell;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then begin
    {SecPAllowImg.Checked:=false;
    SecPAllowImg.Enabled:=false;
    SecPAllowPlugins.Checked:=false;
    SecPAllowPlugins.Enabled:=false;
    SecPAllowJS.Checked:=false;
    SecPAllowJS.Enabled:=false;
    SecPAllowFrames.Checked:=false;
    SecPAllowFrames.Enabled:=false;
    SecPAllowMetaRed.Checked:=false;
    SecPAllowMetaRed.Enabled:=false;}
    exit;
  end
  else begin
    {SecPAllowImg.Enabled:=true;
    SecPAllowPlugins.Enabled:=true;
    SecPAllowJS.Enabled:=true;
    SecPAllowFrames.Enabled:=true;
    SecPAllowMetaRed.Enabled:=true;}
  end;

  ds:=b.DocShell;                   {
  SecPAllowImg.Checked:=ds.AllowImages;
  SecPAllowPlugins.Checked := ds.AllowPlugins;
  SecPAllowJS.Checked := ds.AllowJavascript;
  SecPAllowMetaRed.Checked := ds.AllowMetaRedirects;
  SecPAllowFrames.Checked := ds.AllowSubframes;}
end;

procedure TBagelMainForm.tbCopyExtractClick(Sender: TObject);
var
  i:Integer;
  sl:TStringList;
begin
  sl:=TStringList.Create;
  try
    for i:=0 to LinkListView.Items.Count-1 do begin
      if LinkListView.Items[i].Checked then sl.Add(LinkListView.Items[i].SubItems.Strings[0]);
    end;
    Clipboard.AsText := sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TBagelMainForm.tbDoSelectionClick(Sender: TObject);
begin
  Extract_CheckByPattern(true);
end;

procedure TBagelMainForm.tbExtractReverseClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to LinkListView.Items.Count-1 do begin
    LinkListView.Items[i].Checked := not LinkListView.Items[i].Checked;
  end;
end;


procedure TBagelMainForm.tbExtractSelectAllClick(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to LinkListView.Items.Count-1 do begin
    LinkListView.Items[i].Checked := true;
  end;
end;

procedure TBagelMainForm.LoadLinkSidebar;
var
  doc:nsIDOMDocument;
  nodelist:nsIDOMNodeList;
  elm:nsIDOMNode;
  //str:IInterfacedString;
  //astr:nsAString;
  str2:IInterfacedString;
  astr2:nsAString;
  uri:String;
  str3:IInterfacedString;
  astr3:nsAString;
  text:String;
  range:nsIDOMRange;
  i:Integer;
  tmpListItem:TListItem;
  pat:String;
  b:TBagelBrowser;
begin
  b:=GetCurrentBrowser;
  if b=nil then Exit;

  doc:=b.ContentDocument;

  //str:=NewString('a');
  //astr:=str.AString;
  str2:=NewString('');
  astr2:=str2.AString;
  str3:=NewString('');
  astr3:=str3.AString;
  LinkListView.Clear;
  nodelist := doc.GetElementsByTagName(NewString('a').AString);
//  nodelist.GetLength(listlength);
  for i:=0 to nodeList.Length-1 do
  begin
    elm := nodelist.Item(i);

    (elm as nsIDOMHTMLAnchorElement).GetHref(astr2);//URI取得

    range:=(doc as nsIDOMDocumentRange).CreateRange;
    range.SelectNode(elm);
    range.ToString(astr3);//テキスト取得

    uri := str2.ToString;
    text := str3.ToString;

    (*LinkListView.AddItem(str3.ToString,nil);
    LinkListView.Items[i].SubItems.Add(str2.ToString);*)

    if cboExtractPattern.Text='' then begin //すべて抽出
      tmpListItem := LinkListView.Items.Add;
      tmpListItem.Caption:=text;
      tmpListItem.SubItems.Add(uri);
      tmpListItem.Checked:=true;
    end
    else begin
      if cboExtractDetType.ItemIndex = 0 then begin // URI
      //StringReplace(Action.Option,'%a_href%',currentCtxURI,[rfReplaceAll]);
        pat:=StringReplace(cboExtractPattern.Text,'%cur%',b.URI,[rfReplaceAll]);
        if WildcardMatch(pat,uri) then begin
          tmpListItem := LinkListView.Items.Add;
          tmpListItem.Caption:=text;
          tmpListItem.SubItems.Add(uri);
          tmpListItem.Checked:=true;
        end;
      end
      else begin // Text
        if WildcardMatch(cboExtractPattern.Text,Text) then begin
          tmpListItem := LinkListView.Items.Add;
          tmpListItem.Caption:=text;
          tmpListItem.SubItems.Add(uri);
          tmpListItem.Checked:=true;
        end;
      end;
    end;
  end;
end;

procedure TBagelMainForm.tbFixExtractClick(Sender: TObject);
begin
  //tbFixExtract.Down:= not tbFixExtract.Down;
  cboExtractDetType.Enabled := not tbFixExtract.Down;
  cboExtractPattern.Enabled := not tbFixExtract.Down;
  tbDoExtract.Enabled := not tbFixExtract.Down;
  tbDoSelection.Enabled := not tbFixExtract.Down;
  tbDoExclude.Enabled := not tbFixExtract.Down;
  tbExtractSelectAll.Enabled := not tbFixExtract.Down;
  tbExtractReverse.Enabled := not tbFixExtract.Down;
end;

procedure TBagelMainForm.tbDoExcludeClick(Sender: TObject);
begin
  Extract_CheckByPattern(false);
end;

procedure TBagelMainForm.tbDoExtractClick(Sender: TObject);
begin
  //WebPanel1.Reload;
  LoadLinkSidebar;
end;

procedure TBagelMainForm.tbGrepSearchBarTextClick(Sender: TObject);
var
  s:TShiftState;
  r:Char;
  tmp:String;
begin
  if SearchBox.Text='' then exit;
  if PageControl1.ActivePage <> GrepSheet then actGrepSidebar.Execute
  else if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;

  tmp := StringReplace(SearchBox.Text,' ','|',[rfReplaceAll]);
  tmp := StringReplace(tmp,'　','|',[rfReplaceAll]);

  cmbGrepKeyword.Text := '(' + tmp + ')';
  cmbGrepKind.ItemIndex:=1;

  s:=[];
  r:=Char(VK_RETURN);

  cmbGrepKeywordKeyPress(tbGrepSearchBarText,r);
end;

procedure TBagelMainForm.tbOpenExtractClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to LinkListView.Items.Count-1 do begin
    if LinkListView.Items[i].Checked then AddTab(LinkListView.Items[i].SubItems.Strings[0],2,0,'',Pref.DocShellDefault);
  end;
end;

procedure TBagelMainForm.tbUsrDefSettingClick(Sender: TObject);
var
  box:TBrowseFolderBox;
  pt:TPoint;
begin
  box:=TBrowseFolderBox.Create;
  try
    box.InitFolder:=Pref.UserDefinedFolder;
    pt:=UsrTabSheet.ClientToScreen(Point(0,0));
    box.PosY:=pt.Y;
    box.PosX:=pt.X;
    box.Title:='フォルダを選択してください';
    if box.Execute then begin
      Pref.UserDefinedFolder:=box.SelectFolder;
      if Assigned(FileTreeView) then
      FileTreeView.Root:=Pref.UserDefinedFolder;
    end;
  finally
    box.Free;
  end;
end;

procedure TBagelMainForm.TimerFireSetfocusTimer(Sender: TObject);
begin
  TimerFireSetfocus.Enabled:=False;
end;

procedure TBagelMainForm.ViewMenuSidebarClick(Sender: TObject);
var
  a:TAction;
  i:Integer;
begin
  for i:=0 to WebPanelList.Count-1 do
  begin
    {a:=TAction.Create(Self);
    a.Caption:=StringReplace(WebPanelList.Names[i], '&', '&&', [rfReplaceAll]) ;
    a.Tag := i;
    a.OnExecute := WebPanelItemClick;
    a.ActionList := TActionGenerator(Sender).ActionList;}
  end;
      {SidebarPWebpanel.Clear;


        newMI:=TMenuItem.Create(SidebarPWebPanel);
        newMI.Caption:='-';
        SidebarPWebpanel.Add(newMI);

        newMI:=TMenuItem.Create(SidebarPWebPanel);
        newMI.Action:=actShowWebPanelEditor;
        SidebarPWebpanel.Add(newMI);}
end;

procedure TBagelMainForm.WebPanelItemClick(Sender: TObject);
var
  j:Integer;
  str:String;
begin
  //toggleSidebar('WebPanel');
  if not actWebPanel.Checked then actWebPanel.Execute;
  str:=webpanellist.Strings[TAction(Sender).Tag];
  j:=Pos('=',str);
  WebPanel.LoadURI(RightStr(str,Length(str) - j));
end;


procedure TBagelMainForm.ViewPanelResize(Sender: TObject);
begin
  if SideBasePanel.Align=alNone then begin
    SideBasePanel.Height:=ViewPanel.Height;
    SideBasePanel.Top:=ViewPanel.Top;
  end;
end;

procedure TBagelMainForm.ViewPEncodeClick(Sender: TObject);
  procedure DoCheck(item:TBagelActionContainer;Charset:String);
  var
    i:Integer;
  begin
    for i:=0 to item.Count-1 do begin
      if item.Item[i].Count>0 then begin
        DoCheck(item.Item[i],Charset);
      end
      else begin
        if item.Item[i].Action is TBagelExtCharsetAction then begin
          TBagelExtCharsetAction(item.Item[i].Action).Checked:=(Charset=TBagelExtCharsetAction(item.Item[i].Action).Charset);
        end;
      end;
    end;
  end;
var
  doc:nsIDOMDocument;
  b:TBagelBrowser;
  charset:IInterfacedString;
begin

  b:=GetCurrentBrowser;
  if b=nil then Docheck(EncodeMenu,'')
  else begin
    doc:=b.ContentDocument;
    charset:=NewString;
    (doc as nsIDOMNSDocument).GetCharacterSet(charset.AString);
    DoCheck(EncodeMenu,charset.ToString);
  end;
end;

procedure TBagelMainForm.AutoScrollTimerTimer(Sender: TObject);
var
  win:nsIDOMWindow;
  curPt:TPoint;
begin
  if GetCurrentBrowser=nil then Exit;
  GetCursorPos(curPt);
  if not AutoScrolling then begin
    Self.MouseCapture:=false;
    AutoScrolling:=false;
    AutoScrollTimer.Enabled:=false;
    Panel10.Visible:=False;
    Exit;
  end;
  win := (GetCurrentBrowser.WebBrowser as nsIWebBrowserFocus).FocusedWindow;
  if win=nil then win:= GetCurrentBrowser.ContentWindow;
  win.ScrollBy((curPt.X -AutoScrollOrigPt.X)div 5,(curPt.y -AutoScrollOrigPt.y)div 5);
end;

procedure TBagelMainForm.BackHistoryPopupPopup(Sender: TObject);
var
  i:Integer;
  b:TGeckoBrowser;
  m:TMenuItem;
begin
  BackHistoryPopup.Items.Clear;
  if TabControl.Tabs.Count > 0 then
  begin
    b:=GetCurrentBrowser;
    for i:=0 to b.WebNavigation.SessionHistory.Index-1 do
    begin
      m := TMenuItem.Create(Self);
      m.Caption := b.WebNavigation.SessionHistory.GetEntryAtIndex(0,False).Title;
      m.Tag := i;
      m.OnClick := HistGotoIndex;
      BackHistoryPopup.Items.Insert(0,m);
    end;
  end;
end;

procedure TBagelMainForm.BagelTrayIconDblClick(Sender: TObject);
begin
  actTaskTray.Execute;
end;

procedure TBagelMainForm.ForwardHistoryPopupPopup(Sender: TObject);
var
  i:Integer;
  b:TGeckoBrowser;
  m:TMenuItem;
begin
  ForwardHistoryPopup.Items.Clear;
  if TabControl.Tabs.Count > 0 then
  begin
    b := GetCurrentBrowser;
    for i := b.WebNavigation.SessionHistory.Index+1 to b.WebNavigation.SessionHistory.Count -1 do
    begin
      m := TMenuItem.Create(Self);
      m.Caption := b.WebNavigation.SessionHistory.GetEntryAtIndex(i,False).Title;
      m.Tag := i;
      m.OnClick := HistGotoIndex;
      ForwardHistoryPopup.Items.Add(m);
    end;
  end;
end;

procedure TBagelMainForm.HistGotoIndex(Sender:TObject);
var
  b:TGeckoBrowser;
begin
  b := GetCurrentBrowser;
  b.GotoIndex(TMenuItem(Sender).Tag);
end;

procedure TBagelMainForm.HistorySortByDateClick(Sender: TObject);
begin
  HistoryTree.SortingType := hstDay;
end;

procedure TBagelMainForm.HistorySortBySiteClick(Sender: TObject);
begin
  HistoryTree.SortingType := hstSite;
end;

procedure TBagelMainForm.HistorySortByVisitClick(Sender: TObject);
begin
  HistoryTree.SortingType := hstLastVisited;
end;

procedure TBagelMainForm.bbgSaveTimerTimer(Sender: TObject);
begin
  SaveSnapshot(GetSettingDir()+'Default.bbg');
end;

procedure TBagelMainForm.SearchByNickname(keyword:String;Nickname:String);
var
  i:Integer;
  sl:TStringList;
begin
  sl:=TStringList.Create;
  Pref.IniFile2.ReadSections(sl);
  for i:=0 to sl.Count-1 do begin
    if sl.Strings[i]='Search-List' then continue;
    if Pref.IniFile2.ValueExists(sl.Strings[i],'Shortcut') then begin
      if Nickname=Pref.IniFile2.ReadString(sl.Strings[i],'Shortcut','') then begin
        SearchByEngine(keyword,sl.Strings[i]);
      end;
    end;
  end;
  sl.Free;
end;

{URIが入力された}
procedure TBagelMainForm.OnURIEnter;
//begin
//  AddTab(LocationBox.Text);
var
  already:Integer;
  SpacePos,ZSpacePos:Integer;
  shortcut,keyword:String;
  uri:String;
begin
  SpacePos:=Pos(' ',LocationBox.Text);
  ZSpacePos:=Pos('　',LocationBox.Text);

  if SpacePos>1 then begin
    shortcut:=Copy(LocationBox.Text,1,SpacePos-1);

    keyword:=Copy(LocationBox.Text,SpacePos+1,Length(LocationBox.Text)-SpacePos+1);

    SearchByNickname(keyword,shortcut);
  end
  else if ZSpacePos>1 then begin
    shortcut:=Copy(LocationBox.Text,1,ZSpacePos-1);

    keyword:=Copy(LocationBox.Text,ZSpacePos+1,Length(LocationBox.Text)-ZSpacePos+1);

    SearchByNickname(keyword,shortcut);
  end
  else

  uri:=LocationBox.Text;
  AddTab(uri,Pref.OpenModeLocation,0,'',Pref.DocShellDefault);

  already:=LocationBox.Items.IndexOf(uri);
  if already=-1 then
  begin
    LocationBox.Items.Insert(0,LocationBox.Text);
    Pref.AddrHistory.Insert(0,uri);
  end
  else
  begin
    LocationBox.Items.Move(already,0);
    Pref.AddrHistory.Move(already,0);
  end;
end;


procedure TBagelMainForm.OpenLinkListItemClick(Sender: TObject);
begin
  AddTab(LinkListView.Selected.SubItems.Strings[0],0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.LoadURI(URI:String);
begin
  //
end;

{LocationBoxのリサイズを行う}
procedure TBagelMainForm.LocationBarResize(Sender: TObject);
begin
  LocationBox.Width := LocationBar.Width - GoButton.Width;
end;
{Geckoのプリントプレビューを開始}
procedure TBagelMainForm.DoPrintPreview;
var
  b:TBagelBrowser;
  Print:nsIWebBrowserPrint;
  ps:nsIPrintSettings;
begin
  b:=GetCurrentBrowser;
  if b=nil then Exit;
  //actPrintPreview.Checked:=not actprintPreview.checked;
  //if actprintPreview.Checked then begin


    Print:=b.WebBrowserPrint;
    ps:=GetPrintSettings;

    Print.PrintPreview(ps,nil,nil);
  //end;
end;
procedure TBagelMainForm.edtMemoSearchChange(Sender: TObject);
begin
  if lvMemo.Selected=nil then exit;
  TBagelMemoItem(lvMemo.Selected.Data).Title:=edtMemoTitle.Text;
  lvMemo.Selected.Caption:=edtMemoTitle.Text;
end;


procedure TBagelMainForm.edtMemoSearchKeyPress(Sender: TObject; var Key: Char);
var
  memo:TBagelMemo;
  mitem:TBagelMemoItem;
  litem:TListitem;
  i:Integer;
begin
  if TabControl2.Tabs.Count=0 then Exit;
  if Key = chr(VK_RETURN) then begin
    lvMemo.Clear;
    memo:=TBagelMemo(TabControl2.Tabs.Objects[tabcontrol2.TabIndex]);
    for i:=0 to memo.Count-1 do begin
      mitem:=memo.Items[i];
      if (edtmemoSearch.Text='') or
         (Pos(edtmemoSearch.Text,mitem.Title)>0) or
         (Pos(edtmemoSearch.Text,mitem.Content)>0) then begin
        litem:=lvMemo.Items.Add;
        litem.Caption:=mitem.Title;
        litem.Data:=mitem;
        if lvMemo.Items.Count>0 then
        lvMemo.Selected:=lvMemo.Items.Item[0];
        lvMemoSelectItem(nil,lvMemo.Items.Item[0],true);
      end;
    end;
  end;
end;


{Geckoのプリントプレビューを終了}
procedure TBagelMainForm.ExitPrintPreview;
var
  b:TBagelBrowser;
begin
  b:=GetCurrentBrowser;
  if b=nil then Exit;
//    actprintPreview.Checked:=not actprintPreview.checked;
    b.WebBrowserPrint.ExitPrintPreview;
end;
{プリントプレビューの準備}
procedure TBagelMainForm.PrepareForPP;
begin
  MainCoolbar.Enabled:=false;
  MainCoolbar.Visible:=false;

  FOldStatusbarVisible:=StatusBar.Visible;
  StatusBar.Visible:=false;

  Panel12.Visible:=true;

  FOldSidebarVisible:=SidebasePanel.Visible;
  SidebasePanel.Visible:=false;

  SidebarTogglePanel.Visible:=false;
  actionlist1.State:=asSuspended;
end;
{プリントプレビュー前のウィンドウの状態を復元}
procedure TBagelMainForm.RestorePrePPState;
begin
  Panel12.Visible:=false;
  MainCoolbar.Enabled:=True;
  MainCoolbar.Visible:=True;
  StatusBar.Visible:=FOldStatusbarVisible;
  SidebarTogglePanel.Visible:=true;
  SideBasePanel.Visible:=FOldSidebarVisible;
  actionlist1.State:=asNormal;
end;
procedure TBagelMainForm.RewindPopupPopup(Sender: TObject);
var
  histPos:Integer;
  i:Integer;
  b:TGeckoBrowser;
  hostStr:IInterfacedCString;
  oldHost:String;
  j:Integer;
  entry:nsIHistoryEntry;
  m:TMenuItem;
begin
  oldHost:='';
  hostStr:=NewCString;
  b:=GetCurrentBrowser;
  j := 0;
  RewindPopup.Items.Clear;
  if b<>nil then
  begin
    histPos := b.WebNavigation.SessionHistory.Index;
    entry := b.WebNavigation.SessionHistory.GetEntryAtIndex(histPos,False);
    entry.URI.GetHost(hostStr.ACString);
    oldHost:=hostStr.ToString;
    for i:=histPos-1 downto 0 do
    begin
      b.WebNavigation.SessionHistory.
      GetEntryAtIndex(i,False).URI.GetHost(hostStr.ACString);
      if hostStr.ToString <> oldHost then
      begin
        j := i+1;
        Break;
      end;
    end;
    if j <> histPos then begin
      m := TMenuItem.Create(Self);
      m.Caption :=  b.WebNavigation.SessionHistory.
                    GetEntryAtIndex(j,False).Title;
      m.Tag := j;
      m.OnClick := HistGotoIndex;
      RewindPopup.Items.Add(m);
    end;
    for i:=i downto 0 do
    begin
      b.WebNavigation.SessionHistory.
      GetEntryAtIndex(i,False).URI.GetHost(hostStr.ACString);
      if hostStr.ToString <> oldHost then
      begin
        m := TMenuItem.Create(Self);
        m.Caption :=  b.WebNavigation.SessionHistory.
                      GetEntryAtIndex(i,False).Title;
        m.Tag := i;
        m.OnClick := HistGotoIndex;
        RewindPopup.Items.Add(m);
        
        oldHost := hostStr.ToString;
      end;
    end;
  end;
end;

{名前を付けて保存}
procedure TBagelMainForm.actSaveAsExecute(Sender: TObject);
begin
  if GetCurrentBrowser<>nil then
    SaveDocument(GetCurrentBrowser.ContentDocument,False);
end;
{スクリプトサイドバーを表示}
procedure TBagelMainForm.actScriptSidebarExecute(Sender: TObject);
begin
  if actScriptSidebar.Checked then begin
    PageControl1.ActivePage:=ScriptSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;
procedure TBagelMainForm.actSearchSelectionExecute(Sender: TObject);
var
  selstr:String;
  b:TBagelBrowser;
  aDOMW:nsIDOMWindow;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  //str := GetSelectionFromWin(b.ContentWindow);
  aDOMW := (b.WebBrowser as nsIWebBrowserFocus).FocusedWindow;
  if aDOMW=nil then Exit;
  selstr := GetSelectionStrFromWin(aDOMW);

  DoSearch(selstr);

  //NS_GetService('@mozilla.org/intl/texttosuburi;1',nsITextToSubURI,conv);


  {slGroup:=TStringList.Create ;
    engineName := EngineBox.Items.Strings[EngineBox.ItemIndex];

    if Pref.IniFile2.ReadInteger(engineName,'Group',0)=0 then
    begin
      encode:=Pref.IniFile2.ReadInteger(engineName,'Encode',0);

      if encode=3 then charset:=PChar('UTF-8')
      else if encode=2 then charset:=PChar('EUC-JP')
      else charset:=PChar('Shift_JIS');
      conv.ConvertAndEscape(charset,keyword,pquery);
      front := Pref.IniFile2.ReadString(engineName,'FrontURL','');
      back := Pref.IniFile2.ReadString(engineName,'BackURL','');
      AddTab(front+String(pquery)+back,0,0,'',Pref.DocShellDefault);
    end
    else
    begin
      Pref.IniFile2.ReadSectionValues(engineName,slGroup);
      for i:=0 to slGroup.Count-1 do
      begin
        engineName := slGroup.Values[slGroup.Names[i]];
        if Length(slGroup.Names[i])=2 then//BAD HACK!
        begin
         encode:=Pref.IniFile2.ReadInteger(engineName,'Encode',0);
         if encode=3 then charset:=PChar('UTF-8')
         else if encode=2 then charset:=PChar('EUC-JP')
         else charset:=PChar('Shift_JIS');

         conv.ConvertAndEscape(charset,keyword,pquery);
         front := Pref.IniFile2.ReadString(engineName,'FrontURL','');
         back := Pref.IniFile2.ReadString(engineName,'BackURL','');
         AddTab(front+String(pquery)+back,0,0,'',Pref.DocShellDefault);
        end;
      end;
    end;}
end;

procedure TBagelMainForm.actSelectAllExecute(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  NS_GetInterface(b.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.SelectAll;
  //if canCopy then clipCmd.CopySelection;
end;

procedure TBagelMainForm.actSelectNoneExecute(Sender: TObject);
var
  clipCmd:nsIClipboardCommands;
  //canCopy:Longbool;
  b:TBagelBrowser;
begin
  b:=GetBrowser(tabBarCtxTarget);
  if b=nil then Exit;
  NS_GetInterface(b.WebBrowser,NS_ICLIPBOARDCOMMANDS_IID,clipCmd);
  clipCmd.SelectNone;
end;

procedure TBagelMainForm.actSettingsExecute(Sender: TObject);
var
	f:TBagelSettingForm;
begin
	f:=TBagelSettingForm.Create(nil);
	f.ShowModal;
  UpdatePrefs;
end;

{クッキーマネージャを表示}
procedure TBagelMainForm.actShowAdblockManExecute(Sender: TObject);
var
  f:TBagelSettingForm;
begin
  f:=TBagelSettingForm.Create(nil);
  f.SetCurrentSheet(f.AdblockSheet);
  f.ShowModal;
end;

procedure TBagelMainForm.actShowBkmkImportFormExecute(Sender: TObject);
var
  f:TfrmImportNetscape;
begin
  f:=TfrmImportNetscape.Create(Application);
  f.ShowModal;
end;

procedure TBagelMainForm.actShowCookieManExecute(Sender: TObject);
var
  f:TfrmCookieMan;
begin
  f:=TfrmCookieMan.Create(Self);
  f.ShowModal;
end;
{P3Pの設定を表示}
procedure TBagelMainForm.actShowCookieP3PCustomSettingExecute(Sender: TObject);
var
  f:TfrmCookieP3PCustom;
begin
  f:=TfrmCookieP3PCustom.Create(Self);
  f.ShowModal;
end;
procedure TBagelMainForm.actShowCtxBgImageExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetCurrentBrowser;
  if b<>nil then b.LoadURI(currentCtxBGImg);
end;

procedure TBagelMainForm.actShowCtxImageExecute(Sender: TObject);
var
  b:TGeckoBrowser;
begin
  b:=GetCurrentBrowser;
  if b<>nil then b.LoadURI(currentCtxImg);
end;

{アドレスバー拡張の編集}
procedure TBagelMainForm.actShowExtGoEditorExecute(Sender: TObject);
var
  f:TfrmExtGoEditor;
begin
  f:=TfrmExtGoEditor.Create(Self);
  f.ShowModal;
end;
procedure TBagelMainForm.actShowIEImportFormExecute(Sender: TObject);
var
  f:TfrmImportIE;
begin
  f:=TfrmImportIE.Create(Application);
  f.ShowModal;
end;

procedure TBagelMainForm.actShowImgManExecute(Sender: TObject);
var
  f:TBagelSettingForm;
begin
  f:=TBagelSettingForm.Create(nil);
  f.SetCurrentSheet(f.ImageSheet);
  f.ShowModal;
end;

{ページ情報}
procedure TBagelMainForm.actShowPageInfoExecute(Sender: TObject);
var
  f:TfrmPageInfo;
  b:TBagelBrowser;
  doc:nsIDOMDocument;
  nsdoc:nsIDOMNSDocument;
  htmldoc:nsIDOMNSHTMLDocument;
  str:IInterfacedString;
  cstr:IInterfacedCString;
  cacheService:nsICacheService;
  httpSession:nsICacheSession;
  ftpSession:nsICacheSession;
  desc:nsICacheEntryDescriptor;
  cacheKey:IInterfacedCString;
  deviceID:PChar;
  uri:String;
begin
  if TabControl.Tabs.Count>0 then begin
    b:=GetBrowser(tabBarCtxTarget);
    f:=TfrmPageInfo.Create(Self);
    str:=NewString;
    cstr:=NewCString;
    doc:=b.ContentDocument;

    if Supports(doc,nsIDOMNSDocument,nsdoc) then begin
      nsdoc.GetTitle(str.AString);
      f.edtTitle.Text:=str.ToString;
      nsdoc.GetContentType(str.AString);
      f.edtMIMEType.Text:=str.ToString;
      nsdoc.GetCharacterSet(str.AString);
      f.edtEncoding.Text:=str.ToString;
      nsdoc.GetReferrer(str.AString);
      f.edtReferer.Text:=str.ToString;
      if f.edtReferer.Text='' then f.edtReferer.Text:='なし';
      nsdoc.GetLastModified(str.AString);
      f.edtLastModified.Text:=str.ToString;
    end;

    if Supports(doc,nsIDOMNSHTMLDocument,htmldoc) then begin
      htmldoc.GetCompatMode(str.AString);//BackCompat
      if String(str.ToString)='BackCompat' then
      f.edtRenderingMode.Text:='後方互換モード'
      else f.edtRenderingMode.Text:='標準準拠モード'
    end;

    NS_GetService('@mozilla.org/network/cache-service;1',nsICacheService,cacheService);
    httpSession := cacheService.CreateSession(PChar('HTTP'),0,true);
    ftpSession := cacheService.CreateSession(PChar('FTP'),0,true);
    httpSession.DoomEntriesIfExpired := false;
    ftpSession.DoomEntriesIfExpired := false;

    uri:=b.URI;
    cacheKey:=NewCString;
    cacheKey.Assign(uri);

    desc := httpSession.OpenCacheEntry(cachekey.ACString,ns_ICache_ACCESS_READ,false);
    {NS_FAILED(rv)}if desc=nil then begin
      //desc:=nil;
      desc := ftpSession.OpenCacheEntry(cachekey.ACString,ns_ICache_ACCESS_READ,false);
    end;

    if desc<>nil then begin
      deviceID:=desc.DeviceID;
      if deviceID='disk' then f.edtCacheType.Text:='ディスクキャッシュ'
      else if deviceID='memory' then f.edtCacheType.Text:='メモリキャッシュ'
      else f.edtCacheType.Text:=deviceid;

      f.edtSize.Text:=IntToStr(desc.DataSize div 1024) + 'KB';

      {desc.GetExpirationTime(expire);
      f.edtExpire.Text:=IntToStr(expire*1000);}
    end;

    f.ShowModal;
  end;

end;
procedure TBagelMainForm.actShowPageInfoUpdate(Sender: TObject);
begin
  if TabControl.Tabs.Count>0 then actShowPageInfo.Enabled:=true
  else actShowPageInfo.Enabled:=false;
end;
{ページ設定}
procedure TBagelMainForm.actShowPageSetupExecute(Sender: TObject);
var
  f:TfrmPageSetup;
  b:TBagelBrowser;
begin
  b:=GetCurrentBrowser;
  if b=nil then Exit;

  f:=TfrmPageSetup.Create(Self);
  f.Settings := GetPrintSettings;
  f.ShowModal;
  f.Free;
end;
{プリント設定を取得}
function TBagelMainForm.GetPrintSettings:nsIPrintSettings;
var
  ps:nsIPrintSettings;
  pss:nsIPrintSettingsService;
  defPrinterName,printerName:PWideChar;
begin
  NS_GetService('@mozilla.org/gfx/printsettings-service;1',nsIPrintSettingsService,pss);
  ps:=pss.GlobalPrintSettings;
  printerName := ps.PrinterName;
  if printerName=nil then begin
    defPrinterName := pss.DefaultPrinterName;
    ps.SetPrinterName(defPrinterName);
    printerName:=defPrinterName;
  end;
  pss.InitPrintSettingsFromPrinter(printerName,ps);
  pss.InitPrintSettingsFromPrefs(ps,true,NS_IPRINTSETTINGS_kInitSaveAll);
  nsMemory.Free(printerName);
  Result:=ps;
end;
{アドレス入力ならびにアドレスバー拡張の表示}
procedure TBagelMainForm.LocationBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  pt,pt2:TPoint;
begin
  {if FAutoComplete.Visible then begin
    if Key=VK_UP then begin
//
      if FAutoComplete.ActiveIndex=-1 then begin
        FAutoComplete.ActiveIndex:=FAutoComplete.Items.Count-1;
      end
      else if FAutoComplete.ActiveIndex>=0 then
        FAutoComplete.ActiveIndex:=FAutoComplete.ActiveIndex-1;

      Key:=0;
    end
    else if Key=VK_DOWN then begin
      if FAutoComplete.ActiveIndex<FAutoComplete.Items.Count-1 then
        FAutoComplete.ActiveIndex:=FAutoComplete.ActiveIndex+1
      else if FAutoComplete.ActiveIndex = FAutoComplete.Items.Count-1 then begin
        FAutoComplete.ActiveIndex:=-1;
      end;
      Key:=0;
    end
    else if Key=VK_RETURN then begin
      if FAutoComplete.ActiveIndex>=0 then begin
        AddTab(FAutoComplete.Items.Strings[FAutoComplete.ActiveIndex],Pref.OpenModeLocation,0,'',Pref.DocShellDefault);
      end
      else begin
        ToolButtonGo.Click;
        Key:=0;
      end;
    end
    else if Pref.UseAddAutoComplete then begin
      AutoCompDelayedExec.Enabled:=false;
      AutoCompDelayedExec.Enabled:=true;
    end;

  end}
  if Key=VK_Return then begin
    OnURIEnter();
    Key:=0;
  {end
  else begin
    if Pref.UseAddAutoComplete then begin
      AutoCompDelayedExec.Enabled:=false;
      AutoCompDelayedExec.Enabled:=true;
    end;}
  end
  else if (Key=VK_DOWN) and (ssCtrl in Shift) then begin
    pt.X:=0;
    pt.Y:=LocationBox.Height;
    pt2:=LocationBox.ClientToScreen(pt);
    GoButtonPopup.Popup(pt2.X,pt2.Y);
    Key:=0;
  end
end;


procedure TBagelMainForm.lvMemoDblClick(Sender: TObject);
begin
  if lvMemo.Selected=nil then exit;
  edtMemoTitle.SetFocus;
end;

procedure TBagelMainForm.lvMemoDrawItem(Sender: TCustomListView; Item: TListItem;
  Rect: TRect; State: TOwnerDrawState);
var
  tmpIntg:Integer;
  //rect2:TRect;
  colonpos:Integer;
  str:string;
  content:String;
  tags:String;
  title:String;

begin
  //rect2:=Item.DisplayRect(drLabel);
  //DefaultDraw := false;
  str:=TBagelMemoitem(item.data).Title;
  content:=Copy(TBagelMemoitem(item.data).Content,1,16);
  colonpos:=Pos(':',str);
  tags:=Copy(str,1,colonPos-1);
  Delete(str,1,colonPos);
  title:=str;
  if odSelected in State then begin
    lvMemo.Canvas.Brush.Color:=clHighlight;
    lvMemo.Canvas.FillRect(Rect);
    lvMemo.Canvas.Font.Style:=[];
    lvMemo.Canvas.Font.Color := clyellow;
    lvMemo.Canvas.TextOut(rect.Left+5,rect.Top,tags);
    tmpIntg:=lvMemo.Canvas.TextWidth(tags);
    lvMemo.Canvas.Font.Style := [fsBold];
    lvMemo.Canvas.Font.Color := clHighlightText;
    lvMemo.Canvas.TextOut(rect.Left+tmpIntg+10,rect.Top,title);
    tmpIntg:=tmpIntg + lvMemo.Canvas.TextWidth(title);
    lvMemo.Canvas.Font.Style := [];
    lvMemo.Canvas.Font.Color := clHighlightText;
    lvMemo.Canvas.TextOut(rect.Left+tmpIntg + 15,rect.Top,content);
  end
  else begin
    lvMemo.Canvas.Brush.Color:=clWindow;
    lvMemo.Canvas.FillRect(Rect);
    lvMemo.Canvas.Font.Style:=[];
    lvMemo.Canvas.Font.Color := clGreen;
    lvMemo.Canvas.TextOut(rect.Left+5,rect.Top,tags);
    tmpIntg:=lvMemo.Canvas.TextWidth(tags);
    lvMemo.Canvas.Font.Style := [fsBold];
    lvMemo.Canvas.Font.Color := clWindowText;
    lvMemo.Canvas.TextOut(rect.Left+tmpIntg+10,rect.Top,title);
    tmpIntg:=tmpIntg + lvMemo.Canvas.TextWidth(title);
    lvMemo.Canvas.Font.Style := [];
    lvMemo.Canvas.Font.Color := clInactiveCaption;
    lvMemo.Canvas.TextOut(rect.Left+tmpIntg + 15,rect.Top,content);
  end;
end;

procedure TBagelMainForm.lvMemoEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
  AllowEdit:=False;
end;

procedure TBagelMainForm.lvMemoSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  myitem:TBagelMemoItem;
begin
  if (not Selected) or (Item=nil) then begin
    edtMemoTitle.Enabled:=False;
    edtMemoTitle.Text:='';
    memoMemo.Enabled:=false;
    memoMemo.Text:='';
  end
  else begin
    edtMemoTitle.Enabled:=True;
    memoMemo.Enabled:=True;
    myitem:=TBagelMemoItem(Item.data);
    memoMemo.Text:=myitem.Content;
    edtMemoTitle.Text:=myitem.Title;
  end;
end;

procedure TBagelMainForm.memoMemoChange(Sender: TObject);
begin
  if lvMemo.Selected=nil then exit;
  TBagelMemoItem(lvMemo.Selected.Data).Content:=memoMemo.Text;
end;

{サイドバーのリサイズ処理}
procedure TBagelMainForm.Panel1Resize(Sender: TObject);
begin
  PageControl1.Width:=Panel1.Width+8;
  PageControl1.Left:=-4;
  PageControl1.Height:=Panel1.Height+8;//-SidebarHeaderPanel.Height;
  PageControl1.Top:=-5;
  //if SidebarHeaderToolbar.Visible then
  //SidebarHeaderPanel.Height+ SidebarHeaderToolbar.Height - 5
  //else PageControl1.Top:=SidebarHeaderPanel.Height-5;
end;
procedure TBagelMainForm.Panel5Resize(Sender: TObject);
begin
  bkmkSearchEdit.Width:=Panel5.ClientWidth;
end;

procedure TBagelMainForm.Panel6Resize(Sender: TObject);
begin
  cmbGrepKeyword.Width:=Panel6.Width;
  cmbGrepKind.Width:=Panel6.Width;
  cboGrepTarget.Width:=Panel6.Width;
end;

procedure TBagelMainForm.Panel7Resize(Sender: TObject);
begin
  edtHistorySearch.Width:=Panel7.Width;
end;

{スプリッタの動作}
procedure TBagelMainForm.SidebarHeaderButtonbarResize(Sender: TObject);
begin
  if SidebarHeaderButtonbar.Height+4<>SidebarHeaderPanel.Height then
  SidebarHeaderPanel.Height := SidebarHeaderButtonbar.Height+4;
end;

procedure TBagelMainForm.SidebarTogglePanelClick(Sender: TObject);
begin
  actToggleSidebarVisible.Execute;
end;

procedure TBagelMainForm.SidePanelResize(Sender: TObject);
begin
  if LoadCompleted then
  Pref.SidebarWidth:=SideBasePanel.Width;
end;

procedure TBagelMainForm.SideSplitterMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Client,MousePos:Tpoint;
begin
  if Button=mbLeft then begin
    SplitterPressed:=true;
    GetCursorPos(MousePos);
    Client:=SideSplitter.ScreenToClient(MousePos);
    SplitterStptROffset := SideSplitter.Width - Client.X;
  end;
end;
procedure TBagelMainForm.SideSplitterMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Client,MousePos:Tpoint;
begin
  if SplitterPressed then begin
    GetCursorPos(MousePos);
    Client:=SideBasepanel.ScreenToClient(MousePos);
    SideBasepanel.Width:=Client.X+SplitterStptROffset;
  end;
end;
procedure TBagelMainForm.SideSplitterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SplitterPressed:=false;
end;

procedure TBagelMainForm.actAddTabHomeExecute(Sender: TObject);
begin
  AddTab(Pref.Homepage,0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actAllowFramesExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then
  GetBrowser(tabBarCtxTarget).DocShell.AllowSubframes:=(actAllowFrames.Checked);
  actAllowFrames.Update;
end;

procedure TBagelMainForm.actAllowImgExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then
  GetBrowser(tabBarCtxTarget).DocShell.AllowImages:=(actAllowImg.Checked);
  actAllowImg.Update;
end;

procedure TBagelMainForm.actAllowJSExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then
  GetBrowser(tabBarCtxTarget).DocShell.AllowJavascript:=actAllowJS.Checked;
  actAllowJS.Update;
end;

procedure TBagelMainForm.actAllowPluginsExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then
  GetBrowser(tabBarCtxTarget).DocShell.AllowPlugins:=actAllowPlugins.Checked;
  actAllowPlugins.Update;
end;

procedure TBagelMainForm.actAllowRedirectExecute(Sender: TObject);
begin
  if GetBrowser(tabBarCtxTarget)<>nil then
  GetBrowser(tabBarCtxTarget).DocShell.AllowMetaRedirects :=
    actAllowRedirect.Checked;
  actAllowRedirect.Update;
end;

procedure TBagelMainForm.actBagelHelpExecute(Sender: TObject);
begin
  AddTab('http://ipt.sakura.ne.jp/gecko/farm/wiki.cgi/BagelManual',0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actBagelSiteExecute(Sender: TObject);
begin
  AddTab('http://ipt.sakura.ne.jp/gecko/bagel/',0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.actBlockCtxImageExecute(Sender: TObject);
var
  PM:nsIPermissionManager;
  u:nsIURI;
  //Perm:Cardinal;
  host:IInterfacedCString;
  scheme:IInterfacedCString;
(*
PRUint32  	 UNKNOWN_ACTION  	= 0
PRUint32  	 ALLOW_ACTION  	= 1
PRUint32 	DENY_ACTION 	= 2
*)
begin
  host:=NewCString('');
  scheme:=NewCString('');
  u := NS_NewURI(currentCtxImg);
  u.GetHost(host.ACString);
  u.GetScheme(scheme.ACString);
  u := NS_NewURI(scheme.ToString+'://'+host.ToString);
  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,PM);
  //ShowMessage(cstr.ToString);

  if actBlockCtxImage.Checked then//Deny
  begin
    pm.Add(u,PChar('image'),2);
  end
  else//Allow or Unknown
  begin
    Pm.Remove(host.ACString,PChar('image'));
  end;
end;

procedure TBagelMainForm.actBookmarkEditorExecute(Sender: TObject);
var
  f:TfrmBookmarkEditor;
begin
  f:=TfrmBookmarkEditor.Create(nil);
  //FBookmarkEditor:=f;
  f.RootBookmark := bookmarks;
  f.BaseFolder := bookmarks;
  f.SmallImages := ImageList1;
  f.Show;
end;

procedure TBagelMainForm.actBookmarkPropertyExecute(Sender: TObject);
var
  f:TBookmarkForm;
begin
  f:=TBookmarkForm.Create(Self);
  f.mode:='property';
  f.target:=TBookmark(BookmarksTree.Selected.Data);
  f.Show;
end;

procedure TBagelMainForm.actBookmarkPropertyUpdate(Sender: TObject);
begin
  if BookmarksTree.Selected = nil then actBookmarkProperty.Enabled := false
  else actBookmarkProperty.Enabled := true;
end;

procedure TBagelMainForm.actBookmarkSidebarExecute(Sender: TObject);
begin
  if actBookmarkSidebar.Checked then begin
    PageControl1.ActivePage:=BookmarkSheet;
    SidebarSelector.Caption:=PageControl1.ActivePage.Caption;
    if not actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end
  else begin
    if actToggleSidebarVisible.Checked then actToggleSidebarVisible.Execute;
  end;
end;

//▼マウスジェスチャー関係
//------------------------------------------------------------------------------
procedure TBagelMainForm.CookiePLifeTimeClick(Sender: TObject);
var
  gp:TGeckoPref;
  val:Integer;
begin
  gp:=TGeckoPref.Create;
  //Cookie保存期間
  //pref("network.cookie.lifetimePolicy",       0);
  //0-accept normally
  //1-askBeforeAccepting
  //2-acceptForSession
  //3-acceptForNDays
  val:=gp.GetIntPref('network.cookie.lifetimePolicy');
  if val=0 then begin
    CookieLifetimeNormal.Checked:=true;
  end
  else if val=1 then begin
    CookieLifetimeAskEach.Checked:=true;
  end
  else if val=2 then begin
    CookieLifetimeSession.Checked:=true;
  end
  //本当はこのあと3が入る
  else begin
  end;
  gp.Free;
end;

procedure TBagelMainForm.CookieLifetimeNormalClick(Sender: TObject);
var
  gp:TGeckoPref;
begin
  gp:=TGeckoPref.Create;
  gp.SetIntPref('network.cookie.lifetimePolicy',0);
  gp.Free;
end;

procedure TBagelMainForm.CookieLifetimeSessionClick(Sender: TObject);
var
  gp:TGeckoPref;
begin
  gp:=TGeckoPref.Create;
  gp.SetIntPref('network.cookie.lifetimePolicy',2);
  gp.Free;
end;

procedure TBagelMainForm.CookieLifetimeAskEachClick(Sender: TObject);
var
  gp:TGeckoPref;
begin
  gp:=TGeckoPref.Create;
  gp.SetIntPref('network.cookie.lifetimePolicy',1);
  gp.Free;
end;

procedure TBagelMainForm.DenyAllowCookieMenuClick(Sender: TObject);
var
  cookieBehavior:Integer;
  p3plevel:Integer;
  p3pval: Array [ 0..2 ] of String;
  gp:TGeckoPref;
begin
  //Tagの1の位がビヘイビア
  //10の位がp3pレベル
  gp:=TGeckoPref.Create;
  cookieBehavior:=TMenuItem(Sender).Tag mod 10;
  p3plevel:=TMenuItem(Sender).Tag div 10;

  //	    = ( 'afafaaaa', 'ffffaaaa', 'frfradaa');
  p3pval[0]:='afafaaaa';
  p3pval[1]:='ffffaaaa';
  p3pval[2]:='frfradaa';

{ pref("network.cookie.cookieBehavior",       0);
   0-Accept,
   1-dontAcceptForeign,
   2-dontUse,
   3-p3p
}
  case cookieBehavior of
   0..2:gp.SetIntPref('network.cookie.cookieBehavior',cookieBehavior);//Accept
   //1:DenyOtherSiteCookie.Checked:=true;//dontAcceptForeign
   //2:DenyAllCookie.Checked:=true;//dontUse
   3:begin
     gp.SetIntPref('network.cookie.cookieBehavior',3);
//     gp.SetIntPref();
     case p3plevel of //p3p
       0..2:begin //low medium high
         gp.SetIntPref('network.cookie.p3plevel',p3plevel);
         gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(p3pval[p3plevel]));
       end;
       3:begin//custom
         gp.SetIntPref('network.cookie.p3plevel',3);
         gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(Pref.CookieP3PCustom));
       end;
     else
     end;
   end;
  else
  end;

{
  // The following default value is for p3p medium mode.
  // See xpfe/components/permissions/content/cookieP3P.xul for the definitions of low/medium/hi
  pref("network.cookie.p3p",                  "ffffaaaa");
  pref("network.cookie.p3plevel",             1); // 0=low, 1=medium, 2=high, 3=custom
}
end;

procedure TBagelMainForm.ThisSiteCookieClick(Sender: TObject);
var
  pm:nsIPermissionManager;
  permission:Cardinal;
  chost:nsACString;
  ichost:IInterfacedCString;
begin
  //このサイトのCookie
  ichost:=NewCString('');
  chost:=ichost.ACString;

  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  permission := pm.TestPermission(StrToURI(GetBrowser(tabBarCtxTarget).URI), PChar('cookie'));
  if permission=Cardinal(TMenuItem(Sender).Tag) then exit;
  if TMenuItem(Sender).Tag=ns_IPermissionManager_UNKNOWN_ACTION then begin
    StrToURI((GetBrowser(tabBarCtxTarget)).URI).GetHost(chost);
    pm.Remove(chost,'cookie');
  end;
  pm.Add(StrToURI(GetBrowser(tabBarCtxTarget).URI),PChar('cookie'),TMenuItem(Sender).Tag);
//  pm.add(uri, "cookie", nsICookiePermission.ACCESS_SESSION);
  {case permission of
    NS_IPERMISSIONMANAGER_ALLOW_ACTION:AllowThisSiteCookie.Checked:=True;
    8:AllowThisSiteSessionCookie.checked:=true;//ACCESS_SESSION
    ns_IPermissionManager_UNKNOWN_ACTION:ObeyDefaultThisSiteCookie.checked:=true;
    ns_IPermissionManager_DENY_ACTION:DenyThisSiteCookie.Checked:=true;
  else
  end;}
end;


procedure TBagelMainForm.ObserveClipListClick(Sender: TObject);
begin
  AddTab(ObserveClipList.Items.Strings[ObserveClipList.ItemIndex],0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.OnGestureMessage(var Msg: TMsg; var Handled: boolean);
var
  obj:TObject;
begin

  case Msg.message of
  WM_MOUSEMOVE:
    if Msg.wParam = MK_RBUTTON then
    begin
      MoveGesture(Msg.pt);

      obj:=FindAction(Pref.GestList.Values[moveGestureTemp]);
      if (obj<>nil) and (obj is TCustomAction) then
      begin
        StatusBar.Panels[0].Text:=moveGestureTemp+' : '+TCustomAction(obj).Caption;
      end
      else begin
        StatusBar.Panels[0].Text:=moveGestureTemp;
      end;

      Handled := true;
    end
    else if  GetMouseInPane(SidebarTogglepanel) then //サイドバー開閉バーの上
    begin
      if Pref.SidebarAutoHide then
      begin
        if (not actToggleSidebarVisible.Checked) then begin
          if Pref.SidebarAutoOpenDelay=0 then
            actToggleSidebarVisible.Execute
          else begin
            DelayedSidebarToggler.Interval:=Pref.SidebarAutoOpenDelay;
            DelayedSidebarToggler.Enabled:=true;
          end;
        end
        else begin
          if DelayedSidebarToggler.Enabled then begin
            DelayedSidebarToggler.Enabled:=false;
          end;
        end;
      end;
    end
    else if GetMouseInPane(SideBasePanel) then //サイドバー領域内
    begin
      if DelayedSidebarToggler.Enabled then begin
        DelayedSidebarToggler.Enabled:=false;
      end;
    end
    else if not SplitterPressed then begin
      //サイドバー領域外かつスプリッタを動かしていない
      if Pref.SidebarAutoHide and actToggleSidebarVisible.Checked then
      begin
        if Pref.SidebarAutoHideDelay=0 then
          actToggleSidebarVisible.Execute
        else begin
          DelayedSidebarToggler.Interval:=Pref.SidebarAutoHideDelay;
          DelayedSidebarToggler.Enabled:=true;
        end;
      end;
    end;
  WM_LBUTTONUP:
  	if clickGestureStandby then
    begin
      clickGestureStandby := false;
      Handled := true;
      FireCommand(Pref.RLeftClick);
      restrainContext:=true;
    end;
  WM_MBUTTONUP:
    if clickGestureStandby then
    begin
      clickGestureStandby := false;
      Handled := true;
      FireCommand(Pref.RWheelClick);
      restrainContext:=true;

    end;
  WM_XBUTTONUP:
    if clickGestureStandby then
    begin
      clickGestureStandby := false;
      Handled := true;
      if (GetKeyState(VK_RBUTTON) < 0) then
      begin
        restrainContext := true;
        case HiWord(Msg.wParam) of
          MK_XBUTTON1:
          FireCommand(Pref.RSide1Click);
          MK_XBUTTON2:
          FireCommand(Pref.RSide2Click);
        end
      end
      else begin
        case HiWord(Msg.wParam) of
          MK_XBUTTON1:
          FireCommand(Pref.Side1Click);
          MK_XBUTTON2:
          FireCommand(Pref.Side2Click);
        end;
       	restrainContext := false;
      end;
    end;
  WM_LBUTTONDOWN:
  	if Msg.wParam = (MK_RBUTTON + MK_LBUTTON) then
    begin
      clickGestureStandby := true;
      Handled := true;

    end;
  WM_MBUTTONDOWN:
  	if Msg.wParam = (MK_RBUTTON + MK_MBUTTON) then
    begin
      clickGestureStandby := true;
      Handled := true;

    end;
  WM_XBUTTONDOWN:
    if (HiWord(Msg.wParam) = MK_XBUTTON1) or
       (HiWord(Msg.wParam) = MK_XBUTTON2) then
    begin
      clickGestureStandby := true;
      Handled := (GetKeyState(VK_RBUTTON) < 0);
    end;
  WM_MOUSEWHEEL:

    if LoWord(Msg.wParam) = MK_RBUTTON then
    begin

      if (Msg.wParam > 0) then
        FireCommand(Pref.RWheelUp)
      else
        FireCommand(Pref.RWheelDown);
      Handled := true;
      restrainContext:=true;
    end;
  WM_RBUTTONDOWN:
    begin
      moveGestureTemp := '';
      prevPoint := Msg.pt;
      Handled := false;
    end;
  WM_RBUTTONUP:
    begin
     	if (moveGestureTemp <> '') and (Msg.wParam = 0) then
        begin
          FireGesture(moveGestureTemp);
        end;
      if clickGestureStandby then begin
       	clickGestureStandby := false;
      end;

    end;
  end;
end;

//移動の処理
procedure TBagelMainForm.MemoSheetShow(Sender: TObject);
var
  memo:TBagelMemo;
  memoitem:TBagelMemoItem;
//  i:Integer;
//  item:TListItem;
  DirectoryName:String;
  SearchRec: TSearchRec;
begin
  if MemoSheet.Tag=0 then begin
    DirectoryName:=GetSettingDir()+'memo';
    // 一番後ろに '\' がついていなければ付ける
      DirectoryName:= IncludeTrailingBackslash(DirectoryName);

    // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
    if 0=FindFirst(DirectoryName+'*.*', faAnyFile, SearchRec) then try
      repeat
        if SearchRec.Attr and faDirectory <> 0 then begin
          // カレントディレクトリや親ディレクトリをスキップ
          if (SearchRec.Name='.') and (SearchRec.Name='..') then
            Continue;
          // ディレクトリに対する処理
          // SearchRec.Name にディレクトリ名が入っている
          // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
        end else begin
          // ファイルに対する処理
          // SearchRec.Name にファイル名が入っている
          // たとえば、Memo1.Lines.Add('File:'+DirectoryName+SearchRec.Name);

          memo:=TBagelMemo.Create;
          memo.LoadFromFile(DirectoryName+SearchRec.Name);
          TabControl2.Tabs.AddObject(SearchRec.Name,memo);
{          lvMemo.Clear;
          for i:=0 to memo.Count-1 do begin
            item:=lvMemo.Items.Add;
            item.Caption:=memo.Items[i].Title;
            item.Data:=memo.Items[i];
          end;}
        end;
      until 0<>FindNext(SearchRec);
    finally
      FindClose(SearchRec);
    end;
    if TabControl2.Tabs.Count=0 then begin
      memo:=TBagelMemo.Create;
      memo.Path:=DirectoryName+'Memo.txt';
      memoitem:=TBagelMemoItem.Create(FormatDateTime('yyyy/mm/dd hh:nn',Now)+' 新規アイテム');
      memo.Add(memoitem);
      TabControl2.Tabs.AddObject('Memo.txt',memo);
    end;
    MemoSheet.Tag:=1;
    if TabControl2.Tabs.Count>0 then
    TabControl2.TabIndex:=0;
    TabControl2Change(nil);
  end;
end;

procedure TBagelMainForm.MenuToolbarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //無意味？
  currentCtxURI:='';
  currentCtxImg:='';
  currentCtxBgImg:='';
  currentCtxTargetNode:=Nil;
  currentCtxSel:=    false;
  currentCtxWindow:= false;
  currentCtxQuote:=  false;
  currentCtxTextBox:=false;
end;

procedure TBagelMainForm.MoveGesture(pt: TPoint);
var
  temp: Extended;
  distance: TPoint;
  arrow: string;
begin
  distance.X := Abs(pt.X - prevPoint.X);
  distance.Y := Abs(pt.Y - prevPoint.Y);
  if (distance.X > 8) or   // Config.mseGestureMargin
     (distance.Y > 8) then   // Config.mseGestureMargin
  begin
    //ReleasePopupHint(nil, True);
    temp := distance.Y / (distance.X + 0.001);
    if temp >= 1 then
    begin
      if pt.Y > prevPoint.Y then
        arrow := '↓'
      else
        arrow := '↑';
    end else
    begin
      if pt.X > prevPoint.X then
        arrow := '→'
      else
        arrow := '←';
    end;
    if not AnsiEndsStr(arrow, moveGestureTemp) then
      moveGestureTemp := moveGestureTemp + arrow;
    //WriteStatus(moveGestureTemp);
    prevPoint := pt;
  end;
end;


procedure TBagelMainForm.ExtAppMenuClick(Sender: TObject);
var
  tmpItem:TBagelActionContainer;
  i:Integer;
  act:TCommandAction;
begin
  //while ExtAppMenu.Count>2 do ExtAppMenu.Item[0].Free;
  ExtAppMenu.Clear;
  for i:= 0 to ExtAppList.Count-1 do begin
    tmpItem:=TBagelActionContainer.Create(nil);
    act:=TCommandAction(ExtAppList.Items[i]);
    tmpItem.Caption:=act.Caption;
    tmpItem.Action:=act;
    ExtAppMenu.Add(tmpItem);
  end;
end;

procedure TBagelMainForm.ExtCopyMenuClick(Sender: TObject);
var
  tmpItem:TBagelActionContainer;
  i:Integer;
  act:TCommandAction;
begin
  ExtCopyMenu.Clear;
  for i:=0 to ExtCopyList.Count-1 do begin
    tmpItem:=TBagelActionContainer.Create(nil);
    act:=TCommandAction(ExtCopyList.Items[i]);
    tmpItem.Caption:=act.Caption;
    tmpItem.Action:=act;
    ExtCopyMenu.Add(tmpItem);
  end;
end;

function TBagelMainForm.ExtractUp(URI: string):String;
var
  len: integer;
  i: integer;
  cpick: string;
  body:string;
  nf:String;
begin
  len := length(URI);
  for i := len-1 downto 1 do
  begin
    cpick := Copy(URI, i, 1);
    if cpick = '/' then
    begin
      body := Copy(URI, 1, i-1);
      Result:=body;
      nf:=Result[Length(Result)];
      if nf='/' then Result:='';
      exit;
    end;
  end;
  // ここに来るのは/がなかった場合
  Result:='';
end;


procedure TBagelMainForm.SwitchUA(UAStr:String);
var
  pB:nsIPrefBranch;
  i:Integer;
begin
  pB:=TGeckoPref.Create.GetRootBranch;
  if UAStr<>'' then begin
    pB.SetCharPref(PChar('general.useragent.override'),PChar(UAStr));
    for i:=0 to Pref.UserAgents.Count-1 do begin
      if Pos(UAStr,Pref.UserAgents.Strings[i])=Pos('=',Pref.UserAgents.Strings[i])+1 then begin
        //TODO:swAgentSelector.Caption := Pref.UserAgents.Names[i];
        Break;
      end;
    end;
  end
  else begin
    pB.ClearUserPref(PChar('general.useragent.override'));
    //TODO:swAgentSelector.Caption := NOOVERRIDEAGENT;
  end;
end;


{--------------}
{メッセージ処理}
{--------------}

procedure TBagelMainForm.WMDRAWCLIPBOARD( Var Msg :TMessage) ;
  function IsAlreadyOpened(Str:String):Boolean;
  var
    i:Integer; 
  begin
    Result:=false;
    for i:=0 to TabControl.Tabs.Count-1 do
    begin
      if GetBrowser(i).URI=Str then begin
        Result:=true;
        Exit;
      end;
    end;
  end;
Var
//hWnd          : integer;
//WindowTitle   : array[0..MAX_PATH] of char;
//i:Integer;
  regex:TSkRegExp;
  FindStr,RetStr:String;
  cnt:Integer;
  CanContinue:Boolean;
begin

 //現在操作中のウインドウタイトルを取得(正確でない時があります。(^^;)
// hWnd   := GetForegroundWindow;
  cnt:=0;
//  if GetWindowText(hWnd , WindowTitle,MAX_PATH)=0 then WindowTitle :='No Title';
  try
  //テキストがあったら
  if Clipboard.HasFormat(CF_TEXT) and (Clipboard.AsText<>'') then
  begin
    if chkObserveClipboard.Checked then
    begin
      regex:=TSkRegExp.Create;
      try
      regex.Expression:='https?://[-_.!~*''()a-zA-Z0-9;/?:@&=+$,%#]+';
      FindStr := Clipboard.AsText;
       if regex.Exec (FindStr) then
       begin
         repeat
           RetStr := regex.Match[0];
           if not IsAlreadyOpened(RetStr) then begin
             if ((cnt mod 15) = 0) and (cnt<>0) then begin
               CanContinue := MessageDlg('すでにクリップボードから'+IntToStr(cnt)+'個のタブを開きました。まだクリップボードにはURI文字列が含まれています。これ以上開きますか？', mtConfirmation,[mbYes, mbNo], 0) = mrYes;
               if not CanContinue then break;
             end;
             Inc(cnt);
             ObserveClipList.AddItem(RetStr,nil);
             AddTab(RetStr,Pref.OpenModeClipboard,0,'',Pref.DocShellDefault);
           end;
         until not regex.ExecNext;   //マッチした文字列の次から検索を再開します。
       end;
      finally
        regex.Free;
      end;
    end;
    //StringList.Add(Clipboard.AsText) ;
    //タイトルと時間を入れてノードに追加
    //TreeView1.Items.Add(nil,WindowTitle + String('(') + DateTimeTostr(NOW)+string(')'));
  end;
  finally

 //次のビューワにメッセージを送る
 //(送らないと他のアプリケーションで影響が出る。気にしないならいいんだけどね ;Y^^Y; )
    if hNextViewer<>0 then  SendMessage(hNextViewer, WM_DRAWCLIPBOARD, 0, 0);
  end;
end;

/////////○何らかのウィンドウがチェイン内から削除された○
procedure TBagelMainForm.WMCHANGECBCHAIN( Var Msg :TWMCHANGECBCHAIN) ;
begin
  //自ウインドウの次のビューワが削除された場合はその次のビューワを設定する
  if Msg.Remove = Cardinal(hNextViewer) then
  begin
   hNextViewer := Msg.Next;
   Msg.Result := 0;
   //↑このメッセージを処理をする時は戻り値に0を返さないといけないらしい
   //(Win32 APIプログラマーズリファレンス参照)
  end
  else
  begin
  // 次のビューワにメッセージを送る
  Msg.Result := SendMessage(hNextViewer, WM_CHANGECBCHAIN,Msg.Remove, Msg.Next);
end;
end;

Procedure TBagelMainForm.WMSYSCOMMAND(var Msg : TWMSYSCOMMAND);
begin
    //「メインツールバーの表示」を押した時
  If Msg.CmdType =1 Then
     actToggleMainbarVisible.Execute;

  //「メニューの表示」押した時
  If Msg.CmdType = 2 Then
    actToggleMenubarVisible.Execute;

  //「最小化ボタンを押した時」
  If Msg.CmdType = SC_MINIMIZE Then
    //ウインドウを最小化する（これをしないとウインドウがタスクバーに入らない）
    CloseWindow(Application.Handle)
  else
    //残りの処理（「閉じる」など）をDelphiに任せる
    DefaultHandler(Msg);

end;

procedure TBagelMainForm.WMCopyData(var Msg: TWMCopyData);
var
  i: Integer;
  buf: PChar;
  sl:TStringList;
begin
  if msg.CopyDataStruct.dwData=SIGNATURE_FILEOPEN then
  begin
    buf := StrALloc(msg.CopyDataStruct.cbData);
    sl:=TStringList.Create;
    try
      StrCopy(buf, msg.CopyDataStruct.lpData);
      sl.Text:=String(buf);
      for i:=0 to sl.Count-1 do
      begin
        if sl.Strings[i]='' then continue;
        Addtab(sl.Strings[i],0,0,'',Pref.DocShellDefault);
      end;
    finally
      sl.Free;
      StrDispose(buf);
    end;
  end;
  {else
    inherited;}
end;
procedure TBagelMainForm.UpdatePrefs;
var
  btn:TToolButton;
  i:Integer;
begin
  //メニューにアイコンを表示するか？
  ShowMenuIcon(Pref.ShowMenuIcon);
  //自動保存設定
  if Pref.AutoSaveTablist then bbgSaveTimer.Interval := 1000*60
  else bbgSaveTimer.Interval := 0;
  //Searchbar
  actToggleSearchBtnVisible.Checked := Pref.ShowSearchButtons;
  ToolButton6.Visible := actToggleSearchBtnVisible.Checked;
  tbGrepSearchBarText.Visible := actToggleSearchBtnVisible.Checked;
  HighLightButton.Visible := actToggleSearchBtnVisible.Checked;
  SearchBox.DropDownCount:=Pref.SearchBarDropdownCount;
  if Pref.ShowSearchButtons then DelayedSearchButtonCreator.Enabled:=true
  else ClearWordSearchButtons;
  //AddressBar
  GoButton.Visible := Pref.ShowGoButton;
  actToggleGoButtonVisible.Checked := Pref.ShowGoButton;
  
  //Sidebar
  SidebarHeaderToolbar.Visible:=Pref.ShowSidebarTabs;
  Panel1Resize(nil);

  for i:=SidebarHeaderToolbar.ButtonCount-1 downto 0 do begin
    SidebarHeaderToolbar.Buttons[i].Free;
  end;

  for i:=Pref.SidebarHeaderList.Count-1 downto 0 do begin
     btn:=TToolButton.Create(Self);
     btn.Action:=TAction(FindComponent(Pref.SidebarHeaderList.Strings[i]));
     btn.Parent := SidebarHeaderToolbar;
   end;

  if Pref.SidebarOverlap then SideBasePanel.Align:=alNone
  else SideBasePanel.Align:=alLeft;
  SidePanel.Align:=alClient;

  chkObserveClipboard.Checked:=Pref.ObsClipboard;

  //Tabbar
  TabControl.MultiLine:=Pref.TabMultiLine;
  TabControl.TabWidth:=Pref.TabWidth;

  if Pref.TabStyle=0 then
  TabControl.TabStyle:=btsTabs
  else if Pref.TabStyle=1 then
  TabControl.TabStyle:=btsFlatButtons;

  //Proxy
  RandomProxySelector.Enabled:=Pref.RandomProxy;
  RandomProxySelector.Interval:=(Pref.RandomProxyIntvMin*60+Pref.RandomProxyIntvSec)*1000;

  //サイドバータブ
  if actShowSidebarIcons.Checked<>Pref.ShowSidebarTabs then actShowSidebarIcons.Execute;

  actToggleSidebarVisible.Checked:=Pref.SidebarVisible;
  SideBasePanel.Visible:=Pref.SidebarVisible;

  StatusBar.Visible:=Pref.StatusbarVisible;
  actToggleStatusbarVisible.Checked:=StatusBar.Visible;

  //ユーザー定義サイドバー
  if Assigned(FileTreeView) then begin
    if (FileTreeView.Root<> Pref.UserDefinedFolder) and (Pref.UserDefinedFolder<>'') then
      FileTreeView.Root:=Pref.UserDefinedFolder;
  end;

end;

procedure TBagelMainForm.LinkListViewDblClick(Sender: TObject);
begin
  AddTab(LinkListView.Selected.SubItems.Strings[0],0,0,'',Pref.DocShellDefault);
end;

procedure TBagelMainForm.LoadSession(fileName:String);
var
  ini:TNkMemIniFile;
  tabcount:Integer;
  tabIndex:Integer;
  shCount:Integer;
  tmpTitle:String;
  tmpURI:String;
  uri:String;
  i:Integer;
  int,idx:Integer;
  j:Integer;
  brwsr:TBagelBrowser;
  newSH:nsISHistory;
  newSHI:nsISHistoryInternal;
  newURI:nsIURI;
  newEntry:nsISHEntry;

//shIndex:Integer;
begin

  if not FileExists(fileName) then exit;
  ini:=TNkMemIniFile.Create(fileName);
  try
    tabcount:=ini.ReadInteger('head','tabcount',0);
    tabindex:=ini.ReadInteger('head','tabindex',0);
    if Pref.StartupRestoreSH then begin//タブの履歴を復活させる
      for i:=0 to tabcount-1 do begin
        brwsr:=TBagelBrowser.Create(Self);
        brwsr.Visible := false;
        brwsr.Parent:=self.ViewPanel;
        brwsr.Align := alClient;
        ApplyEvtHandlersToBrowser(brwsr);
        brwsr.TabStop:=true;
        TabControl.Tabs.InsertObject(GetNewtabPos(0),'',TObject(brwsr));
        TabZOrder.Insert(GetMDITabPos(0),TObject(brwsr));
        int := TabControl.Tabs.IndexOfObject(TObject(brwsr));
        TabControl.TabIndex:=int;
        tabBarCtxTarget:=int;
        brwsr.Visible := true;
        newSH := brwsr.WebNavigation.SessionHistory;
        shCount:=ini.ReadInteger('tab'+IntToStr(i),'history_count',0);
        if (Pref.TabMaxCount > 0) and (TabControl.Tabs.Count = Pref.TabMaxCount) then exit;
        newSH.QueryInterface(NS_ISHISTORYINTERNAL_IID,newSHI);

        for j:=0 to shcount-1 do begin
          tmpTitle:=ini.ReadString('tab'+IntToStr(i),'history'+IntToStr(j)+'_title','');
          tmpURI:=ini.ReadString('tab'+IntToStr(i),'history'+IntToStr(j)+'_URI','about:blank');
          NS_CreateInstance('@mozilla.org/browser/session-history-entry;1',nsISHEntry,newEntry);
          newURI := NS_NewURI(tmpURI);
          newEntry.SetURI(newURI);
          newEntry.SetTitle(NewString(tmpTitle).AString);
          newSHI.AddEntry(newEntry,true);
        end;
        if brwsr.DocShell<>nil then begin
          brwsr.DocShell.AllowPlugins:=((Pref.DocShellDefault and 1)<>0);
          brwsr.DocShell.AllowJavascript:=((Pref.DocShellDefault and 2)<>0);
          brwsr.DocShell.AllowSubframes:=((Pref.DocShellDefault and 4)<>0);
          brwsr.DocShell.AllowMetaRedirects:=((Pref.DocShellDefault and 8)<>0);
          brwsr.DocShell.AllowImages:=((Pref.DocShellDefault and 16)<>0);
          actAllowJS.Checked:=brwsr.DocShell.AllowJavascript;
          actAllowJS.Update;
          actAllowImg.Checked:=brwsr.DocShell.AllowImages;
          actAllowImg.Update;
          actAllowFrames.Checked:=brwsr.DocShell.AllowSubFrames;
          actAllowFrames.Update;
          actAllowPlugins.Checked:=brwsr.DocShell.AllowPlugins;
          actAllowPlugins.Update;
          actAllowRedirect.Checked:=brwsr.DocShell.AllowMetaRedirects;
          actAllowRedirect.Update;
          StatusBar.Refresh;
          brwsr.DocShell.UseErrorPages := True;
        end;
        idx := ini.ReadInteger('tab'+IntToStr(i),'history_position',0);
        brwsr.WebNavigation.GotoIndex(idx);
      end;
    end
    else begin//タブ履歴までは召還しない
      for i:=0 to tabcount-1 do
      begin
        uri:=ini.ReadString('tab'+IntToStr(i),'location','about:blank');
        AddTab(uri,0,0,'',Pref.DocShellDefault);
      end;
    end;
  finally
    ini.Free;
  end;

  if TabControl.Tabs.Count>0 then SelectTab(tabIndex);
  if (tabIndex=TabControl.TabIndex) and (tabIndex>0) then begin
    //GetBrowser(tabIndex).ShouldFocus:=true;
    GetBrowser(tabIndex).SetFocus;
  end;
end;


procedure TBagelMainForm.BuildCharsetMenu;
  procedure MakeSubMenu(parent:TBagelActionContainer;key:String;ini:TNkMemIniFile);
  var
    c:TBagelActionContainer;
    cmi:TBagelExtCharsetAction;
    count:Integer;
    i:Integer;
    childkey:String;
  begin
    count := ini.ReadInteger(key,'count',0);
    for i:=0 to count-1 do begin
      childKey:=ini.ReadString(key,'item'+IntToStr(i),'');
      if childKey='' then continue;
      if not ini.SectionExists(childKey) then continue;

      if ini.ReadInteger(childKey,'type',0)=0 then begin
        //アイテム
        cmi:=TBagelExtCharsetAction.Create(parent);
        cmi.Caption:=ini.ReadString(childkey,'caption','');
        cmi.Charset:=ini.ReadString(childKey,'charset','');
        cmi.OnExecute:=CharsetMenuItemClick;
        c:=TBagelActionContainer.Create(parent);
        c.Action := cmi;
        parent.Add(c);
      end
      else begin
        //フォルダ
        c:=TBagelActionContainer.Create(parent);
        c.Caption:=ini.ReadString(childkey,'caption','');
        parent.Add(c);
        MakeSubMenu(c,childKey,ini);
      end;
    end;
  end;
var
  IniFile:TNkMemIniFile;
begin
  if FileExists(GetSettingDir() + 'Charset.ini') then
    IniFile:=TNkMemIniFile.Create(GetSettingDir() + 'Charset.ini')
  else if FileExists(GetDefaultsDir() + 'Charset.ini') then
    IniFile:=TNkMemIniFile.Create(GetDefaultsDir() + 'Charset.ini')
  else Exit;
  try
    MakeSubMenu(EncodeMenu,'manifest',IniFile);
  finally
    IniFile.Free;
  end;
end;

procedure TBagelMainForm.cboExtractPatternKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=chr(VK_RETURN) then
  begin
    LoadLinkSidebar;
  end;
end;

procedure TBagelMainForm.CharsetMenuItemClick(Sender: TObject);
begin
  BrowserSetForcedCharacterSet(TBagelExtCharsetAction(Sender).Charset);
end;

procedure TBagelMainForm.chkObserveClipboardClick(Sender: TObject);
begin
  Pref.ObsClipboard := chkObserveClipboard.Checked ;
end;

procedure TBagelMainForm.BrowserSetForcedCharacterSet(aCharset:String);
var
  docCharset:nsIDocumentCharsetInfo;
  ds:nsIDocShell;
  atom:nsIAtom;
  atoms:nsIAtomService;
begin
  ds := GetCurrentBrowser.DocShell;
  docCharset := ds.DocumentCharsetInfo;
  NS_CreateInstance('@mozilla.org/atom-service;1',NS_IATOMSERVICE_IID,atoms);
  atom := atoms.GetAtom(PWideChar(WideString(aCharset)));
  docCharset.SetForcedCharset(atom);
  GetCurrentBrowser.Reload;
end;

procedure TBagelMainForm.SaveSnapshot(Filename:String);
var
  i:Integer;
  j:Integer;
  histCount:Integer;
  histPos:Integer;
  ini:TIniFile;
  b:TGeckoBrowser;
  tabsec:String;
  entry:nsIHistoryEntry;
begin
  ini:=TIniFile.Create(Filename);
  try
    DeleteFile(FileName);
    ini.WriteInteger('head','tabindex',TabControl.TabIndex);
    ini.WriteInteger('head','tabcount',TabControl.Tabs.Count);
    for i:=0 to TabControl.Tabs.Count-1 do
    begin
      b:=TGeckoBrowser(TabControl.Tabs.Objects[i]);
      histCount := b.WebNavigation.SessionHistory.Count; //b.HistoryCount;
      histPos := b.WebNavigation.SessionHistory.Index; //b.HistoryPosition;
      tabSec:='tab'+IntToStr(i);
      ini.WriteInteger(tabsec,'history_count',histCount);
      ini.WriteInteger(tabsec,'history_position',histPos);

      ini.WriteString(tabsec,'title',b.Title);
      ini.WriteString(tabsec,'location',b.URI);

      for j:=0 to histCount-1 do
      begin
        entry := b.WebNavigation.SessionHistory.GetEntryAtIndex(j,False);
        ini.WriteString(tabsec,'history'+IntToStr(j)+'_title',entry.Title);
        ini.WriteString(tabsec,'history'+IntToStr(j)+'_URI',URIToStr(entry.URI));
      end;

    end;
  finally
    ini.Free;
  end;

end;

procedure TBagelMainForm.ShowMenuIcon(Flag:Boolean);
begin
  if Flag=true then begin

    TabPopup.Images:=ImageList1;
    GeckoPopup.Images:=ImageList1;
    ChevronLinkMenu.Images:=ImageList1;
    ChevronPopupMenu.Images:=ImageList1;
    MainMenu1.Images:=ImageList1;
    ActionList1.Images:=ImageList1;
  end
  else begin
    TabPopup.Images:=nil;
    TabPopup.Items.SubMenuImages:=nil;
    GeckoPopup.Images:=nil;
    GeckoPopup.Items.SubMenuImages:=nil;
    ChevronLinkMenu.Images:=nil;
    ChevronLinkMenu.Items.SubMenuImages:=nil;
    ChevronPopupMenu.Images:=nil;
    ChevronPopupMenu.Items.SubMenuImages:=nil;
    MainMenu1.Images:=nil;
    ActionList1.Images:=nil;
  end;
end;

procedure TBagelMainForm.HighLightButtonClick(Sender: TObject);
var
  i:Integer;
  cnt:Integer;
  filteredSearchWord:String;
  searchWords:TStrArray;
begin
  cnt:=0;
  if isHilighted(GetCurrentBrowser) then begin
    HilightBrowser(GetCurrentBrowser,'','',false);
    GetCurrentBrowser.AutoHighlight:=False;
    exit;
  end;
  filteredSearchWord := StringReplace(SearchBox.Text,' ','　',[rfReplaceAll]);
  searchWords := btSplitToArray(filteredSearchWord,' ');
  for i:=0 to High(searchWords) do begin
    HilightBrowser(GetCurrentBrowser,
                   Pref.GetHighLightStyle(cnt mod Pref.HighLightPref.Count),
                   searchWords[i],
                   true);
    Inc(cnt);
  end;
end;

procedure TBagelMainForm.HilightBrowser(b:TBagelBrowser;style:String;patText:String;hilight:Boolean);
begin
  HilightWin(b.ContentWindow,style,patText,hilight);
end;
                              
procedure TBagelMainForm.ChangeSelectionColor(win:nsIDOMWindow;attention:Boolean);
var
  selcon:nsISelectionController;
begin
  selcon:=GetSelconByWin(win);
  if selcon=nil then exit;
  if attention then begin
    selcon.SetDisplaySelection(NS_ISELECTIONCONTROLLER_SELECTION_ATTENTION);
  end
  else begin
    selcon.SetDisplaySelection(NS_ISELECTIONCONTROLLER_SELECTION_ON)
  end;
  selcon.RepaintSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
end;

procedure TBagelMainForm.ToolButton6Click(Sender: TObject);
begin
  //ShowMessage(IntToStr(MainCoolbar.Bands.Count));
end;

procedure TBagelMainForm.ToolPCookieConfigClick(Sender: TObject);
var
  gp:TGeckoPref;
  cookieBehavior:Integer;
  pm:nsIPermissionManager;
  permission:Cardinal;
  //cookieAStr:nsAString;
begin
  gp:=TGeckoPref.Create;
  //Cookie受け入れ設定
{
692 pref("network.cookie.cookieBehavior",       0);
   0-Accept,
   1-dontAcceptForeign,
   2-dontUse,
   3-p3p
}
  cookieBehavior:=gp.GetIntPref('network.cookie.cookieBehavior');
  case cookieBehavior of
   0:AllowAllCookie.Checked:=true;//Accept
   1:DenyOtherSiteCookie.Checked:=true;//dontAcceptForeign
   2:DenyAllCookie.Checked:=true;//dontUse
   3:case gp.GetIntPref('network.cookie.p3plevel') of //p3p
       0:CookieP3PLow.Checked:=true;//low
       1:CookieP3PMedium.Checked:=true;//medium
       2:CookieP3PHigh.Checked:=true;//high
       3:CookieP3PCustom.Checked:=true;//custom
     else
     end;
  else
  end;

{
699 // The following default value is for p3p medium mode.
700 // See xpfe/components/permissions/content/cookieP3P.xul for the definitions of low/medium/hi
701 pref("network.cookie.p3p",                  "ffffaaaa");
702 pref("network.cookie.p3plevel",             1); // 0=low, 1=medium, 2=high, 3=custom


112       case low:
113         settings = "afafaaaa";
114         break;
115       case medium:
116         settings = "ffffaaaa";
117         break;
118       case high:
119         settings = "frfradaa";
120         break;
121       case custom:
122         break;
}

  //このサイトのCookie
  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  permission:=pm.TestPermission(StrToURI(GetBrowser(tabBarCtxTarget).URI),PChar('cookie'));
  case permission of
    NS_IPERMISSIONMANAGER_ALLOW_ACTION:AllowThisSiteCookie.Checked:=True;
    8:AllowThisSiteSessionCookie.checked:=true;//ACCESS_SESSION
    ns_IPermissionManager_UNKNOWN_ACTION:ObeyDefaultThisSiteCookie.checked:=true;
    ns_IPermissionManager_DENY_ACTION:DenyThisSiteCookie.Checked:=true;
  else
  end;
//   NS_ICOOKIEPERMISSION
{
117         case "cookieAllow":
118           if (permissionmanager.testPermission(uri, "cookie") == nsIPermissionManager.ALLOW_ACTION)
119             return;
120           permissionmanager.add(uri, "cookie", nsIPermissionManager.ALLOW_ACTION);
121           element = document.getElementById("AllowCookies");
122           break;
123         case "cookieSession":
124           if (permissionmanager.testPermission(uri, "cookie") == nsICookiePermission.ACCESS_SESSION)
125             return;
126           permissionmanager.add(uri, "cookie", nsICookiePermission.ACCESS_SESSION);
127           element = document.getElementById("AllowSessionCookies");
128           break;
129         case "cookieDefault":
130           if (permissionmanager.testPermission(uri, "cookie") == nsIPermissionManager.UNKNOWN_ACTION)
131             return;
132           permissionmanager.remove(uri.host, "cookie");
133           element = document.getElementById("UseCookiesDefault");
134           break;
135         case "cookieBlock":
136           if (permissionmanager.testPermission(uri, "cookie") == nsIPermissionManager.DENY_ACTION)
137             return;
138           permissionmanager.add(uri, "cookie", nsIPermissionManager.DENY_ACTION);
139           element = document.getElementById("BlockCookies");
140           break;
}
  gp.Free;
end;


procedure TBagelMainForm.ChangeProxy(Sender:TObject);
var
pb:nsIPrefBranch;
tmpStr1:String;
tmpStr2:String;
tmpInt:Integer;
begin
 //
  if TMenuItem(Sender).Tag<0 then
  begin
    tmpStr1:='';
    tmpStr2:='0';
    tmpInt:=0;
  end
  else
  begin
    tmpStr1:=Pref.Proxies.Strings[TMenuItem(Sender).Tag];
    tmpStr2:=Copy(tmpStr1,Pos(':',tmpStr1)+1,Length(tmpStr1));
    tmpStr1:=Copy(tmpStr1,1,Pos(':',tmpStr1)-1);
    tmpInt:=1;
  end;

  pb:=GeckoPref.GetRootBranch;
  pb.SetCharPref(PChar('network.proxy.http'),PChar(tmpStr1));
  pb.SetIntPref(PChar('network.proxy.http_port'),StrToInt(tmpStr2));
  pb.SetIntPref(PChar('network.proxy.type'),tmpInt);

  {if TMenuItem(Sender).Parent=ProxyPopup.Items then begin
    ToolPProxySwitch.Items[TMenuItem(Sender).MenuIndex].Checked:=true;
  end else begin
    ProxyPopup.Items.Items[TMenuItem(Sender).MenuIndex].Checked:=true;
  end;}

  //TODO
  {
  if TMenuItem(Sender).Tag=-1 then swProxySelector.Caption:=NOPROXY
  else
  swProxySelector.Caption:=Pref.Proxies.Strings[TMenuItem(Sender).Tag];
  StatusBar.Refresh;
  }
end;

procedure TBagelMainForm.ToolPProxySwitchClick(Sender: TObject);
var
  newitem:TBagelActionContainer;
  i:Integer;
  gp:TGeckoPref;
  p:PChar;
  PxName:String;
begin
  ProxySwitchMenu.Clear;

  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption:='直接接続(プロクシ無し)';
  newitem.OnClick := ChangeProxy;
  //TODO:
  //newitem.RadioItem:=true;
  //newitem.AutoCheck:=true;
  newitem.Tag:=-1;
  ProxySwitchMenu.Add(newitem);

  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption:='-';
  newitem.Tag:=-1;
  ProxySwitchMenu.Add(newitem);

  gp:=TGeckoPref.Create;
  if gp.GetIntPref('network.proxy.type') > 0 then begin
    p := gp.GetRootBranch.GetCharPref(PChar('network.proxy.http'));
    PxName:= p + ':' + IntToStr(gp.GetIntPref('network.proxy.http_port'));
    nsMemory.Free(p);
    //swProxySelector.Caption:=PxName;
  end
  else begin
    PxName:='';
    ProxySwitchMenu.Item[1].Checked:=true;
    //swProxySelector.Caption:='No Proxy';
  end;
  gp.Free;

  for i:=0 to Pref.Proxies.Count - 1 do
  begin
    newitem:=TBagelActionContainer.Create(Self);
    newitem.Caption   := Pref.Proxies.Strings[i];
    newitem.OnClick   := ChangeProxy;
    //newitem.RadioItem := true;
    //newitem.AutoCheck := true;
    newitem.Tag       := i;
    if PxName=Pref.Proxies.Strings[i] then newitem.Checked:=true;
    ProxySwitchMenu.Add(newitem);
  end;
end;

procedure TBagelMainForm.StyleSheetSwitchClick(Sender: TObject);
var
//  processed:TStringList;
  i:Integer;
  doc:nsIDOMDocument;
  sheet:nsIDOMStyleSheet;
  ssl:nsIDOMStyleSheetList;
  title:IInterfacedString;
  newitem:TBagelActionContainer;
  newact:TBagelExtSSAction;

  SearchRec: TSearchRec;
  DirectoryName:String;
  DirnameButBSlash:String;

  SSS:nsIStyleSheetService;
  fileURI:nsIURI;
  localfile:nsILocalFile;
begin
  StyleSwitchMenu.Clear;

  tabBarCtxTarget:=TabControl.TabIndex;
  if GetBrowser(tabBarCtxTarget)= nil then exit;

  doc:=GetBrowser(tabBarCtxTarget).ContentDocument;
  ssl := (doc as nsIDOMDocumentStyle).StyleSheets;

  title:=NewString('');

  processedStyleSheets.Clear;

  processedStyleSheets.Add('_nostyle');
  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption := 'スタイルなし';
  newitem.OnClick := SSSMenuClick;
  newitem.Tag := 0;
  StyleSwitchMenu.Add(newitem);

  processedStyleSheets.Add('_default');
  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption := 'デフォルト';
  newitem.OnClick := SSSMenuClick;
  newitem.Tag := 1;
  StyleSwitchMenu.Add(newitem);

  for i:=0 to ssl.Length-1 do
  begin
    sheet := ssl.Item(i);
    sheet.GetTitle(title.AString);
    if processedStyleSheets.IndexOf(title.ToString) <> -1 then continue;
    if IsValidMedia(sheet) and  (not IsPersistent(sheet)) then
    begin
      processedStyleSheets.Add(title.ToString);
      newitem:=TBagelActionContainer.Create(Self);
      newitem.Caption:=title.ToString;
      newitem.Checked:=not sheet.Disabled;
      newitem.OnClick:=SSSMenuClick;
      newitem.Tag := processedStyleSheets.Count-1;
      StyleSwitchMenu.Add(newitem);
    end;
  end;

  DirnameButBSlash:=GetSettingDir()+'css';
  DirectoryName:=DirnameButBSlash+'\';

  if not DirectoryExists(DirectoryName) then
  ForceDirectories(DirectoryName);

  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption:='-';
  StyleSwitchMenu.Add(newitem);

  NS_GetService('@mozilla.org/content/style-sheet-service;1',nsIStyleSheetService,sss);
  // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
  if 0=FindFirst(DirectoryName+'*.css', faAnyFile, SearchRec) then try
    repeat
      if SearchRec.Attr and faDirectory <> 0 then begin
        // カレントディレクトリや親ディレクトリをスキップ
        if (SearchRec.Name='.') and (SearchRec.Name='..') then
          Continue;
        // ディレクトリに対する処理
        // SearchRec.Name にディレクトリ名が入っている
        // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
      end else begin
        // ファイルに対する処理
        // SearchRec.Name にファイル名が入っている
        // たとえば、Memo1.Lines.Add('File:'+DirectoryName+SearchRec.Name);
        newact:=TBagelExtSSAction.Create(Self);
        newact.Caption:=SearchRec.Name;
        newact.OnClick := SSSExMenuClick;
        newact.SSType := 1;//UserCSS
        newact.FileName := DirectoryName+SearchRec.Name;
        //登録されているかのチェック
        NS_NewLocalFile(newString(newact.FileName).AString,false,localfile);
        fileUri := NS_NewFileURI(localfile);
        newact.Checked:=sss.SheetRegistered(fileuri,NS_ISTYLESHEETSERVICE_USER_SHEET);
        //TODO:
        StyleSwitchMenu.Add(newact);
      end;
    until 0<>FindNext(SearchRec);
  finally
    FindClose(SearchRec);
  end;
end;

procedure TBagelMainForm.CookieConfigMenuClick(Sender: TObject);
begin
  //
end;

procedure TBagelMainForm.ToolPUASwitchClick(Sender: TObject);
var
  pB:nsIPrefBranch;
  gp:TGeckoPref;
  UAStringP:PChar;
  UAString:String;
  newitem:TBagelActionContainer;
  i:Integer;
begin
  gp:=TGeckoPref.Create;
  pb:=gp.GetRootBranch;

  UAStringP := nil;
  if gp.PrefExists('general.useragent.override') then
    UAStringP := pB.GetCharPref('general.useragent.override');
  UAString  := String(UAStringP);
  nsMemory.Free(UAStringP);
  UASwitchMenu.Clear;

  for i:=0 to Pref.Useragents.Count-1 do begin
    newitem:=TBagelActionContainer.Create(Self);
    newitem.Caption:=Pref.UserAgents.Names[i];
    newitem.Tag:=i;
    newitem.OnClick:= UASwitchChildClick;
    UASwitchMenu.Add(newitem);

    if Pos(UAString, Pref.UserAgents.Strings[i])=Pos('=',Pref.UserAgents.Strings[i])+1 then begin
      newitem.Checked:=true;
    end
    else if (String(UAString)='') and (Pos('=',Pref.UserAgents.Strings[i])=Length(Pref.UserAgents.Strings[i])) then begin
      newitem.Checked:=true;
    end;
  end;

  newitem:=TBagelActionContainer.Create(Self);
  newitem.Caption := '-';
  UASwitchMenu.Add(newitem);

  newitem:=TBagelActionContainer.Create(Self);
  newitem.Action := actShowUAMan;
  newitem.Caption := '編集';
  UASwitchMenu.Add(newitem);

  gp.free;
end;

procedure TBagelMainForm.UASwitchChildClick(Sender: TObject);
var
  str:String;
begin
  str:=Pref.UserAgents.Strings[TBagelActionContainer(Sender).Tag];
  str:=Copy(str,Pos('=',str)+1,Length(Str)-Pos('=',str));
  SwitchUA(str);
end;

procedure TBagelMainForm.EngineBoxSelect(Sender: TObject);
begin
  if Pref.SearchOnEngineChange then
  DoSearch(SearchBox.Text);
end;

procedure TBagelMainForm.RandomProxySelectorTimer(Sender: TObject);
begin
  if Pref.Proxies.Count<1 then exit;
  ProxySwitchMenu.OnClick(nil);
  ChangeProxy(ProxySwitchMenu.Item[Random(ProxySwitchMenu.Count-2)+2]);
end;

procedure TBagelMainForm.ScriptExec(Sender: TObject);
begin
{var
bssl:nsIBagelScriptLoader;
begin
NS_CreateInstance('@mozilla.org/bagelscriptloader;1',nsIBagelScriptLoader,bssl);
bssl.Load(PWideChar(WideString(TScriptAction(Sender).ScriptPath)),PWideChar(WideString(TScriptAction(Sender).Parameters)));
TScriptAction(Sender).Parameters:='';
bssl:=nil;}
end;

procedure TBagelMainForm.CommandExtExec(Sender: TObject);
var
  Action:TCommandAction;
  ReplacedOption:String;
  sl:TStringList;
  i:Integer;
  BagelTitle:String;
  b:TBagelBrowser;
  aDOMW:nsIDOMWindow;
  range:nsIDOMRange;
  istr:IInterfacedString;
  astr:nsAString;
  Selection:String;
  a_text:String;
  anchor:nsIDOMHTMLAnchorElement;
  apppath:String;
  appparam:String;
  popupobj:TObject;
  popupMI:TMenuItem;
  popupP:TPopupMenu;
  command:String;
begin
{
//$selection:OpenJaneの$TEXTに相当。
//$selectione:OpenJaneの$TEXTEに相当。
//$ahref:$LINKに相当。
//$location:$URLに相当。
//$title:$TITLEに相当。
//$quoteurl:右クリックしたq要素またはblockquote要素のcite属性
//$imgsrc、$imgalt:img要素のsrc、alt属性
//$inputval、$textareaval:input/textarea要素に入力されているテキスト
//$frameuri:フレームのアドレス
}

  if GetCurrentBrowser<>nil then begin
    b:=GetCurrentBrowser;
    //タイトル
    BagelTitle:=b.Title;
    //selection
    aDOMW := b.ContentWindow;
    Selection:=GetSelectionStrFromWin(aDOMW);

    if currentCtxTargetNode<>nil then begin
      Supports(currentCtxTargetNode,nsIDOMHTMLAnchorElement,anchor);
      if anchor <> nil then begin
        //リンクのテキスト
        istr:=NewString;
        astr:=istr.AString;
        range := (aDOMW.Document as nsIDOMDocumentRange).CreateRange;
        range.SelectNode(currentCtxTargetNode);
        range.ToString(astr);
        a_text:=istr.ToString;
      end;
    end;
  end;

{
    currentCtxURI:WideString;
    currentCtxImg:WideString;
    currentCtxBGImg:WideString;
    currentCtxTargetNode:nsIDOMNode;
}
  Action:=TCommandAction(Sender);
  ReplacedOption:=StringReplace(Action.Option,'%a_href%',currentCtxURI,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%a_text%',a_text,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%selection%',selection,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%selection_eucenc%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%selection_sjisenc%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%selection_utf8enc%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%selection_isoenc%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%addressbar%',LocationBox.Text,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%location%',GetCurrentBrowser.URI,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%title%',BagelTitle,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%img_src%',currentCtxImg,[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%img_alt%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%img_title%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%quote_cite%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%input_value%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%form_action%','',[rfReplaceAll]);
  ReplacedOption:=StringReplace(ReplacedOption,'%frame_location%','',[rfReplaceAll]);

  command:=LowerCase(Action.Command);

  if command='javascript' then begin
    if GetCurrentBrowser<>nil then GetCurrentBrowser.LoadURI('javascript:'+ReplacedOption);
  end
  else if command='addtab' then begin
    AddTab(ReplacedOption,0,0,'',Pref.GetDocShellDefault,0);
  end
  else if command='loaduri' then begin
    if GetCurrentBrowser<>nil then GetCurrentBrowser.LoadURI(ReplacedOption);
  end
  else if command='expanduri' then begin
    ShowMessage('「URIの展開」指令は未実装です。ごめんなさい。');
  end
  else if command='run' then begin
    sl:=TStringList.Create;
    Sl.Delimiter:=' ';
    sl.CommaText:=ReplacedOption;

    apppath:=sl.Strings[0];
    sl.Delete(0);

    appparam:=sl.DelimitedText;
    ShellExecute(Handle, 'OPEN', PChar(apppath), PChar(appparam), '', SW_SHOW);
    sl.Free;
  end
  else if command='download' then begin
    ShowMessage('「ダウンロード」指令は未実装です。ごめんなさい。');
  end
  else if command='copy' then begin
    Clipboard.AsText := ReplacedOption;
  end
  else if command='execcmd' then begin
    sl:=TStringList.Create;
    try
      sl.CommaText:=Action.Option;
      for i:=0 to sl.Count-1 do begin
        FireCommand(sl.Strings[i]);
      end;
    finally
      sl.Free;
    end;
  end
  else if command='popupmenu' then begin
    popupobj:=FindComponent(ReplacedOption);
    if popupobj<>nil then begin
      if popupobj is TMenuItem then begin
        popupMI:=TMenuItem(popupobj);
        if popupMI.Count>0 then begin                                               //
          //popupMI.Click;
          //TrackPopupMenuEx(popupMI.Handle,0,(Screen.Width div 2),(Screen.Height div 2),Self.Handle,nil);
          MenuTrackerToolbar.Left:=Self.Width div 2;
          MenuTrackerToolbar.Top:=Self.Height div 2;
          tbMenuTracker.MenuItem:=popupMI;
          MenuTrackerToolbar.TrackMenu(tbMenuTracker);

//          Self.ActiveControl.SetFocus;
          //popupMI.
          //ControlToolbar.TrackMenu()
        end;
      end
      else if popupobj is TPopupMenu then begin
        popupP:=TPopupMenu(popupobj);
        popupP.Popup((Screen.Width div 2),(Screen.Height div 2));
      end;
    end;
    //TrackPopupMenu
  end  {
  else if Action.Command='javascript' then begin
  end }
  else begin
  end;
end;


procedure TBagelMainForm.STPSubClassProc(var Msg: TMessage);
begin
  STPOriginalProc(Msg);
  case Msg.Msg of
    CM_MOUSEENTER:SidebarTogglePanel.Color := clBtnHighlight;
    CM_MOUSELEAVE:SidebarTogglePanel.Color := clBtnFace;
  end;
end;


procedure TBagelMainForm.cmbGrepKeywordKeyPress(Sender: TObject; var Key: Char);
var
  b:TBagelBrowser;
  i:Integer;
begin
  if (Key=chr(VK_RETURN)) and (TabControl.Tabs.Count>0) then
  begin

    for i:=0 to GrepList.Items.Count-1 do
    begin
      Dispose(GrepList.Items[i].Data);
    end;
    GrepList.Clear;
    {
  現在のタブ
  左のタブ
  右のタブ
  すべてのタブ
  選択したタブ
    }

    case cboGrepTarget.ItemIndex of
      0:begin
        b:=GetCurrentBrowser;
        FireGrep(cmbGrepKeyword.Text,cmbGrepKind.ItemIndex,b);
      end;
      1:begin
        for i:=0 to TabControl.Tabs.Count-1 do begin
          if i>TabControl.TabIndex then break;
          b:=GetBrowser(i);
          FireGrep(cmbGrepKeyword.Text,cmbGrepKind.ItemIndex,b);
        end;
      end;
      2:begin
        for i:=0 to TabControl.Tabs.Count-1 do begin
          if i<TabControl.TabIndex then continue;
          b:=GetBrowser(i);
          FireGrep(cmbGrepKeyword.Text,cmbGrepKind.ItemIndex,b);
        end;
      end;
      3:begin
        for i:=0 to TabControl.Tabs.Count-1 do begin
          b:=GetBrowser(i);
          FireGrep(cmbGrepKeyword.Text,cmbGrepKind.ItemIndex,b);
        end;
      end;
      4:begin
      end;
    end;

  end;
end;

procedure TBagelMainForm.FireGrep(aWord:String; mode:Integer; Browser:TBagelBrowser);
var
  //str:IInterfacedString;
  //astr:nsAString;
  pwWord:PWideChar;
  searchRange:nsIDOMRange;
  startPoint:nsIDOMRange;
  endPoint:nsIDOMRange;
  retRange:nsIDOMRange;
  domDoc:nsIDOMDocument;
  body:nsIDOMNode;
  mFind:nsIFind;
  nodeList:nsIDOMNOdeList;
  ////childCount:Cardinal;
  node:nsIDOMNode;
  //node2:nsIDOMNode;
  nodeValue:IInterfacedString;
  offset:Integer;
  grepHit:PGrepResult;
  grepItem:TListItem;
  //i:Integer;
begin

  domDoc:=Browser.ContentDocument;
  nodeList := domDoc.GetElementsByTagName(NewString('body').AString);
  body := nodeList.Item(0);

  searchRange := (domDoc as nsIDOMDocumentRange).CreateRange();
  startPoint := (domDoc as nsIDOMDocumentRange).CreateRange;
  endPoint := (domDoc as nsIDOMDocumentRange).CreateRange;

  searchRange.SelectNodeContents(body);
  startPoint.SelectNodeContents(body);
  endPoint.SelectNodeContents(body);
  startPoint.SetStart(body,0);
  startPoint.SetEnd(body,0);
  endPoint.Collapse(False);

  NS_CreateInstance('@mozilla.org/embedcomp/rangefind;1',nsIFind,mFind);
  mFind.SetFindBackwards(false);

  nodeValue := NewString;

  if mode=0 then begin
    pwWord:=PWideChar(WideString(aWord));

//    body.GetChildNodes(nodeList);
//    nodeList.GetLength(childCount);

    retRange := mFind.Find(pwWord,searchRange,startPoint,endPoint);

    while retRange<>nil do begin

      New(grepHit);

      grepHit^.Browser := Browser;
      grepHit^.Range := retRange;

      grepItem:=grepList.Items.Add;
      grepItem.Data:=grepHit;

      node := retRange.StartContainer;
      offset := retRange.StartOffset;
      node.GetNodeValue(nodeValue.AString);
      grepItem.Caption:=nodeValue.ToString;
      grepHit^.startContainer:=node;
      grepHit^.startOffset:=offset;

      node:=retRange.EndContainer;
      offset:=retRange.EndOffset;
      grepHit^.endContainer:=node;
      grepHit^.endOffset:=offset;

      startPoint.SelectNodeContents(body);
      endPoint.SelectNodeContents(body);
      startPoint.SetStart(node,offset);
      startPoint.SetEnd(node,offset);
      endPoint.Collapse(False);

      searchRange.SetStart(node,offset);
      retRange := mFind.Find(pwWord,searchRange,startPoint,endPoint);
    end;
  end

  else if mode=1 then begin
    
    retRange:=RegExpFind(searchRange,aWord);

    while retRange<>nil do begin

      New(grepHit);

      grepHit^.Browser := Browser;
      grepHit^.Range := retRange;

      grepItem:=grepList.Items.Add;
      grepItem.Data:=grepHit;

      node := retRange.StartContainer;
      offset := retRange.StartOffset;
      node.GetNodeValue(nodeValue.AString);
      grepItem.Caption:=nodeValue.ToString;
      grepHit^.startContainer:=node;
      grepHit^.startOffset:=offset;

      node:=retRange.EndContainer;
      offset:=retRange.EndOffset;
      grepHit^.endContainer:=node;
      grepHit^.endOffset:=offset;

      startPoint.SelectNodeContents(body);
      endPoint.SelectNodeContents(body);
      startPoint.SetStart(node,offset);
      startPoint.SetEnd(node,offset);
      endPoint.Collapse(False);

      searchRange.SetStart(node,offset);

      retRange:=RegExpFind(searchRange,aWord);
    end;
  end
  else if mode=2 then begin
    //TODO:
    {if FMigemoObj=nil then Exit;
    if not FMigemoObj.Isenable then Exit;
    FireGrep(FMigemoObj.Query(aWord),1,Browser);}
  end;
end;

procedure TBagelMainForm.GrepListClick(Sender: TObject);
var
  item:TListItem;
  win:nsIDOMWindow;
  i:Integer;
begin
  if GrepList.ItemIndex=-1 then exit;
  item:=GrepList.Selected;
  i:=TabControl.Tabs.IndexOfObject(PGrepResult(item.Data)^.Browser);
  if i<>-1 then
  begin
    if PGrepResult(item.Data)^.Browser<>GetCurrentBrowser then
    SelectTab(i);
    item.MakeVisible(false);
    win := GetBrowser(i).ContentWindow;

    DoCenterRange(PGrepResult(item.Data)^.Browser.ContentWindow,PGrepResult(item.Data)^.Range);
    setSelection(getRange(PGrepResult(item.Data)^.startContainer,
                          PGrepResult(item.Data)^.startOffset,
                          PGrepResult(item.Data)^.endContainer,
                          PGrepResult(item.Data)^.endOffset)
                 ,GetSelConByWin(win));
    //
  //  setSelectionAndScroll(PGrepResult(item.Data)^.Range,getSelectionForDoc(doc));
  //  selCon.CompleteScroll(true);
  //  GrepList.SetFocus;
  end;
end;

function TBagelMainForm.RegExpFind(Range:nsIDOMRange;patRegExp:String):nsIDOMRange;
var
  finder:nsIFind;
  retRange:nsIDOMRange;
  startPt:nsIDOMRange;
  endPt:nsIDOMRange;
  rangestr:String;
  regex:TSkRegExp;
  findstr:WideString;
  doc:nsIDOMDocument;
  startnode:nsIDOMNode;
begin
//まずRangeから得た文字列を正規表現で検索する。
  Result:=nil;
  //Rangeから得た文字列
  rangestr:=String(Range2String(Range));
  if rangestr='' then exit;
  regex := TSkRegExp.Create;
  try
    try
      regex.Expression := patRegExp;
      //ToDo:
      //regex.UseFuzzyCharDic:=True;
      if regex.Exec(rangestr) then
        findstr:=WideString(regex.Match[0]);
    except
    end;

  finally
    regex.Free;
  end;
//下準備
  startnode := range.StartContainer;
  doc := startnode.OwnerDocument;
  startPt := range.CloneRange;
  endPt := range.CloneRange;
  startPt.Collapse(true);
  endPt.Collapse(false);
//お次に検索すべき文字列をnsIFindにかける
	NS_CreateInstance('@mozilla.org/embedcomp/rangefind;1',nsIFind,finder);
  finder.SetFindBackwards(false);
  retRange := finder.Find(PWideChar(findstr),range,startPt,endPt);
  //lstOutPut.Items.Add(findstr);
//  memoOutPut.Text:=Range2String(range);
  lstOutPut.Items.Add(findstr);
  Result:=retRange;
end;

procedure TBagelMainForm.RegisterBookmark(URI:String;Title:String;
                                    parent: TBookmarkList =nil; index: integer =0;
                                    docshell:String='';
                                    reload:String='');
var
  bkmk: TBookmark;
begin
  bkmk := TBookmark.Create(bookmarks);
  bkmk.URI:=URI;
  bkmk.name:=title;
  bkmk.DocShell:=docshell;
  bkmk.ReloadIntv:=reload;
  if parent = nil then
    bookmarks.Add(bkmk)
  else
    parent.Insert(index, bkmk);
  SaveBookmarks(true);
end;

procedure TBagelMainForm.UnRegisterBookmark(bkmk:TBkmkBase);
begin
  bkmk.parent.Delete(bkmk);
  bkmk.Free;
  SaveBookmarks(true); //削除後の保存
end;

procedure TBagelMainForm.SaveBookmarks(save: boolean = true);
var
  i, top, sel: integer;
  node: TTreeNode;
begin
  top := 0;
  sel := -1;
  for i := 0 to BookmarksTree.Items.Count -1 do
  begin
    node := BookmarksTree.Items[i];
    if TObject(node.Data) is TBookmarkList then
      TBookmarkList(node.Data).expanded := node.Expanded;
    if BookmarksTree.TopItem = node then
      top := i;
    if BookmarksTree.Selected = node then
      sel := i;
  end;
  bookmarks.top := top;
//  bookmarks.selected := sel;
  if save then
  begin
      bookmarks.Save(GetSettingDir() + 'bookmarks.dat');
  end;

end;


function TBagelMainForm.FindScrollToCenter(win:nsIDOMWindow):Boolean;
var
  childwin:nsIDOMWindow;
  sel:nsISelection;
  i:Integer;
  range:nsIDOMRange;
begin
  Result:=False;
  sel := win.GetSelection;
  if sel.IsCollapsed then begin
    if win.Frames.Length = 0 then Result:=false
    else begin
      for i:=0 to win.Frames.Length-1 do begin
        childwin := win.Frames.Item(i);
        if FindScrollToCenter(childwin) then begin
          Result:=true;
          exit;
        end;
      end;
    end;
  end
  else begin
    range := sel.GetRangeAt(0);
    DoCenterRange(win,range);
    Result:=True;
  end;
end;

procedure TBagelMainForm.UpdateSearch;
var
  i:Integer;
  name:string;
begin
  EngineBox.Clear;
  for i:=0 to Pref.Engines.Count - 1 do
  begin
    name:=Pref.Engines.Names[i];
    if name<>'ListCount' then
    EngineBox.AddItem(Pref.Engines.Values[name],nil);
  end;
  EngineBox.ItemIndex := 1;
end;

procedure TBagelMainForm.SSSMenuClick(Sender: TObject);
var
  idx:Integer;
begin
  idx:=TBagelActionContainer(Sender).Tag;
  SwitchStyleSheetInFrame(GetCurrentBrowser.ContentWindow,processedStyleSheets.Strings[idx]);
end;

procedure TBagelMainForm.SSSExMenuClick(Sender: TObject);
var
  sss:nsIStyleSheetService;
  fileURI:nsIURI;
  localfile:nsILocalFile;
begin
  NS_GetService('@mozilla.org/content/style-sheet-service;1',nsIStyleSheetService,sss);
  NS_NewLocalFile(NewString(TBagelExtSSAction(Sender).FileName).AString,false,localfile);
  fileURI := NS_NewFileURI(localfile);
  if TMenuItem(Sender).Checked then begin
    sss.UnregisterSheet(fileURI,NS_ISTYLESHEETSERVICE_USER_SHEET);
  end
  else begin
    sss.LoadAndRegisterSheet(fileURI,NS_ISTYLESHEETSERVICE_USER_SHEET);
  end;
  TMenuItem(Sender).Checked:=not TMenuItem(Sender).Checked;
end;

procedure TBagelMainForm.LoadSaveUserCSS(load:Boolean);
var
  sss:nsIStyleSheetService;
  DirectoryName, DirnameButBSlash:String;
  sl:TStringList;
  localfile:nsILocalFile;
  fileUri:nsIURI;
  SearchRec:TSearchRec;
begin

  DirnameButBSlash:=GetSettingDir()+'css';
  DirectoryName:=DirnameButBSlash+'\';

  if not DirectoryExists(DirectoryName) then
  ForceDirectories(DirectoryName);
  sl:=TStringList.Create;
  if Load then
  sl.CommaText:=Pref.EnabledSheets;

  NS_GetService('@mozilla.org/content/style-sheet-service;1',nsIStyleSheetService,sss);
  // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
  if 0=FindFirst(DirectoryName+'*.css', faAnyFile, SearchRec) then try
    repeat
      if SearchRec.Attr and faDirectory <> 0 then begin
        // カレントディレクトリや親ディレクトリをスキップ
        if (SearchRec.Name='.') and (SearchRec.Name='..') then
          Continue;
        // ディレクトリに対する処理
        // SearchRec.Name にディレクトリ名が入っている
        // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
      end else begin

        NS_NewLocalFile(newString(DirectoryName+SearchRec.Name).AString,false,localfile);
        fileUri := NS_NewFileURI(localfile);

        if Load then begin
          if sl.IndexOf(searchRec.Name)<>-1 then begin
            //登録
            if sss<>nil then sss.LoadAndRegisterSheet(fileuri,NS_ISTYLESHEETSERVICE_USER_SHEET);
          end;
        end
        else begin
          //登録されているかのチェック
          if (sss<>nil) and sss.SheetRegistered(fileuri,NS_ISTYLESHEETSERVICE_USER_SHEET) then begin
            sl.Add(SearchRec.Name);
          end;
        end;
      end;
    until 0<>FindNext(SearchRec);
  finally
    FindClose(SearchRec);
  end;

  if not Load then Pref.EnabledSheets:=sl.CommaText;

  sl.Free;

end;


procedure TBagelMainForm.CreateWnd;
begin
  inherited;
end;

procedure TBagelMainForm.DestroyWnd;
begin
  inherited;
end;

procedure TBagelMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);  {
  //TODO:
  if FormStyle in [fsNormal, fsStayOnTop] then
    if BorderStyle in [bsSingle, bsSizeable] then
      //if Config.wrtFmUseTaskBar then
      begin
        Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
        Params.WndParent := 0;
      end;                          }
end;


function TBagelMainForm.WildcardMatch(Exp:String;S:String):Boolean;

  function WildcardMatchInternal(Exp:String;S:String):Boolean;
  var
    RegExp:TSkRegExp;
    astr:Boolean;
  begin
    astr := False; if Pos('*',Exp)>0 then astr := true;
    Exp:=StringReplace(Exp,'.','\.',[rfReplaceAll]);
    Exp:=StringReplace(Exp,'*','.+',[rfReplaceAll]);
    Exp:=StringReplace(Exp,'?','.',[rfReplaceAll]);

    if astr then Exp:='^'+Exp+'$';

    RegExp:=TSkRegExp.Create;
    try
      RegExp.Expression:=Exp;
      Result := RegExp.Exec(S);
    finally
      RegExp.Free;
    end;
  end;
var
  arr:TStrArray;
  i:Integer;
begin
  Result:=false;
  arr:=btSplitToArray(Exp,';');
  for i:=0 to high(arr) do begin
    if WildcardMatchInternal(arr[i],S) then begin
      Result := true;
      break;
    end;
  end;
end;

procedure TBagelMainForm.AddLinkToBookmarks;
  var
    bkmk: TBookmarkList;
    i: Integer;
  begin
    for i := 0 to bookmarks.Count - 1 do
    begin
      if bookmarks.Items[i].name = 'リンク' then
        exit;
    end;
    bkmk := TbookmarkList.Create(bookmarks);
    bkmk.name := 'リンク';
    bookmarks.Insert(0, bkmk);
end;
procedure TBagelMainForm.bkmkSearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  function GetNext(Current:TBkmkBase):TBkmkBase;
  var
    Index:Integer;
  begin
    Result:=nil;
    Index:=TBookmarkList(Current.parent).IndexOf(Current);
    if Index = TBookmarkList(Current.parent).Count-1 then begin
      if (Current.parent=bookmarks) then Exit;
      Result:=GetNext(Current.parent);
    end
    else begin
      Result:= TBookmarkList(Current.parent).Items[Index+1];
    end;
  end;

var
  i:Integer;
  tmp:TBkmkBase;
//  parent:TBookmarkList;
  node:TTreeNode;
//  Searching:Boolean;
  StartPt:Integer;
//  EndPt:Integer;
begin
  if bookmarks.Count = 0 then Exit;

  StartPt:=0;
  For i:=0 to BookmarksTree.Items.Count-1 do begin
    node:=BookmarksTree.Items.Item[i];
    if BookmarksTree.Selected=node then begin
      StartPt:=i;
      Break;
    end;
  end;

  if Key=VK_RETURN then begin
    if FBookmarkSearchFlag then begin
      BookmarksTree.OnClick(nil);
      exit;
    end;
    FBookmarkSearchFlag:=true;
    //Searching:=true;
    //while Searching do begin
    //ShowMessage(IntToStr(BookmarksTree.Items.Count))
    //end;
    For i:=0 to BookmarksTree.Items.Count-1 do begin
      node:=BookmarksTree.Items.Item[i];
      tmp:=TBkmkBase(node.Data);
      if tmp=bookmarks then Continue;
      if tmp is TBookmarkList then Continue;
      if Pos( UpperCase(bkmkSearchEdit.Text) , UpperCase(tmp.name) )>0 then begin
        node.Selected:=true;
        Break;
      end;
    end;
  end
  else if (Key=VK_UP) and FBookmarkSearchFlag then begin
    Key:=0;
    For i:= StartPt - 1 downto 0 do begin
      node:=BookmarksTree.Items.Item[i];
      tmp:=TBkmkBase(node.Data);
      if tmp=bookmarks then Continue;
      if tmp is TBookmarkList then Continue;
      if Pos( UpperCase(bkmkSearchEdit.Text) , UpperCase(tmp.name) )>0 then begin
        node.Selected:=true;
        Break;
      end;
    end;
    FBookmarkSearchFlag:=true;
  end

  else if (Key=VK_DOWN) and FBookmarkSearchFlag then begin
    //BookmarksTree.
    For i:=StartPt + 1 to BookmarksTree.Items.Count-1 do begin

      node:=BookmarksTree.Items.Item[i];
      tmp:=TBkmkBase(node.Data);
      if tmp=bookmarks then Continue;
      if tmp is TBookmarkList then Continue;
      if Pos( UpperCase(bkmkSearchEdit.Text) , UpperCase(tmp.name) )>0 then begin
        node.Selected:=true;
        BookmarksTree.Selected.MakeVisible;
        Break;
      end;
    end;
    FBookmarkSearchFlag:=true;
  end
  else begin
    Exit;
  end;


end;

procedure TBagelMainForm.bkmkSearchEditChange(Sender: TObject);
begin
  FBookmarkSearchFlag:=false;
end;


procedure TBagelMainForm.BookmarkPNewFolderClick(Sender: TObject);
  function NewFolder(var parent: TBookmarkList): TBookmarkList;
  begin
    result := TBookmarkList.Create(parent);
    result.name := 'New Folder';
    result.expanded := false;
    parent.expanded := true;
  end;

var
  node: TTreeNode;
  parent: TBookmarkList;
begin
  node := BookmarksTree.Selected;
  SaveBookmarks(false);
  if node = nil then
  begin
    parent := bookmarks;
    parent.Insert(parent.Count, NewFolder(parent));
  end
  else if (TObject(node.Data) is TBookmarkList) and (0 <= GetKeyState(VK_CONTROL)) then
  begin
    parent := node.Data;
    parent.Insert(0, NewFolder(parent));
  end
  else begin
    parent := TBookmarkList(node.Parent.Data);
    parent.Insert(parent.IndexOf(node.Data), NewFolder(parent));
  end;
  // BookmarkMenuTimer.Enabled:=True;
end;

procedure TBagelMainForm.AddBookmarkHere(Sender:TObject);
var
  f:TBookmarkForm;
begin
  f:=TBookmarkForm.Create(Self);
  f.mode:='create';
  f.ParentBkmk:=TBookmarkList(TMenuItem(Sender).Tag);
  if GetBrowser(tabBarCtxTarget)<>nil then begin
    f.Title:=GetBrowser(tabBarCtxTarget).Title;
    f.URI:=GetBrowser(tabBarCtxTarget).URI;
  end;
  if (f.ShowModal=mrOk) then begin
    RegisterBookmark(f.URI,f.Title,bookmarks,bookmarks.Count,f.DocShellState);
  end;
  f.Free;
end;

procedure TBagelMainForm.OnBookmarkShortcutMenuClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and
     (TObject((Sender as TMenuItem).Tag) is TBookmark) then
  begin
    with TBookmark(TObject((Sender as TMenuItem).Tag)) do
    begin
      Addtab(URI,Pref.OpenModeBookmarks,
       0,
       '',
       StrToIntDef(DocShell,Pref.DocShellDefault),
       StrToIntDef(ReloadIntv,0));
    end;
  end;
end;

procedure TBagelMainForm.Extract_CheckByPattern(Check:Boolean);
var
  i:Integer;
  Item:TListItem;
begin
  for i:=0 to LinkListView.Items.Count-1 do begin
    Item:=LinkListView.Items[i];
    if not item.Checked then continue;
    if cboExtractDetType.ItemIndex=0 then begin //URI
      if WildCardMatch(cboExtractPattern.Text,item.SubItems.Strings[0]) then begin
        //not Checkのとき unCheck
        if not Check then item.Checked := false;
      end
      else begin
        //Check のとき unCheck
        if Check then item.Checked := false;
      end;
    end
    else begin //Text
      if WildCardMatch(cboExtractPattern.Text,item.Caption) then begin
        //not Checkのとき unCheck
        if not Check then item.Checked := false;
      end
      else begin
        //Check のとき unCheck
        if Check then item.Checked := false;
      end;
    end;
  end;
end;

procedure TBagelMainForm.GlobalHotkeyPressed(Sender: TObject; Modifiers,
  virtkey: Word);
begin
  if Self.Visible then begin 
    //if Application.Active then
    Self.Hide;
  end
  else begin
    Visible := true;
    ShowWindow(Application.Handle,SW_SHOW);
  end;
end;

procedure TBagelMainForm.FileTreeViewDblClick(Sender:TObject);
var
	URLFile:TIniFile;
begin
  if (FileTreeView.SelectedFolder<>nil) and  FileExists(FileTreeView.SelectedFolder.PathName) then begin
    if LowerCase(ExtractFileExt(FileTreeView.SelectedFolder.PathName))='.url' then begin
      URLFile:=TIniFIle.Create(FileTreeView.SelectedFolder.PathName);
      try
        AddTab(URLFile.ReadString('InternetShortcut','URL',''),0,0,'',Pref.DocShellDefault);
      finally
        URLFile.Free;
      end;
    end
    else if LowerCase(ExtractFileExt(FileTreeView.SelectedFolder.PathName))='.lnk' then begin
      ShellExecute(Self.Handle,PChar('open'),PChar(FileTreeView.SelectedFolder.PathName),PChar(''),PChar(''),SW_SHOW);
    end
    else begin
      AddTab(FileTreeView.SelectedFolder.PathName,0,0,'',Pref.DocShellDefault);
    end;
  end;
end;

procedure TBagelMainForm.DoBackUp;
  procedure DeleteFolders(FolderName: string);
  var
    foStruct:  TSHFileOpStruct;
  begin
    with foStruct do
    begin
      wnd:=Handle;
      wFunc:=FO_DELETE;  //削除フラグ（コピーの場合はFO_COPY）
      pFrom:=PChar(FolderName+#0);  //削除するフォルダ
      pTo:=#0;
      fFlags:=FOF_SILENT or FOF_NOCONFIRMATION;  //削除ダイアログ非表示
      fAnyOperationsAborted:=False;
      hNameMappings:=nil;
      lpszProgressTitle:=nil;
    end;

    if SHFileOperation(foStruct)<>0 then  //削除
    ShowMessage('フォルダの削除に失敗しました。');
  end;
var
  BUDir:String;
  pS:nsIPrefService;
  SearchRec:TSearchRec;
  GeckoPrefBakFile:nsILocalFile;
  i:Integer;
begin
  if Pref.BUBookmarkOnStart or Pref.BUPrefOnStart or Pref.BUGeckoPrefOnStart then begin

    BUDir := GetSettingDir()+'backup\';

    //不要になったディレクトリを削除
    if DirectoryExists(BUDir + IntToStr(Pref.BUGeneration)) then begin
      DeleteFolders(BUDir + IntToStr(Pref.BUGeneration));
    end;

    //番号を一つづつずらす
    for i:=Pref.BUGeneration-1 downto 1 do begin
      if not DirectoryExists(BUDir + IntToStr(i)) then continue
      else begin
        RenameFile(BUDir + IntToStr(i),BUDir + IntToStr(i+1));
      end;
    end;

    //最新のバックアップディレクトリを作る
    ForceDirectories(BUDir + '1');
    if Pref.BUBookmarkOnStart then begin
      CopyFile(PChar(ExtractFilePath(Application.ExeName)+'bookmarks.dat'),
               PChar(BUDir + '1\bookmarks.dat'),
               False);
    end;

    if Pref.BUPrefOnStart then begin
      if 0=FindFirst(GetSettingDir + '*.*', faAnyFile	, SearchRec) then try
        repeat
          if SearchRec.Attr and faDirectory <> 0 then begin
            if (SearchRec.Name='.') or (SearchRec.Name='..') then
              Continue;
          end else begin
            CopyFile(
              PChar(GetSettingDir() + SearchRec.Name),
              PChar(BUDir + '1\' + SearchRec.Name),
              False
            );
          end;
        until 0<>FindNext(SearchRec);
      finally
        FindClose(SearchRec);
      end;

      //Bagel.ini
      CopyFile(
        PChar(GetSettingDir() + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini'))),
        PChar(BUDir + '1\' + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini'))),
        False
      );
    end;
    if Pref.BUGeckoPrefOnStart then begin
      //Gecko設定の保存
      try
        NS_GetService(NS_PREFSERVICE_CID,nsIPrefService,pS);
        NS_NewLocalFile(NewString(BUDir + '1\pref.js.dat').AString, false, GeckoPrefBakFile);
        ps.SavePrefFile(GeckoPrefBakFile);
      except
      end;
    end;
  end;
end;

function TBagelMainForm.FireOperaKey(Str:String):Boolean;
var
  kbdObj:TObject;
  kbdName:String;
  i,eqPos:Integer;
begin
  Result:=false;
  tabBarCtxTarget:=TabControl.TabIndex;
  for i:=0 to Pref.OperaKeyList.Count - 1 do begin
    if Str=Pref.OperaKeyList.Names[i] then begin
      kbdName:=Pref.OperaKeyList.Strings[i];
      eqPos:=Pos('=',kbdName);
      kbdName:=Copy(kbdName,eqPos+1,Length(kbdName)-eqPos);
      kbdObj:=FindAction(kbdName);
      if (kbdObj<>nil) and (kbdObj is TCustomAction) then
      begin
        TCustomAction(kbdObj).Execute;
        Result:=true;
      end;
      break;
    end;
  end;
end;

procedure TBagelMainForm.lvTransferDblClick(Sender: TObject);
var
  dl:nsIDownload;
  path:IInterfacedString;
begin
  if lvTransfer.Selected<>nil then begin
    dl := TDLListItem(lvTransfer.Selected).Download;
    path := NewString;
    dl.TargetFile.GetPath(path.AString);
    ShellExecute(Handle,'OPEN',PChar(String(path.ToString)),nil,nil,SW_SHOW);
  end;
end;

{procedure TBagelMainForm.FormFileDropped(Sender: TJvDropTarget; var Effect: TJvDropEffect;
    Shift: TShiftState; X, Y: Integer);
var
  sl:TStringList;
  i:Integer;
begin
  sl := TStringList.Create;
  try
    Sender.GetFilenames(sl);
    for i := 0 to sl.Count - 1 do
      AddTab(sl.Strings[i]);
  finally
    sl.Free;
  end;
end;}


procedure TBagelMainForm.BookmarksTreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
//var
//  node: TTreeNode;
 // si: TScrollInfo;
begin         {
  FavTreeScrlTimer.Enabled := false;
  FavTreeExpndTimer.Enabled := false;}
  Accept := true;
            {
  // 自動スクロール
  si.cbSize := sizeof(TScrollInfo);
  si.fMask := SIF_RANGE or SIF_POS;
  GetScrollInfo(FavoriteView.Handle, SB_VERT, si);
  if (si.nPos > si.nMin) and (Y < 25) then
  begin
    FavTreeScrlTimer.Tag := 0; //UP
    FavTreeScrlTimer.Enabled := true;
    exit;
  end
  else if (si.nPos < si.nMax) and (Y > FavoriteView.Height -45) then
  begin
    FavTreeScrlTimer.Tag := 1; //DOWN
    FavTreeScrlTimer.Enabled := true;
    exit;
  end;       }
          {
  // 自動展開
  node := FavoriteView.GetNodeAt(X, Y);
  if (node <> nil) and (not node.Expanded) and (0 < node.Count) then
  begin
    FavTreeExpndTimer.Tag := node.AbsoluteIndex;
    FavTreeExpndTimer.Enabled := true;
  end;     }
end;

procedure TBagelMainForm.BookmarksTreeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  function IsPosterity(target: TTreeNode; node: TTreeNode): boolean;
  begin
    if target.Parent = nil then
      result := false
    else if target.Parent = node then
      result := true
    else
      result := IsPosterity(target.Parent, node);
  end;
var
  node, src: TTreeNode;
  targetBkmk, srcBkmk:TBkmkBase;
//  board: TBoard;
//  thread: TThreadItem;
//  viewItem: TViewItem;
begin
  {FavTreeScrlTimer.Enabled := False;
  FavTreeExpndTimer.Enabled :=false;}
  node := BookmarksTree.DropTarget;
  targetBkmk := TBkmkBase(node.Data);
  if node = nil then
    exit;

  //▼タブドロップでお気に入りのその位置に登録
  {if Source = ListTabControl then
  begin
    board := ListTabControl.Tabs.Objects[tabDragSourceIndex] as TBoard;
    //▼重複許可
    if not Config.optAllowFavoriteDuplicate and IsFavorite(board) then
      exit;
    if TObject(node.Data) is TFavoriteList then
      RegisterFavorite(board, TFavoriteList(node.Data), 0)
    else
      RegisterFavorite(board, TFavoriteList(node.Parent.Data), node.Index);
    exit;
  end
  else }if Source = TabControl then
  begin       {
    viewItem := viewList.Items[tabDragSourceIndex];
    thread := viewItem.thread;
    if thread = nil then
      exit;
    //▼重複許可
    if not Config.optAllowFavoriteDuplicate and IsFavorite(thread) then
      exit;
    if TObject(node.Data) is TFavoriteList then
      RegisterFavorite(thread, TFavoriteList(node.Data), 0)
    else
      RegisterFavorite(thread, TFavoriteList(node.Parent.Data), node.Index);
    UpdateThreadInfo(thread);
    exit;      }
    exit;
  end;

  src := BookmarksTree.Selected;
  srcBkmk := TBkmkBase(src.Data);
  if (src = nil) or (src = node) then
    exit;
  if src.Data = bookmarks then
    exit;
  if IsPosterity(node, src) then
    exit;
  srcBkmk.Remove;
  if (targetBkmk is TBookmarkList) and
     ((0 <= GetKeyState(VK_CONTROL)) or (targetBkmk = bookmarks))
  then
  begin
    TBookmarkList(targetBkmk).Insert(0, srcBkmk);
  end
  else begin
    TBookmarkList(targetBkmk.parent)
      .Insert(TBookmarkList(targetBkmk.parent).IndexOf(targetBkmk),
              srcBkmk);
  end;
  //BookmarksTree.Selected := src;
  //src.Focused := true;
  SaveBookmarks(false);
end;


procedure TBagelMainForm.SearchBoxDrop(var Res: HRESULT;
  const dataObj: IDataObject; KeyState: TNkKeyState; pt: TPoint;
  var dwEffect: Integer);
var Medium: TSTGMedium;
    Format: TFormatETC;
    Text: string;
begin
  Format.cfFormat := CF_TEXT;
  Format.ptd := Nil;
  Format.dwAspect := DVASPECT_CONTENT;
  Format.lindex := -1;
  Format.tymed := TYMED_HGLOBAL;

  if dataObj.GetData(Format, Medium) <> S_OK then Exit;
  try
    Text := PChar(GlobalLock(Medium.hGlobal));
    GlobalUnlock(Medium.hGlobal);
      //FOnTextDrop(Text);
  finally
    if Medium.unkForRelease = Nil then ReleaseStgMedium(Medium);
  end;

  if  SearchBoxHighlighted then begin
    SearchBox.Color:=clWindow;
    SearchBoxHighlighted:=False;
  end;

  SearchBox.Text:=Text;
  SearchBox.OnChange(Self);

  if Pref.SearchOnDrop then
  DoSearch(Text);

end;

procedure TBagelMainForm.SearchBoxDragOver(var Res: HRESULT;
  KeyState: TNkKeyState; pt: TPoint; var dwEffect: Integer);
begin
  dwEffect := DROPEFFECT_COPY;
  if not SearchBoxHighlighted then begin
    SearchBox.Color:=clYellow;
    SearchBoxHighlighted:=True;
  end;
end;

procedure TBagelMainForm.SearchBoxDragLeave(var Res: HRESULT);
begin
  if SearchBoxHighlighted then begin
    SearchBox.Color:=clWindow;
    SearchBoxHighlighted:=False;
  end;
end;

procedure TBagelMainForm.SearchBoxDragEnter(var Res: HRESULT;
  const dataObj: IDataObject; KeyState: TNkKeyState; pt: TPoint;
  var dwEffect: Integer);
var
  HasText:Boolean;
  Format: TFormatETC;
begin
  Format.cfFormat := CF_TEXT;
  Format.ptd := Nil;
  Format.dwAspect := DVASPECT_CONTENT;
  Format.lindex := -1;
  Format.tymed := TYMED_HGLOBAL;

  if dataObj.QueryGetData(Format) = S_OK then HasText := True
                                        else HasText := False;

  if HasText then dwEffect := DROPEFFECT_COPY
            else dwEffect := DROPEFFECT_NONE;
  if not SearchBoxHighlighted then begin
    SearchBox.Color := clYellow;
    SearchBoxHighlighted:=True;
  end;
end;

procedure TBagelMainForm.MenuToolbarResize(Sender: TObject);
begin
  //MainCoolbar.Bands.FindBand(MenuToolbar).DealWidth := GetWidthAllToolButton(MenuToolbar);
end;
procedure TBagelMainForm.ControlToolbarResize(Sender: TObject);
begin
  //MainCoolbar.Bands.FindBand(ControlToolbar).DealWidth := GetWidthAllToolButton(ControlToolbar);
end;
procedure TBagelMainForm.LinkbarResize(Sender: TObject);
begin
  //MainCoolbar.Bands.FindBand(Linkbar).DealWidth := GetWidthAllToolButton(Linkbar);
end;

procedure TBagelMainForm.BookmarkMenuClick(Sender: TObject);
var
  i,j:Integer;
  item:TBagelActionContainer;
  bitem,cbitem: TBagelBookmarkContainer;
begin
  BookmarkMenu.Clear;

  item:=TBagelActionContainer.Create(Self);
  item.Action  := actAddBookmark;
  item.Caption := 'ブックマークに追加';
  TBagelActionContainer(Sender).Add(item);

  item:=TBagelActionContainer.Create(Self);
  item.Caption := 'ブックマークを編集';
  item.Action  := actBookmarkEditor;
  TBagelActionContainer(Sender).Add(item);

  item := TBagelActionContainer.Create(Self);
//  item.OnClick := BookmarkPNewFolderClick;
  item.Caption := 'フォルダを追加';
  TBagelActionContainer(Sender).Add(item);

  item:=TBagelActionContainer.Create(Self);
  item.Caption := '-';
  TBagelActionContainer(Sender).Add(item);

  for i := 0 to TBookmarks(TBagelBookmarkContainer(Sender).Bookmark).Count - 1 do
  begin
    bitem := TBagelBookmarkContainer.Create(Self);
    bitem.OnClick := BookmarkItemClick;
    bitem.Bookmark := TBookmarks(TBagelBookmarkContainer(Sender).Bookmark).Items[i];
    bitem.Caption := bitem.Bookmark.name;
    TBagelActionContainer(Sender).Add(bitem);
    if bitem.Bookmark is TBookmarkList then begin
      for j := 0 to TBookmarkList(bitem.Bookmark).Count - 1 do begin
        cbitem := TBagelBookmarkContainer.Create(Self);
        cbitem.OnClick := BookmarkItemClick;
        cbitem.Bookmark := TBookmarkList(bitem.Bookmark).Items[j];
        cbitem.Caption := cbitem.Bookmark.name;
        bitem.Add(cbitem);
      end;
    end;
  end;
end;

procedure TBagelMainForm.DummyProc(Sender: TObject);
begin
  //
end;

procedure TBagelMainForm.BookmarkItemClick(Sender: TObject);
var
  b:TBkmkBase;
  cbitem: TBagelBookmarkContainer;
begin
  b := TBagelBookmarkContainer(Sender).Bookmark;
  if b is TBookmark then
  begin
    with TBookmark(b) do
    begin
      Addtab(URI,Pref.OpenModeBookmarks,
       0,
       '',
       StrToIntDef(DocShell,Pref.DocShellDefault),
       StrToIntDef(ReloadIntv,0));
    end;
  end
  else if b is TBookmarkList then
  begin

  end;
end;


//procedure TBagelMainForm.BkmkMenuCreate(Sender: TObject);
(*  procedure AddBkmkItem(bkmkList: TBookmarkList; parent: TMenuItem);
  var
    item: TMenuItem;
    i: integer;
  begin
    for i := 0 to bkmkList.Count -1 do
    begin
      item := TMenuItem.Create(parent);
      if Pref.BookmarkMenuMaxLength> 0 then begin
        item.Caption := StringReplace(LeftStr(bkmkList.Items[i].name,Pref.BookmarkMenuMaxLength), '&', '&&', [rfReplaceAll])
      end
      else begin
        item.Caption := StringReplace(bkmkList.Items[i].name, '&', '&&', [rfReplaceAll])
      end;

      parent.Add(item);
      if bkmkList.Items[i] is TBookmarkList then
      begin
        item.ImageIndex := 7; // ※[JS]
        item.Tag := Integer(bkmkList.Items[i]);
        item.OnClick := BkmkMenuCreate;
      end else
      begin
        if Length(TBookmark(bkmkList.Items[i]).URI) > 0 then
         item.ImageIndex := 9
        else
          item.ImageIndex := 0;
        item.Tag := Integer(bkmkList.Items[i]);
        item.OnClick := OnBookmarkShortcutMenuClick;
      end;
    end;
  end;
var
  i: integer;
  bkmkList: TBookmarkList;
  DefMI:TMenuItem;
begin

  if not (Sender is TMenuItem) then
    exit;

  with TMenuItem(Sender) do
  begin
    if Tag = -1 then
      exit
    else if Tag = 0 then
      bkmkList := bookmarks
    else
      bkmkList := TBookmarkList(Tag);
                                                     //
    for i := 0 to Count - 1 do
    begin
      if (items[i].ImageIndex = 7) and (items[i].Count = 0) then begin
        //ShowMessage(bkmkList.Items[i].name);
        AddBkmkItem(
          TBookmarkList(bkmkList.Items[i]),
          items[i]
        );
      end;
    end;
	if TMenuItem(Sender) = BookmarksMenu then
	begin
	  DefMI:=TMenuItem.Create(TMenuItem(Sender));
	  DefMI.Action:=actAddBookmark;
	  DefMI.Caption := 'ブックマークに追加';
	  TMenuItem(Sender).Insert(0,DefMI);

	  DefMI:=TMenuItem.Create(TMenuItem(Sender));
	  //DefMI.OnClick:=EditBookmarksMenuClick;
	  //DefMI.Action:=
	  DefMI.Caption := 'ブックマークを編集';
	  DefMI.Enabled:=True;
	  DefMI.Action:=actBookmarkEditor;
	  TMenuItem(Sender).Insert(1,DefMI);
	   DefMI:=TMenuItem.Create(TMenuItem(Sender));
	  DefMI.OnClick:=BookmarkPNewFolderClick;
	  DefMI.Caption := 'フォルダを追加';
	  TMenuItem(Sender).Insert(2,DefMI);
	  TMenuItem(Sender).InsertNewLineAfter(DefMI);
	end
	else
	begin
	//
	  if Pref.ShowAddBookmarkHere or Pref.ShowOpenAllBookmarks then begin
	    DefMI:=TMenuItem.Create(TMenuItem(Sender));
	    DefMI.Caption := '-';
	    TMenuItem(Sender).Insert(TMenuItem(Sender).Count,DefMI);

	    if Pref.ShowOpenAllBookmarks then begin
	      DefMI:=TMenuItem.Create(TMenuItem(Sender));
	      DefMI.Tag:=TMenuItem(Sender).Tag;
	      DefMI.Caption := 'これら全てを開く';
	      DefMI.OnClick := OpenAllBookmarks;
	      TMenuItem(Sender).Insert(TMenuItem(Sender).Count,DefMI);
	    end;

	    if Pref.ShowAddBookmarkHere then begin
	      DefMI:=TMenuItem.Create(TMenuItem(Sender));
	      DefMI.Caption := 'このフォルダに追加';
	      DefMI.Tag:=TMenuItem(Sender).Tag;
	      DefMI.OnClick:=AddBookmarkHere;
	      TMenuItem(Sender).Insert(TMenuItem(Sender).Count,DefMI);
	    end;
	  end;
	end;
    Tag := -1;
  end;
end;*)


initialization
  //これを忘れると、RegisterDragDropに失敗します。
  OleInitialize(nil);
  GRE_Startup();
finalization
  GRE_Shutdown();
  OleUninitialize;

end.
