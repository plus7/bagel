unit UBagelPref;

//TODO:
//Prefはいろいろと変わってるので対応しないといけない個所が多い

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,splitjoin,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, {Grids, ValEdit,} CheckLst,BagelPref,nsXPCOM,nsXPCOMGlue,
  {ShellCtrls,} ActnList,nsGeckoStrings,nsPerm,nsNetUtil, Menus, ShlObj, Registry,
  ImgList, {ColorGrd,} BrwsFldr, IniFiles, SearchListItem, USearchEdit, nsPref, nsInit;

type                                                      



  TBagelSettingForm = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    Button2: TButton;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    ActionList1: TActionList;
    Action1: TAction;
    PageControl1: TPageControl;
    GeneralSheet: TTabSheet;
    Label15: TLabel;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    chkKioskAddr: TCheckBox;
    chkKioskTabbar: TCheckBox;
    chkKioskSearchbar: TCheckBox;
    chkKioskStatusBar: TCheckBox;
    chkKioskLinkbar: TCheckBox;
    chkKioskMainbar: TCheckBox;
    edtHome: TEdit;
    KbdSheet: TTabSheet;
    Panel3: TPanel;
    btnAdaptKbd: TButton;
    btnDelKbd: TButton;
    ShortcutListEditor: TListView;
    edtKbdShortcut: TMemo;
    GestureSheet: TTabSheet;
    Label11: TLabel;
    Panel4: TPanel;
    ButtonUp: TButton;
    ButtonClear: TButton;
    ButtonLeft: TButton;
    ButtonRight: TButton;
    ButtonDown: TButton;
    edtMGest: TEdit;
    btnAdaptGest: TButton;
    btnDelGest: TButton;
    GestListEditor: TListView;
    MenuCustSheet: TTabSheet;
    Panel6: TPanel;
    PopupSheet: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Panel9: TPanel;
    AllowPopupList: TListBox;
    AllowPopupEdit: TEdit;
    AddAllowPopup: TButton;
    DelAllowPopup: TButton;
    ImageSheet: TTabSheet;
    Panel10: TPanel;
    DenyImgList: TListBox;
    DenyImgEdit: TEdit;
    AddDenyImg: TButton;
    DelDenyImg: TButton;
    CookieSheet: TTabSheet;
    Label9: TLabel;
    Panel11: TPanel;
    TabSheet: TTabSheet;
    Panel12: TPanel;
    GroupBox7: TGroupBox;
    lbOpenMode: TListBox;
    chkNewTab: TCheckBox;
    rgTabAddPos: TRadioGroup;
    chkBgTab: TCheckBox;
    GroupBox13: TGroupBox;
    Label10: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    chkTabMultiline: TCheckBox;
    edtMaxTab: TEdit;
    chkViewIsRead: TCheckBox;
    edtTabMaxStr: TEdit;
    edtTabWidth: TEdit;
    GroupBox14: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    chkEnableWheelTabChange: TCheckBox;
    GroupBox15: TGroupBox;
    Label16: TLabel;
    Label23: TLabel;
    cboWhenCloseChoose: TComboBox;
    FontColorSheet: TTabSheet;
    Label5: TLabel;
    Label14: TLabel;
    Panel14: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboPropotional: TComboBox;
    ComboSansSerif: TComboBox;
    ComboSerif: TComboBox;
    ComboMonospace: TComboBox;
    GroupBox2: TGroupBox;
    lblTextColor: TLabel;
    lblBGColor: TLabel;
    lblAnchorColor: TLabel;
    lblVisitedColor: TLabel;
    lblFocusColor: TLabel;
    lblFocusBgColor: TLabel;
    chkUseSysColor: TCheckBox;
    chkUseFocusColors: TCheckBox;
    chkFocusOnAnything: TCheckBox;
    chkUnderlineA: TCheckBox;
    chkAlwaysUseFont: TCheckBox;
    chkAlwaysUseColor: TCheckBox;
    NetworkSheet: TTabSheet;
    Panel15: TPanel;
    GroupBox3: TGroupBox;
    MemoProxy: TMemo;
    AddProxyList: TButton;
    DelProxyList: TButton;
    ProxyList: TListBox;
    UserCSSSheet: TTabSheet;
    Label6: TLabel;
    Panel1: TPanel;
    UserCssMemo: TMemo;
    btnSaveUserContent: TButton;
    AutoExecSheet: TTabSheet;
    Panel13: TPanel;
    chkExecScriptOnStart: TCheckBox;
    ConfirmSheet: TTabSheet;
    Panel16: TPanel;
    chkCnfAppQuit: TCheckBox;
    chkCnfCloseAll: TCheckBox;
    chkCnfCloseOther: TCheckBox;
    chkBkmkDel: TCheckBox;
    chkOpeningManyItems: TCheckBox;
    edtWarnItemCount: TEdit;
    AddrSearchSheet: TTabSheet;
    Panel17: TPanel;
    NewTabSheet: TTabSheet;
    Panel18: TPanel;
    NewTabGroup: TRadioGroup;
    chkTakeOverSession: TCheckBox;
    AccSheet: TTabSheet;
    Panel19: TPanel;
    chlAccFiletype: TCheckListBox;
    chlAccProtocol: TCheckListBox;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    AdblockSheet: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    UASheet: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    PasswordSheet: TTabSheet;
    CacheHistorySheet: TTabSheet;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    TabSheet25: TTabSheet;
    TabSheet26: TTabSheet;
    TabSheet27: TTabSheet;
    TabSheet28: TTabSheet;
    TabSheet30: TTabSheet;
    TabSheet31: TTabSheet;
    TabSheet32: TTabSheet;
    TabSheet16: TTabSheet;
    ImageList1: TImageList;
    Panel5: TPanel;
    chkDelRecClosed: TCheckBox;
    chkDelRecOpened: TCheckBox;
    chkDelAddress: TCheckBox;
    chkDelSearch: TCheckBox;
    chkExecScriptOnShutdown: TCheckBox;
    chkDelCookie: TCheckBox;
    chkDelHistory: TCheckBox;
    chkDelCache: TCheckBox;
    lstShutdownScript: TListBox;
    RejURL: TEdit;
    AddRejURL: TButton;
    DelRejURL: TButton;
    RejURLList: TListBox;
    RejTitleList: TListBox;
    RejTitle: TEdit;
    AddRejTitle: TButton;
    DelRejTitle: TButton;
    Panel7: TPanel;
    Panel23: TPanel;
    Panel25: TPanel;
    GroupBox6: TGroupBox;
    clSuppressProtocol: TCheckListBox;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    edtScriptMaxRunTime: TEdit;
    Label17: TLabel;
    edtPopupDisableDelay: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    edtPopupmax: TEdit;
    chkShowImage: TCheckBox;
    chkOnlyOrigServer: TCheckBox;
    chkEnableJava: TCheckBox;
    chkEnableJS: TCheckBox;
    chkInheritDocShell: TCheckBox;
    edtPathToMigemoDLL: TEdit;
    Label28: TLabel;
    edtpathToMigemoDic: TEdit;
    LabelNuma: TLabel;
    chkIncSearchAutoStart: TCheckBox;
    chkIncSearchLinksOnly: TCheckBox;
    chkIncSearchEnableTimeout: TCheckBox;
    edtIncSearchTimeout: TEdit;
    Label34: TLabel;
    chkEnableLazyHighlight: TCheckBox;
    chkAutoOpenGrep: TCheckBox;
    Panel52: TPanel;
    Label30: TLabel;
    GroupBox16: TGroupBox;
    GroupBox9: TGroupBox;
    chkAddrAutoComplete: TCheckBox;
    chkAddrShowGo: TCheckBox;
    chkReplaceZenkakuSpace: TCheckBox;
    edtSearchbarDropdownCount: TEdit;
    chkRemenberSearchEngine: TCheckBox;
    chkScrollToCenterOnFind: TCheckBox;
    chkSearchOnDrop: TCheckBox;
    chkSearchOnEngineChange: TCheckBox;
    chkSearchOnKeywordChange: TCheckBox;
    CheckBox23: TCheckBox;
    Panel53: TPanel;
    lvUserAgent: TListView;
    Label29: TLabel;
    edtUAViewName: TEdit;
    edtUAString: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    btnAddUA: TButton;
    btnDelUA: TButton;
    chkUseCaretMode: TCheckBox;
    CheckBox51: TCheckBox;
    Label37: TLabel;
    chkUseSidebarAutohide: TCheckBox;
    Label38: TLabel;
    edtSidebarAutoOpenDelay: TEdit;
    Label39: TLabel;
    edtSidebarAutoHideDelay: TEdit;
    GroupBox10: TGroupBox;
    chkAddBkmkHere: TCheckBox;
    chkOpenAllBkmk: TCheckBox;
    chkSidebarOverlap: TCheckBox;
    GroupBox5: TGroupBox;
    lstSidebarHeaderHiddenItem: TListBox;
    lstSidebarHeaderVisibleItem: TListBox;
    btnAddSHI: TButton;
    btnDelSHI: TButton;
    Button9: TButton;
    Button10: TButton;
    GroupBox8: TGroupBox;
    chkDomAllowClose: TCheckBox;
    chkDomAllowFlip: TCheckBox;
    chkDomContextmenu: TCheckBox;
    chkDomChangeStatustext: TCheckBox;
    chkDomHideScrollbar: TCheckBox;
    chkDomChangeImgSrc: TCheckBox;
    chkDomPopupDuringLoad: TCheckBox;
    chkDontShowAppname: TCheckBox;
    btnAdblockDel: TButton;
    btnAdblockAdd: TButton;
    edtAdblockPattern: TEdit;
    lvAdblock: TListView;
    Button18: TButton;
    cboAdblockCondition: TComboBox;
    btnURIActionDel: TButton;
    lvURIAction: TListView;
    btnURIActionAdd: TButton;
    cboURIActionCondition: TComboBox;
    edtURIActionPattern: TEdit;
    cboURIActionType: TComboBox;
    chkKioskMenubar: TCheckBox;
    GroupBox11: TGroupBox;
    chkAllowFrames: TCheckBox;
    chkAllowImg: TCheckBox;
    chkAllowPlugins: TCheckBox;
    chkAllowMetaRedirect: TCheckBox;
    chkAllowJS: TCheckBox;
    GroupBox12: TGroupBox;
    edtAutoConnectByScr: TEdit;
    Label18: TLabel;
    radAutoConnectByScr: TRadioButton;
    edtNoProxy: TEdit;
    StaticText7: TStaticText;
    cboSOCKSVersion: TComboBox;
    socksPort: TEdit;
    gopherPort: TEdit;
    ftpPort: TEdit;
    sslPort: TEdit;
    httpPort: TEdit;
    edtHttpProxy: TEdit;
    edtSslProxy: TEdit;
    edtFtpProxy: TEdit;
    edtGopherProxy: TEdit;
    edtSocksProxy: TEdit;
    radManualConnect: TRadioButton;
    radDirectConnect: TRadioButton;
    radProxyAutoDetect: TRadioButton;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    chkImgAutoResize: TCheckBox;
    chkUseSmoothScroll: TCheckBox;
    edtRecentCMax: TEdit;
    Label27: TLabel;
    Label45: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    edtRecentOMax: TEdit;
    Label25: TLabel;
    cboRecentClosedMenuStyle: TComboBox;
    edtUsrAutoReload: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    chkConsiderTarget: TCheckBox;
    Label26: TLabel;
    BagelFontSheet: TTabSheet;
    Panel8: TPanel;
    Label48: TLabel;
    edtBkmkMenuMaxLength: TEdit;
    Label49: TLabel;
    TabSheet1: TTabSheet;
    Panel20: TPanel;
    Label50: TLabel;
    edtUserDefinedFolder: TEdit;
    btnUserDefinedFolder: TButton;
    OpenDialog1: TOpenDialog;
    rgStartupTabBehavior: TRadioGroup;
    edtStartupGroupFilename: TEdit;
    chkRestoreSH: TCheckBox;
    GroupBox17: TGroupBox;
    chkBUGeckoPrefOnStart: TCheckBox;
    chkBUPrefOnStart: TCheckBox;
    chkBUBookmarkOnStart: TCheckBox;
    lstStartupScript: TListBox;
    chkDoAutoHighlightOnSearch: TCheckBox;
    chkDoAutoLockOnSearch: TCheckBox;
    chkRandomProxy: TCheckBox;
    edtRandomProxyIntvMin: TEdit;
    edtRandomProxyIntvSec: TEdit;
    Label51: TLabel;
    Label52: TLabel;
    chkEnableDenyTitle: TCheckBox;
    chkShowMenuIcon: TCheckBox;
    btnAdblockOverride: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label53: TLabel;
    edtURIActionParam: TEdit;
    btnURIActionOverride: TButton;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    edtCacheCapacity: TEdit;
    Label54: TLabel;
    Label55: TLabel;
    edtCacheDirParent: TEdit;
    chkPrefetchNext: TCheckBox;
    Label56: TLabel;
    edtHistoryExpireDays: TEdit;
    Label57: TLabel;
    Button3: TButton;
    btnSelectCacheFolder: TButton;
    Button12: TButton;
    rgCheckFrequency: TRadioGroup;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    Button4: TButton;
    rbCookieLifetimeNormal: TRadioButton;
    rbCookieLifetimeSession: TRadioButton;
    btnRemoveCookie: TButton;
    rbCookieLifetimeAskEach: TRadioButton;
    rbDenyAllCookie: TRadioButton;
    rbDenyOtherSiteCookie: TRadioButton;
    rbCookieP3PHigh: TRadioButton;
    rbCookieP3PMedium: TRadioButton;
    rbCookieP3PLow: TRadioButton;
    rbCookieP3PCustom: TRadioButton;
    rbAllowAllCookie: TRadioButton;
    CheckBox6: TCheckBox;
    RadioButton11: TRadioButton;
    chkUsePassMan: TCheckBox;
    Button13: TButton;
    Label58: TLabel;
    SuperDragSheet: TTabSheet;
    Panel21: TPanel;
    lbHighlightStyle: TListBox;
    chkHighlightBold: TCheckBox;
    chkHighlightUnderline: TCheckBox;
    chkHighlightItalic: TCheckBox;
    Label59: TLabel;
    PopupActionSelector: TPopupMenu;
    stTabRightClick: TStaticText;
    Button14: TButton;
    stTabDblClick: TStaticText;
    stTabMdlClick: TStaticText;
    Button15: TButton;
    Button16: TButton;
    pasItemNoAction: TMenuItem;
    stMouseAction: TStaticText;
    Button17: TButton;
    stKeyAction: TStaticText;
    Button19: TButton;
    pasItemEmbeddedAction: TMenuItem;
    N1: TMenuItem;
    URL1: TMenuItem;
    URL2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    UA1: TMenuItem;
    N6: TMenuItem;
    Cookie1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    GroupBox23: TGroupBox;
    stRWheelClick: TStaticText;
    btnRWheelClick: TButton;
    btnRLeftClick: TButton;
    stRLeftClick: TStaticText;
    stRWheelUp: TStaticText;
    btnRWheelUp: TButton;
    btnRWheelDown: TButton;
    stRWheelDown: TStaticText;
    stRSide1Click: TStaticText;
    btnRSide1Click: TButton;
    btnRSide2Click: TButton;
    stRSide2Click: TStaticText;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    GroupBox24: TGroupBox;
    stSide2Click: TStaticText;
    btnSide2Click: TButton;
    btnSide1Click: TButton;
    stSide1Click: TStaticText;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    rbSDImgSave: TRadioButton;
    rbSDImgNewTab: TRadioButton;
    rbSDImgNoAction: TRadioButton;
    chkSDImgBGTab: TCheckBox;
    cbSDImgSaveType: TComboBox;
    rbSDLinkNoAction: TRadioButton;
    rbSDLinkNewTab: TRadioButton;
    chkSDLinkBGTab: TCheckBox;
    cbSDLinkSaveType: TComboBox;
    rbSDLinkSave: TRadioButton;
    rbSDSelectionNoAction: TRadioButton;
    rbSDSelectionNewTab: TRadioButton;
    chkSDSelectionBGTab: TCheckBox;
    GroupBox25: TGroupBox;
    rbSDSelSearch: TRadioButton;
    rbSDSelOpenURI: TRadioButton;
    rbSDSelMixed: TRadioButton;
    edtSDSelectionURIRE: TEdit;
    chkAddrShowGoCaption: TCheckBox;
    stHighlightFGColor: TStaticText;
    stHighlightBGColor: TStaticText;
    edtSDImgSavePath: TEdit;
    Label70: TLabel;
    Label71: TLabel;
    ListView1: TListView;
    btnImgSavePAthSelector: TButton;
    chkEnableFAYT: TCheckBox;
    chkEnableMigemo: TCheckBox;
    StaticText3: TStaticText;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    CheckBox4: TCheckBox;
    PageControl3: TPageControl;
    TabSheet22: TTabSheet;
    TabSheet23: TTabSheet;
    lvAutoExec: TListView;
    tvExtensions: TTreeView;
    Label33: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    GroupBox22: TGroupBox;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    chkAutoSaveTablist: TCheckBox;
    chkFixToolbar: TCheckBox;
    edtSearchBarSaveCount: TEdit;
    chkOverrideToolFont: TCheckBox;
    chkOverrideSideFont: TCheckBox;
    chkOverrideMenuFont: TCheckBox;
    Label74: TLabel;
    cboMenubarFont: TComboBox;
    cboToolbarFont: TComboBox;
    cboSidebarFont: TComboBox;
    btnStartupFileSelector: TButton;
    btnAddStupScr: TButton;
    btnDelStupScr: TButton;
    btnDelStdwnScr: TButton;
    btnAddStdwnScr: TButton;
    edtBUGeneration: TEdit;
    Label75: TLabel;
    chkInheritAutoHighlight: TCheckBox;
    Panel22: TPanel;
    chkActJS: TCheckBox;
    chkActImg: TCheckBox;
    chkActFrames: TCheckBox;
    chkActPlugins: TCheckBox;
    chkActMeta: TCheckBox;
    chkShowSidebarTabs: TCheckBox;
    chkIsFlatButtonTab: TCheckBox;
    Label76: TLabel;
    ListView2: TListView;
    btnAddSearchEngine: TButton;
    btnAddSearchGroup: TButton;
    btnDelSearchItem: TButton;
    OperaKeySheet: TTabSheet;
    Panel24: TPanel;
    lvOperaKeyList: TListView;
    edtOperakeyKey: TMemo;
    stOperaKeyAction: TStaticText;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    chkUseOperaKey: TCheckBox;

    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
