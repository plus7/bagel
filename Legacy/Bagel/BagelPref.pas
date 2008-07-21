unit BagelPref;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, nsXPCOM, nsXPCOMGlue, IniFiles,NkMemIniFile, UTabList, Version, nsGeckoStrings,
  nsInit, ShlObj{SHGetSpecialFolderPath};


  function GetSettingDir:String;
  function GetDefaultsDir:String;

type
  TBagelPref = class(TObject)
  private
//    SettingPath:String;

    { Private 宣言 }
    //GENERAL
//    FAllowMultiRun:Boolean;
//    FBackupBookmarks:Integer;
    FConsiderTarget:Boolean;
    FAutoSaveTablist:Boolean;

    //FONT
    FOverrideToolbarFont:Boolean;
    FToolbarFont:String;
    FOverrideMenubarFont:Boolean;
    FMenubarFont:String;
    FOverrideSidebarFont:Boolean;
    FSidebarFont:String;

    //TAB
//    FRestrictTabNum:Integer;
    FTabMultiLine:Boolean;
    FViewIsRead:Boolean;
    FTabStyle:Integer;

    //FULLSCREEN
    FKioskTabBarVisible:Boolean;
    FKioskSearchBarVisible:Boolean;
    FKioskLinkBarVisible:Boolean;
    FKioskAddressBarVisible:Boolean;
    FKioskMainBarVisible:Boolean;
    FKioskMenuBarVisible:Boolean;
    FKioskStatusBarVisible:Boolean;

    //WINDOW
//    FTabBarVisible:Boolean;
    FTabBarCaption:String;
//    FTabBarLeft:Integer;
//    FTabBarTop:Integer;

//    FSearchBarVisible:Boolean;
    FSearchBarCaption:String;
//    FSearchBarLeft:Integer;
///    FSearchBarTop:Integer;

//    FLinkBarVisible:Boolean;
    FLinkBarCaption:String;
//    FLinkBarLeft:Integer;
//    FLinkBarTop:Integer;

//    FAddressBarVisible:Boolean;
    FAddressBarCaption:String;
//    FAddressBarLeft:Integer;
//    FAddressBarTop:Integer;

//    FMainBarVisible:Boolean;
    FMainBarCaption:String;
///    FMainBarLeft:Integer;
//    FMainBarTop:Integer;

    FWndTop:Integer;
    FWndLeft:Integer;
    FWndWidth:Integer;
    FWndHeight:Integer;
    FWndState:Integer;

    FFixToolbar:Boolean;

    FStatusbarVisible:Boolean;
    FSearchBoxWidth:Integer;
    FShowAppNameInTitle:Boolean;
    //Sidebar
    FSidebar              : Integer;
    FSidebarVisible       : Boolean;
    FSidebarWidth         : Integer;
    FSidebarAutoHide      : Boolean;
    FSidebarAutoOpenDelay : Integer;
    FSidebarAutoHideDelay : Integer;
    FUserDefinedFolder    : String;
    FSidebarOverlap       : Boolean;
    FShowSidebarTabs      : Boolean;
    FSidebarHeaderList    : TStringList;
    //F11

    //NETWORK
    FProxies            : TStringList;
    FUserAgents         : TStringList;
    FRandomProxy        : Boolean;
    FRandomProxyIntvMin : Integer;
    FRandomProxyIntvSec : Integer;
    //GESTURE
    FGestList:TStringList;
    //DENYTITLE
    FDenyTitleList:TStringList;
    FEnableDenyTitle:Boolean;
    //DENYURL
    FDenyURLList:TStringList;
    FEnableDenyURL:Boolean;
    //RECENT
    FRecentClosedURL:TTablist;
    FRecentOpenedURL:TStringList;
    FRecentClosedMaxCount:Integer;
    FRecentOpenedMaxCount:Integer;
    FRecentClosedURLStyle:Integer;
    //Installed extensions
    FInstalledExtensions:TStringList;
    
    //AutoComplete
    FSearchHistory:TStringList;
    FAddrHistory:TStringList;

    //SHORTCUT
    FKbdList:TStringList;
    FOperaKeyList:TStringList;
    FEngines:TStringList;
    FHomepage:String;
    FObsClipboard:Boolean;
    FObsNotLoaded:Boolean;

    //Statusbar
    FStatusbarWidgets:TStringList;

    //IncSearch
{    FIncSearchMode:Integer;  //0:None 1:FAYT 2:Migemo

    FIncSearchAutoStart:Boolean;
    FIncSearchLinksOnly:Boolean;
    FIncSearchEnableTimeout:Boolean;
    FIncSearchTimeout:Integer;}
    //MIGEMO
    FMigemoEnabled:Boolean;
    FMigemoDLLPath:String;
    FMigemoDicFolder:String;
    FMigemoStartFromViewport:Boolean;
    FMigemoLazyHilight:Boolean;
    FMigemoOpenGrepSidebar:Boolean;

    //OperaKey
    FOperaKeyEnabled:Boolean;

    //Grep
//    FGrepLastSelectedMode:Integer;
//    FGrepLastSearchWord:String;


    //DropTarget
    FDropTargetList:TStringList;

    //Adblock
    FAdDenyList:TStringList;
    FAdWhiteList:TStringList;
    FEnableAdBlock:Boolean;

    //URIAction
    FURIActionList:TStringList;
    FEnableURIAction:Boolean;

    //Menu
    FShowAddBookmarkHere:Boolean;
    FShowOpenAllBookmarks:Boolean;
    FBookmarkMenuMaxLength:Integer;
    FShowMenuIcon:Boolean;

    //CROSSFIRE

    //DocShell
    FDefaultAllowPlugins:Boolean;
    FDefaultAllowJS:Boolean;
    FDefaultAllowFrames:Boolean;
    FDefaultAllowMeta:Boolean;
    FDefaultAllowImg:Boolean;
    //Inherit
    FInheritDocShell:Boolean;
    FInheritAutoHighlight:Boolean;

    //TABS


    {
      1桁目
      0:newtab
      1:normal

      2桁目
      0:normal
      1:background

      3桁目
      0:right
      1:left

      4桁目
      0:edge
      1:next
    }
    FOpenModePopup:Integer;
    FOpenModeBookmarks:Integer;
    FOpenModeHistory:Integer;
    FOpenModeLocation:Integer;
    FOpenModeSearch:Integer;
    FOpenModeViewsource:Integer;
    FOpenModeMiddleClick:Integer;
    FOpenModeClipboard:Integer;

    {
      0:right
      1:left
    }

    FWhenCloseTabChoose:Integer;

    FTabWidth:Integer;

    FEnableWheelTabChange:Boolean;

    //Startup
    //FRestoreTabs:Boolean;
    FStartupTabBehavior:Integer;
    FStartupRestoreSH:Boolean;
    FStartupGroup:String;
    FStartupScript:String;
    FBUBookmarkOnStart:Boolean;
    FBUPrefOnStart:Boolean;
    FBUGeckoPrefOnStart:Boolean;
    FBUGeneration:Integer;

    //Term
    FDelRecentClosed: Boolean;
    FDelRecentOpened: Boolean;
    FDelAddrHistory: Boolean;
    FDelSearchHistory: Boolean;
    FDelCookie: Boolean;
    FDelHistory:Boolean;
    FDelCache:Boolean;

    FOnAppQuit             : Boolean;
    FOnCloseAll            : Boolean;
    FOnCloseOther          : Boolean;
    FOnDeleteBookmark      : Boolean;
    FOnOpeningManyItems    : Boolean;
    FWarnItemCount         : integer;
    FShutdownScript        : String;
    
    FTabMaxCount    : Integer;
    FTabMaxStrCount : Integer;

    FTabMiddleClickAct : String;
    FTabDblClickAct    : String;
    FTabRightClickAct    : String;

    FNewTabMode:Integer;
    FAddTabCurrCopyHistory:Boolean;

    FAutoReloadCustomIntv:Integer;

    //Download
    FUseDLDir:Boolean;
    FDownloadDir:String;

    //PageSearch
    FScrollToCenterOnFind:Boolean;

    //WebSearch
    FSearchOnKeywordChange:Boolean;
    FSearchOnEngineChange:Boolean;
    FSearchOnDrop:Boolean;
    FShowAtCenterFound:Boolean;
    FRememberEngine:Boolean;
    FRememberedEngineIndex:Integer;
    FReplaceZenkakuSpace:Boolean;
    FSearchBarSaveCount:Integer;
    FSearchbarDropdownCount:Integer;
    FShowSearchButtons:Boolean;

//    FReplaceWideSpaceOnSearch:Boolean;
    FAutoHighlightAfterSearch:Boolean;
    FAutoTabLockAfterSearch:Boolean;

    //Cookie
    FCookieP3PCustom:String;

    //HighLight
    FHighLightPref:TStringList;

    //RightClickGesture
    FRWheelClick:String;
    FRLeftClick:String;
    FRWheelUp:String;
    FRWheelDown:String;
    FRSide1Click:String;
    FRSide2Click:String;
    FSide1Click:String;
    FSide2Click:String;

    //SuperDrag
    FSDragImgAction:integer;
    FSDragImgIsBG:Boolean;
    FSDragImgSaveType:Integer;
    FSDragImgSavePath:String;

    FSDragLinkAction:integer;
    FSDragLinkgIsBG:Boolean;
    FSDragLinkSaveType:Integer;
    FSDragLinkSavePath:String;

    FSDragSelectionAction:integer;
    FSDragSelectionIsBG:Boolean;
    FSDragSelectionDet:integer;
    FSDragSelectionDetRE:String;

    //Addressbar
    FShowGoButtonCaption:Boolean;
    FShowGoButton:Boolean;
    FUseAddrAutoComplete:Boolean;

    //UserStyleSheet
    FEnabledSheets:String;
  public
    { Public 宣言 }
    IniFile2:TMemIniFile;
    WebPanelIni:TMemIniFile;
    procedure Init;
    procedure Save;
    destructor Destroy; override;
    function GetDocShellDefault:Integer;

    function GetHighLightStyle(Index:Integer):String;
    function GetAdDenyList:TStringList;
    function GetDropTargetList:TStringList;
    function GetURIActionList:TStringList;
    function GetStatusbarWidgets:TStringList;
    function GetProxies:TStringList;
    function GetUserAgents:TStringList;
    function GetGestList:TStringList;
    function GetKbdList:TStringList;
    function GetOperaKeyList:TStringList;
    function GetDenyTitleList:TStringList;
    function GetDenyURLList:TStringList;
    function GetRecentClosedURL:TTabList;
    function GetRecentOpenedURL:TStringList;
    function GetInstalledExtensions:TStringList;
