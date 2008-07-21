unit nsDocShell;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsDocumentCharsetInfo,nsSupportsArray;

const
  NS_IDOCSHELL_IID: TGUID = '{7d1cf6b9-daa3-476d-8f9f-9eb2a971a95c}';
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_NONE = 0;
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_INHERIT_OWNER = 1;
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_DONT_SEND_REFERRER = 2;
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_ALLOW_THIRD_PARTY_FIXUP = 4;
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_FIRST_LOAD = 8;
  NS_IDOCSHELL_INTERNAL_LOAD_FLAGS_BYPASS_CLASSIFIER = 16;
  NS_IDOCSHELL_ENUMERATE_FORWARDS = 0;
  NS_IDOCSHELL_ENUMERATE_BACKWARDS = 1;
  NS_IDOCSHELL_APP_TYPE_UNKNOWN = 0;
  NS_IDOCSHELL_APP_TYPE_MAIL = 1;
  NS_IDOCSHELL_APP_TYPE_EDITOR = 2;
  NS_IDOCSHELL_BUSY_FLAGS_NONE = 0;
  NS_IDOCSHELL_BUSY_FLAGS_BUSY = 1;
  NS_IDOCSHELL_BUSY_FLAGS_BEFORE_PAGE_LOAD = 2;
  NS_IDOCSHELL_BUSY_FLAGS_PAGE_LOADING = 4;
  NS_IDOCSHELL_LOAD_CMD_NORMAL = 1;
  NS_IDOCSHELL_LOAD_CMD_RELOAD = 2;
  NS_IDOCSHELL_LOAD_CMD_HISTORY = 4;

  NS_IDOCSHELLHISTORY_IID: TGUID = '{89caa9f0-8b1c-47fb-b0d3-f0aef0bff749}';

  NS_IDOCSHELLLOADINFO_IID: TGUID = '{4f813a88-7aca-4607-9896-d97270cdf15e}';
  NS_IDOCSHELLLOADINFO_loadNormal = 0;
  NS_IDOCSHELLLOADINFO_loadNormalReplace = 1;
  NS_IDOCSHELLLOADINFO_loadHistory = 2;
  NS_IDOCSHELLLOADINFO_loadReloadNormal = 3;
  NS_IDOCSHELLLOADINFO_loadReloadBypassCache = 4;
  NS_IDOCSHELLLOADINFO_loadReloadBypassProxy = 5;
  NS_IDOCSHELLLOADINFO_loadReloadBypassProxyAndCache = 6;
  NS_IDOCSHELLLOADINFO_loadLink = 7;
  NS_IDOCSHELLLOADINFO_loadRefresh = 8;
  NS_IDOCSHELLLOADINFO_loadReloadCharsetChange = 9;
  NS_IDOCSHELLLOADINFO_loadBypassHistory = 10;
  NS_IDOCSHELLLOADINFO_loadStopContent = 11;
  NS_IDOCSHELLLOADINFO_loadStopContentAndReplace = 12;
  NS_IDOCSHELLLOADINFO_loadNormalExternal = 13;
  NS_IDOCSHELLLOADINFO_loadNormalBypassCache = 14;
  NS_IDOCSHELLLOADINFO_loadNormalBypassProxy = 15;
  NS_IDOCSHELLLOADINFO_loadNormalBypassProxyAndCache = 16;

  NS_IDOCSHELLTREENODE_IID: TGUID = '{37f1ab73-f224-44b1-82f0-d2834ab1cec0}';

  NS_IDOCSHELLTREEITEM_IID: TGUID = '{09b54ec1-d98a-49a9-bc95-3219e8b55089}';
  NS_IDOCSHELLTREEITEM_typeChrome = 0;
  NS_IDOCSHELLTREEITEM_typeContent = 1;
  NS_IDOCSHELLTREEITEM_typeContentWrapper = 2;
  NS_IDOCSHELLTREEITEM_typeChromeWrapper = 3;
  NS_IDOCSHELLTREEITEM_typeAll = 2147483647;

  NS_IDOCSHELLTREEOWNER_IID: TGUID = '{bc0eb30e-656e-491e-a7ae-7f460b660c8d}';

  NS_ISHENTRY_IID: TGUID = '{c16fde76-3108-450e-8c8c-ae8286f286ed}';