//    procedure ButtonAlreadyClick(Sender: TObject);
//    procedure ButtonNotyetClick(Sender: TObject);
//    procedure ButtonBackColorClick(Sender: TObject);
    procedure ButtonColorClick(Sender: TObject);
    procedure lblFocusBgColorClick(Sender: TObject);
    procedure chkFocusOnAnythingClick(Sender: TObject);
    procedure lblFocusColorClick(Sender: TObject);
    procedure chkUseFocusColorsClick(Sender: TObject);
    procedure chkUnderlineAClick(Sender: TObject);
    procedure DelRejTitleClick(Sender: TObject);
    procedure DelRejURLClick(Sender: TObject);
    procedure AddRejTitleClick(Sender: TObject);
    procedure AddRejURLClick(Sender: TObject);
    procedure RejURLList1Click(Sender: TObject);
    procedure lblClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonRightClick(Sender: TObject);
    procedure ButtonLeftClick(Sender: TObject);
    procedure ButtonDownClick(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure edtNoProxyChange(Sender: TObject);
    procedure radAutoConnectByScrClick(Sender: TObject);
    procedure radManualConnectClick(Sender: TObject);
    procedure radDirectConnectClick(Sender: TObject);
    procedure AddProxyListClick(Sender: TObject);
    procedure DelProxyListClick(Sender: TObject);
    procedure AddDenyImgClick(Sender: TObject);
    procedure DelDenyImgClick(Sender: TObject);
//    procedure DelCookieClick(Sender: TObject);
//    procedure AddCookieClick(Sender: TObject);
    procedure AddAllowPopupClick(Sender: TObject);
    procedure DelAllowPopupClick(Sender: TObject);

    procedure btnAdaptGestClick(Sender: TObject);

    procedure btnDelGestClick(Sender: TObject);
    procedure btnDelKbdClick(Sender: TObject);
    procedure btnAdaptKbdClick(Sender: TObject);
    procedure edtKbdShortcutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ShortcutListEditorSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure GestListEditorSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure NewTabGroupClick(Sender: TObject);
    procedure btnAddUAClick(Sender: TObject);
    procedure btnSaveUserContentClick(Sender: TObject);
    procedure lbOpenModeClick(Sender: TObject);
    procedure TabOpenModeChange(Sender: TObject);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkShowImageClick(Sender: TObject);
    procedure radProxyAutoDetectClick(Sender: TObject);
    procedure btnDelUAClick(Sender: TObject);
    procedure lvUserAgentSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnUserDefinedFolderClick(Sender: TObject);
    procedure lvAdblockSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnAdblockAddClick(Sender: TObject);
    procedure btnAdblockOverrideClick(Sender: TObject);
    procedure btnAdblockDelClick(Sender: TObject);
    procedure btnURIActionAddClick(Sender: TObject);
    procedure btnURIActionDelClick(Sender: TObject);
    procedure btnURIActionOverrideClick(Sender: TObject);
    procedure lvURIActionSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cboURIActionTypeChange(Sender: TObject);
    procedure lvURIActionEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure lvAdblockEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure btnSelectCacheFolderClick(Sender: TObject);
    procedure lbHighlightStyleDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chlAccFiletypeClickCheck(Sender: TObject);
    procedure chlAccProtocolClickCheck(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure ActionSelectorClick(Sender: TObject);
    procedure lbHighlightStyleClick(Sender: TObject);
    procedure chkHighlightBoldClick(Sender: TObject);
    procedure chkHighlightItalicClick(Sender: TObject);
    procedure chkHighlightUnderlineClick(Sender: TObject);
    procedure stHighlightFGColorClick(Sender: TObject);
    procedure stHighlightBGColorClick(Sender: TObject);
    procedure btnImgSavePAthSelectorClick(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StaticText4Click(Sender: TObject);
    procedure btnStartupFileSelectorClick(Sender: TObject);
    procedure btnAddStupScrClick(Sender: TObject);
    procedure btnAddStdwnScrClick(Sender: TObject);
    procedure btnDelStdwnScrClick(Sender: TObject);
    procedure btnDelStupScrClick(Sender: TObject);
    procedure btnAddSHIClick(Sender: TObject);
    procedure btnDelSHIClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure btnDelSearchItemClick(Sender: TObject);
    procedure btnAddSearchEngineClick(Sender: TObject);
    procedure btnAddSearchGroupClick(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure BuildSearchGroup(f:TfrmSearchEdit);
    procedure ListView2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListView2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure edtOperakeyKeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvOperaKeyListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private 宣言 }
    arrOpenMode:array [0..7] of Integer;

  public
    { Public 宣言 }
//    ExePath:String;
    pasTarget:TObject;
    SearchIni:TMemIniFile;
    procedure SetCurrentSheet(Sheet:TTabSheet);
  end;

var
  BagelSettingForm: TBagelSettingForm;
type

  PAdblockData = ^TAdblockData;
  TAdblockData = record
    Pattern    :string;
    Condition  :integer;
  end;

  PURIActionData = ^TURIActionData;
  TURIActionData = record
    Pattern    :String;
    Condition  :Integer;
    ActionType :Integer;
    Param      :String;
  end;


  PInlineStyle = ^TInlineStyle;
  TInlineStyle = record
    Color      :TColor;
    BGColor    :TColor;
    Underline  :Boolean;
    Bold       :Boolean;
    Italic     :Boolean;
  end;
  function SelectFolderDialog(owner : HWND): AnsiString ;
implementation

uses UBagel;

{$R *.dfm}

function GetSStr(Int:Integer):String;
begin
  if Int<10 then Result:='0'+IntToStr(int)
  else Result:=IntToStr(int);
end;

function NewAdblockData(AD:TAdblockData):PAdblockData;
begin
  New(result);
  result^ := AD;
end;

function NewURIActionData(UD:TURIActionData):PURIActionData;
begin
  New(result);
  result^ := UD;
end;

function NewInlineStyle(Style:TInlineStyle):PInlineStyle;
begin
  New(result);
  result^ := Style;
end;

function convFromUnicode(aStr:String;aCharCode:String):String;
{const
UConvID = '@mozilla.org/intl/scriptableunicodeconverter';
var
udec:nsICharsetConverterManager;}
begin
//uconv:=NS_GetService(

end;
function convToUnicode(aStr:String;aCharCode:String):String;
begin
end;
(*
function convertCharCodeFrom(aString, aCharCode){
	var UConvID = "@mozilla.org/intl/scriptableunicodeconverter";
	var UConvIF  = Components.interfaces.nsIScriptableUnicodeConverter;
	var UConv = Components.classes[UConvID].getService(UConvIF);
	
	var tmpString = "";
	try{
		UConv.charset = aCharCode;
		tmpString = UConv.ConvertFromUnicode(aString);
	}catch(e){
		tmpString = null;
	}
	return tmpString;
}

function convertCharCodeTo(aString, aCharCode){
	var UConvID = "@mozilla.org/intl/scriptableunicodeconverter";
	var UConvIF  = Components.interfaces.nsIScriptableUnicodeConverter;
	var UConv = Components.classes[UConvID].getService(UConvIF);
	
	var tmpString = "";
	try{
		UConv.charset = aCharCode;
		tmpString = UConv.ConvertToUnicode(aString);
	}catch(e){
		tmpString = null;
	}
	return tmpString;
}

*)

function HexToInt( const S: string ): Integer;
var
  E: Integer;
begin
  Val( '$' + S, Result, E );
  if E <> 0 then
      raise EConvertError.Create( '変換できません' );
end;


function StrToColor(Str:String):TColor;
var
  tmp:String;
begin
  tmp:=Str[5]+Str[6];
  tmp:=tmp+Str[3]+Str[4];
  Result:=TColor(HexToInt(tmp+Str[1]+Str[2]));
end;

function ColorToStr(Color:TColor):String;
var
  tmp:String;
  str:String;
begin
  str:=IntToHex(Integer(Color),6);
  tmp:=Str[5]+Str[6];
  tmp:=tmp+Str[3]+Str[4];
  Result:=tmp+Str[1]+Str[2];
end;

function getChromeDir(fileName:String):String;
var
  dirLocator : nsiProperties;
  f:nsIFile;
  str:IInterfacedString;
  astr:nsAString;
  strFilename:IInterfacedString;
  astrFileName:nsAString;
begin
  Result := '';
  NS_GetService('@mozilla.org/file/directory_service;1',nsIProperties,dirLocator);
  dirLocator.Get('UChrm',nsIFile,f);
  if f=nil then Exit;

  strFilename:=NewString(filename);
  astrFilename:=strFilename.AString;
  f.Append(astrFilename);
  str:=NewString('');
  astr:=str.AString;
  f.GetPath(astr);
  Result:=str.ToString;
end;

procedure TBagelSettingForm.SetCurrentSheet(Sheet:TTabSheet);
var
  parentitem:TTreeNodes;
  item:TTreeNode;
  i:Integer;
begin
  parentitem:=TreeView1.Items;

  //ShowMessage(IntToStr(TreeView1.Items.Item.Count));
  for i := 0 to parentitem.count-1 do begin
    item:=parentitem.Item[i];
    if TTabSheet(item.Data) = Sheet then begin
      TreeView1.Select(item);
      exit;
    end;
  end;
end;

procedure TBagelSettingForm.TreeView1Click(Sender: TObject);
begin
//ShowMessage(IntToStr(TreeView1.Selected.AbsoluteIndex));
//TreeView1.Selected.AbsoluteIndex;
//PageControl1.ActivePage:=TTabSheet(TreeView1.Selected.AbsoluteIndex;);
end;

procedure TBagelSettingForm.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
{  if not (TObject(Node.Data) is TTabSheet) then
    exit;
  PageControl.ActivePage := TTabSheet(Node.Data);     }
//  PageControl1.ActivePageIndex:=TreeView1.Selected.AbsoluteIndex;
  //PageControlChange(Sender);
  if Node.Data<>nil then PageControl1.ActivePage:=TTabSheet(Node.Data) else Node.Item[0].Selected:=true;
end;

procedure TBagelSettingForm.Button2Click(Sender: TObject);
var
  i:Integer;
begin
   for i := 0 to lvAdblock.Items.Count-1 do begin
     Dispose(PAdblockData(lvAdblock.Items.Item[i].Data));
   end;
   for i := 0 to lvURIAction.Items.Count-1 do begin
     Dispose(PURIActionData(lvURIAction.Items.Item[i].Data));
   end;
  Self.Close;
end;

function CheckFiletype(ext:String;ref:String):Boolean;
var
  reg:TRegistry;
  i:Integer;
  strArray:TStrArray;
begin
   reg:=TRegistry.Create;
   reg.RootKey := HKEY_CLASSES_ROOT;
   strArray := btSplitToArray(ext,',');
   Result:=true;
   try
        for i:=0 to High(strArray) do
        begin
           reg.OpenKey('.'+strArray[i],false);
           if reg.ReadString('')<>ref then
           begin
             Result:=false;
           end;
           reg.CloseKey;
        end;
   finally
     reg.Free;
   end

end;

procedure TBagelSettingForm.FormShow(Sender: TObject);
var
  pb:nsIPrefBranch;
  pm:nsIPermissionManager;
  gp:TGeckoPref;
  tmpPChar:PChar;
  tmpPWchar:PWideChar;
  tmpBool:Longbool;
  tmpInt:Integer;
  tmpStr:String;
  tmpCardinal:Cardinal;
  tmpSS:nsISupportsString;
  i,j,k:Integer;
//  gestIndex:Integer;
//  gestName:String;
//  u:nsIURI;
  Str:nsAString;
  intfStr:IInterfacedString;
  cstr:IInterfacedCString;
  acstr:nsACString;
  cstr2:IInterfacedCString;
  acstr2:nsACString;
  enum:nsISimpleEnumerator;
  perm:nsISupports;
  permission:nsIPermission;
  gestindex:Integer;
  tmpName:String;
  tmpAction:TAction;
  tmpActionCaption:String;
  tmpItem:TListItem;
  tmpSearchItem:TSearchListItem;
  reg:TRegistry;
  csssl:TStringList;

  AD:TAdblockData;
  adLine:String;
  adLineArr:TStrArray;

  UD:TURIActionData;
  UDList:TStringList;
  udLine:String;
  udLineArr:TStrArray;

  Style:TInlineStyle;
  StyleArr:TStrArray;

  dirSvc:nsIProperties;
  cacheDir:nsILocalFile;
  cookieBehavior:Integer;
  tmpSL:TStringList;
  tmpObj:TObject;
(*
PRUint32  	 UNKNOWN_ACTION  	= 0
PRUint32  	 ALLOW_ACTION  	= 1
PRUint32 	DENY_ACTION 	= 2
*)
begin

//Bagel設定

//  Stick('Bagel設定');

  
  //General
//  Stick('General');
  chkConsiderTarget.Checked:=Pref.ConsiderTarget;
  chkEnableDenyTitle.Checked:=Pref.EnableDenyTitle;
  chkAutoSaveTablist.Checked:=Pref.AutoSaveTablist;
//Font
  try
    ComboSerif.Items := Screen.Fonts;
    ComboSansSerif.Items := Screen.Fonts;
    ComboMonospace.Items := Screen.Fonts;
    cboMenubarFont.Items := Screen.Fonts;
    cboToolbarFont.Items := Screen.Fonts;
    cboSidebarFont.Items := Screen.Fonts;
  finally
  //
  end;

  chkOverrideToolFont.Checked:=Pref.OverrideToolbarFont;
  chkOverrideMenuFont.Checked:=Pref.OverrideMenubarFont;
  chkOverrideSideFont.Checked:=Pref.OverrideSidebarFont;
  cboToolbarFont.Text:=Pref.ToolbarFont;
  cboMenubarFont.Text:=Pref.MenubarFont;
  cboSidebarFont.Text:=Pref.SidebarFont;

  // Startup/Shutdown Script
  tmpSL:=TStringList.Create;
  try
    tmpSL.CommaText:=Pref.StartupScript;
    for i:=0 to tmpSl.Count-1 do begin
      tmpObj:=BagelMainForm.FindComponent(tmpSL.Strings[i]);
      if (tmpObj<>nil) and (tmpObj is TAction) then begin
        lstStartupScript.AddItem(TAction(tmpObj).Caption,tmpObj);
      end;
    end;
    tmpSL.Clear;
    tmpSL.CommaText:=Pref.ShutdownScript;
    for i:=0 to tmpSl.Count-1 do begin
      tmpObj:=BagelMainForm.FindComponent(tmpSL.Strings[i]);
      if (tmpObj<>nil) and (tmpObj is TAction) then begin
        lstShutdownScript.AddItem(TAction(tmpObj).Caption,tmpObj);
      end;
    end;
  finally
    tmpSL.Free;
  end;


  GestListEditor.Tag:=0;
  GestListEditor.Clear;

//  Stick('GestList');
  for i:=0 to Pref.GestList.Count-1 do
  begin
    if BagelMainForm.FindComponent(Pref.GestList.Values[Pref.GestList.Names[i]])<>nil then begin
      tmpName:=Pref.GestList.Names[i];
      tmpActionCaption:=TAction(BagelMainForm.FindComponent(Pref.GestList.Values[Pref.GestList.Names[i]])).Caption;
      tmpItem:=GestListEditor.Items.Add;
      tmpItem.Caption:=tmpName;
      tmpItem.SubItems.Add(tmpActionCaption);
      tmpItem.Data:=BagelMainForm.FindComponent(Pref.GestList.Values[Pref.GestList.Names[i]]);
    end;
  end;
  
//  Stick('ShortcutList');
  ShortcutListEditor.Tag:=0;
  ShortcutListEditor.Clear;
  for i:=0 to Pref.KbdList.Count-1 do
  begin
    tmpName:=Pref.KbdList.Names[i];
    if BagelMainForm.FindComponent(Pref.KbdList.Values[Pref.KbdList.Names[i]])=nil then continue;
    tmpActionCaption:=TAction(BagelMainForm.FindComponent(Pref.KbdList.Values[Pref.KbdList.Names[i]])).Caption;
    tmpItem:=ShortcutListEditor.Items.Add;
    tmpItem.Caption:=tmpName;
    tmpItem.SubItems.Add(tmpActionCaption);
    tmpItem.Data:=BagelMainForm.FindComponent(Pref.KbdList.Values[Pref.KbdList.Names[i]]);
  end;

  lvOperaKeyList.Tag:=0;
  lvOperaKeyList.Clear;
  Pref.OperaKeyList.CaseSensitive:=true;
  
  for i:=0 to Pref.OperaKeyList.Count-1 do
  begin
    tmpName:=Pref.OperaKeyList.Names[i];
    if BagelMainForm.FindComponent(Pref.OperaKeyList.Values[Pref.OperaKeyList.Names[i]])=nil then continue;
    tmpActionCaption:=TAction(BagelMainForm.FindComponent(Pref.OperaKeyList.Values[Pref.OperaKeyList.Names[i]])).Caption;
    tmpItem:=lvOperaKeyList.Items.Add;
    tmpItem.Caption:=tmpName;
    tmpItem.SubItems.Add(tmpActionCaption);
    tmpItem.Data:=BagelMainForm.FindComponent(Pref.OperaKeyList.Values[Pref.OperaKeyList.Names[i]]);
  end;



  lvUserAgent.Tag:=0;
  lvUserAgent.Clear;
  for i:=0 to Pref.UserAgents.Count-1 do begin
    tmpItem:=lvUserAgent.Items.Add;
    tmpItem.Caption:=Pref.UserAgents.Names[i];
    tmpItem.SubItems.Add(Pref.UserAgents.Values[Pref.UserAgents.Names[i]]);
  end;

//  Stick('Adblock');
  lvAdblock.Tag:=0;
  lvAdblock.Clear;
  for i:=0 to Pref.AdDenyList.Count - 1 do begin
    adLine:=Pref.AdDenyList.Strings[i];
    adLineArr:=btSplitToArray(adLine,#9);
      {
        0:部分一致
        1:完全一致
        2:前方一致
        3:後方一致
        4:正規表現
      }
    if High(adLineArr)<1 then continue;
    AD.Pattern := adLineArr[1];
    AD.Condition := StrToInt(adLineArr[0]);
    tmpItem:=lvAdblock.Items.Add;
    tmpItem.Caption:=AD.Pattern;
    tmpItem.SubItems.Add(cboAdblockCondition.Items.Strings[AD.Condition]);
    tmpItem.Data:=TObject(NewAdblockData(AD));
  end;

  lbHighlightStyle.Clear;
  for i:=0 to Pref.HighLightPref.Count - 1 do begin
    StyleArr:=btSplitToArray(Pref.HighLightPref.Strings[i],',');
    Style.Color:=StrToColor(StyleArr[0]);
    Style.BGColor:=StrToColor(StyleArr[1]);
    Style.Bold     :=Boolean(StrToInt(StyleArr[2]));
    Style.Italic   :=Boolean(StrToInt(StyleArr[3]));
    Style.Underline:=Boolean(StrToInt(StyleArr[4]));
    lbHighlightStyle.AddItem('スタイル'+IntToStr(i+1),TObject(NewInlineStyle(Style)));
  end;

  //Search.ini
  //for i:=0 to
  if FileExists(GetSettingDir+ 'Search.ini') then
    SearchIni := TMemIniFile.Create(GetSettingDir+ 'Search.ini')
  else
    SearchIni := TMemIniFile.Create(GetDefaultsDir+ 'Search.ini');
  
  for i:=1 to SearchIni.ReadInteger('Search-List','ListCount',0) do begin
    if i<10 then tmpStr:='0'+IntToStr(i)
    else tmpStr:=IntToStr(i);
    tmpSearchItem:=TSearchListItem.Create(ListView2.Items);
    ListView2.Items.AddItem(tmpSearchItem);
    tmpSearchItem.Caption:=(SearchIni.ReadString('Search-List',tmpStr,''));
    tmpStr:=tmpSearchItem.Caption;
    tmpSearchItem.SubItems.Add(SearchIni.ReadString(tmpStr,'FrontURL',''));
    tmpSearchItem.SubItems.Add(SearchIni.ReadString(tmpStr,'BackURL',''));
    tmpSearchItem.SubItems.Add(SearchIni.ReadString(tmpStr,'Encode','UTF-8'));
    tmpSearchItem.SubItems.Add(SearchIni.ReadString(tmpStr,'Shortcut',''));
    tmpSearchItem.Encode:=SearchIni.ReadString(tmpStr,'Encode','UTF-8');
    if SearchIni.ReadInteger(tmpStr,'Group',0)=0 then
    tmpSearchItem.ItemType:=0
    else  tmpSearchItem.ItemType:=1;
    if tmpSearchItem.ItemType=1 then begin
      for j:=1 to SearchIni.ReadInteger(tmpStr,'ListCount',0) do begin
        if j<10 then
        tmpSearchItem.Groups.Add(SearchIni.ReadString(tmpStr,'0'+IntToStr(j),''))
        else
        tmpSearchItem.Groups.Add(SearchIni.ReadString(tmpStr,IntToStr(j),''));
      end;
    end;
  end;

  SearchIni.Free;

//  Stick('URIAction');
  lvURIAction.Tag:=0;
  lvURIAction.Clear;
  //UDList:=TStringList.Create;
  //UDList.Delimiter:=#9;
//  try
    for i:=0 to Pref.URIActionList.Count - 1 do begin
      udLine:=Pref.URIActionList.Strings[i];
      udLineArr:=btSplitToArray(udLine,#9);
      //UDList.CommaText:=udLine;

      if High(udLineArr) < 3 then continue;
      UD.Pattern := udLineArr[1];
      UD.Condition := StrToInt(udLineArr[0]);
        {
          0:部分一致
          1:完全一致
          2:前方一致
          3:後方一致
          4:正規表現
        }
      UD.ActionType := StrToInt(udLineArr[2]);
        {
          0:Application;
          1:Script;
          2:SwitchSecurity;
        }
      UD.Param := udLineArr[3];

      tmpItem:=lvURIAction.Items.Add;
      tmpItem.Caption:=UD.Pattern+cboURIActionCondition.Items.Strings[ud.Condition];
      tmpItem.SubItems.Add(cboURIActionType.Items.Strings[ud.ActionType]);
      tmpItem.Data:=TObject(NewURIActionData(UD));
    end;
//  finally
    //UDList.Free;
//  end;

//  Stick('clear1');
//  ActsCombo.Clear;
  edtMGest.Clear;
//  ComboKeyOpr.Clear;
//  cboTabRightClick.Clear;
//  cboTabDblClick.Clear;
//  cboTabMdlClick.Clear;
  edtKbdShortcut.Lines.Clear;

//  Stick('ctxmenu');
  //cboTabRightClick.Items.AddObject('コンテキストメニュー',nil);
  (*for i:=0 to BagelMainForm.ActionList1.ActionCount -1 do
  begin
    //tmpAction:=TAction(BagelMainForm.ActionList1.Actions[i]);
    //ActsCombo.Items.AddObject(tmpAction.Caption,tmpAction);
    //ComboKeyOpr.Items.AddObject(tmpAction.Caption,tmpAction);
    //cboTabRightClick.Items.AddObject(tmpAction.Caption,tmpAction);
    {cboTabDblClick.Items.AddObject(tmpAction.Caption,tmpAction);
    cboTabMdlClick.Items.AddObject(tmpAction.Caption,tmpAction);
    cboTabRightClick.Items.AddObject(tmpAction.Caption,tmpAction);}
  end;*)
      //ActsCombo.Items.AddObject(tmpAction.Caption,tmpAction);
    //ComboKeyOpr.Items.AddObject(tmpAction.Caption,tmpAction);
//  Stick('ctxmenu2');
    stTabDblClick.Caption := TAction(BagelMainForm.FindComponent(Pref.TabDblClickAct)).Caption;
    stTabDblClick.Tag := Integer(BagelMainForm.FindComponent(Pref.TabDblClickAct));

    stTabMdlClick.Caption := TAction(BagelMainForm.FindComponent(Pref.TabMiddleClickAct)).Caption;
    stTabMdlClick.Tag := Integer(BagelMainForm.FindComponent(Pref.TabMiddleClickAct));

    if BagelMainForm.FindComponent(Pref.TabRightClickAct)=nil then stTabRightClick.Caption := 'コンテキストメニュー'
    else stTabRightClick.Caption := TAction(BagelMainForm.FindComponent(Pref.TabRightClickAct)).Caption;
    stTabRightClick.Tag:=Integer(BagelMainForm.FindComponent(Pref.TabRightClickAct));
    //cboTabDblClick.ItemIndex := cboTabDblClick.Items.IndexOfObject(BagelMainForm.FindComponent(Pref.TabDblClickAct));
    //cboTabMdlClick.ItemIndex:=cboTabMdlClick.Items.IndexOfObject(BagelMainForm.FindComponent(Pref.TabMiddleClickAct));
    //cboTabRightClick.ItemIndex:=cboTabRightClick.Items.IndexOfObject(BagelMainForm.FindComponent(Pref.TabRightClickAct));
    //if cboTabRightClick.ItemIndex=-1 then cboTabRightClick.ItemIndex:=0;


{
    //RightClickGesture
    property RWheelClick:String  read FRWheelClick write FRWheelClick;
    property RLeftClick:String  read FRLeftClick write FRLeftClick;
    property RWheelUp:String  read FRWheelUp write FRWheelUp;
    property RWheelDown:String  read FRWheelDown write FRWheelDown;
    property RSide1Click:String  read FRSide1Click write FRSide1Click;
    property RSide2Click:String  read FRSide2Click write FRSide2Click;
    property Side1Click:String  read FSide1Click write FSide1Click;
    property Side2Click:String  read FSide2Click write FSide2Click;
}

    if BagelMainForm.FindComponent(Pref.RWheelClick)=nil then stRWheelClick.Caption := 'なし'
    else stRWheelClick.Caption := TAction(BagelMainForm.FindComponent(Pref.RWheelClick)).Caption;
    stRWheelClick.Tag:=Integer(BagelMainForm.FindComponent(Pref.RWheelClick));

    if BagelMainForm.FindComponent(Pref.RLeftClick)=nil then stRLeftClick.Caption := 'なし'
    else stRLeftClick.Caption := TAction(BagelMainForm.FindComponent(Pref.RLeftClick)).Caption;
    stRLeftClick.Tag:=Integer(BagelMainForm.FindComponent(Pref.RLeftClick));

    if BagelMainForm.FindComponent(Pref.RWheelUp)=nil then stRWheelUp.Caption := 'なし'
    else stRWheelUp.Caption := TAction(BagelMainForm.FindComponent(Pref.RWheelUp)).Caption;
    stRWheelUp.Tag:=Integer(BagelMainForm.FindComponent(Pref.RWheelUp));

    if BagelMainForm.FindComponent(Pref.RWheelDown)=nil then stRWheelDown.Caption := 'なし'
    else stRWheelDown.Caption := TAction(BagelMainForm.FindComponent(Pref.RWheelDown)).Caption;
    stRWheelDown.Tag:=Integer(BagelMainForm.FindComponent(Pref.RWheelDown));

    if BagelMainForm.FindComponent(Pref.RSide1Click)=nil then stRSide1Click.Caption := 'なし'
    else stRSide1Click.Caption := TAction(BagelMainForm.FindComponent(Pref.RSide1Click)).Caption;
    stRSide1Click.Tag:=Integer(BagelMainForm.FindComponent(Pref.RSide1Click));

    if BagelMainForm.FindComponent(Pref.RSide2Click)=nil then stRSide2Click.Caption := 'なし'
    else stRSide2Click.Caption := TAction(BagelMainForm.FindComponent(Pref.RSide2Click)).Caption;
    stRSide2Click.Tag:=Integer(BagelMainForm.FindComponent(Pref.RSide2Click));

    if BagelMainForm.FindComponent(Pref.Side1Click)=nil then stSide1Click.Caption := 'なし'
    else stSide1Click.Caption := TAction(BagelMainForm.FindComponent(Pref.Side1Click)).Caption;
    stSide1Click.Tag:=Integer(BagelMainForm.FindComponent(Pref.Side1Click));

    if BagelMainForm.FindComponent(Pref.Side2Click)=nil then stSide2Click.Caption := 'なし'
    else stSide2Click.Caption := TAction(BagelMainForm.FindComponent(Pref.Side2Click)).Caption;
    stSide2Click.Tag:=Integer(BagelMainForm.FindComponent(Pref.Side2Click));

    //SuperDrag
    case Pref.SDragImgAction of
      0:rbSDImgNoAction.Checked:=true;
      1:rbSDImgNewTab.Checked:=true;
      2:rbSDImgSave.Checked:=true;
    else
    end;

    chkSDImgBGTab.Checked:=Pref.SDragImgIsBG;
    cbSDImgSaveType.ItemIndex:=Pref.SDragImgSaveType;
    edtSDImgSavePath.Text:=Pref.SDragImgSavePath;
    
    case Pref.SDragLinkAction of
      0:rbSDLinkNoAction.Checked:=true;
      1:rbSDLinkNewTab.Checked:=true;
      2:rbSDLinkSave.Checked:=true;
    else
    end;
    chkSDLinkBGTab.Checked:=Pref.SDragLinkgIsBG;
    cbSDLinkSaveType.ItemIndex:=Pref.SDragLinkSaveType;

    case Pref.SDragSelectionAction of
      0:rbSDSelectionNoAction.Checked:=true;
      1:rbSDSelectionNewTab.Checked:=true;
    else
    end;

    case Pref.SDragSelectionDet of
      0:rbSDSelSearch.Checked:=true;
      1:rbSDSelOpenURI.Checked:=true;
      2:rbSDSelMixed.Checked:=true;
    else
    end;

    chkSDSelectionBGTab.Checked:=Pref.SDragLinkgIsBG;
    edtSDSelectionURIRE.Text:=Pref.SDragSelectionDetRE;
    
  chkDontShowAppname.Checked:=not Pref.ShowAppNameInTitle;
  //ComboKeyOpr.Items.Assign(actsCombo.Items);

  RejTitleList.Items.Assign(Pref.DenyTitleList);
  RejURLList.Items.Assign(Pref.DenyURLList);

  ProxyList.Tag:=0;
//  CookieList.Tag:=0;
//  CookieList.Clear;
  DenyImgList.Tag:=0;
  DenyImgList.Clear;
  AllowPopupList.Tag:=0;
  AllowPopupList.Clear;

//  Stick('ZattaPrefs');
  arrOpenMode[0]:=Pref.OpenModePopup;
  arrOpenMode[1]:=Pref.OpenModeBookmarks;
  arrOpenMode[2]:=Pref.OpenModeHistory;
  arrOpenMode[3]:=Pref.OpenModeLocation;
  arrOpenMode[4]:=Pref.OpenModeSearch;
  arrOpenMode[5]:=Pref.OpenModeViewsource;
  arrOpenMode[6]:=Pref.OpenModeMiddleClick;
  arrOpenMode[7]:=Pref.OpenModeClipboard;
  lbOpenMode.ItemIndex:=0;
  lbOpenMode.OnClick(lbOpenMode);
  
  cboWhenCloseChoose.ItemIndex:=Pref.WhenCloseTabChoose;

  edtTabWidth.Text := IntToStr(Pref.TabWidth);
  chkEnableWheelTabChange.Checked := Pref.EnableWheelTabChange;
//
  //cbOpenModeVal.ItemIndex:=arrOpenMode[cbOpenMode.ItemIndex];

  edtMaxTab.Text             := IntToStr(Pref.TabMaxCount);
  edtTabMaxStr.Text          := IntToStr(Pref.TabMaxStrCount);
  chkTabMultiline.Checked    := Pref.TabMultiLine;
  chkViewIsRead.Checked      := Pref.ViewIsRead;
  edtHome.Text               := Pref.Homepage;
  chkIsFlatButtonTab.Checked := (Pref.TabStyle=1);

  NewTabGroup.ItemIndex      := Pref.NewTabMode;
  chktakeOverSession.Checked := Pref.AddTabCurrCopyHistory;
  edtUsrAutoReload.Text      := IntToStr(Pref.AutoReloadCustomIntv);
  edtUserDefinedFolder.Text  := Pref.UserDefinedFolder;
    //chkTakeOverSession.Enabled:=false;
    //if NewTabGroup.ItemIndex=1 then chkTakeOverSession.Enabled:=true;
  //StartUp
//  chkRestoreTabs.Checked:=Pref.RestoreTabs;
  rgStartupTabBehavior.ItemIndex:=Pref.StartupTabBehavior;
  chkRestoreSH.Checked:=Pref.StartupRestoreSH;
  edtBUGeneration.Text:=IntToStr(Pref.BUGeneration);
  chkBUBookmarkOnStart.Checked:=Pref.BUBookmarkOnStart;
  chkBUPrefOnStart.Checked:=Pref.BUPrefOnStart;
  chkBUGeckoPrefOnStart.Checked:=Pref.BUGeckoPrefOnStart;
  edtStartupGroupFilename.Text:=Pref.StartupGroup;
//OnEnd
  chkDelRecClosed.Checked:=Pref.DelRecentClosed;
  chkDelRecOpened.Checked:=Pref.DelRecentOpened;
  chkDelAddress.Checked:=Pref.DelAddrHistory;
  chkDelSearch.Checked:=Pref.DelSearchHistory;
  chkDelCookie.Checked:=Pref.DelCookie;
  chkDelHistory.Checked:=Pref.DelHistory;
  chkDelCache.Checked:=Pref.DelCache;
  

  //Confirm
  chkCnfAppQuit.Checked := Pref.OnAppQuit;
  chkCnfCloseAll.Checked := Pref.OnCloseAll;
  chkCnfCloseOther.Checked := Pref.OnCloseOther;
  chkBkmkDel.Checked := Pref.OnDeleteBookmark;
  chkOpeningManyItems.Checked := Pref.OnOpeningManyItems;
  edtWarnItemCount.Text := IntToStr(Pref.WarnItemCount);

  //Kiosk
  chkKioskAddr.Checked:=Pref.KioskAddressBarVisible;
  chkKioskTabbar.Checked:=Pref.KioskTabBarVisible;
  chkKioskSearchbar.Checked:=Pref.KioskSearchBarVisible;
  chkKioskStatusBar.Checked:=Pref.KioskStatusBarVisible;
  chkKioskLinkbar.Checked:=pref.KioskLinkBarVisible;
  chkKioskMainbar.Checked:=Pref.KioskMainBarVisible;
  chkKioskMenubar.Checked:=Pref.KioskMenuBarVisible;

  //Recent
  edtRecentCMax.Text:=IntToStr(Pref.RecentClosedMaxCount);
  edtRecentOMax.Text:=IntToStr(Pref.RecentOpenedMaxCount);
  cboRecentClosedMenuStyle.ItemIndex:=Pref.RecentClosedURLStyle;

  //Sidebar
  chkShowSidebarTabs.Checked    := Pref.ShowSidebarTabs;
  chkUseSidebarAutohide.Checked := Pref.SidebarAutoHide;
  chkSidebarOverlap.Checked     := Pref.SidebarOverlap;
  edtSidebarAutoOpenDelay.Text  := IntToStr(Pref.SidebarAutoOpenDelay);
  edtSidebarAutoHideDelay.Text  := IntToStr(Pref.SidebarAutoHideDelay);

  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actBookmarkSidebar.Caption,BagelMainForm.actBookmarkSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actHistorySidebar.Caption,BagelMainForm.actHistorySidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actLinkSidebar.Caption,BagelMainForm.actLinkSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actGrepSidebar.Caption,BagelMainForm.actGrepSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actWebPanel.Caption,BagelMainForm.actWebPanel);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actScriptSidebar.Caption,BagelMainForm.actScriptSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actClipboardSidebar.Caption,BagelMainForm.actClipboardSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actMemoSidebar.Caption,BagelMainForm.actMemoSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actTransferSidebar.Caption,BagelMainForm.actTransferSidebar);
  lstSidebarHeaderHiddenItem.Items.AddObject(BagelMainForm.actUserDefinedSidebar.Caption,BagelMainForm.actUserDefinedSidebar);

  {for i:=lstSidebarHeaderHiddenItem.Count -1 downto 0 do begin
    tmpInt := Pref.SidebarHeaderList.IndexOf(TAction(lstSidebarHeaderHiddenItem.Items.Objects[i]).Name);
    if tmpInt>-1 then begin
      tmpAction := TAction(lstSidebarHeaderHiddenItem.Items.Objects[i]);
      lstSidebarHeaderVisibleItem.Items.AddObject(tmpAction.Caption,tmpAction);
      lstSidebarHeaderHiddenItem.Items.Delete(tmpInt);
    end;
  end;}
  for i:=0 to Pref.SidebarHeaderList.Count-1 do begin
    for j:=0 to lstSidebarHeaderHiddenItem.Items.Count -1 do begin
      if TAction(lstSidebarHeaderHiddenItem.Items.Objects[j]).Name = Pref.SidebarHeaderList.Strings[i] then
      begin
        tmpAction := TAction(lstSidebarHeaderHiddenItem.Items.Objects[j]);
        lstSidebarHeaderVisibleItem.Items.AddObject(tmpAction.Caption,tmpAction);
        lstSidebarHeaderHiddenItem.Items.Delete(j);
        break;
      end;
    end;
  end;

  //Menu
  chkOpenAllBkmk.Checked:=Pref.ShowOpenAllBookmarks;
  chkAddBkmkHere.Checked:=Pref.ShowAddBookmarkHere;
  edtBkmkMenuMaxLength.Text:=IntToStr(Pref.BookmarkMenuMaxLength);
  chkShowmenuIcon.Checked:=Pref.ShowMenuIcon;

  //DocShell
  chkAllowPlugins.Checked:=   Pref.DefaultAllowPlugins;
  chkAllowJS.Checked:=   Pref. DefaultAllowJS;
  chkAllowFrames.Checked:=   Pref. DefaultAllowFrames;
  chkAllowMetaRedirect.Checked:=  Pref.  DefaultAllowMeta;
  chkAllowImg.Checked:=   Pref. DefaultAllowImg;

  chkInheritDocShell.Checked:=Pref.InheritDocShell;
  chkInheritAutoHighlight.Checked:=Pref.InheritAutoHighlight;

  //ランダムプロクシ
  chkRandomProxy.Checked:=Pref.RandomProxy;
  edtRandomProxyIntvMin.Text:=IntToStr(pref.RandomProxyIntvMin);
  edtRandomProxyIntvSec.Text:=IntToStr(pref.RandomProxyIntvSec);

  //Toolbar
  chkFixToolbar.Checked:=Pref.FixToolbar;

  //Search
  chkScrollToCenterOnFind.Checked:=Pref.ScrollToCenterOnFind;
  chkSearchOnDrop.Checked:=Pref.SearchOnDrop;
  chkSearchOnEngineChange.Checked:=Pref.SearchOnEngineChange;
  chkSearchOnKeywordChange.Checked:=Pref.SearchOnKeywordChange;
  chkRemenberSearchEngine.Checked:=Pref.RememberEngine;
  chkReplaceZenkakuSpace.Checked:=Pref.ReplaceZenkakuSpace;
  chkDoAutoHighlightOnSearch.Checked:=Pref.AutoHighlightAfterSearch;
  chkDoAutoLockOnSearch.Checked:=Pref.AutoTabLockAfterSearch;
  edtSearchBarSaveCount.Text:=IntToStr(Pref.SearchBarSaveCount);
  edtSearchBarDropdownCount.Text:=IntToStr(Pref.SearchBarDropdownCount);

  //Addressbar
  chkAddrShowGo.Checked:=Pref.ShowGoButton;
  chkAddrShowGoCaption.Checked:=Pref.ShowGoButtonCaption;
  chkAddrAutoComplete.Checked:=Pref.UseAddAutoComplete;
    
//  Stick('Reg');
  //関連付け
  chlAccProtocol.Tag:=0;
  chlAccFiletype.Tag:=0;
  reg := TRegistry.Create;

  with reg do
  begin
    try
      RootKey:=HKEY_CLASSES_ROOT;
      //プロトコル
      reg.OpenKey('HTTP\shell',false);
      chlAccProtocol.Checked[0]:=false;
      if reg.ReadString('')='Bagel' then
      begin
        //HKEY_CLASSES_ROOT\HTTP\shell\Bagel\Command
        Reg.OpenKey('Bagel\Command',false);
        if reg.ReadString('') = '"'+Application.Exename+'" "%1"' then chlAccProtocol.Checked[0]:=true;
      end;
      reg.CloseKey;

      reg.OpenKey('https\shell',false);
      chlAccProtocol.Checked[1]:=false;
      if reg.ReadString('')='Bagel' then
      begin
        //HKEY_CLASSES_ROOT\HTTP\shell\Bagel\Command
        Reg.OpenKey('Bagel\Command',false);
        if reg.ReadString('') = '"'+Application.Exename+'" "%1"' then chlAccProtocol.Checked[1]:=true;
      end;
      reg.CloseKey;
      
      reg.OpenKey('ftp\shell',false);
      chlAccProtocol.Checked[2]:=false;
      if reg.ReadString('')='Bagel' then
      begin
        //HKEY_CLASSES_ROOT\HTTP\shell\Bagel\Command
        Reg.OpenKey('Bagel\Command',false);
        if reg.ReadString('') = '"'+Application.Exename+'" "%1"' then chlAccProtocol.Checked[2]:=true;
      end;
      reg.CloseKey;

      //SHChangeNotify(SHCNE_ASSOCCHANGED,            //システムに変更を通知
      //               SHCNF_FLUSH,nil,nil);
    finally
      Free;
    end;
  end;

  chlAccFiletype.Checked[0]:= CheckFiletype('htm,html','BagelHTML');
  chlAccFiletype.Checked[1]:= CheckFiletype('xhtml','BagelXHTML');
  chlAccFiletype.Checked[2]:= CheckFiletype('xml','BagelXML');
  chlAccFiletype.Checked[3]:= CheckFiletype('xul','BagelXUL');
  chlAccFiletype.Checked[4]:= CheckFiletype('png','BagelPNG');
  chlAccFiletype.Checked[5]:= CheckFiletype('jpeg,jpe,jpg','BagelJPEG');
  chlAccFiletype.Checked[6]:= CheckFiletype('gif','BagelGIF');
  chlAccFiletype.Checked[7]:= CheckFiletype('xbm','BagelXBM');
//UserCSSのロード

  csssl:=TStringList.Create;
  if FileExists(getChromeDir('userContent.css') )then
  begin
    csssl.LoadFromFile(getChromeDir('userContent.css'));
    UserCssMemo.Text:=Utf8ToAnsi(csssl.Text);
  end
  else begin
    if FileExists(getChromeDir('userContent-example.css')) then
    begin
      csssl.LoadFromFile(getChromeDir('userContent-example.css'));
      UserCssMemo.Text:=Utf8ToAnsi(csssl.Text);
    end;
  end;
  csssl.Free;



//Gecko設定
//  Stick('Gecko');
  gp := TGeckoPref.Create;
  pb := gp.GetRootBranch;


  //Migemo FAYT
  chkEnableFAYT.Checked:=gp.GetBoolPref('accessibility.typeaheadfind');
  chkEnableMigemo.Checked:=Pref.MigemoEnabled;
  chkIncSearchAutoStart.Checked:= gp.GetBoolPref('accessibility.typeaheadfind.autostart');
  chkIncSearchLinksOnly.Checked:=gp.GetBoolPref('accessibility.typeaheadfind.linksonly');
  chkIncSearchEnableTimeout.Checked:=gp.GetBoolPref('accessibility.typeaheadfind.enabletimeout');
  edtIncSearchTimeout.Text:=IntToStr(gp.GetIntPref('accessibility.typeaheadfind.timeout'));

  chkEnableLazyHighlight.Checked:=pref.MigemoLazyHilight;
  chkAutoOpenGrep.Checked:=pref.MigemoOpenGrepSidebar;
  edtPathToMigemoDLL.Text:=Pref.MigemoDLLPath;
  edtpathToMigemoDic.Text:=Pref.MigemoDicFolder;
  {
//  accessibility.typeaheadfind.startlinksonly
  accessibility.typeaheadfind.timeout
  }  
{  'javascript.enabled'
   'security.enable_java'
   'security.warn_entering_secure'
   'security.warn_entering_weak'
   'security.warn_leaving_secure'
   'security.warn_submit_insecure'

   'network.image.imageBehavior'
   'image.animation_mode'
   'browser.enable_automatic_image_resizing'
   'browser.display.show_image_placeholders'
   'advanced.always_load_images'
   
   'accessibility.tabfocus'

}
{
dom.allow_scripts_to_close_windows
dom.disable_image_src_set
dom.disable_open_during_load
dom.disable_window_open_feature.scrollbars
dom.disable_window_status_change
dom.max_script_run_time
dom.popup_maximum
dom.event.contextmenu.enabled
dom.disable_open_click_delay
dom.disable_window_flip
}
  //JavaScript詳細
  chkDomAllowClose.Checked := gp.GetBoolPref('dom.allow_scripts_to_close_windows');
  chkDomAllowFlip.Checked := not gp.GetBoolPref('dom.disable_window_flip');
  chkDomContextmenu.Checked := gp.GetBoolPref('dom.event.contextmenu.enabled');
  chkDomChangeStatustext.Checked := not gp.GetBoolPref('dom.disable_window_status_change');
  //BlockPopup
  chkDomPopupDuringLoad.Checked := gp.GetBoolPref('dom.disable_open_during_load');
  chkDomHideScrollbar.Checked := not gp.GetBoolPref('dom.disable_window_open_feature.scrollbars');
  chkDomChangeImgSrc.Checked := not gp.GetBoolPref('dom.disable_image_src_set');
  edtScriptMaxRunTime.Text := IntToStr(gp.GetIntPref('dom.max_script_run_time'));
  edtPopupDisableDelay.Text := IntToStr(gp.GetIntPref('dom.disable_open_click_delay'));
  edtPopupmax.Text := IntToStr(gp.GetIntPref('dom.popup_maximum'));

  //Java JavaScript
  chkEnableJS.Checked:=gp.GetBoolPref(PChar('javascript.enabled'));
  chkEnableJava.Checked:=gp.GetBoolPref(PChar('security.enable_java'));

  //画像表示設定
  // 1-Accept, 2-Deny, 3-dontAcceptForeign
  case gp.GetIntPref('permissions.default.image') of
    1:begin
      chkShowImage.Checked:=true;
      chkOnlyOrigServer.Checked:=False;
      chkOnlyOrigServer.Enabled:=True;
    end;
    2:begin
      chkShowImage.Checked:=true;
      chkOnlyOrigServer.Checked:=true;
      chkOnlyOrigServer.Enabled:=True;
    end;
    3:begin
      chkShowImage.Checked:=False;
      chkOnlyOrigServer.Checked:=False;
      chkOnlyOrigServer.Enabled:=False;
    end;
  end;

  //キャレットモード
  chkUseCaretMode.Checked:=gp.GetBoolPref(PChar('accessibility.browsewithcaret'));
  //自動リサイズ
  chkImgAutoResize.Checked:=gp.GetBoolPref(PChar('browser.enable_automatic_image_resizing'));
  //SmoothScroll
  //chkUseSmoothScroll.Checked:=gp.GetBoolPref(PChar('general.smoothScroll'));


  //デフォルトフォント設定
  if pb.GetCharPref(PChar('font.default.ja')) = 'serif' then
  begin
    ComboPropotional.ItemIndex:=0;
  end

  else
  begin
    ComboPropotional.ItemIndex:=1;
  end;

  //文書のフォント指定に従う
  if gp.GetIntPref(Pchar('browser.display.use_document_fonts'))=0 then
  begin
    chkAlwaysUseFont.Checked:=true;
  end
  else
  begin
    chkAlwaysUseFont.Checked:=false;
  end;

  chkUseSysColor.Checked:=gp.GetBoolPref(PChar('browser.display.use_system_colors'));//システムカラーを用いる

  chkAlwaysUseColor.Checked:=(not gp.GetBoolPref(PChar('browser.display.use_document_colors'))); //文書の色指定に従う

  chkUseFocusColors.Checked:=gp.GetBoolPref(PChar('browser.display.use_focus_colors'));//フォーカスカラーを用いる

  chkFocusOnAnything.Checked:=gp.GetBoolPref(PChar('browser.display.focus_ring_on_anything')); //フォーカスリングをつける

  chkUnderlineA.Checked:=gp.GetBoolPref(PChar('browser.underline_anchors'));//リンクに下線を引く


  (****色設定****)
  tmpStr:=String(pb.GetCharPref(PChar('browser.display.foreground_color')));
//  IntToHex( intData, 6 );
  lblTextColor.Font.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  tmpStr:=String(pb.GetCharPref(PChar('browser.display.background_color')));
//  ShowMessage(tmpStr);
  lblBGColor.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  tmpStr:=String(pb.GetCharPref(PChar('browser.anchor_color')));
  lblAnchorColor.Font.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  tmpStr:=String(pb.GetCharPref(PChar('browser.visited_color')));
  lblVisitedColor.Font.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  tmpStr:=String(pb.GetCharPref(PChar('browser.display.focus_text_color')));
  lblFocusColor.Font.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));
  lblFocusBgColor.Font.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  tmpStr:=String(pb.GetCharPref(PChar('browser.display.focus_background_color')));
  lblFocusBgColor.Color:=StrToColor(Copy( tmpStr, 2, Length(tmpStr)-1 ));

  //セリフ
  pb.GetComplexValue(PChar('font.name.serif.ja'),nsISupportsString,tmpSS);
  tmpPWChar := tmpSS.ToString;
  ComboSerif.Text:=tmpPWChar;
  //サンセリフ
  pb.GetComplexValue(PChar('font.name.sans-serif.ja'),nsISupportsString,tmpSS);
  tmpPWChar:=tmpSS.ToString;
  ComboSansSerif.Text:=tmpPWChar;
  //等幅
  pb.GetComplexValue(PChar('font.name.monospace.ja'),nsISupportsString,tmpSS);
  tmpPWChar:=tmpSS.ToString;
  ComboMonospace.Text:=tmpPWChar;

  (****プロトコル抑制****)
  clSuppressProtocol.Checked[0]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.mailto'));
  clSuppressProtocol.Checked[1]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.telnet'));
  clSuppressProtocol.Checked[2]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.rlogin'));
  clSuppressProtocol.Checked[3]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.tn3270'));
  clSuppressProtocol.Checked[4]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.news'));
  clSuppressProtocol.Checked[5]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.pnm'));
  clSuppressProtocol.Checked[6]:=not gp.GetBoolPref(PChar('network.protocol-handler.external.mms'));



  (****プロクシ設定****)
  (*串を使うか？*)
  if gp.GetIntPref(PChar('network.proxy.type'))=0 then
  begin
    radDirectConnect.Checked := true;
  end
  else if tmpInt=1 then
  begin
    radManualConnect.Checked := true;
  end
  else if tmpInt=2 then
  begin
    radAutoConnectByScr.Checked := true;
  end
  else if tmpInt=4 then begin
    radProxyAutoDetect.Checked := True;
  end;
  //network.proxy.autoconfig_url
  //自動設定
  edtAutoConnectByScr.Text:=String(pb.GetCharPref(PChar('network.proxy.autoconfig_url')));

  (*串を使わないサイト*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.no_proxies_on')));
  edtNoProxy.Text:=tmpStr;

  (*HTTP串*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.http')));
  edtHttpProxy.Text:=tmpStr;
  tmpStr:=IntToStr(gp.GetIntPref(PChar('network.proxy.http_port')));
  httpPort.Text:=tmpStr;

  (*FTP串*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.ftp')));
  edtFtpProxy.Text:=tmpStr;
  tmpStr:=IntToStr(gp.GetIntPref(PChar('network.proxy.ftp_port')));
  ftpPort.Text:=tmpStr;

  (*SSL串*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.ssl')));
  edtSslProxy.Text:=tmpStr;
  tmpStr:=IntToStr(gp.GetIntPref(PChar('network.proxy.ssl_port')));
  sslPort.Text:=tmpStr;

  (*SOCKS串*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.socks')));
  edtSocksProxy.Text:=tmpStr;
  tmpStr:=IntToStr(gp.GetIntPref(PChar('network.proxy.socks_port')));
  socksPort.Text:=tmpStr;
  if gp.GetIntPref(PChar('network.proxy.socks_version'))=4 then cboSOCKSVersion.ItemIndex:=0 else if gp.GetIntPref(PChar('network.proxy.socks_version'))=5 then cboSOCKSVersion.ItemIndex:=1;

  (*SSL串*)
  tmpStr:=String(pb.GetCharPref(PChar('network.proxy.gopher')));
  edtGopherProxy.Text:=tmpStr;
  tmpStr:=IntToStr(gp.GetIntPref(PChar('network.proxy.gopher_port')));
  gopherPort.Text:=tmpStr;

  (*串リスト*)
  ProxyList.Items.Assign(Pref.Proxies);


  (*履歴*)
  edtHistoryExpireDays.Text := IntToStr(gp.GetIntPref('browser.history_expire_days'));

  (*キャッシュ*)

  //// 0 = once-per-session, 1 = each-time, 2 = never, 3 = when-appropriate/automatically
  //browser.cache.check_doc_frequency
  rgCheckFrequency.ItemIndex := gp.GetIntPref('browser.cache.check_doc_frequency');

  //browser.cache.disk.capacity
  edtCacheCapacity.Text := IntToStr(gp.GetIntPref('browser.cache.disk.capacity') div 1024);

  //browser.cache.disk.parent_directory
  if pb.PrefHasUserValue(PChar('browser.cache.disk.parent_directory')) then begin
    pb.GetComplexValue(PChar('browser.cache.disk.parent_directory'),nsILocalFile,cacheDir);
    edtCacheDirParent.Tag := 0;
    if cacheDir=nil then begin
      NS_GetService('@mozilla.org/file/directory_service;1',nsIProperties,dirSvc);

      if dirSvc.Has(PChar('cachePDir')) then begin
        dirSvc.Get('cachePDir',nsILocalFile,cacheDir);
      end
      else begin
        dirSvc.Get('ProfLD',nsILocalFile,cacheDir);
      end;
    end;
    intfStr := NewString;
    Str:=intfStr.AString;
    cacheDir.GetPath(Str);
    edtCacheDirParent.Text :=intfStr.ToString;
  end;

  //network.prefetch-next
  chkPrefetchNext.Checked := gp.GetBoolPref('network.prefetch-next');

  (*パスワード*)
  //Passwordマネージャを使うか？
  chkUsePassMan.Checked := gp.GetBoolPref('signon.rememberSignons');
  
  (* Cookie *)
  //Cookie受け入れ設定
{
692 pref("network.cookie.cookieBehavior",       0);
   0-Accept,
   1-dontAcceptForeign,
   2-dontUse,
   3-p3p
}
//  Stick('Cookie');
  cookieBehavior:=gp.GetIntPref('network.cookie.cookieBehavior');
  case cookieBehavior of
   0:rbAllowAllCookie.Checked:=true;//Accept
   1:rbDenyOtherSiteCookie.Checked:=true;//dontAcceptForeign
   2:rbDenyAllCookie.Checked:=true;//dontUse
   3:case gp.GetIntPref('network.cookie.p3plevel') of //p3p
       0:rbCookieP3PLow.Checked:=true;//low
       1:rbCookieP3PMedium.Checked:=true;//medium
       2:rbCookieP3PHigh.Checked:=true;//high
       3:rbCookieP3PCustom.Checked:=true;//custom
     else
     end;
  else
  end;
  
  //Cookie保存期間
  //pref("network.cookie.lifetimePolicy",       0);
  //0-accept normally
  //1-askBeforeAccepting
  //2-acceptForSession
  //3-acceptForNDays
  case gp.GetIntPref('network.cookie.lifetimePolicy') of
    0:rbCookieLifetimeNormal.Checked:=true;
    1:rbCookieLifetimeAskEach.Checked:=true;
    2:rbCookieLifetimeSession.Checked:=true;
  //本当はこのあと3が入る
  else
  end;

  cstr:=NewCString('');
  acstr:=cstr.ACString;
  cstr2:=NewCString('');
  acstr2:=cstr2.ACString;

  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);
  enum := pm.Enumerator;
  while enum.HasMoreElements do
  begin
    perm := enum.GetNext;
    perm.QueryInterface(nsIPermission,permission);
    permission.GetType(ACStr);
    //tmpCardinal := permission.Capability;
    permission.GetHost(ACStr2);
    if Cstr.ToString = 'image' then
    begin
      DenyImgList.AddItem(CStr2.ToString,nil);
    end
    else if Cstr.ToString = 'popup' then
    begin
      AllowPopupList.AddItem(CStr2.ToString,nil);
    end{
    else if Cstr.ToString = 'cookie' then
    begin
//      CookieList.AddItem(CStr2.ToString,nil);
    end};
  end;

  gp.Free;
//  Stick('gpFree');
end;

procedure TBagelSettingForm.FormCreate(Sender: TObject);
  function GetMenu(Caption:String;Parent:TMenuItem):TMenuItem;
  var
    i:Integer;
    new:TMenuItem;
  begin
    for i:=0 to Parent.Count-1 do begin
      if Parent.Items[i].Caption=Caption then begin
        Result:=Parent.Items[i];
        Exit;
      end;
    end;
    new:=TMenuItem.Create(Parent);
    new.Caption:=Caption;
    Parent.Add(new);
    Result:=new;
  end;
var
  i:Integer;
  node:TTreenode;
  parent:TMenuItem;
  newnode:TMenuitem;
begin
  //ExePath := ExtractFilePath(Application.ExeName);
  //SearchIni:=TMeminiFile.Create(ExePath+'Search.ini');
 //Self.TreeView1.FullExpand;
  for i:=PageControl1.PageCount-1 downto 0 do begin
    //Treeview1.TopItem.Item[]
    node:=Treeview1.Items.AddChildObjectFirst(Treeview1.Items.Item[ PageControl1.Pages[i].Tag ],PageControl1.Pages[i].Caption,PageControl1.Pages[i]);
    node.ImageIndex:=-1;
    node.SelectedIndex:=13;
    Treeview1.AutoExpand:=True;
    Treeview1.ShowRoot:=True;
    PageControl1.Pages[i].TabVisible:=False;
  end;

  for i:=0 to BagelMainForm.ActionList1.ActionCount -1 do begin
    parent:=GetMenu(BagelMainForm.ActionList1.Actions[i].Category,PopupActionSelector.Items);
    newnode:=TMenuItem.Create(parent);

    newnode.Caption:=TAction(BagelMainForm.ActionList1.Actions[i]).Caption;
    newnode.Tag:=Integer(BagelMainForm.ActionList1.Actions[i]);
    newnode.OnClick:=ActionClick;
    parent.Add(newnode);
  end;

  //アクションセレクタ
  btnRWheelClick.Tag:=Integer(stRWheelClick);
  btnRLeftClick.Tag:=Integer(stRLeftClick);
  btnRWheelUp.Tag:=Integer(stRWheelUp);
  btnRWheelDown.Tag:=Integer(stRWheelDown);
  btnRSide1Click.Tag:=Integer(stRSide1Click);
  btnRSide2Click.Tag:=Integer(stRSide2Click);
  btnSide1Click.Tag:=Integer(stSide1Click);
  btnSide2Click.Tag:=Integer(stSide2Click);

  btnAddStupScr.Tag:=Integer(lstStartupScript);
  btnAddStdwnScr.Tag:=Integer(lstShutdownScript);
end;

procedure TBagelSettingForm.ActionClick(Sender: TObject);
begin
  if TAction(TMenuItem(Sender).Tag)<>nil then begin
    if pasTarget is TStaticText then begin//マウス
      TStatictext(pasTarget).Tag:=TMenuItem(Sender).Tag;
      TStatictext(pasTarget).Caption:=TAction(TMenuItem(Sender).Tag).Caption;
    end
    else if pasTarget is TListBox then begin//スクリプト追加
      if TListBox(pasTarget).Items.IndexOfObject(TAction(TMenuItem(Sender).Tag))<0 then begin
        TListBox(pasTarget).AddItem(TAction(TMenuItem(Sender).Tag).Caption,TAction(TMenuItem(Sender).Tag));
      end;
    end;
  end
  else begin
    if TStatictext(pasTarget)=stTabRightClick then begin
      TStatictext(pasTarget).Tag:=0;
      TStatictext(pasTarget).Caption:='コンテキストメニュー';
    end
    else begin
      TStatictext(pasTarget).Tag:=0;
      TStatictext(pasTarget).Caption:='なし';
    end;
  end;
end;

procedure TBagelSettingForm.Button1Click(Sender: TObject);

procedure RegisterFiletype(ext:String;ref:String;regist:Boolean);
var
  reg:TRegistry;
  strArray:TStrArray;
  i:Integer;
  refbackup:String;
begin
   reg := TRegistry.Create;
   reg.RootKey := HKEY_CLASSES_ROOT;
   strArray := btSplitToArray(ext,',');
   try
      if regist=true then
      begin
        for i:=0 to High(strArray) do
        begin
          reg.OpenKey('.'+strArray[i],True);                        // 拡張子 を登録
          refbackup := reg.ReadString('');
          if not (refbackup = ref) then
                 reg.WriteString('refbackup',refbackup);//もともとの参照のバックアップ;
          reg.WriteString('',ref);                    // 拡張子 は refを参照
          reg.CloseKey;
          
          reg.OpenKey(ref,True);                     // xxxFile を登録
          reg.WriteString('',strArray[i]+'ファイル');                // Explorer の説明用
          reg.OpenKey('DefaultIcon',True);         // Icon 参照キー
          reg.WriteString('',Application.ExeName+',0'); // Icon の指定
          reg.CloseKey;

          reg.OpenKey(ref+'\shell\open\command',True);  // Application 参照キー
          reg.WriteString('',                               // Application の指定
                 '"'+Application.ExeName+'" "%1"');
          reg.CloseKey;
        end;
      end
      else
      begin
        for i:=0 to High(strArray) do
        begin
          reg.OpenKey('.'+strArray[i],True);                        // 拡張子
          if reg.ValueExists('refbackup') then
          begin
            refbackup := reg.ReadString('refbackup');
            reg.WriteString('',refbackup);                    // 拡張子 のrefへの参照をもとにもどす
            reg.DeleteValue('refbackup');
          end;
          reg.CloseKey;
        end;
          reg.DeleteKey(ref);               //参照先を削除
      end;
   finally
     reg.Free;
   end;
end;

procedure RegisterProtocol(proto:String;regist:Boolean);
var
  reg:TRegistry;
begin
   reg := TRegistry.Create;
   reg.RootKey:=HKEY_CLASSES_ROOT;
   try
      if regist=true then
      begin
        reg.OpenKey(proto+'\shell',true);
        reg.WriteString('','Bagel'); //HTTP は Bagel を参照

        reg.OpenKey('Bagel',true);
        reg.WriteString('','Bagel');

        reg.OpenKey('Command',true);
        reg.WriteString('','"'+Application.ExeName+'" "%1"');
      end
      else
      begin
        reg.OpenKey(proto+'\shell',true);
        if reg.ReadString('')='Bagel' then reg.WriteString('','');
        reg.OpenKey('Bagel',true);
        reg.DeleteKey('');
      end;
      reg.CloseKey;
   finally
     reg.Free
   end;
end;

const
  encode: array[0..3] of String = ('', 'Shift_JIS', 'EUC-JP', 'UTF-8');
var
  pb:nsIPrefBranch;
  gp:TGeckoPref;
  tmpPChar:PChar;
  tmpBool:Longbool;
  tmpInt:Integer;
  tmpSS:nsISupportsString;
  pS:nsIPrefService;
  pm:nsIPermissionManager;
  i,j,k,l:Integer;
  u:nsIURI;
  reg:TRegistry;
  ad:TAdblockData;
  ud:TURIActionData;
  style:TInlineStyle;
  cacheDir:nsILocalFile;
  p3pval: Array [ 0..2 ] of String;
  tmpSL:TStringList;
  tmpObj:TObject;
  tmpStr:String;
  tmpItem:TSearchListItem;
  oldIndex:integer;
begin
  NS_GetService(NS_PREFSERVICE_CID,nsIPrefService,pS);
//  NS_CreateInstance(NS_ISUPPORTSSTRING_IID,nsISupportsString,tmpSS);
  NS_CreateInstance('@mozilla.org/supports-string;1',nsISupportsString,tmpSS);
  //関連付け
//  Stick('Bagel設定 OK');
//  Stick('Protocol');
      //プロトコル
      //http
      if chlAccProtocol.Tag=1 then begin
        RegisterProtocol('http',chlAccProtocol.Checked[0]);

        //https
        RegisterProtocol('https',chlAccProtocol.Checked[1]);

        //ftp
        RegisterProtocol('ftp',chlAccProtocol.Checked[2]);
      end;

      if chlAccFiletype.Tag=1 then begin
        //HTML
        RegisterFiletype('htm,html','BagelHTML',chlAccFiletype.Checked[0]);
        //XHTML
        RegisterFiletype('xhtml','BagelXHTML',chlAccFiletype.Checked[1]);
        //XML
        RegisterFiletype('xml','BagelXML',chlAccFiletype.Checked[2]);
        //XUL
        RegisterFiletype('xul','BagelXUL',chlAccFiletype.Checked[3]);
        //PNG
        RegisterFiletype('png','BagelPNG',chlAccFiletype.Checked[4]);
        //JPEG
        RegisterFiletype('jpeg,jpe,jpg','BagelJPEG',chlAccFiletype.Checked[5]);
        //GIF
        RegisterFiletype('gif','BagelGIF',chlAccFiletype.Checked[6]);
        //XBM
        RegisterFiletype('xbm','BagelXBM',chlAccFiletype.Checked[7]);
      end;

      if (chlAccFiletype.Tag=1) or (chlAccProtocol.Tag=1) then begin
        SHChangeNotify(SHCNE_ASSOCCHANGED,            //システムに変更を通知
                       SHCNF_FLUSH,nil,nil);
      end;
      {reg.OpenKey('HTTP\shell',false);
      if reg.ReadString('')='Bagel' then chlAccProtocol.Checked[0]:=true else chlAccProtocol.Checked[0]:=false;
      reg.OpenKey('HTTPS\shell',false);
      if reg.ReadString('')='Bagel' then chlAccProtocol.Checked[0]:=true else chlAccProtocol.Checked[0]:=false;
      reg.OpenKey('FTP\shell',false);
      if reg.ReadString('')='Bagel' then chlAccProtocol.Checked[0]:=true else chlAccProtocol.Checked[0]:=false;
      }
      //ファイルタイプ
      {OpenKey('\.html',True);
      if reg.ReadString('') ='BagelHTML' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.htm',True);
      if reg.ReadString('') ='BagelHTML' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.xhtml',True);
      if reg.ReadString('') ='BagelXHTML' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.xml',True);
      if reg.ReadString('') ='BagelXML' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.xul',True);
      if reg.ReadString('') ='BagelXUL' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.png',True);
      if reg.ReadString('') ='BagelPNG' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.jpeg',True);
      if reg.ReadString('') ='BagelJPEG' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.gif',True);
      if reg.ReadString('') ='BagelGIF' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
      OpenKey('\.xbm',True);
      if reg.ReadString('') ='BagelXBM' then chlAccFiletype.Checked[0]:=true else chlAccFiletype.Checked[0]:=false;
       }
      //OpenKey('\.xxx',True);                        // HTTP を登録
      ///WriteString('','xxxFile');                    // 拡張子.xxx は xxxFile を参照
      //OpenKey('\xxxFile',True);                     // xxxFile を登録
      //WriteString('','xxxファイル');                // Explorer の説明用
      //OpenKey('\xxxFile\DefaultIcon',True);         // Icon 参照キー
      //WriteString('','"D:\WinNT40\Notepad.exe,0"'); // Icon の指定
      //OpenKey('\xxxFile\shell\open\command',True);  // Application 参照キー
      //WriteString('',                               // Application の指定
      //      '"D:\WinNT40\Notepad.exe" "%1"');
      //SHChangeNotify(SHCNE_ASSOCCHANGED,            //システムに変更を通知
      //               SHCNF_FLUSH,nil,nil);

  //Search.ini
  SearchIni:=TMeminiFile.Create(GetSettingDir()+'Search.ini');
  SearchIni.Clear;
  tmpInt:=1;
  SearchIni.WriteInteger('Search-List','ListCount',ListView2.Items.Count);
  for i:=0 to listView2.Items.Count-1 do begin
    tmpItem:=Tsearchlistitem(ListView2.Items.Item[i]);
    tmpStr:=GetSStr(i+1);
    SearchIni.WriteString('Search-List',tmpStr,tmpItem.Caption);
    if tmpitem.ItemType=0 then begin
      tmpStr:=tmpItem.Caption;
      SearchIni.WriteInteger(tmpStr,'Group',0);
      SearchIni.WriteString(tmpStr,'FrontURL',tmpItem.SubItems.Strings[0]);
      SearchIni.WriteString(tmpStr,'BackURL',tmpItem.SubItems.Strings[1]);
      SearchIni.WriteString(tmpStr,'Encode',tmpitem.Encode);
      SearchIni.WriteString(tmpStr,'Shortcut',tmpItem.SubItems.Strings[3]);
    end
    else begin
      tmpStr:=tmpItem.Caption;
      SearchIni.WriteInteger(tmpStr,'Group',tmpInt);
      SearchIni.WriteString(tmpStr,'Shortcut',tmpItem.SubItems.Strings[3]);
      Inc(tmpInt);
      SearchIni.WriteInteger(tmpStr,'ListCount',tmpitem.Groups.Count);
      for j:=0 to tmpitem.Groups.Count-1 do begin
        SearchIni.WriteString(tmpStr,GetSStr(j+1),tmpitem.Groups.Strings[j]);
      end;
    end;
  end;

  SearchIni.UpdateFile;
  SearchIni.Free;
  Pref.IniFile2.Free;
  Pref.IniFile2:=TMemIniFile.Create(GetSettingDir()+'Search.ini');
  Pref.IniFile2.ReadSectionValues('Search-List',Pref.Engines);

  //Bagel設定

  with Pref do
  begin
//   Stick('Pref1');
   ConsiderTarget:=chkConsiderTarget.Checked;
   ShowAppNameInTitle:=not chkDontShowAppname.Checked;
   EnableDenyTitle:=chkEnableDenyTitle.Checked;
   AutoSaveTablist:=chkAutoSaveTablist.Checked;
   DenyTitleList.Assign(RejTitleList.Items);
   DenyURLList.Assign(RejURLList.Items);
//Font
  OverrideToolbarFont:=chkOverrideToolFont.Checked;
  ToolbarFont:=cboToolbarFont.Text;
  OverrideMenubarFont:=chkOverrideMenuFont.Checked;
  MenubarFont:=cboMenubarFont.Text;
  OverrideSidebarFont:=chkOverrideSideFont.Checked;
  SidebarFont:=cboSidebarFont.Text;

  // Startup/Shutdown Script
  tmpSL:=TStringList.Create;
  try
    for i:=0 to lstStartupScript.Count-1 do begin
      tmpSL.Add(TAction(lstStartupScript.Items.Objects[i]).Name);
    end;
    Pref.StartupScript:=tmpSL.CommaText;
    
    tmpSL.Clear;
    for i:=0 to lstShutdownScript.Count-1 do begin
      tmpSL.Add(TAction(lstShutdownScript.Items.Objects[i]).Name);
    end;
    Pref.ShutdownScript:=tmpSL.CommaText;
  finally
    tmpSL.Free;
  end;
  
//   Stick('Gest');
   if GestListEditor.Tag=1 then
   begin
   GestList.Clear;
   for i:=0 to GestListEditor.Items.Count-1 do
   begin
//     ShowMessage(GestListEditor.Items.Item[i].Caption+'='+TAction(GestListEditor.Items.Item[i].Data).Name);
     GestList.Add(GestListEditor.Items.Item[i].Caption+'='+TAction(GestListEditor.Items.Item[i].Data).Name);
   end;
   end;
//   Stick('Key');
   if ShortcutListEditor.Tag=1 then
   begin
   KbdList.Clear;
     for i:=0 to ShortcutListEditor.Items.Count-1 do
     begin
       KbdList.Add(ShortcutListEditor.Items.Item[i].Caption+'='+TAction(ShortcutListEditor.Items.Item[i].Data).Name);
     end;
   end;

   if lvOperaKeyList.Tag=1 then
   begin
   OperakeyList.Clear;
     for i:=0 to lvOperaKeyList.Items.Count-1 do
     begin
       OperakeyList.Add(lvOperaKeyList.Items.Item[i].Caption+'='+TAction(lvOperaKeyList.Items.Item[i].Data).Name);
     end;
   end;

   //   Stick('UA');
   if lvUserAgent.Tag=1 then begin
     UserAgents.Clear;
     for i:=0 to lvUserAgent.Items.Count-1 do begin
       UserAgents.Add(lvUserAgent.Items.Item[i].Caption+'='+lvUserAgent.Items.Item[i].SubItems.Strings[0]);
     end;
   end;
//   Stick('Adb');
   if lvAdblock.Tag=1 then begin
     //for i:=0 to lvUserAgent.Items.Count-1 do begin
       //UserAgents.Add(lvUserAgent.Items.Item[i].Caption+'='+lvUserAgent.Items.Item[i].SubItems.Strings[0]);
     //end;
     AdDenyList.Clear;
     for i := 0 to lvAdblock.Items.Count-1 do begin
       ad:=PAdblockData(lvAdblock.Items.Item[i].Data)^;
       AdDenyList.Add(IntToStr(ad.Condition)+#9+ad.Pattern);
     end;

   end;

   for i := 0 to lvAdblock.Items.Count-1 do begin
     Dispose(PAdblockData(lvAdblock.Items.Item[i].Data));
   end;

   //HighLight
   Pref.HighLightPref.Clear;
   for i:=0 to lbHighlightStyle.Count -1 do begin
     Style:=PInlineStyle(lbHighlightStyle.Items.Objects[i])^;
     Pref.HighLightPref.Add(ColorToStr(Style.Color)+','+
     ColorToStr(Style.BGColor)+','+
     IntToStr(Integer(Style.Bold))+','+
     IntToStr(Integer(Style.italic))+','+
     IntToStr(Integer(Style.underline))
     );
     Dispose(PInlineStyle(lbHighlightStyle.Items.Objects[i]));
   end;

   if lvURIAction.Tag=1 then begin
     URIActionList.Clear;
     for i := 0 to lvURIAction.Items.Count-1 do begin
       ud:=PURIActionData(lvURIAction.Items.Item[i].Data)^;
       URIActionList.Add(IntToStr(ud.Condition)+#9+ud.Pattern+#9+IntToStr(ud.ActionType)+#9+ud.Param);
     end;
   end;

   for i := 0 to lvURIAction.Items.Count-1 do begin
     Dispose(PURIActionData(lvURIAction.Items.Item[i].Data));
   end;

//   Stick('TabBehv');
   //TabDblClickAct := TAction(cboTabDblClick.Items.Objects[cboTabDblClick.ItemIndex]).Name;
   TabDblClickAct := TAction(stTabDblClick.Tag).Name;
   //TabMiddleClickAct := TAction(cboTabMdlClick.Items.Objects[cboTabMdlClick.ItemIndex]).Name;
   TabMiddleClickAct := TAction(stTabMdlClick.Tag).Name;
   if TAction(stTabRightClick.Tag)=nil then TabRightClickAct := ''
   else TabRightClickAct := TAction(stTabRightClick.Tag).Name;

   //RightClickGesture
   if TAction(stRWheelClick.Tag)=nil then RWheelClick := ''
   else RWheelClick := TAction(stRWheelClick.Tag).Name;

   if TAction(stRLeftClick.Tag)=nil then RLeftClick := ''
   else RLeftClick := TAction(stRLeftClick.Tag).Name;

   if TAction(stRWheelUp.Tag)=nil then RWheelUp := ''
   else RWheelUp := TAction(stRWheelUp.Tag).Name;

   if TAction(stRWheelDown.Tag)=nil then RWheelDown := ''
   else RWheelDown := TAction(stRWheelDown.Tag).Name;

   if TAction(stRSide1Click.Tag)=nil then RSide1Click := ''
   else RSide1Click := TAction(stRSide1Click.Tag).Name;

   if TAction(stRSide2Click.Tag)=nil then RSide2Click := ''
   else RSide2Click := TAction(stRSide2Click.Tag).Name;

   if TAction(stSide1Click.Tag)=nil then Side1Click := ''
   else Side1Click := TAction(stSide1Click.Tag).Name;
   
   if TAction(stSide2Click.Tag)=nil then Side2Click := ''
   else Side2Click := TAction(stSide2Click.Tag).Name;

    //SuperDrag
    if rbSDImgNoAction.Checked then Pref.SDragImgAction:=0
    else if rbSDImgNewTab.Checked then Pref.SDragImgAction:=1
    else if rbSDImgSave.Checked then Pref.SDragImgAction:=2;

    SDragImgIsBG:=chkSDImgBGTab.Checked;
    SDragImgSaveType:=cbSDImgSaveType.ItemIndex;
    SDragImgSavePath:=edtSDImgSavePath.Text;    

    if rbSDLinkNoAction.Checked then Pref.SDragLinkAction:=0
    else if rbSDLinkNewTab.Checked then Pref.SDragLinkAction:=1
    else if rbSDLinkSave.Checked then Pref.SDragLinkAction:=2;

    SDragLinkgIsBG:=chkSDLinkBGTab.Checked;
    SDragLinkSaveType:=cbSDLinkSaveType.ItemIndex;

    if rbSDSelectionNoAction.Checked then Pref.SDragSelectionAction:=0
    else if rbSDSelectionNewTab.Checked then Pref.SDragSelectionAction:=1;
    
    if rbSDSelSearch.Checked then Pref.SDragSelectionDet:=0
    else if rbSDSelOpenURI.Checked then Pref.SDragSelectionDet:=1
    else if rbSDSelMixed.Checked then Pref.SDragSelectionDet:=2;

    SDragLinkgIsBG:=chkSDSelectionBGTab.Checked;
    SDragSelectionDetRE:=edtSDSelectionURIRE.Text;

//   Stick('Tab');
   DefaultAllowPlugins:=chkAllowPlugins.Checked;
   DefaultAllowJS:=chkAllowJS.Checked;
   DefaultAllowFrames:=chkAllowFrames.Checked;
   DefaultAllowMeta:=chkAllowMetaRedirect.Checked;
   DefaultAllowImg:=chkAllowImg.Checked;

   OpenModePopup       := arrOpenMode[0];
   OpenModeBookmarks   := arrOpenMode[1];
   OpenModeHistory     := arrOpenMode[2];
   OpenModeLocation    := arrOpenMode[3];
   OpenModeSearch      := arrOpenMode[4];
   OpenModeViewsource  := arrOpenMode[5];
   OpenModeMiddleClick := arrOpenMode[6];
   OpenModeClipboard   := arrOpenMode[7];

   WhenCloseTabChoose := cboWhenCloseChoose.ItemIndex;

   TabWidth := StrToInt(edtTabWidth.Text);
   EnableWheelTabChange := chkEnableWheelTabChange.Checked;

   TabMaxCount         := StrToInt(edtMaxTab.Text);
   TabMaxStrCount      := StrToInt(edtTabMaxStr.Text);
   TabMultiLine        := chkTabMultiline.Checked;
   ViewIsRead          := chkViewIsRead.Checked;
   if chkIsFlatButtonTab.Checked then TabStyle:=1
   else TabStyle:=0;
   
     BagelMainForm.TabControl.MultiLine:=chkTabMultiline.Checked;
     if not chkTabMultiline.Checked then BagelMainForm.TabControl.Height:=22;
   NewTabMode          := NewTabGroup.ItemIndex;
   AddTabCurrCopyHistory := chktakeOverSession.Checked;
   Homepage            := edtHome.Text;
   AutoReloadCustomIntv:=StrToInt(edtUsrAutoReload.Text);
   UserDefinedFolder:=  edtUserDefinedFolder.Text;
//   Stick('Kiosk');
    KioskAddressBarVisible:=   chkKioskAddr.Checked  ;
    KioskTabBarVisible:=   chkKioskTabbar.Checked    ;
    KioskSearchBarVisible:=   chkKioskSearchbar.Checked ;
    KioskStatusBarVisible:=   chkKioskStatusBar.Checked ;
    KioskLinkBarVisible:=   chkKioskLinkbar.Checked  ;
    KioskMainBarVisible:=   chkKioskMainbar.Checked  ;
    KioskMenuBarVisible:=   chkKioskMenubar.Checked  ;
   //Recent
//   Stick('Recent');
    RecentClosedMaxCount:=StrToInt(edtRecentCMax.Text);
    RecentOpenedMaxCount:=StrToInt(edtRecentOMax.Text);
    RecentClosedURLStyle:=cboRecentClosedMenuStyle.ItemIndex;
    //Sidebar
    ShowSidebarTabs := chkShowSidebarTabs.Checked;
    SidebarAutoHide:= chkUseSidebarAutohide.Checked;
    SidebarOverlap:=chkSidebarOverlap.Checked;
    SidebarAutoOpenDelay := StrToIntDef(edtSidebarAutoOpenDelay.Text,0);
    SidebarAutoHideDelay := StrToIntDef(edtSidebarAutoHideDelay.Text,0);

    Pref.SidebarHeaderList.Clear;
    for i:=0 to lstSidebarHeaderVisibleItem.Count-1 do begin
      Pref.SidebarHeaderList.Add(TAction(lstSidebarHeaderVisibleItem.Items.Objects[i]).Name);
    end;
{
  for i:=lstSidebarHeaderHiddenItem.Count -1 downto 0 do begin
    tmpInt := Pref.SidebarHeaderList.IndexOf(TAction(lstSidebarHeaderHiddenItem.Items.Objects[i]).Name);
    if tmpInt>-1 then begin
      tmpAction := TAction(lstSidebarHeaderHiddenItem.Items.Objects[i]);
      lstSidebarHeaderVisibleItem.Items.AddObject(tmpAction.Caption,tmpAction);
      lstSidebarHeaderHiddenItem.Items.Delete(tmpInt);
    end;
  end;
}
  //Menu
  {chkOpenAllBkmk.Checked:=Pref.ShowOpenAllBookmarks;
  chkAddBkmkHere.Checked:=Pref.ShowAddBookmarkHere;
  edtBkmkMenuMaxLength.Text:=IntToStr(Pref.BookmarkMenuMaxLength):}
//  Stick('Menu');
    ShowAddBookmarkHere := chkAddBkmkHere.Checked;
    ShowOpenAllBookmarks:= chkOpenAllBkmk.Checked;
    BookmarkMenuMaxLength:= StrToInt(edtBkmkMenuMaxLength.Text);
    ShowmenuIcon:=chkShowMenuIcon.Checked;
    InheritDocShell:=chkInheritDocShell.Checked;
    InheritAutoHighlight:=chkInheritAutoHighlight.Checked;
   //DocShell
   {
   DefaultAllowPlugins:=chkAllowPlugins.Checked;
   DefaultAllowJS:=chkAllowJS.Checked;
   DefaultAllowFrames:=chkAllowFrames.Checked;
   DefaultAllowMeta:=chkAllowMetaRedirect;
   DefaultAllowImg:=chkAllowImg.Checked;
    }

   //StartUp
//   Stick('AutoExec');
   StartupTabBehavior:=rgStartupTabBehavior.ItemIndex;
//   RestoreTabs     := chkRestoreTabs.Checked;
   BUGeneration:=StrToInt(edtBUGeneration.Text);
   BUBookmarkOnStart:=chkBUBookmarkOnStart.Checked;
   BUPrefOnStart:=chkBUPrefOnStart.Checked;
   BUGeckoPrefOnStart:=chkBUGeckoPrefOnStart.Checked;

   StartupRestoreSH:=chkRestoreSH.Checked;
   StartupGroup:=edtStartupGroupFilename.Text;
//OnEnd
   DelRecentClosed := chkDelRecClosed.Checked;
   DelRecentOpened := chkDelRecOpened.Checked;
   DelAddrHistory  := chkDelAddress.Checked;
   DelSearchHistory:= chkDelSearch.Checked;
   DelCookie:= chkDelCookie.Checked;
   DelHistory:= chkDelHistory.Checked;
   DelCache:= chkDelCache.Checked;

   OnAppQuit := chkCnfAppQuit.Checked;
   OnCloseAll := chkCnfCloseAll.Checked;
   OnCloseOther := chkCnfCloseOther.Checked;
   OnDeleteBookmark := chkBkmkDel.Checked;
   OnOpeningManyItems := chkOpeningManyItems.Checked;
   WarnItemCount := StrToInt(edtWarnItemCount.Text);
//   Stick('RandomProxy');
  //ランダムプロクシ
   RandomProxy := chkRandomProxy.Checked;
   RandomProxyIntvMin:=StrToInt(edtRandomProxyIntvMin.Text);
   RandomProxyIntvsec:=StrToInt(edtRandomProxyIntvSec.Text);

   //Toolbar
   FixToolbar:=chkFixToolbar.Checked;
   BagelMainForm.actToggleNoGripper.Checked:=FixToolbar;


   //Search
   ScrollToCenterOnFind := chkScrollToCenterOnFind.Checked;
   SearchOnKeywordChange := chkSearchOnKeywordChange.Checked;
   SearchOnEngineChange := chkSearchOnEngineChange.Checked;
   SearchOnDrop := chkSearchOnDrop.Checked;
   RememberEngine := chkRemenberSearchEngine.Checked;
   SearchBarSaveCount := StrToInt(edtSearchBarSaveCount.Text);
   SearchBarDropdownCount := StrToInt(edtSearchBarDropdownCount.Text);
   ReplaceZenkakuSpace := chkReplaceZenkakuSpace.Checked;
   AutoHighlightAfterSearch:=chkDoAutoHighlightOnSearch.Checked;
   AutoTabLockAfterSearch:=chkDoAutoLockOnSearch.Checked;
   ShowGoButton:=chkAddrShowGo.Checked;
   ShowGoButtonCaption:=chkAddrShowGoCaption.Checked;
   UseAddAutoComplete:=chkAddrAutoComplete.Checked;
  end;

//Gecko設定
  //関連付け
  {winhook.GetSettings(hooksettings);
  hooksettings.SetIsHandlingFTP(chlAccProtocol.Checked[2]);
  winhook.SetSettings(hooksettings);}
//  Stick('Gecko');
  gp := TGeckoPref.Create;
  pb := gp.GetRootBranch;
//  pf := gp.GetPref;

  //Migemo FAYT
  gp.SetBoolPref('accessibility.typeaheadfind',chkEnableFAYT.Checked);
  Pref.MigemoEnabled:=chkEnableMigemo.Checked;
  gp.SetBoolPref('accessibility.typeaheadfind.autostart',chkIncSearchAutoStart.Checked);
  gp.SetBoolPref('accessibility.typeaheadfind.linksonly',chkIncSearchLinksOnly.Checked);
  gp.SetBoolPref('accessibility.typeaheadfind.enabletimeout',chkIncSearchEnableTimeout.Checked);
  gp.SetIntPref('accessibility.typeaheadfind.timeout',StrToInt(edtIncSearchTimeout.Text));

  Pref.MigemoLazyHilight:=chkEnableLazyHighlight.Checked;
  Pref.MigemoOpenGrepSidebar:=chkAutoOpenGrep.Checked;
  Pref.MigemoDLLPath:=edtPathToMigemoDLL.Text;
  Pref.MigemoDicFolder:=edtpathToMigemoDic.Text;

  //Java JavaScript
  gp.SetBoolPref('javascript.enabled',chkEnableJS.Checked);
  gp.SetBoolPref('security.enable_java',chkEnableJava.Checked);

  //JavaScript詳細
  gp.SetBoolPref('dom.allow_scripts_to_close_windows',chkDomAllowClose.Checked);
  gp.SetBoolPref('dom.disable_window_flip',not chkDomAllowFlip.Checked);
  gp.SetBoolPref('dom.event.contextmenu.enabled',chkDomContextmenu.Checked);
  gp.SetBoolPref('dom.disable_window_status_change',not chkDomChangeStatustext.Checked);
  //BlockPopup
  gp.SetBoolPref('dom.disable_open_during_load',chkDomPopupDuringLoad.Checked);
  gp.SetBoolPref('dom.disable_window_open_feature.scrollbars',not chkDomHideScrollbar.Checked);
  gp.SetBoolPref('dom.disable_image_src_set',not chkDomChangeImgSrc.Checked);
  gp.SetIntPref('dom.max_script_run_time',StrToInt(edtScriptMaxRunTime.text));
  gp.SetIntPref('dom.disable_open_click_delay',StrToInt(edtPopupDisableDelay.Text));
  gp.SetIntPref('dom.popup_maximum',StrToInt(edtPopupmax.Text));

  //画像表示設定
  // 1-Accept, 2-Deny, 3-dontAcceptForeign
  if chkShowImage.Checked then begin
    if chkOnlyOrigServer.Checked then
     gp.SetIntPref('permissions.default.image',3)    //同じ鯖のみ
    else
     gp.SetIntPref('permissions.default.image',1);//全て読み込む
  end
  else begin
    gp.SetIntPref('permissions.default.image',2);//読み込まない
  end;

  {//キャレットモード
  chkUseCaretMode.Checked:=gp.GetBoolPref(PChar('accessibility.browsewithcaret'));
  //自動リサイズ
  chkImgAutoResize.Checked:=gp.GetBoolPref(PChar('browser.enable_automatic_image_resizing'));
  //SmoothScroll
  chkUseSmoothScroll.Checked:=gp.GetBoolPref(PChar('general.smoothScroll'));}
  gp.SetBoolPref('accessibility.browsewithcaret',chkUseCaretMode.Checked);
  gp.SetBoolPref('browser.enable_automatic_image_resizing',chkImgAutoResize.Checked);
  gp.SetBoolPref('general.smoothScroll',chkUseSmoothScroll.Checked);

  //デフォルトフォント設定
  if ComboPropotional.ItemIndex=0 then tmpPChar:=PChar('serif')
  else tmpPChar:=PChar('sans-serif');
  pb.SetCharPref(PChar('font.default'),tmpPChar);

  //日本語フォント設定
  //セリフ
  tmpSS.SetData(NewString(WideString(ComboSerif.Text)).AString);
  pb.SetComplexValue('font.name.serif.ja',nsISupportsString,tmpSS);
  //サンセリフ
  tmpSS.SetData(NewString(WideString(ComboSansSerif.Text)).AString);
  pb.SetComplexValue('font.name.sans-serif.ja',nsISupportsString,tmpSS);
  //等幅
  tmpSS.SetData(NewString(WideString(ComboMonospace.Text)).AString);
  pb.SetComplexValue('font.name.monospace.ja',nsISupportsString,tmpSS);

  //システムカラーを使う
  gp.SetBoolPref('browser.display.use_system_colors',chkUseSysColor.Checked);

  //ドキュメントの色を使う
  gp.SetBoolPref('browser.display.use_document_colors',(not chkAlwaysUseColor.Checked));

  //フォーカスカラーを用いる
  gp.SetBoolPref('browser.display.use_focus_colors',chkUseFocusColors.Checked);

  //フォーカスリングをつける
  gp.SetBoolPref('browser.display.focus_ring_on_anything',chkFocusOnAnything.Checked);

  //リンクに下線を引く
  gp.SetBoolPref('browser.underline_anchors',chkUnderlineA.Checked);


  //常にこのフォント設定を使う
  if chkAlwaysUseFont.Checked then
  begin
    tmpInt:=0;
  end
  else
  begin
    tmpInt:=1;
  end;
  pb.SetIntPref(Pchar('browser.display.use_document_fonts'),tmpInt);

  //色設定
  tmpPChar:=PChar('#'+ColorToStr(lblTextColor.Font.Color));
  pb.SetCharPref(PChar('browser.display.foreground_color'),tmpPChar);

  tmpPChar:=PChar('#'+ColorToStr(lblAnchorColor.Font.Color));
  pb.SetCharPref(PChar('browser.anchor_color'),tmpPChar);

  tmpPChar:=PChar('#'+ColorToStr(lblVisitedColor.Font.Color));
  pb.SetCharPref(PChar('browser.visited_color'),tmpPChar);

  tmpPChar:=PChar('#'+ColorToStr(lblBGColor.Color));
  pb.SetCharPref(PChar('browser.display.background_color'),tmpPChar);
  //ShowMessage(tmpPChar);

  tmpPChar:=PChar('#'+ColorToStr(lblFocusColor.Font.Color));
  pb.SetCharPref(PChar('browser.display.focus_text_color'),tmpPChar);

  tmpPChar:=PChar('#'+ColorToStr(lblFocusBgColor.Color));
  pb.SetCharPref(PChar('browser.display.focus_background_color'),tmpPChar);


  (****プロトコル抑制****)

  tmpBool:=not clSuppressProtocol.Checked[0];
  pb.SetBoolPref(PChar('network.protocol-handler.external.mailto'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[1];
  pb.SetBoolPref(PChar('network.protocol-handler.external.telnet'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[2];
  pb.SetBoolPref(PChar('network.protocol-handler.external.rlogin'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[3];
  pb.SetBoolPref(PChar('network.protocol-handler.external.tn3270'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[4];
  pb.SetBoolPref(PChar('network.protocol-handler.external.news'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[5];
  pb.SetBoolPref(PChar('network.protocol-handler.external.pnm'),Integer(tmpBool));
  tmpBool:=not clSuppressProtocol.Checked[6];
  pb.SetBoolPref(PChar('network.protocol-handler.external.mms'),Integer(tmpBool));

  (****プロクシ設定****)
  (*串を使うか？*)

  if radDirectConnect.Checked then tmpInt := 0
  else if radManualConnect.Checked then tmpInt := 1
  else if radAutoConnectByScr.Checked then tmpInt := 2
  else if radProxyAutoDetect.Checked then tmpInt := 4;
  pb.SetIntPref(PChar('network.proxy.type'),tmpInt);

  (*自動設定URL*)
  pb.SetCharPref(PChar('network.proxy.autoconfig_url'),PChar(edtAutoConnectByScr.Text));

  (*串を使わないサイト*)
  pb.SetCharPref(PChar('network.proxy.no_proxies_on'),PChar(edtNoProxy.Text));

  (*HTTP串*)
  pb.SetCharPref(PChar('network.proxy.http'),PChar(edtHttpProxy.Text));
  pb.SetIntPref(PChar('network.proxy.http_port'),StrToInt(httpPort.Text));

  (*FTP串*)
  pb.SetCharPref(PChar('network.proxy.ftp'),Pchar(edtFtpProxy.Text));
  pb.SetIntPref(PChar('network.proxy.ftp_port'),StrToInt(ftpPort.Text));

  (*SSL串*)
  pb.SetCharPref(PChar('network.proxy.ssl'),Pchar(edtSslProxy.Text));
  pb.SetIntPref(PChar('network.proxy.ssl_port'),StrToInt(sslPort.Text));

  (*SOCKS串*)
  pb.SetCharPref(PChar('network.proxy.socks'),Pchar(edtSocksProxy.Text));
  pb.SetIntPref(PChar('network.proxy.socks_port'),StrToInt(socksPort.Text));
//  if cboSOCKSVersion.ItemIndex=0 then network.proxy.socks_version
//  else if cboSOCKSVersion.ItemIndex=1 then network.proxy.socks_version;

  (*SSL串*)
  pb.SetCharPref(PChar('network.proxy.gopher'),Pchar(edtGopherProxy.Text));
  pb.SetIntPref(PChar('network.proxy.gopher_port'),StrToInt(gopherPort.Text));
  (*串リスト*)
  Pref.Proxies.Assign(ProxyList.Items);

  (*履歴*)
  //履歴保存期間
  gp.SetIntPref('browser.history_expire_days',StrToInt(edtHistoryExpireDays.Text));

  (*キャッシュ*)

  //キャッシュ確認頻度
  //// 0 = once-per-session, 1 = each-time, 2 = never, 3 = when-appropriate/automatically
  gp.SetIntPref('browser.cache.check_doc_frequency',rgCheckFrequency.ItemIndex);


  //ディスクキャッシュ容量
  gp.SetIntPref('browser.cache.disk.capacity',StrToInt(edtCacheCapacity.Text)*1024);


  //キャッシュフォルダ
  if edtCacheDirParent.Tag=1 then begin
    NS_NewLocalFile(NewString(edtCacheDirParent.Text).AString,false,cacheDir);
    pb.SetComplexValue(PChar('browser.cache.disk.parent_directory'),nsILocalFile,cacheDir);
  end;

  //プリフェッチ
  gp.SetBoolPref('network.prefetch-next',chkPrefetchNext.Checked);

  (*パスワード*)
  gp.SetBoolPref('signon.rememberSignons',chkUsePassMan.Checked);
//  Stick('Cookie');
  (* Cookie *)
  //Cookie受け入れ設定
  p3pval[0]:='afafaaaa';
  p3pval[1]:='ffffaaaa';
  p3pval[2]:='frfradaa';
{
692 pref("network.cookie.cookieBehavior",       0);
   0-Accept,
   1-dontAcceptForeign,
   2-dontUse,
   3-p3p
}
   if rbAllowAllCookie.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',0);
   end
   else if rbDenyOtherSiteCookie.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',1);
   end
   else if rbDenyAllCookie.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',2);
   end
   else if rbCookieP3PHigh.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',3);
     gp.SetIntPref('network.cookie.p3plevel',2);
     gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(p3pval[2]));
   end
   else if rbCookieP3PMedium.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',3);
     gp.SetIntPref('network.cookie.p3plevel',1);
     gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(p3pval[1]));
   end
   else if rbCookieP3PLow.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',3);
     gp.SetIntPref('network.cookie.p3plevel',0);
     gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(p3pval[0]));
   end
   else if rbCookieP3PCustom.Checked then begin
     gp.SetIntPref('network.cookie.cookieBehavior',3);
     gp.SetIntPref('network.cookie.p3plevel',3);
     gp.GetRootBranch.SetCharPref(PChar('network.cookie.p3p'),PChar(Pref.CookieP3PCustom));
   end;

  //Cookie保存設定
  if rbCookieLifetimeNormal.Checked then begin
    gp.SetIntPref('network.cookie.lifetimePolicy',0);
  end
  else if rbCookieLifetimeSession.Checked then begin
    gp.SetIntPref('network.cookie.lifetimePolicy',2);
  end
  else if rbCookieLifetimeAskEach.Checked then begin
    gp.SetIntPref('network.cookie.lifetimePolicy',1);
  end;
//  Stick('Img');
  NS_GetService('@mozilla.org/permissionmanager;1',nsIPermissionManager,pm);

  //cstr:=NewCString('image');
  //acstr:=cstr.ACString;
  //cstr2:=NewCString('');
  //a//cstr2:=cstr2.ACString;                   (CookieList.Tag=1) or
  if (DenyImgList.Tag=1) or (AllowPopupList.Tag=1) then
  begin

   pm.RemoveAll;

   for i:=0 to DenyImgList.count-1 do
   begin
     u:=NS_NewURI('http://'+DenyImgList.Items.Strings[i]);
     pm.Add(u,PChar('image'),2);//Deny
   end;

   for i:=0 to AllowPopupList.count-1 do
   begin
     u:=NS_NewURI('http://'+AllowPopupList.Items.Strings[i]);
     pm.Add(u,PChar('popup'),1);//Allow
   end;
   {
   for i:=0 to CookieList.count-1 do
   begin
     NS_NewURI(u,'http://'+CookieList.Items.Strings[i]);
     pm.Add(u,PChar('Cookie'),2);//Deny
   end;}
  end;
//  Stick('gpFree');
  gp.Free;
  pS.SavePrefFile(nil);
//  Stick('saved.');
  BagelMainForm.UpdatePrefs;
  oldIndex:=BagelMainForm.EngineBox.ItemIndex;
  BagelMainForm.UpdateSearch;
  if (oldIndex<BagelMainForm.EngineBox.Items.Count) then BagelMainForm.EngineBox.ItemIndex := oldIndex;
  //BagelMainForm.UpdateBookmarks2;
  Self.Close;
end;
                         {
procedure TBagelSettingForm.ButtonAlreadyClick(Sender: TObject);
begin
//browser.visited_color
end;

procedure TBagelSettingForm.ButtonNotyetClick(Sender: TObject);
begin
//browser.anchor_color
end;

procedure TBagelSettingForm.ButtonBackColorClick(Sender: TObject);
begin
//browser.display.background_color
end;                      }

procedure TBagelSettingForm.ButtonColorClick(Sender: TObject);
var
pb:nsIPrefBranch;
gp:TGeckoPref;
//tmpPChar:PChar;
//tmpPChar2:PChar;
//tmpBool:Longbool;
//tmpInt:Integer;
//tmpStr:String;
begin
//Gecko設定
  gp := TGeckoPref.Create;
  pb := gp.GetRootBranch;
  //デフォルトフォント設定
 { tmpStr:=String(pb.GetCharPref(PChar('browser.display.foreground_color')));
//browser.display.foreground_color
ShowMessage(Copy( str, 2, Length(str)-1 ));
ColorDialog1.CustomColors.Append(Copy( str, 2, Length(str)-1 ));
ColorDialog1.Execute;}
gp.Free;
end;

procedure TBagelSettingForm.lblFocusBgColorClick(Sender: TObject);
begin
//browser.display.focus_background_color#1166FF
end;

procedure TBagelSettingForm.chkFocusOnAnythingClick(Sender: TObject);
begin
//browser.display.focus_ring_on_anything
end;

procedure TBagelSettingForm.lblFocusColorClick(Sender: TObject);
begin
//browser.display.focus_text_color
end;

procedure TBagelSettingForm.chkUseFocusColorsClick(Sender: TObject);
begin
//browser.display.use_focus_colors
end;

procedure TBagelSettingForm.chkUnderlineAClick(Sender: TObject);
begin
//browser.underline_anchors
end;

procedure TBagelSettingForm.DelRejTitleClick(Sender: TObject);
begin
RejTitleList.DeleteSelected;
end;

procedure TBagelSettingForm.DelRejURLClick(Sender: TObject);
begin
RejURLList.DeleteSelected ;
end;

procedure TBagelSettingForm.AddRejTitleClick(Sender: TObject);
begin
RejTitleList.AddItem(RejTitle.Text ,nil);
RejTitle.Text:='';
end;

procedure TBagelSettingForm.AddRejURLClick(Sender: TObject);
begin
  RejURLList.AddItem(RejURL.Text,nil);
  RejURL.Text:='';
end;

procedure TBagelSettingForm.RejURLList1Click(Sender: TObject);
begin
  RejURL.Text:=RejURLList.Items.Strings[RejURLList.ItemIndex];
end;

procedure TBagelSettingForm.lblClick(Sender: TObject);
begin
  if TLabel(Sender).Color = clBtnFace then
  begin
    ColorDialog1.Color:=TLabel(Sender).Font.Color;
    if ColorDialog1.Execute then TLabel(Sender).Font.Color:=ColorDialog1.Color;
  end
  else
  begin
    ColorDialog1.Color:=TLabel(Sender).Color;
    if ColorDialog1.Execute then TLabel(Sender).Color:=ColorDialog1.Color;
  end;
end;

procedure TBagelSettingForm.ButtonClearClick(Sender: TObject);
begin
  edtMGest.Text:='';
end;

procedure TBagelSettingForm.ButtonRightClick(Sender: TObject);
begin
  edtMGest.Text:=edtMGest.Text+'→'
end;

procedure TBagelSettingForm.ButtonLeftClick(Sender: TObject);
begin
  edtMGest.Text:=edtMGest.Text+'←'
end;

procedure TBagelSettingForm.ButtonDownClick(Sender: TObject);
begin
  edtMGest.Text:=edtMGest.Text+'↓'
end;

procedure TBagelSettingForm.ButtonUpClick(Sender: TObject);
begin
  edtMGest.Text:=edtMGest.Text+'↑'
end;

procedure TBagelSettingForm.edtNoProxyChange(Sender: TObject);
begin
  //network.proxy.no_proxies_on
end;

procedure TBagelSettingForm.radAutoConnectByScrClick(Sender: TObject);
begin
//network.proxy.autoconfig_url
  edtHttpProxy.Enabled    :=radManualConnect.Checked;
  edtSslProxy.Enabled     :=radManualConnect.Checked;
  edtFtpProxy.Enabled     :=radManualConnect.Checked;
  edtSocksProxy.Enabled   :=radManualConnect.Checked;
  edtGopherProxy.Enabled  :=radManualConnect.Checked;
  httpPort.Enabled        :=radManualConnect.Checked;
  ftpPort.Enabled         :=radManualConnect.Checked;
  socksPort.Enabled       :=radManualConnect.Checked;
  sslPort.Enabled         :=radManualConnect.Checked;
  gopherPort.Enabled      :=radManualConnect.Checked;
  cboSOCKSVersion.Enabled :=radManualConnect.Checked;
end;

procedure TBagelSettingForm.radManualConnectClick(Sender: TObject);
begin
  edtHttpProxy.Enabled    :=radManualConnect.Checked;
  edtSslProxy.Enabled     :=radManualConnect.Checked;
  edtFtpProxy.Enabled     :=radManualConnect.Checked;
  edtSocksProxy.Enabled   :=radManualConnect.Checked;
  edtGopherProxy.Enabled  :=radManualConnect.Checked;
  httpPort.Enabled        :=radManualConnect.Checked;
  ftpPort.Enabled         :=radManualConnect.Checked;
  socksPort.Enabled       :=radManualConnect.Checked;
  sslPort.Enabled         :=radManualConnect.Checked;
  gopherPort.Enabled      :=radManualConnect.Checked;
  cboSOCKSVersion.Enabled         :=radManualConnect.Checked;
end;

procedure TBagelSettingForm.radDirectConnectClick(Sender: TObject);
begin
  edtHttpProxy.Enabled    :=radManualConnect.Checked;
  edtSslProxy.Enabled     :=radManualConnect.Checked;
  edtFtpProxy.Enabled     :=radManualConnect.Checked;
  edtSocksProxy.Enabled   :=radManualConnect.Checked;
  edtGopherProxy.Enabled  :=radManualConnect.Checked;
  httpPort.Enabled        :=radManualConnect.Checked;
  ftpPort.Enabled         :=radManualConnect.Checked;
  socksPort.Enabled       :=radManualConnect.Checked;
  sslPort.Enabled         :=radManualConnect.Checked;
  gopherPort.Enabled      :=radManualConnect.Checked;
  cboSOCKSVersion.Enabled :=radManualConnect.Checked;
end;

procedure TBagelSettingForm.AddProxyListClick(Sender: TObject);
var
  i:Integer;
  tmp:String;
begin
  for i:=0 to MemoProxy.Lines.Count-1 do
  begin
    tmp:=MemoProxy.Lines.Strings[i];
    if ProxyList.Items.IndexOf(MemoProxy.Lines.Strings[i])=-1 then
    begin
      if (Pos('# ',tmp)=1) or (Pos('* ',tmp)=1) then ProxyList.AddItem(Copy(tmp,3,Length(tmp)),nil)
      else ProxyList.AddItem(tmp,nil);

    end;
  end;
  MemoProxy.Text:='';
end;

procedure TBagelSettingForm.DelProxyListClick(Sender: TObject);
begin
  ProxyList.DeleteSelected;
  ProxyList.Tag:=1;
end;

procedure TBagelSettingForm.AddDenyImgClick(Sender: TObject);
begin
  DenyImgList.AddItem(DenyImgEdit.Text ,nil);
  DenyImgEdit.Text:='';
  DenyImgList.Tag:=1;
end;

procedure TBagelSettingForm.DelDenyImgClick(Sender: TObject);
begin
  DenyImgList.DeleteSelected;
  DenyImgList.Tag:=1;
end;
                  {
procedure TBagelSettingForm.DelCookieClick(Sender: TObject);
begin
//CookieList.DeleteSelected;
CookieList.Tag:=1;
end;

procedure TBagelSettingForm.AddCookieClick(Sender: TObject);
begin
CookieList.AddItem(CookieListEdit.Text ,nil);
CookieList.Tag:=1;
CookieListEdit.Text:='';
end;           }

procedure TBagelSettingForm.AddAllowPopupClick(Sender: TObject);
begin
  AllowPopupList.AddItem(AllowPopupEdit.Text ,nil);
  AllowPopupList.Tag:=1;
  AllowPopupEdit.Text:='';
end;

procedure TBagelSettingForm.DelAllowPopupClick(Sender: TObject);
begin
  AllowPopupList.DeleteSelected;
  AllowPopupList.Tag:=1;
end;

procedure TBagelSettingForm.btnAdaptGestClick(Sender: TObject);
var
  item:TListItem;
  new:TListItem;
begin
  item:=GestListEditor.FindCaption(0,edtMGest.Text,false,false,false);
  //i:=GestListEditor.Strings.IndexOfName(edtMGest.Text);
  //
  GestListEditor.Tag:=1;
  if item<>nil then
  begin
    item.Caption:=edtMGest.Text;
    item.SubItems.Strings[0]:=TAction(stMouseAction.Tag).Caption;
    item.Data:=TAction(stMouseAction.Tag);

  end
  else
  begin
    new:=GestListEditor.Items.Add;
    //new:=
    //GestListEditor.Items.
    new.Caption:=edtMGest.Text;
    new.SubItems.Add(TAction(stMouseAction.Tag).Caption);
    new.Data:=TAction(stMouseAction.Tag);
    //GestListEditor.Items.AddItem(new);
  end;

  edtMGest.Text:='';

end;


procedure TBagelSettingForm.btnDelGestClick(Sender: TObject);
begin
//  GestListEditor.DeleteRow(GestListEditor.Row);
  GestListEditor.DeleteSelected;
  GestListEditor.Tag:=1;
  edtMGest.Text:='';
end;

procedure TBagelSettingForm.btnDelKbdClick(Sender: TObject);
begin
  ShortcutListEditor.DeleteSelected;
  ShortcutListEditor.Tag:=1;
  edtKbdShortcut.Text:='';
end;

procedure TBagelSettingForm.btnAdaptKbdClick(Sender: TObject);
var
  item:TListItem;
  new:TListItem;
begin
  item:=ShortcutListEditor.FindCaption(0,edtKbdShortcut.Text,false,false,false);
  shortcutListEditor.Tag:=1;
  if item<>nil then
  begin
    item.Caption:=edtKbdShortcut.Lines.Text;
    //item.SubItems.Add();
    item.SubItems.Strings[0]:=TAction(stKeyAction.Tag).Caption;
    item.Data:=TAction(stKeyAction.Tag);

  end
  else
  begin
    new:=ShortcutListEditor.Items.Add;
    new.Caption:=edtKbdShortcut.Lines.Text;
    new.SubItems.Add(TAction(stKeyAction.Tag).Caption);
    new.Data:=TAction(stKeyAction.Tag);
  end;

  edtKbdShortcut.Lines.Text:='';
end;

procedure TBagelSettingForm.edtKbdShortcutKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  shortcut:String;
begin
  shortcut:=ShortcutToText(TShortcut(Key));
{
ssShift	〔Shift〕キーが押されている
ssAlt	〔Alt〕キーが押されている
ssCtrl	〔Ctrl〕キーが押されている
}
  if (shortcut='Ctrl') or (shortcut='Alt') or (shortcut='Shift') then Exit;

  if ssAlt in Shift then shortcut:='Alt+'+shortcut;
  if ssCtrl in Shift then shortcut:='Ctrl+'+shortcut;
  if ssShift in Shift then shortcut:='Shift+'+shortcut;

  TMemo(Sender).Lines.Text:=shortcut;

end;

procedure TBagelSettingForm.ShortcutListEditorSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);

//var
//  i:Integer;
begin
  if Selected=false then exit;

  edtKbdShortcut.Lines.Text:=ShortcutListEditor.Selected.Caption;
  stKeyAction.Tag := Integer(Item.Data);
  stKeyAction.Caption := TAction(Item.Data).Caption;
  {i:=ComboKeyOpr.Items.IndexOfObject(TAction(Item.Data));
  if i<>-1 then
  begin
    ComboKeyOpr.ItemIndex:=i;
  end;}


end;

procedure TBagelSettingForm.GestListEditorSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
//var
//  i:Integer;
begin
  if Selected=false then exit;

  edtMGest.Text:=GestListEditor.Selected.Caption;
  stMouseAction.Tag := Integer(Item.Data);
  stMouseAction.Caption := TAction(Item.Data).Caption;
  {i:=ActsCombo.Items.IndexOfObject(TAction(Item.Data));

  if i<>-1 then
  begin
    ActsCombo.ItemIndex:=i;
  end;}
end;

procedure TBagelSettingForm.NewTabGroupClick(Sender: TObject);
begin
  {if TRadioGroup(Sender).ItemIndex=1 then
  begin
    chkTakeOverSession.Enabled:=true;
  end
  else
  begin
    chkTakeOverSession.Enabled:=false;
  end;}

end;
procedure TBagelSettingForm.btnAddUAClick(Sender: TObject);
var
  item:TListItem;
  //new:TListItem;
begin
  item:=lvUserAgent.FindCaption(0,edtUAViewName.Text,false,false,false);
  if item=nil then item:=lvUserAgent.Items.Add;

  item.Caption:=edtUAViewName.Text;
  item.SubItems.Add(edtUAString.Text);

  edtUAString.Text:='';
  edtUAViewName.Text:='';
  lvUserAgent.Tag:=1;
end;



procedure TBagelSettingForm.btnSaveUserContentClick(Sender: TObject);
var
  sl : TStringList;
begin
  sl := TStringList.Create;
  sl.Text:=AnsiToUTF8(UserCssMemo.Text);
  sl.SaveToFile(getChromeDir('userContent.css'));
end;

procedure TBagelSettingForm.lbOpenModeClick(Sender: TObject);
var
  OpenMode:Integer;
begin
  //チェックボックス等に反映
  OpenMode:=arrOpenMode[lbOpenMode.ItemIndex];
  if (OpenMode and 1)=0 then chkNewTab.Checked:=true else chkNewTab.Checked:=false;
  if (OpenMode and 2)=0 then chkBgTab.Checked:=false else chkBgTab.Checked:=true;
  rgTabAddPos.ItemIndex:=OpenMode div 4;
end;

procedure TBagelSettingForm.TabOpenModeChange(Sender: TObject);
begin
   arrOpenMode[lbOpenMode.ItemIndex]:=rgTabAddPos.ItemIndex * 4 +
                                      Integer(chkBgTab.Checked)*2 +
                                      Integer(not chkNewTab.Checked)
end;
procedure TBagelSettingForm.TreeView1Editing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit:=False;
end;

procedure TBagelSettingForm.TreeView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_UP then begin
    if TreeView1.Selected.Index=0 then begin
      if TreeView1.Selected.Parent.GetPrev<>nil then
      TreeView1.Select(TreeView1.Selected.Parent.GetPrev);
      Key := 0;
    end;
  end
  else if Key=VK_Down then begin
    if (TreeView1.Selected.Parent<>nil) and (TreeView1.Selected.Index=TreeView1.Selected.Parent.Count-1) then begin
      if (TreeView1.Selected.GetNext<>nil) and (TreeView1.Selected.GetNext.Getnext<>nil) then begin
        TreeView1.Select(TreeView1.Selected.GetNext.Getnext);
        Key:=0;
      end;
    end;
  end;
end;

procedure TBagelSettingForm.chkShowImageClick(Sender: TObject);
begin
  if chkShowImage.Checked then chkOnlyOrigServer.Enabled:=true else chkOnlyOrigServer.Enabled:=false;
end;
procedure TBagelSettingForm.radProxyAutoDetectClick(Sender: TObject);
begin
  edtHttpProxy.Enabled    :=radManualConnect.Checked;
  edtSslProxy.Enabled     :=radManualConnect.Checked;
  edtFtpProxy.Enabled     :=radManualConnect.Checked;
  edtSocksProxy.Enabled   :=radManualConnect.Checked;
  edtGopherProxy.Enabled  :=radManualConnect.Checked;
  httpPort.Enabled        :=radManualConnect.Checked;
  ftpPort.Enabled         :=radManualConnect.Checked;
  socksPort.Enabled       :=radManualConnect.Checked;
  sslPort.Enabled         :=radManualConnect.Checked;
  gopherPort.Enabled      :=radManualConnect.Checked;
  cboSOCKSVersion.Enabled :=radManualConnect.Checked;
end;

procedure TBagelSettingForm.btnDelUAClick(Sender: TObject);
begin
  lvUserAgent.Tag:=1;
  lvUserAgent.DeleteSelected;
end;

procedure TBagelSettingForm.lvUserAgentSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
//var
//  i:Integer;
begin
  if Selected=false then exit;

  edtUAViewName.Text:=lvUserAgent.Selected.Caption;
  edtUAString.Text:=lvUserAgent.Selected.SubItems.Strings[0];
end;

//引数にウィンドウのハンドルを取り、
//ディレクトリを返す関数。
function SelectFolderDialog(owner : HWND): AnsiString ;
var
  b : BROWSEINFO ;
  path : array[0..MAX_PATH] of char;
  id : PItemIDList;
begin
  path := 'C:\';
  b.hwndOwner := owner; //オーナーウィンドウのハンドル
  b.pidlRoot := nil;   //ルートフォルダ(これが私はよくわかってません))
  b.pszDisplayName := path; //選択したものの表示名格納場所
  b.lpszTitle := 'フォルダを選んで下さい'; //表示メッセージ
  b.ulFlags := BIF_RETURNONLYFSDIRS; //フォルダのみ選べる
  b.lpfn := nil; //コールバック関数
  b.lParam := 0;  //コールバック関数に渡される値
  b.iImage := 0;  //選択したもののイメージ番号

  id := SHBrowseForFolder(b); //ダイアログの表示

  if id <> nil then       //フォルダが選択されたか？
  begin
    //パス名を得る
    SHGetPathFromIDList(id, path);
    Result := path;
  end
  else Result := '';   //選択されなかった。
end;

procedure TBagelSettingForm.btnUserDefinedFolderClick(Sender: TObject);
var
  box:TBrowseFolderBox;
begin
  box:=TBrowseFolderBox.Create;
  try
    box.InitFolder:=edtUserDefinedFolder.Text;
    box.Title:='フォルダを選択してください';
    if box.Execute then edtUserDefinedFolder.Text:=box.SelectFolder;
  finally
    box.Free;
  end;
end;


procedure TBagelSettingForm.lvAdblockSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
//var
//  i:Integer;
begin
  if Selected=false then exit;

  edtAdblockPattern.Text := PAdblockData(lvAdblock.Selected.Data)^.Pattern;
  cboAdblockCondition.ItemIndex := PAdblockData(lvAdblock.Selected.Data)^.Condition;
end;

procedure TBagelSettingForm.btnAdblockAddClick(Sender: TObject);
var
  tmpItem:TListItem;
  AD:TAdblockData;
begin
      {
        0:部分一致
        1:完全一致
        2:前方一致
        3:後方一致
        4:正規表現
      }

  AD.Pattern := edtAdblockPattern.Text;
  AD.Condition := cboAdblockCondition.ItemIndex;
  tmpItem:=lvAdblock.Items.Add;
  tmpItem.Caption:=AD.Pattern;
  tmpItem.SubItems.Add(cboAdblockCondition.Items.Strings[AD.Condition]);
  tmpItem.Data:=TObject(NewAdblockData(AD));
  lvAdblock.Tag:=1;
end;

procedure TBagelSettingForm.btnAdblockOverrideClick(Sender: TObject);
begin
  if lvAdblock.Selected=nil then exit;
  PAdblockData(lvAdblock.Selected.Data)^.Pattern := edtAdblockPattern.Text;
  PAdblockData(lvAdblock.Selected.Data)^.Condition := cboAdblockCondition.ItemIndex;
  lvAdblock.Selected.Caption:=edtAdblockPattern.Text;
  lvAdblock.Selected.SubItems.Strings[0] := cboAdblockCondition.Items.Strings[cboAdblockCondition.ItemIndex];
  lvAdblock.Tag:=1;
end;

procedure TBagelSettingForm.btnAdblockDelClick(Sender: TObject);
begin
  if lvAdblock.Selected=nil then exit;
  Dispose(PAdblockData(lvAdblock.Selected.Data));
  lvAdblock.DeleteSelected;
  lvAdblock.Tag:=1;
end;

procedure TBagelSettingForm.btnURIActionAddClick(Sender: TObject);
var
  tmpItem:TListItem;
  UD:TURIActionData;
begin
      {
        0:部分一致
        1:完全一致
        2:前方一致
        3:後方一致
        4:正規表現
      }

  UD.Pattern := edtURIActionPattern.Text;
  UD.Condition := cboURIActionCondition.ItemIndex;
  UD.ActionType := cboURIActionType.ItemIndex;
  UD.Param := '';
  if UD.ActionType=0 then begin
    UD.Param := edtURIActionParam.Text;
  end
  else if UD.ActionType=1 then begin
    if chkActJS.Checked then UD.Param:=UD.Param+'1'
    else UD.Param:=UD.Param+'0';

    if chkActImg.Checked then UD.Param:=UD.Param+'1'
    else UD.Param:=UD.Param+'0';

    if chkActPlugins.Checked then UD.Param:=UD.Param+'1'
    else UD.Param:=UD.Param+'0';

    if chkActFrames.Checked then UD.Param:=UD.Param+'1'
    else UD.Param:=UD.Param+'0';

    if chkActMeta.Checked then UD.Param:=UD.Param+'1'
    else UD.Param:=UD.Param+'0';
  end;

  tmpItem:=lvURIAction.Items.Add;
  tmpItem.Caption:=UD.Pattern+cboURIActionCondition.Items.Strings[UD.Condition];
  tmpItem.SubItems.Add(cboURIActionType.Items.Strings[ud.ActionType]);
  tmpItem.Data:=TObject(NewURIActionData(UD));
  lvURIAction.Tag:=1;
end;

procedure TBagelSettingForm.btnURIActionDelClick(Sender: TObject);
begin
  if lvURIAction.Selected=nil then exit;
  Dispose(PURIActionData(lvURIAction.Selected.Data));
  lvURIAction.DeleteSelected;
  lvURIAction.Tag:=1;
end;

procedure TBagelSettingForm.btnURIActionOverrideClick(Sender: TObject);
var
  UD:PURIActionData;
begin
  if lvURIAction.Selected=nil then exit;
  UD:=PURIActionData(lvURIAction.Selected.Data);
  UD^.Pattern := edtURIActionPattern.Text;
  UD^.Condition := cboURIActionCondition.ItemIndex;
  UD^.ActionType := cboURIActionType.ItemIndex;
  UD^.Param := '';
  if UD^.ActionType=0 then begin
    UD^.Param := edtURIActionParam.Text;
  end
  else if UD^.ActionType=1 then begin
    if chkActJS.Checked then UD^.Param:=UD^.Param+'1'
    else UD^.Param:=UD^.Param+'0';

    if chkActImg.Checked then UD^.Param:=UD^.Param+'1'
    else UD^.Param:=UD^.Param+'0';

    if chkActPlugins.Checked then UD^.Param:=UD^.Param+'1'
    else UD^.Param:=UD^.Param+'0';

    if chkActFrames.Checked then UD^.Param:=UD^.Param+'1'
    else UD^.Param:=UD^.Param+'0';

    if chkActMeta.Checked then UD^.Param:=UD^.Param+'1'
    else UD^.Param:=UD^.Param+'0';
  end;

  lvURIAction.Selected.Caption:=edtURIActionPattern.Text + cboURIActionCondition.Items.Strings[cboURIActionCondition.ItemIndex];
  lvURIAction.Selected.SubItems.Strings[0] := cboURIActionType.Items.Strings[PURIActionData(lvURIAction.Selected.Data)^.ActionType];
  lvURIAction.Tag:=1;
end;

procedure TBagelSettingForm.lvURIActionSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
//var
//  i:Integer;
begin
  if Selected=false then exit;

  edtURIActionPattern.Text := PURIActionData(lvURIAction.Selected.Data)^.Pattern;
  cboURIActionCondition.ItemIndex := PURIActionData(lvURIAction.Selected.Data)^.Condition;
  cboURIActionType.ItemIndex := PURIActionData(lvURIAction.Selected.Data)^.ActionType;

  case PURIActionData(lvURIAction.Selected.Data)^.ActionType of
    0: begin
      edtURIActionParam.Visible:=true;
      Panel22.Visible:=False;
      edtURIActionParam.Text := PURIActionData(lvURIAction.Selected.Data)^.Param;
    end;
    1: begin
      edtURIActionParam.Visible:=False;
      Panel22.Visible:=True;
      if PURIActionData(lvURIAction.Selected.Data)^.Param[1] = '0' then chkActJS.Checked:=False
      else chkActJS.Checked:=true;

      if PURIActionData(lvURIAction.Selected.Data)^.Param[2] = '0' then chkActImg.Checked:=False
      else chkActImg.Checked:=true;

      if PURIActionData(lvURIAction.Selected.Data)^.Param[3] = '0' then chkActPlugins.Checked:=False
      else chkActPlugins.Checked:=true;

      if PURIActionData(lvURIAction.Selected.Data)^.Param[4] = '0' then chkActFrames.Checked:=False
      else chkActFrames.Checked:=true;

      if PURIActionData(lvURIAction.Selected.Data)^.Param[5] = '0' then chkActMeta.Checked:=False
      else chkActMeta.Checked:=true;
    end;//1
  end;//case

end;

procedure TBagelSettingForm.cboURIActionTypeChange(Sender: TObject);
begin
  if cboURIActionType.ItemIndex=0 then begin
    edtURIActionParam.Visible:=true;
    Panel22.Visible:=false;
    OpenDialog1.Filter:='実行ファイル (*.exe)|*.exe|WSHスクリプト (*.vbs,*.js)|*.vbs;*.js';
    if OpenDialog1.Execute then edtURIActionParam.Text := '"'+OpenDialog1.FileName + '" %uri%';
  end
  else if cboURIActionType.ItemIndex=1 then begin
    edtURIActionParam.Visible:=false;
    Panel22.Visible:=true;
  end;
end;

procedure TBagelSettingForm.lvURIActionEditing(Sender: TObject;
  Item: TListItem; var AllowEdit: Boolean);
begin
  AllowEdit:=False;
end;

procedure TBagelSettingForm.lvAdblockEditing(Sender: TObject;
  Item: TListItem; var AllowEdit: Boolean);
begin
  AllowEdit:=False;
end;

procedure TBagelSettingForm.btnSelectCacheFolderClick(Sender: TObject);
var
  path:String;
begin
  path:=SelectFolderDialog(Self.Handle);
  if path<>'' then begin
    edtCacheDirParent.Text:=Path;
    edtCacheDirParent.Tag:=1;
  end;
end;

procedure TBagelSettingForm.lbHighlightStyleDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  try
    with TListBox(Control) do begin
      Canvas.Brush.Color := PInlineStyle(Items.Objects[Index])^.BGColor;
      Canvas.Font.Color := PInlineStyle(Items.Objects[Index])^.Color;
      Canvas.Font.Style := [];
      if PInlineStyle(Items.Objects[Index])^.Bold then Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      if PInlineStyle(Items.Objects[Index])^.Italic then Canvas.Font.Style := Canvas.Font.Style + [fsItalic];
      if PInlineStyle(Items.Objects[Index])^.Underline then Canvas.Font.Style := Canvas.Font.Style + [fsUnderline];
      //fsBold, fsItalic, fsUnderline
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left, Rect.Top, Items[Index]);
    end;
  except
  end;
end;

procedure TBagelSettingForm.chlAccFiletypeClickCheck(Sender: TObject);
begin
  chlAccFiletype.Tag:=1;
end;

procedure TBagelSettingForm.chlAccProtocolClickCheck(Sender: TObject);
begin
  chlAccProtocol.Tag:=1;
end;

procedure TBagelSettingForm.Button14Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=True;
  pasItemNoAction.Caption:='コンテキストメニュー';
  pt.X:=0;
  pt.Y:=Button14.Height;
  pt2:=Button14.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stTabRightClick;
end;

procedure TBagelSettingForm.Button15Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=Button15.Height;
  pt2:=Button15.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stTabDblClick;
end;

procedure TBagelSettingForm.Button16Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=Button16.Height;
  pt2:=Button16.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stTabMdlClick;
end;

procedure TBagelSettingForm.Button19Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=Button19.Height;
  pt2:=Button19.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stKeyAction;
end;

procedure TBagelSettingForm.Button17Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=Button17.Height;
  pt2:=Button17.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stMouseAction;
end;

procedure TBagelSettingForm.ActionSelectorClick(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=True;
  pasItemNoAction.Caption:='なし';
  pt.X:=0;
  pt.Y:=TButton(Sender).Height;
  pt2:=TButton(Sender).ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=TObject(TButton(Sender).Tag);
end;

procedure TBagelSettingForm.lbHighlightStyleClick(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then begin
    stHighlightFGColor.Color := PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Color;
    stHighlightBGColor.Color := PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.BGColor;
    chkHighlightBold.Checked:=PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Bold;
    chkHighlightItalic.Checked:=PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Italic;
    chkHighlightUnderline.Checked:=PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Underline;
  end;
end;
              {
procedure TBagelSettingForm.ColorBox1Change(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then
  PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Color:=ColorBox1.Selected;
  lbHighlightStyle.Refresh;
end;

procedure TBagelSettingForm.ColorBox2Change(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then
  PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.BGColor:=ColorBox2.Selected;
  lbHighlightStyle.Refresh;
end;           }

procedure TBagelSettingForm.chkHighlightBoldClick(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then
  PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Bold:=chkHighlightBold.Checked;
  lbHighlightStyle.Refresh;
end;

procedure TBagelSettingForm.chkHighlightItalicClick(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then
  PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Italic:=chkHighlightItalic.Checked;
  lbHighlightStyle.Refresh;
end;

procedure TBagelSettingForm.chkHighlightUnderlineClick(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex>-1 then
  PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Underline:=chkHighlightUnderline.Checked;
  lbHighlightStyle.Refresh;
end;

procedure TBagelSettingForm.stHighlightFGColorClick(Sender: TObject);
begin
  ColorDialog1.Color:=stHighlightFGColor.Color;
  if ColorDialog1.Execute then begin
    stHighlightFGColor.Color:=ColorDialog1.Color;
    if lbHighlightStyle.ItemIndex>-1 then
    PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Color:=stHighlightFGColor.Color;
    lbHighlightStyle.Refresh;
  end;
end;

procedure TBagelSettingForm.stHighlightBGColorClick(Sender: TObject);
begin
  ColorDialog1.Color:=stHighlightBGColor.Color;
  if ColorDialog1.Execute then begin
    stHighlightBGColor.Color:=ColorDialog1.Color;
    if lbHighlightStyle.ItemIndex>-1 then
    PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.BGColor:=stHighlightBGColor.Color;
    lbHighlightStyle.Refresh;
  end;
end;

procedure TBagelSettingForm.btnImgSavePAthSelectorClick(Sender: TObject);
var
  path:String;
begin
  path:=SelectFolderDialog(Self.Handle);
  if path<>'' then edtSDImgSavePath.Text:=Path;
end;

procedure TBagelSettingForm.Button30Click(Sender: TObject);
var
  Style:TInlineStyle;
begin
  Style.Color    := clBlack;
  Style.BGColor  := clYellow;
  Style.Bold     := true;
  Style.Italic   := false;
  Style.Underline:= false;
  lbHighlightStyle.AddItem('スタイル'+IntToStr(lbHighlightStyle.Count+1),TObject(NewInlineStyle(Style)));
end;

procedure TBagelSettingForm.Button31Click(Sender: TObject);
begin
  if lbHighlightStyle.ItemIndex<0 then Exit;
  Dispose(PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex]));
  lbHighlightStyle.Items.Delete(lbHighlightStyle.ItemIndex);
end;

procedure TBagelSettingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TBagelSettingForm.StaticText4Click(Sender: TObject);
begin               {
  ColorDialog1.Color:=stHighlightFGColor.Color;
  if ColorDialog1.Execute then begin
    stHighlightFGColor.Color:=ColorDialog1.Color;
    if lbHighlightStyle.ItemIndex>-1 then
    PInlineStyle(lbHighlightStyle.Items.Objects[lbHighlightStyle.ItemIndex])^.Color:=stHighlightFGColor.Color;
    lbHighlightStyle.Refresh;
  end;               }
end;

procedure TBagelSettingForm.btnStartupFileSelectorClick(Sender: TObject);
//var
//path:String;
begin
  //path:=SelectFolderDialog(Self.Handle);
  OpenDialog1.InitialDir:=SysUtils.ExtractFileDir(edtStartupGroupFilename.Text);
  if OpenDialog1.Execute then edtStartupGroupFilename.Text:=OpenDialog1.FileName;
end;

procedure TBagelSettingForm.btnAddStupScrClick(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=TButton(Sender).Height;
  pt2:=TButton(Sender).ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=TObject(TButton(Sender).Tag);
end;

procedure TBagelSettingForm.btnAddStdwnScrClick(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=TButton(Sender).Height;
  pt2:=TButton(Sender).ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=TObject(TButton(Sender).Tag);
end;

procedure TBagelSettingForm.btnDelStdwnScrClick(Sender: TObject);
begin
  lstShutdownScript.DeleteSelected;
end;

procedure TBagelSettingForm.btnDelStupScrClick(Sender: TObject);
begin
  lstStartupScript.DeleteSelected;
end;

procedure TBagelSettingForm.btnAddSHIClick(Sender: TObject);
begin
  if lstSidebarHeaderHiddenItem.ItemIndex<>-1 then begin
    lstSidebarHeaderVisibleItem.AddItem(
      lstSidebarHeaderHiddenItem.Items.Strings[
        lstSidebarHeaderHiddenItem.ItemIndex
      ]
    , lstSidebarHeaderHiddenItem.Items.Objects[
        lstSidebarHeaderHiddenItem.ItemIndex
      ]
    );

    lstSidebarHeaderHiddenItem.DeleteSelected;
  end;
end;

procedure TBagelSettingForm.btnDelSHIClick(Sender: TObject);
begin
  if lstSidebarHeaderVisibleItem.ItemIndex<>-1 then begin
    lstSidebarHeaderHiddenItem.AddItem(
      lstSidebarHeaderVisibleItem.Items.Strings[
        lstSidebarHeaderVisibleItem.ItemIndex
      ]
    , lstSidebarHeaderVisibleItem.Items.Objects[
        lstSidebarHeaderVisibleItem.ItemIndex
      ]
    );

    lstSidebarHeaderVisibleItem.DeleteSelected;
  end;
end;

procedure TBagelSettingForm.Button10Click(Sender: TObject);
var
  newindex:Integer;
begin
  if lstSidebarHeaderVisibleItem.ItemIndex<>-1 then begin
    if (lstSidebarHeaderVisibleItem.ItemIndex<>0)  then begin
      newIndex:=lstSidebarHeaderVisibleItem.ItemIndex-1;
      lstSidebarHeaderVisibleItem.Items.Move(lstSidebarHeaderVisibleItem.ItemIndex,newIndex);
      lstSidebarHeaderVisibleItem.ItemIndex:=newIndex;
    end;
  end;
end;

procedure TBagelSettingForm.Button9Click(Sender: TObject);
var
  newindex:Integer;
begin
  if lstSidebarHeaderVisibleItem.ItemIndex<>-1 then begin
    if (lstSidebarHeaderVisibleItem.ItemIndex<>lstSidebarHeaderVisibleItem.Count-1) then begin
      newIndex:=lstSidebarHeaderVisibleItem.ItemIndex+1;
      lstSidebarHeaderVisibleItem.Items.Move(lstSidebarHeaderVisibleItem.ItemIndex,newIndex);
      lstSidebarHeaderVisibleItem.ItemIndex:=newIndex;
    end;
  end;
end;

procedure TBagelSettingForm.btnDelSearchItemClick(Sender: TObject);

//var
//name:String;
//i,j:Integer;
begin
  if ListView2.Selected<>nil then begin
    ListView2.DeleteSelected;
    {name := listView2.Selected.Caption;
    SearchIni.EraseSection(name);
    //SearchIni.DeleteKey('Search-List',);
    i:=ListView2.Selected.Index;
    for j:=i+1 to ListView2.Items.Count-1 do begin
      SearchIni.WriteString('Search-List',GetStr(j),SearchIni.ReadString('Search-List',GetStr(j+1),''));
    end;
    SearchIni.DeleteKey('Search-List',GetStr(ListView2.Items.Count));
    SearchIni.WriteInteger('Search-List','ListCount',ListView2.Items.Count-1);
    }
  end;
end;

procedure TBagelSettingForm.btnAddSearchEngineClick(Sender: TObject);
var
  f:TfrmSearchEdit;
  item:TSearchListItem;
begin
  f:=TfrmSearchEdit.Create(Self);
  f.PageControl1.ActivePage:=f.EngineSheet;
  f.edtCaptionE.Text:='新しい検索エンジン';
  f.ShowModal;
  if f.ModalResult=mrOK then begin
    item:=TSearchListItem.Create(ListView2.Items);
    ListView2.Items.AddItem(item);
    item.Caption:=f.edtCaptionE.Text;
    item.SubItems.Add(f.edtPrefixE.Text);
    item.SubItems.Add(f.edtSuffixE.Text);
    item.SubItems.Add(IntToStr(f.cboEncodeE.ItemIndex));
    item.SubItems.Add(f.edtShortcutE.Text);
    item.Encode:=f.cboEncodeE.Text;
    item.ItemType:=0;
  end;
  f.Free;
end;

procedure TBagelSettingForm.btnAddSearchGroupClick(Sender: TObject);
var
  f:TfrmSearchEdit;
  item:TSearchListItem;
begin
  f:=TfrmSearchEdit.Create(Self);
  f.PageControl1.ActivePage:=f.GroupSheet;
  f.edtCaptionG.Text:='新しい検索グループ';
  BuildSearchGroup(f);
  f.ShowModal;
  if f.ModalResult=mrOK then begin
    item:=TSearchListItem.Create(ListView2.Items);
    ListView2.Items.AddItem(item);
    item.Caption:=f.edtCaptionG.Text;
    item.SubItems.Add('');
    item.SubItems.Add('');
    item.SubItems.Add('');
    item.SubItems.Add(f.edtShortcutG.Text);
    item.Groups.Assign(f.lstEngine.Items);
    item.ItemType:=1;
  end;
  f.Free;
end;

procedure TBagelSettingForm.ListView2DblClick(Sender: TObject);
var
  f:TfrmSearchEdit;
  item:TSearchListItem;
begin
  if ListView2.Selected=nil then Exit;
  item:=TSearchlistitem(ListView2.Selected);
  f:=TfrmSearchEdit.Create(Self);
  if item.ItemType=0 then//エンジン
  begin
    f.PageControl1.ActivePage:=f.EngineSheet;
    f.edtCaptionE.Text := item.Caption;
    f.edtPrefixE.Text := item.SubItems.Strings[0];
    f.edtSuffixE.Text := item.SubItems.Strings[1];
    f.cboEncodeE.Text := item.Encode;
    f.edtShortcutE.Text := item.SubItems.Strings[3];

    f.ShowModal;
    if f.ModalResult=mrOK then begin
      item.Caption:=f.edtCaptionE.Text;
      item.SubItems.Strings[0] := f.edtPrefixE.Text;
      item.SubItems.Strings[1] := f.edtSuffixE.Text;
      item.Encode := f.cboEncodeE.Text;
      item.SubItems.Strings[3] := f.edtShortcutE.Text;
    end;
  end
  else if item.ItemType=1 then begin//グループ
    f.PageControl1.ActivePage:=f.GroupSheet;
    f.edtCaptionG.Text := item.Caption;
    f.edtShortcutG.Text := item.SubItems.Strings[3];
    f.lstEngine.Items.Assign(item.Groups);
    BuildSearchGroup(f);
    
    f.ShowModal;

    if f.ModalResult=mrOK then begin
      item.Caption := f.edtCaptionG.Text;
      item.SubItems.Strings[3] := f.edtShortcutG.Text;
      item.Groups.Clear;
      item.Groups.Assign(f.lstEngine.Items);
    end;
    
  end;
  f.Free;
end;

procedure TBagelSettingForm.BuildSearchGroup(f:TFrmsearchEdit);
var
  i:Integer;
begin
  for i:=0 to ListView2.Items.Count-1 do begin
    f.AddEngineMenu(ListView2.Items.Item[i].Caption);
  end;
end;



procedure TBagelSettingForm.ListView2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  sourceItem,destItem,newItem:TSearchListItem;
  i:Integer;
begin
  if (Source = ListView2) then begin
    sourceitem:=TSearchListItem(ListView2.Selected);
    destItem:=TSearchListItem(ListView2.GetItemAt(x,y));
    newItem:=TSearchListItem.Create(listView2.Items);
    ListView2.Items.AddItem(newItem,destItem.Index);
    newItem.Caption:=sourceItem.Caption;
    for i:=0 to 3 do
      newItem.SubItems.Add(sourceItem.SubItems.Strings[i]);
    newItem.Groups.Assign(sourceItem.Groups);
    newItem.Encode:=sourceItem.Encode;
    newItem.ItemType:=sourceItem.ItemType;
    sourceitem.Free;
    {ListView2.Items.Delete(sourceItem.Index);
    if sourceItem=nil then ShowMessage('');
    ListView2.Items.AddItem(sourceitem,destItem.Index);
    ListView2.Items.Item.Cut}
  end;
end;

procedure TBagelSettingForm.ListView2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = ListView2) then begin
    Accept:=true;
  end;
end;

procedure TBagelSettingForm.Button5Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pasItemNoAction.Visible:=False;
  pt.X:=0;
  pt.Y:=Button5.Height;
  pt2:=Button5.ClientToScreen(pt);
  PopupActionSelector.Popup(pt2.X,pt2.Y);
  pasTarget:=stOperaKeyAction;
end;

procedure TBagelSettingForm.Button7Click(Sender: TObject);
begin
  lvOperakeyList.DeleteSelected;
  lvOperakeyList.Tag:=1;
  edtOperakeyKey.Text:='';
end;

procedure TBagelSettingForm.Button6Click(Sender: TObject);
var
  item:TListItem;
  new:TListItem;
begin
  item:=lvOperakeyList.FindCaption(0,edtOperakeyKey.Text,false,false,false);
  lvOperakeyList.Tag:=1;
  if item<>nil then
  begin
    item.Caption:=edtOperakeyKey.Lines.Text;
    item.SubItems.Strings[0]:=TAction(stOperaKeyAction.Tag).Caption;
    item.Data:=TAction(stOperaKeyAction.Tag);
  end
  else
  begin
    new:=lvOperakeyList.Items.Add;
    new.Caption:=edtOperakeyKey.Lines.Text;
    new.SubItems.Add(TAction(stOperaKeyAction.Tag).Caption);
    new.Data:=TAction(stOperaKeyAction.Tag);
  end;
  edtOperakeyKey.Lines.Text:='';
end;

procedure TBagelSettingForm.edtOperakeyKeyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  shortcut:String;
begin
  shortcut:=ShortcutToText(TShortcut(Key));
  if shortcut='Shift' then exit;
  if (ssAlt in Shift) or (ssCtrl in Shift) then Exit;

  if ssShift in Shift then
  TMemo(Sender).Lines.Text:=shortcut
  else
  TMemo(Sender).Lines.Text:=LowerCase(shortcut);
end;

procedure TBagelSettingForm.lvOperaKeyListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected=false then exit;

  edtOperakeyKey.Lines.Text:=lvOperaKeyList.Selected.Caption;
  stOperaKeyAction.Tag := Integer(Item.Data);
  stOperaKeyAction.Caption := TAction(Item.Data).Caption;
end;

initialization
//  PatchINT3;
end.

