//    function GetEngines:TStringList;
    function GetSearchHistory:TStringList;
    function GetAddrHistory:TStringList;

//    function GetHighLightPref:TStringList;
  published
    //general
    property ConsiderTarget:Boolean read FConsiderTarget write FConsiderTarget;
    property EnableDenyTitle:Boolean read FEnableDenyTitle write FEnableDenyTitle;
    property EnableDenyURL:Boolean read FEnableDenyURL write FEnableDenyURL;
    property AutoSaveTablist:Boolean read FAutoSaveTablist write FAutoSaveTablist;
    //Font
    property OverrideToolbarFont:Boolean read FOverrideToolbarFont write FOverrideToolbarFont;
    property ToolbarFont:String read FToolbarFont write FToolbarFont;
    property OverrideMenubarFont:Boolean read FOverrideMenubarFont write FOverrideMenubarFont;
    property MenubarFont:String read FMenubarFont write FMenubarFont;
    property OverrideSidebarFont:Boolean read FOverrideSidebarFont write FOverrideSidebarFont;
    property SidebarFont:String read FSidebarFont write FSidebarFont;

    //kiosk
    property KioskTabBarVisible:Boolean read FKioskTabBarVisible write FKioskTabBarVisible;
    property KioskSearchBarVisible:Boolean read FKioskSearchBarVisible write FKioskSearchBarVisible;
    property KioskLinkBarVisible:Boolean read FKioskLinkBarVisible write FKioskLinkBarVisible;
    property KioskAddressBarVisible:Boolean read FKioskAddressBarVisible write FKioskAddressBarVisible;
    property KioskMainBarVisible:Boolean read FKioskMainBarVisible write FKioskMainBarVisible ;
    property KioskMenuBarVisible:Boolean read FKioskMenuBarVisible write FKioskMenuBarVisible;
    property KioskStatusBarVisible:Boolean read FKioskStatusBarVisible write FKioskStatusBarVisible;
   // procedure GetEngineURL;
    {FTabBarVisible:Boolean;
    FTabBarCaptionVisible:Boolean;
    FTabBarLeft:Integer;
    FTabBarTop:Integer;

    FSearchBarVisible:Boolean;
    FSearchBarCaptionVisible:Boolean;
    FSearchBarLeft:Integer;
    FSearchBarTop:Integer;

    FLinkBarVisible:Boolean;
    FLinkBarCaptionVisible:Boolean;
    FLinkBarLeft:Integer;
    FLinkBarTop:Integer;

    FAddressBarVisible:Boolean;
    FAddressBarCaptionVisible:Boolean;
    FAddressBarLeft:Integer;
    FAddressBarTop:Integer;

    FMainBarVisible:Boolean;
    FMainBarCaptionVisible:Boolean;
    FMainBarLeft:Integer;
    FMainBarTop:Integer;
    }
    property TabBarCaption : String  read FTabBarCaption write FTabBarCaption;
    property SearchBarCaption : String  read FSearchBarCaption write FSearchBarCaption;
    property LinkBarCaption : String  read FLinkBarCaption write FLinkBarCaption;
    property AddressBarCaption : String  read FAddressBarCaption write FAddressBarCaption;
    property MainBarCaption : String   read FMainBarCaption write FMainBarCaption;
    property FixToolbar : Boolean read FFixToolbar write FFixToolbar;

    property TabMiddleClickAct:String  read FTabMiddleClickAct write FTabMiddleClickAct;
    property TabDblClickAct:String  read FTabDblClickAct write FTabDblClickAct;
    property TabRightClickAct:String  read FTabRightClickAct write FTabRightClickAct;

    property TabMaxCount:Integer  read FTabMaxCount write FTabMaxCount;
    property TabMaxStrCount:Integer  read FTabMaxStrCount write FTabMaxStrCount;
    property TabMultiLine:Boolean  read FTabMultiLine write FTabMultiLine;
    property ViewIsRead:Boolean  read FViewIsRead write FViewIsRead;
    property TabStyle:Integer  read FTabStyle write FTabStyle;
    property NewTabMode:Integer  read FNewTabMode write FNewTabMode;
    property AddTabCurrCopyHistory:Boolean read FAddTabCurrCopyHistory write FAddTabCurrCopyHistory;
    property AutoReloadCustomIntv:Integer read FAutoReloadCustomIntv write FAutoReloadCustomIntv;

    property OpenModePopup      :Integer read FOpenModePopup       write FOpenModePopup;
    property OpenModeBookmarks  :Integer read FOpenModeBookmarks   write FOpenModeBookmarks;
    property OpenModeHistory    :Integer read FOpenModeHistory     write FOpenModeHistory;
    property OpenModeLocation   :Integer read FOpenModeLocation    write FOpenModeLocation;
    property OpenModeSearch     :Integer read FOpenModeSearch      write FOpenModeSearch;
    property OpenModeViewsource :Integer read FOpenModeViewsource  write FOpenModeViewsource;
    property OpenModeMiddleClick:Integer read FOpenModeMiddleClick write FOpenModeMiddleClick;
    property OpenModeClipboard  :Integer read FOpenModeClipboard   write FOpenModeClipboard;
    //property NewTabPos          :Integer read FNewTabPos           write FNewTabPos;
    property WhenCloseTabChoose :Integer read FWhenCloseTabChoose  write FWhenCloseTabChoose;
    property TabWidth:Integer read FTabWidth write FTabWidth;
    property EnableWheelTabChange:Boolean read FEnableWheelTabChange write FEnableWheelTabChange;

    property WndTop: integer read FWndTop write FWndTop;
    property WndLeft: integer read FWndLeft write FWndLeft;
    property WndWidth: integer read FWndWidth write FWndWidth;
    property WndHeight: integer read FWndHeight write FWndHeight;
    property WndState: integer read FWndState write FWndState;

    property Sidebar: integer read FSidebar write FSidebar;
    property SidebarVisible: Boolean read FSidebarVisible write FSidebarVisible;
    property SidebarWidth: Integer read FSidebarWidth write FSidebarWidth;
    property SidebarAutoOpenDelay: Integer read FSidebarAutoOpenDelay write FSidebarAutoOpenDelay;
    property SidebarAutoHideDelay: Integer read FSidebarAutoHideDelay write FSidebarAutoHideDelay;

    property SidebarAutoHide: Boolean read FSidebarAutoHide write FSidebarAutoHide;
    property ShowAppNameInTitle:Boolean read FShowAppNameInTitle write FShowAppNameInTitle;
    property SidebarOverlap: Boolean read FSidebarOverlap write FSidebarOverlap;
    property ShowSidebarTabs: Boolean read FShowSidebarTabs write FShowSidebarTabs;
    property SidebarHeaderList : TStringList read FSidebarHeaderList write FSidebarHeaderList; 

    property UserDefinedFolder:String read FUserDefinedFolder write FUserDefinedFolder;

    //Adblock
    property AdDenyList:TStringList read GetAdDenyList;
    property AdWhiteList:TStringList read FAdWhiteList;
    property EnableAdBlock:Boolean read FEnableAdBlock write FEnableAdBlock;

    //URIAction
    property URIActionList:TStringList read GetURIActionList;
    property EnableURIAction:Boolean read FEnableURIAction write FEnableURIAction;
    
    //Menu
    property ShowAddBookmarkHere:Boolean read FShowAddBookmarkHere write FShowAddBookmarkHere;
    property ShowOpenAllBookmarks:Boolean read FShowOpenAllBookmarks write FShowOpenAllBookmarks;
    property BookmarkMenuMaxLength:Integer read FBookmarkMenuMaxLength write FBookmarkMenuMaxLength;
    property ShowMenuIcon:Boolean read FShowMenuIcon write FShowMenuIcon;
    
    //DocShell
    property DocShellDefault:Integer read GetDocShellDefault;
    property DefaultAllowPlugins:Boolean read FDefaultAllowPlugins write FDefaultAllowPlugins;
    property DefaultAllowJS:Boolean read FDefaultAllowJS write FDefaultAllowJS;
    property DefaultAllowFrames:Boolean read FDefaultAllowFrames write FDefaultAllowFrames;
    property DefaultAllowMeta:Boolean read FDefaultAllowMeta write FDefaultAllowMeta;
    property DefaultAllowImg:Boolean read FDefaultAllowImg write FDefaultAllowImg;
    property InheritDocShell:Boolean read FInheritDocShell write FInheritDocShell;
    property InheritAutoHighlight:Boolean read FInheritAutoHighlight write FInheritAutoHighlight;

    property StatusbarWidgets:TStringlist read GetStatusbarWidgets;
    property StatusbarVisible: Boolean read FStatusbarVisible write FStatusbarVisible;
    property Proxies: TStringList read GetProxies;
    property RandomProxy:Boolean read FRandomProxy write FRandomProxy;
    property RandomProxyIntvMin:Integer read FRandomProxyIntvMin write FRandomProxyIntvMin;
    property RandomProxyIntvSec:Integer read FRandomProxyIntvSec write FRandomProxyIntvSec;
    property UserAgents: TStringList read GetUserAgents;
    property GestList: TStringList read GetGestList;
    property KbdList: TStringList read GetKbdList;
    property OperaKeyList: TStringList read GetOperaKeyList;
    property DenyTitleList: TStringList read GetDenyTitleList;
    property DenyURLList: TStringList read GetDenyURLList;
    property RecentClosedURL: TTablist read GetRecentClosedURL;
    property RecentClosedMaxCount:Integer read FRecentClosedMaxCount write FRecentClosedMaxCount;
    property RecentOpenedURL: TStringList read GetRecentOpenedURL;
    property RecentOpenedMaxCount:Integer read FRecentOpenedMaxCount write FRecentOpenedMaxCount;
    property RecentClosedURLStyle:Integer read FRecentClosedURLStyle write FRecentClosedURLStyle;
    property InstalledExtensions:TStringList read GetInstalledExtensions;
    property Engines: TStringList read FEngines write FEngines;
    property SearchHistory: TStringList read GetSearchHistory;
    property AddrHistory: TStringList read GetAddrHistory;

    property SearchBoxWidth: Integer read FSearchBoxWidth write FSearchBoxWidth;

    property Homepage: String read FHomepage write FHomepage;
    property ObsClipboard: Boolean read FObsClipboard write FObsClipboard;
    property ObsNotLoaded: Boolean read FObsNotLoaded write FObsNotLoaded;
    //StartUp