type
  PnsDocShellEditorData = Pointer;
  nsIDocShell = interface;
  nsIDocShellHistory = interface;
  nsIDocShellLoadInfo = interface;
  nsIDocShellTreeNode = interface;
  nsIDocShellTreeItem = interface;
  nsIDocShellTreeOwner = interface;
  nsISHEntry = interface;
  nsDocShellInfoLoadType = PRInt32;
  nsIDocShell = interface(nsISupports)
  ['{7d1cf6b9-daa3-476d-8f9f-9eb2a971a95c}']
    procedure LoadURI(uri: nsIURI; loadInfo: nsIDocShellLoadInfo; aLoadFlags: PRUint32; firstParty: PRBool); safecall;
    procedure LoadStream(aStream: nsIInputStream; aURI: nsIURI; const aContentType: nsACString; const aContentCharset: nsACString; aLoadInfo: nsIDocShellLoadInfo); safecall;
    procedure InternalLoad(aURI: nsIURI; aReferrer: nsIURI; aOwner: nsISupports; aFlags: PRUint32; const aWindowTarget: PWideChar; const aTypeHint: PAnsiChar; aPostDataStream: nsIInputStream; aHeadersStream: nsIInputStream; aLoadFlags: PRUint32; aSHEntry: nsISHEntry; firstParty: PRBool; out aDocShell: nsIDocShell; out aRequest: nsIRequest); safecall;
    procedure CreateLoadInfo(out loadInfo: nsIDocShellLoadInfo); safecall;
    procedure PrepareForNewContentModel(); safecall;
    procedure SetCurrentURI(aURI: nsIURI); safecall;
    procedure FirePageHideNotification(isUnload: PRBool); safecall;
    function GetPresContext(): PnsPresContext; safecall;
    property PresContext: PnsPresContext read GetPresContext;
    function GetPresShell(): nsIPresShell; safecall;
    property PresShell: nsIPresShell read GetPresShell;
    function GetEldestPresShell(): nsIPresShell; safecall;
    property EldestPresShell: nsIPresShell read GetEldestPresShell;
    function GetContentViewer(): nsIContentViewer; safecall;
    property ContentViewer: nsIContentViewer read GetContentViewer;
    function GetChromeEventHandler(): nsIDOMEventTarget; safecall;
    procedure SetChromeEventHandler(aChromeEventHandler: nsIDOMEventTarget); safecall;
    property ChromeEventHandler: nsIDOMEventTarget read GetChromeEventHandler write SetChromeEventHandler;
    function GetDocumentCharsetInfo(): nsIDocumentCharsetInfo; safecall;
    procedure SetDocumentCharsetInfo(aDocumentCharsetInfo: nsIDocumentCharsetInfo); safecall;
    property DocumentCharsetInfo: nsIDocumentCharsetInfo read GetDocumentCharsetInfo write SetDocumentCharsetInfo;
    function GetAllowPlugins(): PRBool; safecall;
    procedure SetAllowPlugins(aAllowPlugins: PRBool); safecall;
    property AllowPlugins: PRBool read GetAllowPlugins write SetAllowPlugins;
    function GetAllowJavascript(): PRBool; safecall;
    procedure SetAllowJavascript(aAllowJavascript: PRBool); safecall;
    property AllowJavascript: PRBool read GetAllowJavascript write SetAllowJavascript;
    function GetAllowMetaRedirects(): PRBool; safecall;
    procedure SetAllowMetaRedirects(aAllowMetaRedirects: PRBool); safecall;
    property AllowMetaRedirects: PRBool read GetAllowMetaRedirects write SetAllowMetaRedirects;
    function GetAllowSubframes(): PRBool; safecall;
    procedure SetAllowSubframes(aAllowSubframes: PRBool); safecall;
    property AllowSubframes: PRBool read GetAllowSubframes write SetAllowSubframes;
    function GetAllowImages(): PRBool; safecall;
    procedure SetAllowImages(aAllowImages: PRBool); safecall;
    property AllowImages: PRBool read GetAllowImages write SetAllowImages;
    function GetDocShellEnumerator(aItemType: PRInt32; aDirection: PRInt32): nsISimpleEnumerator; safecall;
    function GetAppType(): PRUint32; safecall;
    procedure SetAppType(aAppType: PRUint32); safecall;
    property AppType: PRUint32 read GetAppType write SetAppType;
    function GetAllowAuth(): PRBool; safecall;
    procedure SetAllowAuth(aAllowAuth: PRBool); safecall;
    property AllowAuth: PRBool read GetAllowAuth write SetAllowAuth;
    function GetZoom(): Single; safecall;
    procedure SetZoom(aZoom: Single); safecall;
    property Zoom: Single read GetZoom write SetZoom;
    function GetMarginWidth(): PRInt32; safecall;
    procedure SetMarginWidth(aMarginWidth: PRInt32); safecall;
    property MarginWidth: PRInt32 read GetMarginWidth write SetMarginWidth;
    function GetMarginHeight(): PRInt32; safecall;
    procedure SetMarginHeight(aMarginHeight: PRInt32); safecall;
    property MarginHeight: PRInt32 read GetMarginHeight write SetMarginHeight;
    function GetHasFocus(): PRBool; safecall;
    procedure SetHasFocus(aHasFocus: PRBool); safecall;
    property HasFocus: PRBool read GetHasFocus write SetHasFocus;
    function GetCanvasHasFocus(): PRBool; safecall;
    procedure SetCanvasHasFocus(aCanvasHasFocus: PRBool); safecall;
    property CanvasHasFocus: PRBool read GetCanvasHasFocus write SetCanvasHasFocus;
    procedure TabToTreeOwner(forward: PRBool; out tookFocus: PRBool); safecall;
    function GetBusyFlags(): PRUint32; safecall;
    property BusyFlags: PRUint32 read GetBusyFlags;
    function GetLoadType(): PRUint32; safecall;
    procedure SetLoadType(aLoadType: PRUint32); safecall;
    property LoadType: PRUint32 read GetLoadType write SetLoadType;
    function IsBeingDestroyed(): PRBool; safecall;
    function GetIsExecutingOnLoadHandler(): PRBool; safecall;
    property IsExecutingOnLoadHandler: PRBool read GetIsExecutingOnLoadHandler;
    function GetLayoutHistoryState(): nsILayoutHistoryState; safecall;
    procedure SetLayoutHistoryState(aLayoutHistoryState: nsILayoutHistoryState); safecall;
    property LayoutHistoryState: nsILayoutHistoryState read GetLayoutHistoryState write SetLayoutHistoryState;
    function GetShouldSaveLayoutState(): PRBool; safecall;
    property ShouldSaveLayoutState: PRBool read GetShouldSaveLayoutState;
    function GetSecurityUI(): nsISecureBrowserUI; safecall;
    procedure SetSecurityUI(aSecurityUI: nsISecureBrowserUI); safecall;
    property SecurityUI: nsISecureBrowserUI read GetSecurityUI write SetSecurityUI;
    procedure SuspendRefreshURIs(); safecall;
    procedure ResumeRefreshURIs(); safecall;
    procedure BeginRestore(viewer: nsIContentViewer; top: PRBool); safecall;
    procedure FinishRestore(); safecall;
    function GetRestoringDocument(): PRBool; safecall;
    property RestoringDocument: PRBool read GetRestoringDocument;
    function GetUseErrorPages(): PRBool; safecall;
    procedure SetUseErrorPages(aUseErrorPages: PRBool); safecall;
    property UseErrorPages: PRBool read GetUseErrorPages write SetUseErrorPages;
    function GetPreviousTransIndex(): PRInt32; safecall;
    property PreviousTransIndex: PRInt32 read GetPreviousTransIndex;
    function GetLoadedTransIndex(): PRInt32; safecall;
    property LoadedTransIndex: PRInt32 read GetLoadedTransIndex;
    procedure HistoryPurged(numEntries: PRInt32); safecall;
    function GetSessionStorageForURI(uri: nsIURI): nsIDOMStorage; safecall;
    procedure AddSessionStorage(const aDomain: nsACString; storage: nsIDOMStorage); safecall;
    function GetCurrentDocumentChannel(): nsIChannel; safecall;
    property CurrentDocumentChannel: nsIChannel read GetCurrentDocumentChannel;
    procedure SetChildOffset(offset: PRUint32); safecall;
    function GetIsInUnload(): PRBool; safecall;
    property IsInUnload: PRBool read GetIsInUnload;
    function GetChannelIsUnsafe(): PRBool; safecall;
    property ChannelIsUnsafe: PRBool read GetChannelIsUnsafe;
    procedure DetachEditorFromWindow(); stdcall;
  end;

  nsIDocShellHistory = interface(nsISupports)
  ['{89caa9f0-8b1c-47fb-b0d3-f0aef0bff749}']
    function GetChildSHEntry(aChildOffset: PRInt32): nsISHEntry; safecall;
    procedure AddChildSHEntry(aCloneReference: nsISHEntry; aHistoryEntry: nsISHEntry; aChildOffset: PRInt32); safecall;
    function GetUseGlobalHistory(): PRBool; safecall;
    procedure SetUseGlobalHistory(aUseGlobalHistory: PRBool); safecall;
    property UseGlobalHistory: PRBool read GetUseGlobalHistory write SetUseGlobalHistory;
  end;

  nsIDocShellLoadInfo = interface(nsISupports)
  ['{4f813a88-7aca-4607-9896-d97270cdf15e}']
    function GetReferrer(): nsIURI; safecall;
    procedure SetReferrer(aReferrer: nsIURI); safecall;
    property Referrer: nsIURI read GetReferrer write SetReferrer;
    function GetOwner(): nsISupports; safecall;
    procedure SetOwner(aOwner: nsISupports); safecall;
    property Owner: nsISupports read GetOwner write SetOwner;
    function GetInheritOwner(): PRBool; safecall;
    procedure SetInheritOwner(aInheritOwner: PRBool); safecall;
    property InheritOwner: PRBool read GetInheritOwner write SetInheritOwner;
    function GetLoadType(): nsDocShellInfoLoadType; safecall;
    procedure SetLoadType(aLoadType: nsDocShellInfoLoadType); safecall;
    property LoadType: nsDocShellInfoLoadType read GetLoadType write SetLoadType;
    function GetSHEntry(): nsISHEntry; safecall;
    procedure SetSHEntry(aSHEntry: nsISHEntry); safecall;
    property SHEntry: nsISHEntry read GetSHEntry write SetSHEntry;
    function GetTarget(): PWideChar; safecall;
    procedure SetTarget(const aTarget: PWideChar); safecall;
    property Target: PWideChar read GetTarget write SetTarget;
    function GetPostDataStream(): nsIInputStream; safecall;
    procedure SetPostDataStream(aPostDataStream: nsIInputStream); safecall;
    property PostDataStream: nsIInputStream read GetPostDataStream write SetPostDataStream;
    function GetHeadersStream(): nsIInputStream; safecall;
    procedure SetHeadersStream(aHeadersStream: nsIInputStream); safecall;
    property HeadersStream: nsIInputStream read GetHeadersStream write SetHeadersStream;
    function GetSendReferrer(): PRBool; safecall;
    procedure SetSendReferrer(aSendReferrer: PRBool); safecall;
    property SendReferrer: PRBool read GetSendReferrer write SetSendReferrer;
  end;

  nsIDocShellTreeNode = interface(nsISupports)
  ['{37f1ab73-f224-44b1-82f0-d2834ab1cec0}']
    function GetChildCount(): PRInt32; safecall;
    property ChildCount: PRInt32 read GetChildCount;
    procedure AddChild(child: nsIDocShellTreeItem); safecall;
    procedure RemoveChild(child: nsIDocShellTreeItem); safecall;
    function GetChildAt(index: PRInt32): nsIDocShellTreeItem; safecall;
    function FindChildWithName(const aName: PWideChar; aRecurse: PRBool; aSameType: PRBool; aRequestor: nsIDocShellTreeItem; aOriginalRequestor: nsIDocShellTreeItem): nsIDocShellTreeItem; safecall;
  end;

  nsIDocShellTreeItem = interface(nsIDocShellTreeNode)
  ['{09b54ec1-d98a-49a9-bc95-3219e8b55089}']
    function GetName(): PWideChar; safecall;
    procedure SetName(const aName: PWideChar); safecall;
    property Name: PWideChar read GetName write SetName;
    function NameEquals(const name: PWideChar): PRBool; safecall;
    function GetItemType(): PRInt32; safecall;
    procedure SetItemType(aItemType: PRInt32); safecall;
    property ItemType: PRInt32 read GetItemType write SetItemType;
    function GetParent(): nsIDocShellTreeItem; safecall;
    property Parent: nsIDocShellTreeItem read GetParent;
    function GetSameTypeParent(): nsIDocShellTreeItem; safecall;
    property SameTypeParent: nsIDocShellTreeItem read GetSameTypeParent;
    function GetRootTreeItem(): nsIDocShellTreeItem; safecall;
    property RootTreeItem: nsIDocShellTreeItem read GetRootTreeItem;
    function GetSameTypeRootTreeItem(): nsIDocShellTreeItem; safecall;
    property SameTypeRootTreeItem: nsIDocShellTreeItem read GetSameTypeRootTreeItem;
    function FindItemWithName(const name: PWideChar; aRequestor: nsISupports; aOriginalRequestor: nsIDocShellTreeItem): nsIDocShellTreeItem; safecall;
    function GetTreeOwner(): nsIDocShellTreeOwner; safecall;
    property TreeOwner: nsIDocShellTreeOwner read GetTreeOwner;
    procedure SetTreeOwner(treeOwner: nsIDocShellTreeOwner); safecall;
  end;

  nsIDocShellTreeOwner = interface(nsISupports)
  ['{bc0eb30e-656e-491e-a7ae-7f460b660c8d}']
    function FindItemWithName(const name: PWideChar; aRequestor: nsIDocShellTreeItem; aOriginalRequestor: nsIDocShellTreeItem): nsIDocShellTreeItem; safecall;
    procedure ContentShellAdded(aContentShell: nsIDocShellTreeItem; aPrimary: PRBool; aTargetable: PRBool; const aID: nsAString); safecall;
    procedure ContentShellRemoved(aContentShell: nsIDocShellTreeItem); safecall;
    function GetPrimaryContentShell(): nsIDocShellTreeItem; safecall;
    property PrimaryContentShell: nsIDocShellTreeItem read GetPrimaryContentShell;
    procedure SizeShellTo(shell: nsIDocShellTreeItem; cx: PRInt32; cy: PRInt32); safecall;
    procedure SetPersistence(aPersistPosition: PRBool; aPersistSize: PRBool; aPersistSizeMode: PRBool); safecall;
    procedure GetPersistence(out aPersistPosition: PRBool; out aPersistSize: PRBool; out aPersistSizeMode: PRBool); safecall;
  end;

  nsISHEntry = interface(nsIHistoryEntry)
  ['{c16fde76-3108-450e-8c8c-ae8286f286ed}']
    procedure SetURI(aURI: nsIURI); safecall;
    function GetReferrerURI(): nsIURI; safecall;
    procedure SetReferrerURI(aReferrerURI: nsIURI); safecall;
    property ReferrerURI: nsIURI read GetReferrerURI write SetReferrerURI;
    function GetContentViewer(): nsIContentViewer; safecall;
    procedure SetContentViewer(aContentViewer: nsIContentViewer); safecall;
    property ContentViewer: nsIContentViewer read GetContentViewer write SetContentViewer;
    function GetSticky(): PRBool; safecall;
    procedure SetSticky(aSticky: PRBool); safecall;
    property Sticky: PRBool read GetSticky write SetSticky;
    function GetWindowState(): nsISupports; safecall;
    procedure SetWindowState(aWindowState: nsISupports); safecall;
    property WindowState: nsISupports read GetWindowState write SetWindowState;
    procedure GetViewerBounds(var bounds: nsRect); safecall;
    procedure SetViewerBounds(var bounds: nsRect); safecall;
    procedure AddChildShell(shell: nsIDocShellTreeItem); safecall;
    function ChildShellAt(index: PRInt32): nsIDocShellTreeItem; safecall;
    procedure ClearChildShells(); safecall;
    function GetRefreshURIList(): nsISupportsArray; safecall;
    procedure SetRefreshURIList(aRefreshURIList: nsISupportsArray); safecall;
    property RefreshURIList: nsISupportsArray read GetRefreshURIList write SetRefreshURIList;
    procedure SyncPresentationState(); safecall;
    procedure SetTitle(const aTitle: nsAString); safecall;
    function GetPostData(): nsIInputStream; safecall;
    procedure SetPostData(aPostData: nsIInputStream); safecall;
    property PostData: nsIInputStream read GetPostData write SetPostData;
    function GetLayoutHistoryState(): nsILayoutHistoryState; safecall;
    procedure SetLayoutHistoryState(aLayoutHistoryState: nsILayoutHistoryState); safecall;
    property LayoutHistoryState: nsILayoutHistoryState read GetLayoutHistoryState write SetLayoutHistoryState;
    function GetParent(): nsISHEntry; safecall;
    procedure SetParent(aParent: nsISHEntry); safecall;
    property Parent: nsISHEntry read GetParent write SetParent;
    function GetLoadType(): PRUint32; safecall;
    procedure SetLoadType(aLoadType: PRUint32); safecall;
    property LoadType: PRUint32 read GetLoadType write SetLoadType;
    function GetID(): PRUint32; safecall;
    procedure SetID(aID: PRUint32); safecall;
    property ID: PRUint32 read GetID write SetID;
    function GetPageIdentifier(): PRUint32; safecall;
    procedure SetPageIdentifier(aPageIdentifier: PRUint32); safecall;
    property PageIdentifier: PRUint32 read GetPageIdentifier write SetPageIdentifier;
    function GetCacheKey(): nsISupports; safecall;
    procedure SetCacheKey(aCacheKey: nsISupports); safecall;
    property CacheKey: nsISupports read GetCacheKey write SetCacheKey;
    function GetSaveLayoutStateFlag(): PRBool; safecall;
    procedure SetSaveLayoutStateFlag(aSaveLayoutStateFlag: PRBool); safecall;
    property SaveLayoutStateFlag: PRBool read GetSaveLayoutStateFlag write SetSaveLayoutStateFlag;
    function GetExpirationStatus(): PRBool; safecall;
    procedure SetExpirationStatus(aExpirationStatus: PRBool); safecall;
    property ExpirationStatus: PRBool read GetExpirationStatus write SetExpirationStatus;
    procedure GetContentType(aContentType: nsACString); safecall;
    procedure SetContentType(const aContentType: nsACString); safecall;
    procedure SetScrollPosition(x: PRInt32; y: PRInt32); safecall;
    procedure GetScrollPosition(out x: PRInt32; out y: PRInt32); safecall;
    procedure Create(URI: nsIURI; const title: nsAString; inputStream: nsIInputStream; layoutHistoryState: nsILayoutHistoryState; cacheKey: nsISupports; const contentType: nsACString; owner: nsISupports); safecall;
    function Clone(): nsISHEntry; safecall;
    procedure SetIsSubFrame(aFlag: PRBool); safecall;
    function GetAnyContentViewer(out ownerEntry: nsISHEntry): nsIContentViewer; safecall;
    function GetOwner(): nsISupports; safecall;
    procedure SetOwner(aOwner: nsISupports); safecall;
    property Owner: nsISupports read GetOwner write SetOwner;
    function ForgetEditorData(): PnsDocShellEditorData; stdcall;
    procedure SetEditorData(aData: PnsDocShellEditorData); stdcall;
    function HasDetachedEditor(): PRBool; stdcall;
  end;

implementation

end.