//    property RestoreTabs: Boolean read FRestoreTabs write FRestoreTabs;
    property StartupTabBehavior:Integer read FStartupTabBehavior write FStartupTabBehavior;
    property StartupRestoreSH:Boolean read FStartupRestoreSH write FStartupRestoreSH;
    property StartupGroup:String read FStartupGroup write FStartupGroup;
    property StartupScript:String read FStartupScript write FStartupScript;
    property BUGeneration:Integer read FBUGeneration write FBUGeneration;
    property BUBookmarkOnStart:Boolean read FBUBookmarkOnStart write FBUBookmarkOnStart;
    property BUPrefOnStart:Boolean read FBUPrefOnStart write FBUPrefOnStart;
    property BUGeckoPrefOnStart:Boolean read FBUGeckoPrefOnStart write FBUGeckoPrefOnStart;

    //さくーじょ
    property DelRecentClosed: Boolean read FDelRecentClosed write FDelRecentClosed;
    property DelRecentOpened: Boolean read FDelRecentOpened write FDelRecentOpened;
    property DelAddrHistory: Boolean read FDelAddrHistory write FDelAddrHistory;
    property DelSearchHistory: Boolean read FDelSearchHistory write FDelSearchHistory;
    property DelCookie: Boolean read FDelCookie write FDelCookie;
    property DelHistory: Boolean read FDelHistory write FDelHistory;
    property DelCache: Boolean read FDelCache write FDelCache;
    //確認
    property OnAppQuit: Boolean read FOnAppQuit write FOnAppQuit;
    property OnCloseAll: Boolean read FOnCloseAll write FOnCloseAll;
    property OnCloseOther: Boolean read FOnCloseOther write FOnCloseOther;
    property OnDeleteBookmark:Boolean read FOnDeleteBookmark write FOnDeleteBookmark;
    property OnOpeningManyItems :Boolean read FOnOpeningManyItems write FOnOpeningManyItems;
    property WarnItemCount : Integer read FWarnItemCount write FWarnItemCount;
    property ShutdownScript :String read FShutdownScript write FShutdownScript;

    //Download
    property UseDLDir:Boolean read FUseDLDir write FUseDLDir;
    property DownloadDir:String read FDownloadDir write FDownloadDir;

    //Search
    property ScrollToCenterOnFind:Boolean read FScrollToCenterOnFind write FScrollToCenterOnFind;

    //WebSearch
    property SearchOnKeywordChange:Boolean read FSearchOnKeywordChange write FSearchOnKeywordChange;
    property SearchOnEngineChange:Boolean read FSearchOnEngineChange write FSearchOnEngineChange;
    property SearchOnDrop:Boolean read FSearchOnDrop write FSearchOnDrop;
    property ShowAtCenterFound:Boolean read FShowAtCenterFound write FShowAtCenterFound;
    property RememberEngine:Boolean read FRememberEngine write FRememberEngine;
    property RememberedEngineIndex:integer read FRememberedEngineIndex write FRememberedEngineIndex;
    property ReplaceZenkakuSpace:Boolean read FReplaceZenkakuSpace write FReplaceZenkakuSpace;
    property SearchBarSaveCount:Integer read FSearchBarSaveCount write FSearchBarSaveCount;
    property SearchBarDropdownCount:Integer read FSearchBarDropdownCount write FSearchBarDropdownCount;
    property AutoHighlightAfterSearch:Boolean read FAutoHighlightAfterSearch write FAutoHighlightAfterSearch;
    property AutoTabLockAfterSearch:Boolean read FAutoTabLockAfterSearch write FAutoTabLockAfterSearch;
    property ShowSearchButtons:Boolean read FShowSearchButtons write FShowSearchButtons;

    //Cookie
    property CookieP3PCustom:String read FCookieP3PCustom write FCookieP3PCustom;
    //HighLight
    property HighLightPref:TStringList read FHighLightPref;

    //RightClickGesture
    property RWheelClick:String  read FRWheelClick write FRWheelClick;
    property RLeftClick:String  read FRLeftClick write FRLeftClick;
    property RWheelUp:String  read FRWheelUp write FRWheelUp;
    property RWheelDown:String  read FRWheelDown write FRWheelDown;
    property RSide1Click:String  read FRSide1Click write FRSide1Click;
    property RSide2Click:String  read FRSide2Click write FRSide2Click;
    property Side1Click:String  read FSide1Click write FSide1Click;
    property Side2Click:String  read FSide2Click write FSide2Click;

   //SuperDrag
    property DropTargetList:TStringList read GetDropTargetList;

    property SDragImgAction:Integer  read FSDragImgAction write FSDragImgAction;
    property SDragImgIsBG:Boolean  read FSDragImgIsBG write FSDragImgIsBG;
    property SDragImgSaveType:Integer  read FSDragImgSaveType write FSDragImgSaveType;
    property SDragImgSavePath:String  read FSDragImgSavePath write FSDragImgSavePath;

    property SDragLinkAction:Integer  read FSDragLinkAction write FSDragLinkAction;
    property SDragLinkgIsBG:Boolean  read FSDragLinkgIsBG write FSDragLinkgIsBG;
    property SDragLinkSaveType:Integer  read FSDragLinkSaveType write FSDragLinkSaveType;
    property SDragLinkSavePath:String  read FSDragLinkSavePath write FSDragLinkSavePath;

    property SDragSelectionAction:Integer  read FSDragSelectionAction write FSDragSelectionAction;
    property SDragSelectionIsBG:Boolean  read FSDragSelectionIsBG write FSDragSelectionIsBG;
    property SDragSelectionDet:integer  read FSDragSelectionDet write FSDragSelectionDet;
    property SDragSelectionDetRE:String  read FSDragSelectionDetRE write FSDragSelectionDetRE;

    //AddressBar
    property ShowGoButton:Boolean read FShowGoButton write FShowGoButton;
    property ShowGoButtonCaption:Boolean read FShowGoButtonCaption write FShowGoButtonCaption;
    property UseAddAutoComplete : Boolean read FUseAddrAutoComplete write FUseAddrAutoComplete;

    //UserStyleSheet
    property EnabledSheets:String read FEnabledSheets write FEnabledSheets;

    //Migemo
    property MigemoEnabled:Boolean read FMigemoEnabled write FMigemoEnabled;
    property MigemoDLLPath:String read FMigemoDLLPath write FMigemoDLLPath;
    property MigemoDicFolder:String read FMigemoDicFolder write FMigemoDicFolder;
    property MigemoStartFromViewport:Boolean read FMigemoStartFromViewport write FMigemoStartFromViewport;
    property MigemoLazyHilight:Boolean read FMigemoLazyHilight write FMigemoLazyHilight;
    property MigemoOpenGrepSidebar:Boolean read FMigemoOpenGrepSidebar write FMigemoOpenGrepSidebar;

    //Operakey
    property OperaKeyEnabled:Boolean read FOperaKeyEnabled write FOperaKeyEnabled;
  end;

  TGeckoPref = class(TObject)
  private
    { Private 宣言 }
    Fpb:nsIPrefBranch;
  public
    { Public 宣言 }
    constructor Create;// override;
    function GetRootBranch:nsIPrefBranch;
    function GetPrefService:nsIPrefService;
    //function GetPref:nsIPref;
    function PrefExists(PrefName:String):Boolean;
    function GetBoolPref(PrefName:String):Boolean;
    procedure SetBoolPref(PrefName:String;Val:Boolean);
    function GetIntPref(PrefName:String):Integer;
    procedure SetIntPref(PrefName:String;Val:integer);
    function GetStrPref(PrefName:String):String;
    procedure SetStrPref(PrefName:String;Val:String);
  end;

var
   a:integer;
   Pref: TBagelPref;
   GeckoPref:TGeckoPref;
   i,HighLightColorCount:Integer;
implementation

  function GetSettingDir:String;
  var
    UseAppData:Boolean;
    FolderPath:array[0..MAX_PATH] of Char;
    SettingPath:String;
  begin
    UseAppData := True;
    if UseAppData then
    begin
      SHGetSpecialFolderPath(0,FolderPath, CSIDL_APPDATA,False);
      SettingPath := IncludeTrailingBackslash(FolderPath)+'Bagel\';
    end
    else begin
      SettingPath := ExtractFilePath(Application.ExeName) + 'settings\';
    end;
    if not DirectoryExists(SettingPath) then
    begin
      if not CreateDir(SettingPath) then
      begin
         ShowMessage('設定フォルダ'+SettingPath+'の作成に失敗しました');
        Application.Terminate;
      end;
    end;
    {
    IniFileName:=IncludeTrailingBackslash(IniFolder)+
                 ExtractFileName(ChangeFileExt(
                 Application.ExeName,'.ini'));
    }
    Result := SettingPath;
  end;
  
  function GetDefaultsDir:String;
  begin
    Result := ExtractFilePath(Application.ExeName) + 'defaults\';
  end;

procedure TBagelPref.Init;
var
  IniFile:     TNkMemIniFile; //TMemIniFile;
//  IniFile2:     TIniFile;
//  TS:TStrings;
  i:Integer;
//  tmpbool:Boolean;
begin
  FSearchHistory := nil;
  FAddrHistory := nil;
  //Bagel.iniからの読み込み
  IniFile := TNkMemIniFile.Create(GetSettingDir() + 'Bagel.ini');

  //ExeまでのPath
//  GetSettingDir() := ExtractFilePath(Application.ExeName);
  try
    //General

    IniFile.WriteString('General','Version',version.theVersion.StringVersion);
    FConsiderTarget:=Boolean(IniFile.ReadInteger('General','ConsiderTarget',Integer(true)));
    FEnableDenyTitle:=Boolean(IniFile.ReadInteger('General','EnableDenyTitle',Integer(true)));
    FEnableDenyURL:=Boolean(IniFile.ReadInteger('General','EnableDenyURL',Integer(true)));
    FAutoSaveTablist:=Boolean(IniFile.ReadInteger('General','AutoSaveTablist',Integer(false)));
    //Font
    FOverrideToolbarFont:=Boolean(IniFile.ReadInteger('Font','OverrideToolbar',Integer(False)));
    FToolbarFont:=Inifile.ReadString('Font','Toolbar','');
    FOverrideMenubarFont:=Boolean(IniFile.ReadInteger('Font','OverrideMenubar',Integer(False)));
    FMenubarFont:=Inifile.ReadString('Font','Menubar','');
    FOverrideSidebarFont:=Boolean(IniFile.ReadInteger('Font','OverrideSidebar',Integer(False)));
    FSidebarFont:=Inifile.ReadString('Font','Sidebar','');

  //Window
    FWndTop := IniFile.ReadInteger('WINDOW','top',30);
    FWndLeft := IniFile.ReadInteger('WINDOW','left',0);
    FWndWidth := IniFile.ReadInteger('WINDOW','width',740);
    FWndHeight := IniFile.ReadInteger('WINDOW','height',480);
    FWndState := IniFile.ReadInteger('WINDOW','state',0);
    FSidebar := IniFile.ReadInteger('WINDOW','sidebar',0);
    FSidebarVisible := Boolean(IniFile.ReadInteger('WINDOW','sidebarvisible',Integer(true)));
    FSidebarOverlap := Boolean(IniFile.ReadInteger('WINDOW','SidebarOverlap',Integer(false)));
    FShowSidebarTabs := Boolean(IniFile.ReadInteger('WINDOW','ShowSidebarTabs',Integer(false)));

    FSidebarHeaderList :=TStringList.Create;
    FSidebarHeaderList.CommaText := IniFile.ReadString('WINDOW','SidebarHeaderList','actBookmarkSidebar,actHistorySidebar,actGrepSidebar');

    FSidebarWidth := IniFile.ReadInteger('WINDOW','sidebarwidth',230);
    FSidebarAutoOpenDelay := IniFile.ReadInteger('WINDOW','SidebarAutoOpenDelay',0);
    FSidebarAutoHideDelay := IniFile.ReadInteger('WINDOW','SidebarAutoHideDelay',0);
    FSidebarAutoHide := Boolean(IniFile.ReadInteger('WINDOW','sidebarautohide',Integer(false)));
    FUserDefinedFolder:=IniFIle.ReadString('Sidebar','UserDefinedFolder','');
    FStatusbarVisible := Boolean(IniFile.ReadInteger('WINDOW','statusbarvisible',Integer(true)));
    FShowAppNameInTitle:= Boolean(IniFile.ReadInteger('WINDOW','ShowAppNameInTitle',Integer(true)));
    

    //Toolbar
    FTabBarCaption := IniFile.ReadString('TOOLBAR','tabcaption','タブ');
    FSearchBarCaption := IniFile.ReadString('TOOLBAR','searchcaption','検索');
    FLinkBarCaption := IniFile.ReadString('TOOLBAR','linkcaption','リンク');
    FAddressBarCaption := IniFile.ReadString('TOOLBAR','addresscaption','アドレス');
    FMainBarCaption := IniFile.ReadString('TOOLBAR','maincaption','');
    FSearchBoxWidth := IniFile.ReadInteger('TOOLBAR','searchboxwidth',150);
    FFixToolbar :=  Boolean(Inifile.ReadInteger('TOOLBAR','FixToolbar',Integer(False)));
    //Kiosk
    FKioskTabBarVisible:=    Boolean(Inifile.ReadInteger('TOOLBAR','KioskTabBarVisible',Integer(True)));
    FKioskSearchBarVisible:= Boolean(Inifile.ReadInteger('TOOLBAR','KioskSearchBarVisible',Integer(True)));
    FKioskLinkBarVisible:=   Boolean(Inifile.ReadInteger('TOOLBAR','KioskLinkBarVisible',Integer(false)));
    FKioskAddressBarVisible:=Boolean(Inifile.ReadInteger('TOOLBAR','KioskAddressBarVisible',Integer(false)));
    FKioskMainBarVisible:=   Boolean(Inifile.ReadInteger('TOOLBAR','KioskMainBarVisible',Integer(True)));
    FKioskMenuBarVisible:=   Boolean(Inifile.ReadInteger('TOOLBAR','KioskMenuBarVisible',Integer(True)));
    FKioskStatusBarVisible:= Boolean(Inifile.ReadInteger('TOOLBAR','KioskStatusBarVisible',Integer(false)));

    //OnStart
    //OnClose
    //Confirm

    //Menu
    FShowAddBookmarkHere:= Boolean(Inifile.ReadInteger('Menu','ShowAddBookmarkHere',Integer(true)));
    FShowOpenAllBookmarks:=Boolean(Inifile.ReadInteger('Menu','ShowOpenAllBookmarks',Integer(true)));
    FBookmarkMenuMaxLength:=IniFile.ReadInteger('Menu','BookmarkMenuMaxLength',0);
    FShowMenuIcon:=Boolean(Inifile.ReadInteger('Menu','ShowMenuIcon',Integer(true)));
    //DocShell
    FDefaultAllowPlugins:=Boolean(Inifile.ReadInteger('DocShell','DefaultAllowPlugins',Integer(true)));
    FDefaultAllowJS:=Boolean(Inifile.ReadInteger('DocShell','DefaultAllowJS',Integer(true)));
    FDefaultAllowFrames:=Boolean(Inifile.ReadInteger('DocShell','DefaultAllowFrames',Integer(true)));
    FDefaultAllowMeta:=Boolean(Inifile.ReadInteger('DocShell','DefaultAllowMeta',Integer(true)));
    FDefaultAllowImg:=Boolean(Inifile.ReadInteger('DocShell','DefaultAllowImg',Integer(true)));

    FInheritDocShell:=Boolean(Inifile.ReadInteger('Inherit','InheritDocShell',Integer(false)));
    FInheritAutoHighlight:=Boolean(Inifile.ReadInteger('Inherit','InheritAutoHighlight',Integer(false)));

    //TAB
    FTabMiddleClickAct := IniFile.ReadString('TAB','middleclick','actCloseTab');
    FTabDblClickAct := IniFile.ReadString('TAB','dblclick','actReload');
    FTabRightClickAct := IniFile.ReadString('TAB','rightclick','');
    
    FTabMaxCount := IniFile.ReadInteger('TAB','maxcount',0);
    FTabMaxStrCount := IniFile.ReadInteger('TAB','maxstrcount',15);
    FTabMultiLine := Boolean(IniFile.ReadInteger('TAB','multiline',Integer(true)));
    FViewIsRead := Boolean(IniFile.ReadInteger('TAB','IsRead',Integer(true)));
    FTabStyle := IniFile.ReadInteger('TAB','Style',0);
    FNewTabMode := IniFile.ReadInteger('TAB','newtabmode',0);
    FAddTabCurrCopyHistory := Boolean(IniFile.ReadInteger('TAB','AddTabCurrCopyHistory',Integer(false)));
    FAutoReloadCustomIntv := IniFile.ReadInteger('TAB','AutoReloadCustomIntv',20);

    FOpenModePopup := IniFile.ReadInteger('TAB','OpenModePopup',2);
    FOpenModeBookmarks := IniFile.ReadInteger('TAB','OpenModeBookmarks',0);
    FOpenModeHistory := IniFile.ReadInteger('TAB','OpenModeHistory',0);
    FOpenModeLocation := IniFile.ReadInteger('TAB','OpenModeLocation',0);
    FOpenModeSearch := IniFile.ReadInteger('TAB','OpenModeSearch',0);
    FOpenModeViewsource := IniFile.ReadInteger('TAB','OpenModeViewsource',0);
    FOpenModeMiddleClick := IniFile.ReadInteger('TAB','OpenModeMiddleClick',2);
    FOpenModeClipboard := IniFile.ReadInteger('TAB','OpenModeClipboard',0);
//    FNewTabPos := IniFile.ReadInteger('TAB','NewTabPos',1);
    FWhenCloseTabChoose := iniFile.ReadInteger('TAB','WhenCloseTabChoose',0);
    FTabWidth := inifile.ReadInteger('TAB','TabWidth',0);
    FEnableWheelTabChange :=Boolean(inifile.ReadInteger('TAB','EnableWheelTabChange',Integer(true)));
    
    //StartUp
//    FRestoreTabs := Boolean(IniFile.ReadInteger('STARTUP','RestoreTabs',Integer(false)));
    FStartupTabBehavior:=IniFile.ReadInteger('STARTUP','TabBehavior',3);
    FStartupRestoreSH := Boolean(IniFile.ReadInteger('STARTUP','RestoreSH',Integer(true)));
    FStartupGroup:= IniFIle.ReadString('STARTUP','Group','');
    FStartupScript:= IniFIle.ReadString('STARTUP','Script','');
{    property StartupTabBehavior:Integer read FStartupTabBehavior write FStartupTabBehavior;
    property StartupRestoreSH:Boolean read FStartupRestoreSH write FStartupRestoreSH;
    property StartupGroup:String read FStartupGroup write FStartupGroup;}
    FBUBookmarkOnStart:= Boolean(IniFile.ReadInteger('STARTUP','BackupBookmark',Integer(true)));
    FBUPrefOnStart:= Boolean(IniFile.ReadInteger('STARTUP','BackupPref',Integer(False)));
    FBUGeckoPrefOnStart:= Boolean(IniFile.ReadInteger('STARTUP','BackupGeckoPref',Integer(False)));
    FBUGeneration:=IniFile.ReadInteger('STARTUP','BackupGeneration',7);
    
    //OnClose
    FDelRecentClosed := Boolean(IniFile.ReadInteger('ONCLOSE','DelRecentClosed',Integer(false)));
    FDelRecentOpened := Boolean(IniFile.ReadInteger('ONCLOSE','DelRecentOpened',Integer(false)));
    FDelAddrHistory := Boolean(IniFile.ReadInteger('ONCLOSE','DelAddrHistory',Integer(false)));
    FDelSearchHistory := Boolean(IniFile.ReadInteger('ONCLOSE','DelSearchHistory',Integer(false)));
    FDelCookie := Boolean(IniFile.ReadInteger('ONCLOSE','DelCookie',Integer(false)));
    FDelHistory := Boolean(IniFile.ReadInteger('ONCLOSE','DelHistory',Integer(false)));
    FDelCache := Boolean(IniFile.ReadInteger('ONCLOSE','DelCache',Integer(false)));
    //Confirm
    FOnAppQuit := Boolean(IniFile.ReadInteger('CONFIRM','AppQuit',Integer(false)));
    FOnCloseAll := Boolean(IniFile.ReadInteger('CONFIRM','CloseAll',Integer(false)));
    FOnCloseOther := Boolean(IniFile.ReadInteger('CONFIRM','CloseOther',Integer(false)));
    FOnDeleteBookmark := Boolean(IniFile.ReadInteger('CONFIRM','DeleteBookmark',Integer(false)));
    FOnOpeningManyItems := Boolean(IniFile.ReadInteger('CONFIRM','OpeningManyItems',Integer(false)));
    FWarnItemCount := IniFile.ReadInteger('CONFIRM','WarnItemCount',30);
    //ShutdownScript
    FShutdownScript:= IniFile.ReadString('ONCLOSE','Script','');
    //Recent
    FRecentClosedMaxCount := IniFile.ReadInteger('RECENT','CMaxCount',10);
    FRecentOpenedMaxCount := IniFile.ReadInteger('RECENT','OMaxCount',10);
    FRecentClosedURLStyle := IniFile.ReadInteger('RECENT','CStyle',0);
  //Network
    FRandomProxy:=Boolean(IniFile.ReadInteger('NETWORK','RandomProxy',Integer(false)));
    FRandomProxyIntvMin:=IniFile.ReadInteger('NETWORK','RandomProxyIntvMin',0);
    FRandomProxyIntvSec:=IniFile.ReadInteger('NETWORK','RandomProxyIntvSec',0);
    
    FHomepage := IniFile.ReadString('STARTUP','homepage','http://ipt.sakura.ne.jp/gecko/bagel/');
    FObsClipboard := Boolean(IniFile.ReadInteger('CLIPBOARD','observe',Integer(false)));
    FObsNotLoaded := Boolean(IniFile.ReadInteger('CLIPBOARD','notloaded',Integer(true)));

    //AdBlock
    FEnableAdblock := Boolean(IniFile.ReadInteger('Adblock','enable',Integer(true)));

    //Cookie
    FCookieP3PCustom := IniFile.ReadString('Cookie','p3pcustom','ffffaaaa');


    {IniFile.WriteInteger('HighLightPref','Count',FHighLightPref.Count);
    for i:=0 to FHighLightPref.Count - 1 do begin
      IniFile.WriteString('HighLightPref','Style'+IntToStr(i),FHighLightPref.Strings[i]);
    end;}

    //HighLight
    if not IniFile.SectionExists('HighLightPref') then begin
      IniFile.WriteInteger('HighLightPref','Count',4);
      IniFile.WriteString('HighLightPref','Style0','000000,FFFF00,1,0,0');
      IniFile.WriteString('HighLightPref','Style1','000000,95FFFF,1,0,0');
      IniFile.WriteString('HighLightPref','Style2','000000,80FF80,1,0,0');
      IniFile.WriteString('HighLightPref','Style3','000000,FFB5DA,1,0,0');
    end;
    
    HighLightColorCount := IniFile.ReadInteger('HighLightPref','Count',0);
    FHighLightPref:=TStringlist.Create;
    for i:=0 to HighLightColorCount - 1 do begin
      FHighLightPref.Add(IniFile.ReadString('HighLightPref','Style'+IntToStr(i),'ffff00,000000,0,0,0'));
    end;

    //Search
    FScrollToCenterOnFind := Boolean(IniFile.ReadInteger('Search','ScrollToCenter',Integer(true)));

    //WebSearch
    FSearchOnKeywordChange := Boolean(IniFile.ReadInteger('Search','SearchOnKeywordChange',Integer(false)));
    FSearchOnEngineChange := Boolean(IniFile.ReadInteger('Search','SearchOnEngineChange',Integer(false)));
    FSearchOnDrop := Boolean(IniFile.ReadInteger('Search','SearchOnDrop',Integer(true)));
    FShowAtCenterFound := Boolean(IniFile.ReadInteger('Search','ShowAtCenterFound',Integer(false)));
    FRememberEngine := Boolean(IniFile.ReadInteger('Search','RememberEngine',Integer(false)));
    FRememberedEngineIndex := IniFile.ReadInteger('Search','RememberedEngineIndex',1);
    FReplaceZenkakuSpace := Boolean(IniFile.ReadInteger('Search','ReplaceZenkakuSpace',Integer(false)));
    FSearchBarSaveCount := IniFile.ReadInteger('Search','HistorySaveCount',30);
    FSearchBarDropdownCount := IniFile.ReadInteger('Search','DropdownCount',8);
    FAutoHighlightAfterSearch := Boolean(IniFile.ReadInteger('Search','AutoHighlightAfterSearch',Integer(true)));
    FAutoTabLockAfterSearch := Boolean(IniFile.ReadInteger('Search','AutoTabLockAfterSearch',Integer(false)));
    FShowSearchButtons := Boolean(IniFile.ReadInteger('Search','ShowSearchButtons',Integer(True)));

    //RightClickGesture
    //
    FRWheelClick := IniFile.ReadString('Gesture','RWheelClick','actCloseTab');
    FRLeftClick := IniFile.ReadString('Gesture','RLeftClick','actGoBack');
    FRWheelUp := IniFile.ReadString('Gesture','RWheelUp','');
    FRWheelDown := IniFile.ReadString('Gesture','RWheelDown','');
    FRSide1Click := IniFile.ReadString('Gesture','RSide1Click','');
    FRSide2Click := IniFile.ReadString('Gesture','RSide2Click','');
    FSide1Click := IniFile.ReadString('Gesture','Side1Click','');
    FSide2Click := IniFile.ReadString('Gesture','Side2Click','');

    FSDragImgAction :=IniFile.ReadInteger('SuperDrag','ImgAction',1);
    FSDragImgIsBG :=Boolean(IniFile.ReadInteger('SuperDrag','ImgIsBG',Integer(false)));
    FSDragImgSaveType :=IniFile.ReadInteger('SuperDrag','ImgSaveType',0);
    FSDragImgSavePath := IniFile.ReadString('SuperDrag','ImgSavePath','');

    FSDragLinkAction :=IniFile.ReadInteger('SuperDrag','LinkAction',1);
    FSDragLinkgIsBG :=Boolean(IniFile.ReadInteger('SuperDrag','LinkgIsBG',Integer(false)));
    FSDragLinkSaveType :=IniFile.ReadInteger('SuperDrag','LinkSaveType',0);
    FSDragLinkSavePath := IniFile.ReadString('SuperDrag','LinkSavePath','');

    FSDragSelectionAction :=IniFile.ReadInteger('SuperDrag','SelectionAction',1);
    FSDragSelectionIsBG :=Boolean(IniFile.ReadInteger('SuperDrag','SelectionIsBG',Integer(false)));
    FSDragSelectionDet :=IniFile.ReadInteger('SuperDrag','SelectionDet',0);
    FSDragSelectionDetRE := IniFile.ReadString('SuperDrag','SelectionDetRE','^[a-z0-9:/\.\-]+\.(com|net|org|info|biz|jp|de|uk|tv|to|cc|cx)');

    //Addressbar
    FShowGoButtonCaption := Boolean(IniFile.ReadInteger('AddressBar','ShowGoCaption',Integer(True)));
    FShowGoButton := Boolean(IniFile.ReadInteger('AddressBar','ShowGoButton',Integer(True)));
    FUseAddrAutoComplete := Boolean(IniFile.ReadInteger('AddressBar','UseAutoComplete',Integer(True)));

    //UserSS
    FEnabledSheets := IniFile.ReadString('CSS','EnabledSheets','');

    FMigemoEnabled := Boolean(IniFile.ReadInteger('Migemo','Enabled',Integer(True)));
    FMigemoDLLPath := IniFile.ReadString('Migemo','DLLPath','');
    FMigemoDicFolder := IniFile.ReadString('Migemo','DicFolder','');
    FMigemoStartFromViewport := Boolean(IniFile.ReadInteger('Migemo','StartFromViewport',Integer(False)));
    FMigemoLazyHilight := Boolean(IniFile.ReadInteger('Migemo','LazyHighlight',Integer(False)));
    FMigemoOpenGrepSidebar := Boolean(IniFile.ReadInteger('Migemo','OpenGrepSidebar',Integer(False)));

    FOperaKeyEnabled := Boolean(IniFile.ReadInteger('Keyboard','OperaKeyEnabled',Integer(True)));

    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;
  //Search.iniからの読みこみ
  if FileExists(GetSettingDir+ 'Search.ini') then
    IniFile2 := TMemIniFile.Create(GetSettingDir+ 'Search.ini')
  else
    IniFile2 := TMemIniFile.Create(GetDefaultsDir+ 'Search.ini');

  try
    //IniFile2.ReadSection('Search-List',FEngines);
    FEngines := TStringList.Create;
    IniFile2.ReadSectionValues('Search-List',FEngines);
  finally
    //IniFile2.Free;
  end;

    {//マウスジェスチャ
    FGestList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Mouse.dat') then
    begin
      FGestList.LoadFromFile(GetSettingDir() + 'Mouse.dat');
    end
    else
    begin

    end;

    //キーボード
    FKbdList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Keyconf.dat') then
    begin
      FKbdList.LoadFromFile(GetSettingDir() + 'Keyconf.dat');
    end
    else
    begin
      //FKbdList.Add('Ctrl+W=actCloseTab');
    end;

    //UA
    FUserAgents := TStringList.Create;
    if FileExists(GetSettingDir() + 'UA.dat') then
    begin
      FUserAgents.LoadFromFile(GetSettingDir() + 'UA.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    //DenyTitle
    FDenyTitleList := TStringList.Create;
    if FileExists(GetSettingDir() + 'DenyTitle.dat') then
    begin
      FDenyTitleList.LoadFromFile(GetSettingDir() + 'DenyTitle.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    //DenyURL
    FDenyURLList := TStringList.Create;
    if FileExists(GetSettingDir() + 'DenyURL.dat') then
    begin
      FDenyURLList.LoadFromFile(GetSettingDir() + 'DenyURL.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FRecentClosedURL := TTablist.Create;
    if FileExists(GetSettingDir() + 'RecentClosed.dat') then
    begin
      FRecentClosedURL.LoadFromFile(GetSettingDir() + 'RecentClosed.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FRecentOpenedURL := TStringList.Create;
    if FileExists(GetSettingDir() + 'RecentOpened.dat') then
    begin
      FRecentOpenedURL.LoadFromFile(GetSettingDir() + 'RecentOpened.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;

    FInstalledExtensions := TStringList.Create;
    if FileExists(GetSettingDir() + 'installed-extensions.txt') then
    begin
      FInstalledExtensions.LoadFromFile(GetSettingDir() + 'installed-extensions.txt');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;

    FSearchHistory := TStringList.Create;
    if FileExists(GetSettingDir() + 'SearchHistory.dat') then
    begin
      FSearchHistory.LoadFromFile(GetSettingDir() + 'SearchHistory.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;

    FAddrHistory := TStringList.Create;
    if FileExists(GetSettingDir() + 'AddrHistory.dat') then
    begin
      FAddrHistory.LoadFromFile(GetSettingDir() + 'AddrHistory.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FAdDenyList := TStringList.Create;
    if FileExists(GetSettingDir() + 'AdDenyList.dat') then
    begin
      FAdDenyList.LoadFromFile(GetSettingDir() + 'AdDenyList.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FAdWhiteList := TStringList.Create;
    if FileExists(GetSettingDir() + 'AdWhiteList.dat') then
    begin
      FAdWhiteList.LoadFromFile(GetSettingDir() + 'AdWhiteList.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FURIActionList := TStringList.Create;
    if FileExists(GetSettingDir() + 'URIActionList.dat') then
    begin
      FURIActionList.LoadFromFile(GetSettingDir() + 'URIActionList.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;
    FStatusbarWidgets := TStringList.Create;
    if FileExists(GetSettingDir() + 'Statusbar.dat') then
    begin
      FStatusbarWidgets.LoadFromFile(GetSettingDir() + 'Statusbar.dat');
    end
    else
    begin
      //FProxies.Add('Ctrl+W=actCloseTab');
    end;}
end;

destructor TBagelPref.Destroy;
begin
    //NETWORK
    if Assigned(FProxies) then
    FProxies.Free;

    if Assigned(FUserAgents) then
    FUserAgents.Free;

    //Sidebar
    if Assigned(FSidebarHeaderList) then
    FSidebarHeaderList.Free;

    //GESTURE
    if Assigned(FGestList) then
    FGestList.Free;
    //DENYTITLE
    if Assigned(FDenyTitleList) then
    FDenyTitleList.Free;
    //DENYURL
    if Assigned(FDenyURLList) then
    FDenyURLList.Free;
    //RECENT
    if Assigned(FRecentClosedURL) then
    FRecentClosedURL.Free;
    if Assigned(FRecentOpenedURL) then
    FRecentOpenedURL.Free;

    //Extension
    if Assigned(FInstalledExtensions) then
    FInstalledExtensions.Free;

    //AutoComplete
    if Assigned(FSearchHistory) then
    FSearchHistory.Free;
    
    if Assigned(FAddrHistory) then
    FAddrHistory.Free;

    //SHORTCUT
    if Assigned(FKbdList) then
    FKbdList.Free;

    if Assigned(FOperaKeyList) then
    FOperaKeyList.Free;

    if Assigned(FEngines) then
    FEngines.Free;

    //Adblock
    if Assigned(FAdDenyList) then
    FAdDenyList.Free;

    if Assigned(FDropTargetList) then FDropTargetList.Free;

    //FAdWhiteList.Free;

    if Assigned(FURIActionList) then
    FURIActionList.Free;

    if Assigned(FStatusbarWidgets) then
    FStatusbarWidgets.Free;

    //HighLight
    if Assigned(FHighLightPref) then 
    FHighLightPref.Free;

  IniFile2.Free;
  inherited;
end;

function TBagelPref.GetDocShellDefault:Integer;
begin
Result:=
Integer(Self.DefaultAllowPlugins)*1+
Integer(Self.DefaultAllowJS)*2+
Integer(Self.DefaultAllowFrames)*4+
Integer(Self.DefaultAllowMeta)*8+
Integer(Self.DefaultAllowImg)*16;
end;


function TBagelPref.GetHighLightStyle(Index:Integer):String;
var
  sl:TStringList;
begin
  sl:=TStringList.Create;
  sl.CommaText := Pref.HighLightPref.Strings[Index];
  Result:='color:#'+sl.Strings[0]+' !important;'+
          'background-color:#'+sl.Strings[1]+' !important;';

  if sl.Strings[2]='1' then Result:=Result+'font-weight:bold !important;';
  if sl.Strings[3]='1' then Result:=Result+'font-style: italic !important;';
  if sl.Strings[4]='1' then Result:=Result+'text-decoration: underline !important;';

  sl.Free;
end;

function TBagelPref.GetAdDenyList:TStringList;
begin
  if not Assigned(Self.FAdDenyList) then begin
    FAdDenyList:=TStringList.Create;

    if FileExists(GetSettingDir() + 'AdDenyList.dat') then
    begin
      FAdDenyList.LoadFromFile(GetSettingDir() + 'AdDenyList.dat');
    end;
  end;
  Result:=FAdDenyList;
end;

function TBagelPref.GetDropTargetList:TStringList;
begin
  if not Assigned(Self.FDropTargetList) then begin
    FDropTargetList:=TStringList.Create;

    if FileExists(GetSettingDir() + 'DropTargetList.dat') then
    begin
      FDropTargetList.LoadFromFile(GetSettingDir() + 'DropTargetList.dat');
    end;
  end;
  Result:=FDropTargetList;
end;

function TBagelPref.GetURIActionList:TStringList;
begin
  if not Assigned(Self.FURIActionList) then begin
    FURIActionList := TStringList.Create;
    if FileExists(GetSettingDir() + 'URIActionList.dat') then
    begin
      FURIActionList.LoadFromFile(GetSettingDir() + 'URIActionList.dat');
    end
  end;
  Result:=FURIActionList;
end;
function TBagelPref.GetStatusbarWidgets:TStringList;
begin
  if not Assigned(Self.FStatusbarWidgets) then begin
    FStatusbarWidgets := TStringList.Create;
    if FileExists(GetSettingDir() + 'Statusbar.dat') then
    begin
      FStatusbarWidgets.LoadFromFile(GetSettingDir() + 'Statusbar.dat');
    end;
  end;
  Result:=FStatusbarWidgets;
end;
function TBagelPref.GetProxies:TStringList;
begin
  if not Assigned(Self.FProxies) then begin
    FProxies := TStringList.Create;
    if FileExists(GetSettingDir() + 'Proxies.dat') then
    begin
      FProxies.LoadFromFile(GetSettingDir() + 'Proxies.dat');
    end;
  end;
  Result:=FProxies;
end;
function TBagelPref.GetUserAgents:TStringList;
begin
  if not Assigned(Self.FUserAgents) then begin
    FUserAgents := TStringList.Create;
    if FileExists(GetSettingDir() + 'UA.dat') then
    begin
      FUserAgents.LoadFromFile(GetSettingDir() + 'UA.dat');
    end
    else if FileExists(GetDefaultsDir() + 'UA.dat') then
    begin
      FUserAgents.LoadFromFile(GetDefaultsDir() + 'UA.dat');
    end
  end;
  Result:=FUserAgents;
end;

function TBagelPref.GetGestList:TStringList;
begin
  if not Assigned(Self.FGestList) then begin
    FGestList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Mouse.dat') then
    begin
      FGestList.LoadFromFile(GetSettingDir() + 'Mouse.dat');
    end
    else if FileExists(GetDefaultsDir() + 'Mouse.dat') then
    begin
      FGestList.LoadFromFile(GetDefaultsDir() + 'Mouse.dat');
    end;
  end;
  Result:=FGestList;
end;

function TBagelPref.GetKbdList:TStringList;
begin
  if not Assigned(Self.FKbdList) then begin
    FKbdList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Keyconf.dat') then
    begin
      FKbdList.LoadFromFile(GetSettingDir() + 'Keyconf.dat');
    end
    else if FileExists(GetDefaultsDir() + 'Keyconf.dat') then
    begin
      FKbdList.LoadFromFile(GetDefaultsDir() + 'Keyconf.dat');
    end
  end;
  Result:=FKbdList;
end;

function TBagelPref.GetOperaKeyList:TStringList;
begin
  if not Assigned(Self.FOperaKeyList) then begin
    FOperaKeyList := TStringList.Create;
    if FileExists(GetSettingDir() + 'OperaKey.dat') then
    begin
      FOperaKeyList.LoadFromFile(GetSettingDir() + 'OperaKey.dat');
    end
    else if FileExists(GetDefaultsDir() + 'OperaKey.dat') then
    begin
      FOperaKeyList.LoadFromFile(GetDefaultsDir() + 'OperaKey.dat');
    end
  end;
  Result:=FOperaKeyList;
end;

function TBagelPref.GetDenyTitleList:TStringList;
begin
  if not Assigned(Self.FDenyTitleList) then begin
    FDenyTitleList := TStringList.Create;
    if FileExists(GetSettingDir() + 'DenyTitle.dat') then
    begin
      FDenyTitleList.LoadFromFile(GetSettingDir() + 'DenyTitle.dat');
    end
    else if FileExists(GetDefaultsDir() + 'DenyTitle.dat') then
    begin
      FDenyTitleList.LoadFromFile(GetDefaultsDir() + 'DenyTitle.dat');
    end
  end;
  Result:=FDenyTitleList;
end;

function TBagelPref.GetDenyURLList:TStringList;
begin
  if not Assigned(Self.FDenyURLList) then begin
    FDenyURLList := TStringList.Create;
    if FileExists(GetSettingDir() + 'DenyURL.dat') then
    begin
      FDenyURLList.LoadFromFile(GetSettingDir() + 'DenyURL.dat');
    end
    else if FileExists(GetDefaultsDir() + 'DenyURL.dat') then
    begin
      FDenyURLList.LoadFromFile(GetDefaultsDir() + 'DenyURL.dat');
    end
  end;
  Result:=FDenyURLList;
end;

function TBagelPref.GetRecentClosedURL:TTabList;
begin
  if not Assigned(Self.FRecentClosedURL) then begin
    FRecentClosedURL := TTablist.Create;
    if FileExists(GetSettingDir() + 'RecentClosed.dat') then
    begin
      FRecentClosedURL.LoadFromFile(GetSettingDir() + 'RecentClosed.dat');
    end
  end;
  Result:=FRecentClosedURL;
end;

function TBagelPref.GetRecentOpenedURL:TStringList;
begin
  if not Assigned(Self.FRecentOpenedURL) then begin
    FRecentOpenedURL := TStringList.Create;
    if FileExists(GetSettingDir() + 'RecentOpened.dat') then
    begin
      FRecentOpenedURL.LoadFromFile(GetSettingDir() + 'RecentOpened.dat');
    end;
  end;
  Result:=FRecentOpenedURL;
end;
function TBagelPref.GetInstalledExtensions:TStringList;
begin
  if not Assigned(FInstalledExtensions) then begin
    FInstalledExtensions:=TStringList.Create;

    if FileExists(GetSettingDir() + 'installed-extensions.txt') then
    begin
      FInstalledExtensions.LoadFromFile(GetSettingDir() + 'installed-extensions.txt');
    end;
  end;

  Result:=FInstalledExtensions;
end;
{
function TBagelPref.GetEngines:TStringList;
begin
  if not Assigned(Self.FGestList) then begin
    FKbdList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Keyconf.dat') then
    begin
      FKbdList.LoadFromFile(GetSettingDir() + 'Keyconf.dat');
    end
  end;
  Result:=FGestList;
end;                           }
function TBagelPref.GetSearchHistory:TStringList;
begin
  if not Assigned(Self.FSearchHistory) then begin
    FSearchHistory := TStringList.Create;
    if FileExists(GetSettingDir() + 'SearchHistory.dat') then
    begin
      FSearchHistory.LoadFromFile(GetSettingDir() + 'SearchHistory.dat');
    end
  end;
  Result:=FSearchHistory;
end;
function TBagelPref.GetAddrHistory:TStringList;
begin
  if not Assigned(Self.FAddrHistory) then begin
    FAddrHistory := TStringList.Create;
    if FileExists(GetSettingDir() + 'AddrHistory.dat') then
    begin
      FAddrHistory.LoadFromFile(GetSettingDir() + 'AddrHistory.dat');
    end
  end;
  Result:=FAddrHistory;
end;
                                    {
function TBagelPref.GetHighLightPref:TStringList;
begin
  if not Assigned(Self.FGestList) then begin
    FKbdList := TStringList.Create;
    if FileExists(GetSettingDir() + 'Keyconf.dat') then
    begin
      FKbdList.LoadFromFile(GetSettingDir() + 'Keyconf.dat');
    end
  end;
  Result:=FGestList;
end;                                 }

procedure TBagelPref.Save;
var
  IniFile:     TMemIniFile;
//  GetSettingDir():String;
  i:Integer;
begin
  //iniファイルへの書き込み
  IniFile := TMemIniFile.Create(GetSettingDir + ExtractFileName(ChangeFileExt(Application.ExeName, '.ini')));
//  GetSettingDir():=ExtractFilePath(Application.ExeName);
  try

    IniFile.WriteBool('General','ConsiderTarget',FConsiderTarget);
    IniFile.WriteBool('General','EnableDenyTitle',FEnableDenyTitle);
    IniFile.WriteBool('General','EnableDenyURL',FEnableDenyURL);
    IniFile.WriteBool('General','AutoSaveTablist',FAutoSaveTablist);
    IniFile.WriteString('General','Version',version.theVersion.StringVersion);

    IniFile.WriteBool('Font','OverrideToolbar',FOverrideToolbarFont);
    IniFile.WriteString('Font','Toolbar',FToolbarFont);
    IniFile.WriteBool('Font','OverrideMenubar',FOverrideMenubarFont);
    IniFile.WriteString('Font','Menubar',FMenubarFont);
    IniFile.WriteBool('Font','OverrideSidebar',FOverrideSidebarFont);
    IniFile.WriteString('Font','Sidebar',FSidebarFont);

    IniFile.WriteInteger('WINDOW','top',FWndTop);
    IniFile.WriteInteger('WINDOW','left',FWndLeft);
    IniFile.WriteInteger('WINDOW','width',FWndWidth);
    IniFile.WriteInteger('WINDOW','height',FWndHeight);
    IniFile.WriteInteger('WINDOW','state',FWndState);
    IniFile.WriteInteger('WINDOW','sidebar',FSidebar);
    IniFile.WriteInteger('WINDOW','sidebarvisible',Integer(FSidebarVisible));
    IniFile.WriteInteger('WINDOW','SidebarOverlap',Integer(FSidebarOverlap));
    IniFile.WriteInteger('WINDOW','ShowSidebarTabs',Integer(FShowSidebarTabs));
{        FSidebarHeaderList :=TStringList.Create;
    FSidebarHeaderList.CommaText := IniFile.ReadString('WINDOW','SidebarHeaderList','');}
    IniFile.WriteString('WINDOW','SidebarHeaderList',FSidebarHeaderList.CommaText);
    IniFile.WriteInteger('WINDOW','sidebarwidth',FSidebarWidth);
    IniFile.WriteInteger('WINDOW','SidebarAutoOpenDelay',FSidebarAutoOpenDelay);
    IniFile.WriteInteger('WINDOW','SidebarAutoHideDelay',FSidebarAutoHideDelay);
    IniFile.WriteInteger('WINDOW','sidebarautohide',Integer(FSidebarAutoHide));
    IniFIle.WriteString('Sidebar','UserDefinedFolder',FUserDefinedFolder);

    IniFile.WriteInteger('WINDOW','statusbarvisible',Integer(FStatusbarVisible));
    IniFile.WriteInteger('WINDOW','ShowAppNameInTitle',Integer(FShowAppNameInTitle));


    IniFile.WriteInteger('CLIPBOARD','observe',Integer(FObsClipboard));
    IniFile.WriteInteger('CLIPBOARD','notloaded',Integer(FObsNotLoaded));

    IniFile.WriteString('TAB','middleclick',FTabMiddleClickAct);
    IniFile.WriteString('TAB','dblclick',FTabDblClickAct);
    IniFile.WriteString('TAB','rightclick',FTabRightClickAct);

    IniFile.WriteInteger('TAB','maxcount',FTabMaxCount);
    IniFile.WriteInteger('TAB','maxstrcount',FTabMaxStrCount);
    IniFile.WriteInteger('TAB','multiline',Integer(FTabMultiLine));
    IniFile.WriteInteger('TAB','IsRead',Integer(FViewIsRead));
    IniFile.WriteInteger('TAB','Style',FTabStyle);

    IniFile.WriteInteger('TAB','newtabmode',FNewTabMode);
    IniFile.WriteBool('TAB','AddTabCurrCopyHistory',FAddTabCurrCopyHistory);
    IniFile.WriteInteger('TAB','AutoReloadCustomIntv',FAutoReloadCustomIntv);

    
    IniFile.WriteInteger('TAB','OpenModePopup',FOpenModePopup);
    IniFile.WriteInteger('TAB','OpenModeBookmarks',FOpenModeBookmarks);
    IniFile.WriteInteger('TAB','OpenModeHistory',FOpenModeHistory);
    IniFile.WriteInteger('TAB','OpenModeLocation',FOpenModeLocation);
    IniFile.WriteInteger('TAB','OpenModeSearch',FOpenModeSearch);
    IniFile.WriteInteger('TAB','OpenModeViewsource',FOpenModeViewsource);
    IniFile.WriteInteger('TAB','OpenModeMiddleClick',FOpenModeMiddleClick);
    IniFile.WriteInteger('TAB','OpenModeClipboard',FOpenModeClipboard);
    IniFile.WriteInteger('TAB','WhenCloseTabChoose',FWhenCloseTabChoose);
    IniFile.WriteInteger('TAB','TabWidth',FTabWidth);
    IniFile.WriteBool('TAB','EnableWheelTabChange',FEnableWheelTabChange);
(*
  for i := 0 to CoolBar.Bands.Count - 1 do
  begin
    iniFile.WriteInteger(INI_WIN_SECT, 'Band' + IntToStr(i) + 'ID', CoolBar.Bands[i].id);
    iniFile.WriteInteger(INI_WIN_SECT, 'Band' + IntToStr(i) + 'Width', CoolBar.Bands[i].Width);
    iniFile.WriteBool(INI_WIN_SECT, 'Band' + IntToStr(i) + 'Break', CoolBar.Bands[i].Break);
  end;
*)
    IniFile.WriteString('TOOLBAR','tabcaption',FTabBarCaption);


    IniFile.WriteString('TOOLBAR','searchcaption',FSearchBarCaption);


    IniFile.WriteString('TOOLBAR','linkcaption',FLinkBarCaption);


    IniFile.WriteString('TOOLBAR','addresscaption',FAddressBarCaption);


    IniFile.WriteString('TOOLBAR','maincaption',FMainBarCaption);

    IniFile.WriteBool('TOOLBAR','FixToolbar',FFixToolbar);

    IniFile.WriteInteger('TOOLBAR','searchboxwidth',FSearchBoxWidth);
    //FullScreen
    IniFile.WriteBool('TOOLBAR','KioskTabBarVisible',FKioskTabBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskSearchBarVisible',FKioskSearchBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskLinkBarVisible',FKioskLinkBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskAddressBarVisible',FKioskAddressBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskMainBarVisible',FKioskMainBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskMenuBarVisible',FKioskMenuBarVisible);
    IniFile.WriteBool('TOOLBAR','KioskStatusBarVisible',FKioskStatusBarVisible);
{    FShowAddBookmarkHere:= Boolean(Inifile.ReadInteger('Menu','ShowAddBookmarkHere',Integer(true)));
    FShowOpenAllBookmarks:=Boolean(Inifile.ReadInteger('Menu','ShowOpenAllBookmarks',Integer(true)));}
    IniFile.WriteBool('Menu','ShowAddBookmarkHere',FShowAddBookmarkHere);
    IniFile.WriteBool('Menu','ShowOpenAllBookmarks',FShowOpenAllBookmarks);
    IniFile.WriteInteger('Menu','BookmarkMenuMaxLength',FBookmarkMenuMaxLength);
    IniFile.WriteBool('Menu','ShowMenuIcon',FShowMenuIcon);

    IniFile.WriteBool('DocShell','DefaultAllowPlugins',FDefaultAllowPlugins);
    IniFile.WriteBool('DocShell','DefaultAllowJS',FDefaultAllowJS);
    IniFile.WriteBool('DocShell','DefaultAllowFrames',FDefaultAllowFrames);
    IniFile.WriteBool('DocShell','DefaultAllowMeta',FDefaultAllowMeta);
    IniFile.WriteBool('DocShell','DefaultAllowImg',FDefaultAllowImg);

    IniFile.WriteBool('Inherit','InheritDocShell',FInheritDocShell);
    IniFile.WriteBool('Inherit','InheritAutoHighlight',FInheritAutoHighlight);

    IniFile.WriteBool('STARTUP','RestoreSH',FStartupRestoreSH);
    IniFile.WriteInteger('STARTUP','TabBehavior',FStartupTabBehavior);
    IniFile.WriteString('STARTUP','Group',FStartupGroup);
    IniFile.WriteString('STARTUP','Script',FStartupScript);
    IniFile.WriteBool('STARTUP','BackupBookmark',FBUBookmarkOnStart);
    IniFile.WriteBool('STARTUP','BackupPref',FBUPrefOnStart);
    IniFile.WriteBool('STARTUP','BackupGeckoPref',FBUGeckoPrefOnStart);
    IniFile.WriteInteger('STARTUP','BackupGeneration',FBUGeneration);

    IniFile.WriteBool('ONCLOSE','DelRecentClosed',FDelRecentClosed);
    IniFile.WriteBool('ONCLOSE','DelRecentOpened',FDelRecentOpened);
    IniFile.WriteBool('ONCLOSE','DelAddrHistory',FDelAddrHistory);
    IniFile.WriteBool('ONCLOSE','DelSearchHistory',FDelSearchHistory);
    IniFile.WriteBool('ONCLOSE','DelCookie',FDelCookie);
    IniFile.WriteBool('ONCLOSE','DelHistory',FDelHistory);
    IniFile.WriteBool('ONCLOSE','DelCache',FDelCache);

    IniFile.WriteString('ONCLOSE','Script',FShutdownScript);

    IniFile.WriteBool('CONFIRM','AppQuit',FOnAppQuit);
    IniFile.WriteBool('CONFIRM','CloseAll',FOnCloseAll);
    IniFile.WriteBool('CONFIRM','CloseOther',FOnCloseOther);
    IniFile.WriteBool('CONFIRM','DeleteBookmark',FOnDeleteBookmark);
    IniFile.WriteBool('CONFIRM','OpeningManyItems',FOnOpeningManyItems);
    IniFile.WriteInteger('CONFIRM','WarnItemCount',FWarnItemCount);

    IniFile.WriteInteger('RECENT','CMaxCount',FRecentClosedMaxCount);
    IniFile.WriteInteger('RECENT','OMaxCount',FRecentOpenedMaxCount);
    IniFile.WriteInteger('RECENT','CStyle',FRecentClosedURLStyle);

    IniFile.WriteBool('NETWORK','RandomProxy',FRandomProxy);
    IniFile.WriteInteger('NETWORK','RandomProxyIntvMin',FRandomProxyIntvMin);
    IniFile.WriteInteger('NETWORK','RandomProxyIntvSec',FRandomProxyIntvSec);

    IniFile.WriteString('STARTUP','homepage',FHomepage);

    IniFile.WriteBool('Adblock','enable',FEnableAdblock);

    //Cookie
    IniFile.WriteString('Cookie','p3pcustom',FCookieP3PCustom);

    IniFile.WriteInteger('HighLightPref','Count',FHighLightPref.Count);
    for i:=0 to FHighLightPref.Count - 1 do begin
      IniFile.WriteString('HighLightPref','Style'+IntToStr(i),FHighLightPref.Strings[i]);
    end;

    //WebSearch
    IniFile.WriteBool('Search','ScrollToCenter',FScrollToCenterOnFind);

    IniFile.WriteBool('Search','SearchOnKeywordChange',FSearchOnKeywordChange);
    IniFile.WriteBool('Search','SearchOnEngineChange',FSearchOnEngineChange);
    IniFile.WriteBool('Search','SearchOnDrop',FSearchOnDrop);
    IniFile.WriteBool('Search','ShowAtCenterFound',FShowAtCenterFound);
    IniFile.WriteBool('Search','RememberEngine',FRememberEngine);
    IniFile.WriteInteger('Search','RememberedEngineIndex',FRememberedEngineIndex);
    IniFile.WriteBool('Search','ReplaceZenkakuSpace',FReplaceZenkakuSpace);
    IniFile.WriteInteger('Search','HistorySaveCount',FSearchBarSaveCount);
    IniFile.WriteInteger('Search','DropdownCount',FSearchBarDropdownCount);
    IniFile.WriteBool('Search','AutoHighlightAfterSearch',FAutoHighlightAfterSearch);
    IniFile.WriteBool('Search','AutoTabLockAfterSearch',FAutoTabLockAfterSearch);
    IniFile.WriteBool('Search','ShowSearchButtons',FShowSearchButtons);

    //RightClickGesture
    IniFile.WriteString('Gesture','RWheelClick',FRWheelClick);
    IniFile.WriteString('Gesture','RLeftClick',FRLeftClick);
    IniFile.WriteString('Gesture','RWheelUp',FRWheelUp);
    IniFile.WriteString('Gesture','RWheelDown',FRWheelDown);
    IniFile.WriteString('Gesture','RSide1Click',FRSide1Click);
    IniFile.WriteString('Gesture','RSide2Click',FRSide2Click);
    IniFile.WriteString('Gesture','Side1Click',FSide1Click);
    IniFile.WriteString('Gesture','Side2Click',FSide2Click);
    //SuperDrag

    IniFile.WriteInteger('SuperDrag','ImgAction',FSDragImgAction);
    IniFile.WriteBool('SuperDrag','ImgIsBG',FSDragImgIsBG);
    IniFile.WriteInteger('SuperDrag','ImgSaveType',FSDragImgSaveType);
    IniFile.writeString('SuperDrag','ImgSavePath',FSDragImgSavePath);

    IniFile.WriteInteger('SuperDrag','LinkAction',FSDragLinkAction);
    IniFile.WriteBool('SuperDrag','LinkgIsBG',FSDragLinkgIsBG);
    IniFile.WriteInteger('SuperDrag','LinkSaveType',FSDragLinkSaveType);
    IniFile.WriteString('SuperDrag','LinkSavePath',FSDragLinkSavePath);

    IniFile.WriteInteger('SuperDrag','SelectionAction',FSDragSelectionAction);
    IniFile.WriteBool('SuperDrag','SelectionIsBG',FSDragSelectionIsBG);
    IniFile.WriteInteger('SuperDrag','SelectionDet',FSDragSelectionDet);
    IniFile.WriteString('SuperDrag','SelectionDetRE',FSDragSelectionDetRE);

    IniFile.WriteBool('AddressBar','ShowGoCaption',FShowGoButtonCaption);
    IniFile.WriteBool('AddressBar','ShowGoButton',FShowGoButton);
    IniFile.WriteBool('AddressBar','UseAutoComplete',FUseAddrAutoComplete);

    IniFile.WriteString('CSS','EnabledSheets',FEnabledSheets);

    IniFile.WriteBool('Migemo','Enabled',FMigemoEnabled);
    IniFile.WriteString('Migemo','DLLPath',FMigemoDLLPath);
    IniFile.WriteString('Migemo','DicFolder',FMigemoDicFolder);
    IniFile.WriteBool('Migemo','StartFromViewPort',FMigemoStartFromViewport);
    IniFile.WriteBool('Migemo','LazyHighlight',FMigemoLazyHilight);
    IniFile.WriteBool('Migemo','OpenGrepSidebar',FMigemoOpenGrepSidebar);

    IniFile.WriteBool('Keyboard','OperaKeyEnabled',FOperaKeyEnabled);

    IniFile.UpdateFile;
  finally
    IniFile.Free;
  end;

    if Assigned(FKbdList) then 
    FKbdList.SaveToFile(GetSettingDir() + 'KeyConf.dat');

    if Assigned(FOperakeyList) then
    FOperakeyList.SaveToFile(GetSettingDir() + 'OperaKey.dat');

    if Assigned(FGestList) then
    FGestList.SaveToFile(GetSettingDir() + 'Mouse.dat');

    if Assigned(FProxies) then
    FProxies.SaveToFile(GetSettingDir() + 'Proxies.dat');

    if Assigned(FUserAgents) then
    FUserAgents.SaveToFile(GetSettingDir() + 'UA.dat');
    if Assigned(FAdDenyList) then
    FAdDenyList.SaveToFile(GetSettingDir() + 'AdDenyList.dat');

    if Assigned(FDropTargetList) then
    FDropTargetList.SaveToFile(GetSettingDir() + 'DropTargetList.dat');

    if Assigned(FURIActionList) then
    FURIActionList.SaveToFile(GetSettingDir() + 'URIActionList.dat');

    if Assigned(FDenyTitleList) then
    FDenyTitleList.SaveToFile(GetSettingDir() + 'DenyTitle.dat');

    if Assigned(FDenyURLList) then
    FDenyURLList.SaveToFile(GetSettingDir() + 'DenyURL.dat');

    if Assigned(FInstalledExtensions) then
    FInstalledExtensions.SaveToFile(GetSettingDir() + 'installed-extensions.txt');

    if Assigned(FRecentOpenedURL) then begin
      if FDelRecentOpened=true then FRecentOpenedURL.Clear;
      FRecentOpenedURL.SaveToFile(GetSettingDir() + 'RecentOpened.dat');
    end;
    
    if Assigned(FRecentClosedURL) then begin
      if (FDelRecentClosed=true) then FRecentClosedURL.Clear;
      FRecentClosedURL.SaveToFile(GetSettingDir() + 'RecentClosed.dat');
    end;
//AutoComplete
    if Assigned(FAddrHistory) then begin
      if FDelAddrHistory=true then FAddrHistory.Clear;
      FAddrHistory.SaveToFile(GetSettingDir() + 'AddrHistory.dat');
    end;

    if Assigned(FSearchHistory) then begin
      if FDelSearchHistory=true then FSearchHistory.Clear;
      FSearchHistory.SaveToFile(GetSettingDir() + 'SearchHistory.dat');
    end;

    if Assigned(FStatusbarWidgets) then
    FStatusbarWidgets.SaveToFile(GetSettingDir() + 'Statusbar.dat');
end;

constructor TGeckoPref.Create;
var
  pS:nsIPrefService;
begin
  NS_GetService(NS_PREFSERVICE_CID,nsIPrefService,pS);
  Fpb := pS.GetBranch('');
  inherited Create;
end;

function TGeckoPref.GetRootBranch:nsIPrefBranch;
var
  pS:nsIPrefService;
begin
  //NS_PREFSERVICE_CONTRACTID,NS_PREFSERVICE_CID
  NS_GetService(NS_PREFSERVICE_CID,nsIPrefService,pS);
  Result := pS.GetBranch('');
end;

function TGeckoPref.GetPrefService:nsIPrefService;
var
  pS:nsIPrefService;
begin
  NS_GetService(NS_PREFSERVICE_CID,nsIPrefService,pS);
  Result:=pS;
end;

function TGeckoPref.PrefExists(PrefName:String):Boolean;
begin
  if fpb.GetPrefType(PChar(PrefName)) = 0 then
    Result := False
  else
    Result := True;
end;

function TGeckoPref.GetBoolPref(PrefName:String):Boolean;
begin
  if PrefExists(PrefName) then
  Result := fpb.GetBoolPref(PChar(PrefName))
  else Result := False;
end;

procedure TGeckoPref.SetBoolPref(PrefName:String;Val:Boolean);
begin
  fpb.SetBoolPref(PChar(PrefName),Integer(Val));
end;

function TGeckoPref.GetIntPref(PrefName:String):Integer;
begin
  if PrefExists(PrefName) then
  Result := fpb.GetIntPref(PChar(PrefName))
  else Result := 0;
end;
procedure TGeckoPref.SetIntPref(PrefName:String;Val:integer);
begin
  fpb.SetIntPref(PChar(prefname),Val);
end;

function TGeckoPref.GetStrPref(PrefName:String):String;
var
  str:nsISupportsString;
  astr:IInterfacedString;
begin
  Result:='';
  if PrefExists(PrefName) then begin
    fpb.GetComplexValue(PChar(PrefName),nsISupportsString,str);
    astr:=NewString;
    str.GetData(astr.AString);
    Result := String(astr.ToString);
  end;
end;

procedure TGeckoPref.SetStrPref(PrefName:String;Val:String);
var
  Str:nsISupportsString;
begin
  NS_CreateInstance('@mozilla.org/supports-string;1', nsISupportsString, Str);
  Str.SetData(NewString(Val).AString);
  fpb.SetComplexValue(PChar(PrefName),nsISupportsString,Str);
end;

initialization
  Pref:=TBagelPref.Create;
  Pref.Init;
  //GeckoPref:=TGeckoPref.Create;
  GRE_Startup();

finalization
	if Pref <> nil then begin
          Pref.Save;
          Pref.Free;
	  Pref := nil;
	end;
  GRE_Shutdown();
  {if GeckoPref<>nil then begin
    GeckoPref.Free;
  end; }

end.
