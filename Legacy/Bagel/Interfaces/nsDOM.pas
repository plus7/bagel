unit nsDOM;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IDOMWINDOWINTERNAL_IID: TGUID = '{0d12a345-3fe2-491e-af0d-bcfd5c4baa03}';

  NS_IDOMNAVIGATOR_IID: TGUID = '{8e150a70-3e51-45df-bee3-77505fbe016c}';

  NS_IDOMJSNAVIGATOR_IID: TGUID = '{4b4f8316-1dd2-11b2-b265-9a857376d159}';

  NS_IDOMSCREEN_IID: TGUID = '{77947960-b4af-11d2-bd93-00805f8ae3f4}';

  NS_IDOMHISTORY_IID: TGUID = '{896d1d20-b4c4-11d2-bd93-00805f8ae3f4}';

  NS_IDOMCRYPTO_IID: TGUID = '{d2b675a5-f05b-4172-bac2-24cc39ffd398}';

  NS_IDOMPKCS11_IID: TGUID = '{9fd42950-25e7-11d4-8a7d-006008c844c3}';

  NS_IDOMLOCATION_IID: TGUID = '{a6cf906d-15b3-11d2-932e-00805f8add32}';

  NS_IDOMMIMETYPEARRAY_IID: TGUID = '{f6134683-f28b-11d2-8360-c90899049c3c}';

  NS_IDOMPLUGINARRAY_IID: TGUID = '{f6134680-f28b-11d2-8360-c90899049c3c}';

  NS_IDOMJSPLUGINARRAY_IID: TGUID = '{ee753352-1dd1-11b2-b18d-b0b7320a28c3}';

  NS_IDOMCRMFOBJECT_IID: TGUID = '{16da46c0-208d-11d4-8a7c-006008c844c3}';

  NS_IDOMMIMETYPE_IID: TGUID = '{f6134682-f28b-11d2-8360-c90899049c3c}';

  NS_IDOMPLUGIN_IID: TGUID = '{f6134681-f28b-11d2-8360-c90899049c3c}';

  NS_IDOMNSHTMLELEMENT_IID: TGUID = '{eac0a4ee-2e4f-403c-9b77-5cf32cfb42f7}';

  NS_IDOMNSDOCUMENT_IID: TGUID = '{533a8131-8d0c-4ebf-990b-7fad7cd514ee}';

  NS_IDOMNSHTMLDOCUMENT_IID: TGUID = '{79beb289-3644-4b54-9432-9fb993945629}';

type
  nsIDOMWindowInternal = interface;
  nsIDOMNavigator = interface;
  nsIDOMJSNavigator = interface;
  nsIDOMScreen = interface;
  nsIDOMHistory = interface;
  nsIDOMCrypto = interface;
  nsIDOMPkcs11 = interface;
  nsIDOMLocation = interface;
  nsIDOMMimeTypeArray = interface;
  nsIDOMPluginArray = interface;
  nsIDOMJSPluginArray = interface;
  nsIDOMCRMFObject = interface;
  nsIDOMMimeType = interface;
  nsIDOMPlugin = interface;
  nsIDOMNSHTMLElement = interface;
  nsIDOMNSDocument = interface;
  nsIDOMNSHTMLDocument = interface;
  nsIDOMWindowInternal = interface(nsIDOMWindow2)
  ['{0d12a345-3fe2-491e-af0d-bcfd5c4baa03}']
    function GetWindow(): nsIDOMWindowInternal; safecall;
    property Window: nsIDOMWindowInternal read GetWindow;
    function GetSelf(): nsIDOMWindowInternal; safecall;
    property _Self: nsIDOMWindowInternal read GetSelf;
    function GetNavigator(): nsIDOMNavigator; safecall;
    property Navigator: nsIDOMNavigator read GetNavigator;
    function GetScreen(): nsIDOMScreen; safecall;
    property Screen: nsIDOMScreen read GetScreen;
    function GetHistory(): nsIDOMHistory; safecall;
    property History: nsIDOMHistory read GetHistory;
    function GetContent(): nsIDOMWindow; safecall;
    property Content: nsIDOMWindow read GetContent;
    function GetPrompter(): nsIPrompt; safecall;
    property Prompter: nsIPrompt read GetPrompter;
    function GetMenubar(): nsIDOMBarProp; safecall;
    property Menubar: nsIDOMBarProp read GetMenubar;
    function GetToolbar(): nsIDOMBarProp; safecall;
    property Toolbar: nsIDOMBarProp read GetToolbar;
    function GetLocationbar(): nsIDOMBarProp; safecall;
    property Locationbar: nsIDOMBarProp read GetLocationbar;
    function GetPersonalbar(): nsIDOMBarProp; safecall;
    property Personalbar: nsIDOMBarProp read GetPersonalbar;
    function GetStatusbar(): nsIDOMBarProp; safecall;
    property Statusbar: nsIDOMBarProp read GetStatusbar;
    function GetDirectories(): nsIDOMBarProp; safecall;
    property Directories: nsIDOMBarProp read GetDirectories;
    function GetClosed(): PRBool; safecall;
    property Closed: PRBool read GetClosed;
    function GetCrypto(): nsIDOMCrypto; safecall;
    property Crypto: nsIDOMCrypto read GetCrypto;
    function GetPkcs11(): nsIDOMPkcs11; safecall;
    property Pkcs11: nsIDOMPkcs11 read GetPkcs11;
    function GetControllers(): nsIControllers; safecall;
    property Controllers: nsIControllers read GetControllers;
    function GetOpener(): nsIDOMWindowInternal; safecall;
    procedure SetOpener(aOpener: nsIDOMWindowInternal); safecall;
    property Opener: nsIDOMWindowInternal read GetOpener write SetOpener;
    procedure GetStatus(aStatus: nsAString); safecall;
    procedure SetStatus(const aStatus: nsAString); safecall;
    procedure GetDefaultStatus(aDefaultStatus: nsAString); safecall;
    procedure SetDefaultStatus(const aDefaultStatus: nsAString); safecall;
    function GetLocation(): nsIDOMLocation; safecall;
    property Location: nsIDOMLocation read GetLocation;
    function GetInnerWidth(): PRInt32; safecall;
    procedure SetInnerWidth(aInnerWidth: PRInt32); safecall;
    property InnerWidth: PRInt32 read GetInnerWidth write SetInnerWidth;
    function GetInnerHeight(): PRInt32; safecall;
    procedure SetInnerHeight(aInnerHeight: PRInt32); safecall;
    property InnerHeight: PRInt32 read GetInnerHeight write SetInnerHeight;
    function GetOuterWidth(): PRInt32; safecall;
    procedure SetOuterWidth(aOuterWidth: PRInt32); safecall;
    property OuterWidth: PRInt32 read GetOuterWidth write SetOuterWidth;
    function GetOuterHeight(): PRInt32; safecall;
    procedure SetOuterHeight(aOuterHeight: PRInt32); safecall;
    property OuterHeight: PRInt32 read GetOuterHeight write SetOuterHeight;
    function GetScreenX(): PRInt32; safecall;
    procedure SetScreenX(aScreenX: PRInt32); safecall;
    property ScreenX: PRInt32 read GetScreenX write SetScreenX;
    function GetScreenY(): PRInt32; safecall;
    procedure SetScreenY(aScreenY: PRInt32); safecall;
    property ScreenY: PRInt32 read GetScreenY write SetScreenY;
    function GetPageXOffset(): PRInt32; safecall;
    property PageXOffset: PRInt32 read GetPageXOffset;
    function GetPageYOffset(): PRInt32; safecall;
    property PageYOffset: PRInt32 read GetPageYOffset;
    function GetScrollMaxX(): PRInt32; safecall;
    property ScrollMaxX: PRInt32 read GetScrollMaxX;
    function GetScrollMaxY(): PRInt32; safecall;
    property ScrollMaxY: PRInt32 read GetScrollMaxY;
    function GetLength(): PRUint32; safecall;
    property Length: PRUint32 read GetLength;
    function GetFullScreen(): PRBool; safecall;
    procedure SetFullScreen(aFullScreen: PRBool); safecall;
    property FullScreen: PRBool read GetFullScreen write SetFullScreen;
    procedure Alert(const text: nsAString); safecall;
    function Confirm(const text: nsAString): PRBool; safecall;
    procedure Prompt(const aMessage: nsAString; const aInitial: nsAString; const aTitle: nsAString; aSavePassword: PRUint32; _retval: nsAString); safecall;
    procedure Focus(); safecall;
    procedure Blur(); safecall;
    procedure Back(); safecall;
    procedure Forward(); safecall;
    procedure Home(); safecall;
    procedure Stop(); safecall;
    procedure Print(); safecall;
    procedure MoveTo(xPos: PRInt32; yPos: PRInt32); safecall;
    procedure MoveBy(xDif: PRInt32; yDif: PRInt32); safecall;
    procedure ResizeTo(width: PRInt32; height: PRInt32); safecall;
    procedure ResizeBy(widthDif: PRInt32; heightDif: PRInt32); safecall;
    procedure Scroll(xScroll: PRInt32; yScroll: PRInt32); safecall;
    function Open(const url: nsAString; const name: nsAString; const options: nsAString): nsIDOMWindow; safecall;
    function OpenDialog(const url: nsAString; const name: nsAString; const options: nsAString; aExtraArgument: nsISupports): nsIDOMWindow; safecall;
    procedure Close(); safecall;
    procedure UpdateCommands(const action: nsAString); safecall;
    function Find(const str: nsAString; caseSensitive: PRBool; backwards: PRBool; wrapAround: PRBool; wholeWord: PRBool; searchInFrames: PRBool; showDialog: PRBool): PRBool; safecall;
    procedure Atob(const aAsciiString: nsAString; _retval: nsAString); safecall;
    procedure Btoa(const aBase64Data: nsAString; _retval: nsAString); safecall;
    function GetFrameElement(): nsIDOMElement; safecall;
    property FrameElement: nsIDOMElement read GetFrameElement;
    function ShowModalDialog(const aURI: nsAString; aArgs: nsIVariant; const aOptions: nsAString): nsIVariant; safecall;
  end;

  nsIDOMNavigator = interface(nsISupports)
  ['{8e150a70-3e51-45df-bee3-77505fbe016c}']
    procedure GetAppCodeName(aAppCodeName: nsAString); safecall;
    procedure GetAppName(aAppName: nsAString); safecall;
    procedure GetAppVersion(aAppVersion: nsAString); safecall;
    procedure GetLanguage(aLanguage: nsAString); safecall;
    function GetMimeTypes(): nsIDOMMimeTypeArray; safecall;
    property MimeTypes: nsIDOMMimeTypeArray read GetMimeTypes;
    procedure GetPlatform(aPlatform: nsAString); safecall;
    procedure GetOscpu(aOscpu: nsAString); safecall;
    procedure GetVendor(aVendor: nsAString); safecall;
    procedure GetVendorSub(aVendorSub: nsAString); safecall;
    procedure GetProduct(aProduct: nsAString); safecall;
    procedure GetProductSub(aProductSub: nsAString); safecall;
    function GetPlugins(): nsIDOMPluginArray; safecall;
    property Plugins: nsIDOMPluginArray read GetPlugins;
    procedure GetSecurityPolicy(aSecurityPolicy: nsAString); safecall;
    procedure GetUserAgent(aUserAgent: nsAString); safecall;
    function GetCookieEnabled(): PRBool; safecall;
    property CookieEnabled: PRBool read GetCookieEnabled;
    function GetOnLine(): PRBool; safecall;
    property OnLine: PRBool read GetOnLine;
    procedure GetBuildID(aBuildID: nsAString); safecall;
    function JavaEnabled(): PRBool; safecall;
    function TaintEnabled(): PRBool; safecall;
  end;

  nsIDOMJSNavigator = interface(nsISupports)
  ['{4b4f8316-1dd2-11b2-b265-9a857376d159}']
    procedure Preference(); safecall;
  end;

  nsIDOMScreen = interface(nsISupports)
  ['{77947960-b4af-11d2-bd93-00805f8ae3f4}']
    function GetTop(): PRInt32; safecall;
    property Top: PRInt32 read GetTop;
    function GetLeft(): PRInt32; safecall;
    property Left: PRInt32 read GetLeft;
    function GetWidth(): PRInt32; safecall;
    property Width: PRInt32 read GetWidth;
    function GetHeight(): PRInt32; safecall;
    property Height: PRInt32 read GetHeight;
    function GetPixelDepth(): PRInt32; safecall;
    property PixelDepth: PRInt32 read GetPixelDepth;
    function GetColorDepth(): PRInt32; safecall;
    property ColorDepth: PRInt32 read GetColorDepth;
    function GetAvailWidth(): PRInt32; safecall;
    property AvailWidth: PRInt32 read GetAvailWidth;
    function GetAvailHeight(): PRInt32; safecall;
    property AvailHeight: PRInt32 read GetAvailHeight;
    function GetAvailLeft(): PRInt32; safecall;
    property AvailLeft: PRInt32 read GetAvailLeft;
    function GetAvailTop(): PRInt32; safecall;
    property AvailTop: PRInt32 read GetAvailTop;
  end;

  nsIDOMHistory = interface(nsISupports)
  ['{896d1d20-b4c4-11d2-bd93-00805f8ae3f4}']
    function GetLength(): PRInt32; safecall;
    property Length: PRInt32 read GetLength;
    procedure GetCurrent(aCurrent: nsAString); safecall;
    procedure GetPrevious(aPrevious: nsAString); safecall;
    procedure GetNext(aNext: nsAString); safecall;
    procedure Back(); safecall;
    procedure Forward(); safecall;
    procedure Go(aDelta: PRInt32); safecall;
    procedure Item(index: PRUint32; _retval: nsAString); safecall;
  end;

  nsIDOMCrypto = interface(nsISupports)
  ['{d2b675a5-f05b-4172-bac2-24cc39ffd398}']
    procedure GetVersion(aVersion: nsAString); safecall;
    function GetEnableSmartCardEvents(): PRBool; safecall;
    procedure SetEnableSmartCardEvents(aEnableSmartCardEvents: PRBool); safecall;
    property EnableSmartCardEvents: PRBool read GetEnableSmartCardEvents write SetEnableSmartCardEvents;
    function GenerateCRMFRequest(): nsIDOMCRMFObject; safecall;
    procedure ImportUserCertificates(const nickname: nsAString; const cmmfResponse: nsAString; doForcedBackup: PRBool; _retval: nsAString); safecall;
    procedure PopChallengeResponse(const challenge: nsAString; _retval: nsAString); safecall;
    procedure Random(numBytes: PRInt32; _retval: nsAString); safecall;
    procedure SignText(const stringToSign: nsAString; const caOption: nsAString; _retval: nsAString); safecall;
    procedure Alert(const message: nsAString); safecall;
    procedure Logout(); safecall;
    procedure DisableRightClick(); safecall;
  end;

  nsIDOMPkcs11 = interface(nsISupports)
  ['{9fd42950-25e7-11d4-8a7d-006008c844c3}']
    function Deletemodule(const moduleName: nsAString): PRInt32; safecall;
    function Addmodule(const moduleName: nsAString; const libraryFullPath: nsAString; cryptoMechanismFlags: PRInt32; cipherFlags: PRInt32): PRInt32; safecall;
  end;

  nsIDOMLocation = interface(nsISupports)
  ['{a6cf906d-15b3-11d2-932e-00805f8add32}']
    procedure GetHash(aHash: nsAString); safecall;
    procedure SetHash(const aHash: nsAString); safecall;
    procedure GetHost(aHost: nsAString); safecall;
    procedure SetHost(const aHost: nsAString); safecall;
    procedure GetHostname(aHostname: nsAString); safecall;
    procedure SetHostname(const aHostname: nsAString); safecall;
    procedure GetHref(aHref: nsAString); safecall;
    procedure SetHref(const aHref: nsAString); safecall;
    procedure GetPathname(aPathname: nsAString); safecall;
    procedure SetPathname(const aPathname: nsAString); safecall;
    procedure GetPort(aPort: nsAString); safecall;
    procedure SetPort(const aPort: nsAString); safecall;
    procedure GetProtocol(aProtocol: nsAString); safecall;
    procedure SetProtocol(const aProtocol: nsAString); safecall;
    procedure GetSearch(aSearch: nsAString); safecall;
    procedure SetSearch(const aSearch: nsAString); safecall;
    procedure Reload(forceget: PRBool); safecall;
    procedure Replace(const url: nsAString); safecall;
    procedure Assign(const url: nsAString); safecall;
    procedure ToString(_retval: nsAString); safecall;
  end;

  nsIDOMMimeTypeArray = interface(nsISupports)
  ['{f6134683-f28b-11d2-8360-c90899049c3c}']
    function GetLength(): PRUint32; safecall;
    property Length: PRUint32 read GetLength;
    function Item(index: PRUint32): nsIDOMMimeType; safecall;
    function NamedItem(const name: nsAString): nsIDOMMimeType; safecall;
  end;

  nsIDOMPluginArray = interface(nsISupports)
  ['{f6134680-f28b-11d2-8360-c90899049c3c}']
    function GetLength(): PRUint32; safecall;
    property Length: PRUint32 read GetLength;
    function Item(index: PRUint32): nsIDOMPlugin; safecall;
    function NamedItem(const name: nsAString): nsIDOMPlugin; safecall;
    procedure Refresh(reloadDocuments: PRBool); safecall;
  end;

  nsIDOMJSPluginArray = interface(nsISupports)
  ['{ee753352-1dd1-11b2-b18d-b0b7320a28c3}']
    procedure Refresh(); safecall;
  end;

  nsIDOMCRMFObject = interface(nsISupports)
  ['{16da46c0-208d-11d4-8a7c-006008c844c3}']
    procedure GetRequest(aRequest: nsAString); safecall;
  end;

  nsIDOMMimeType = interface(nsISupports)
  ['{f6134682-f28b-11d2-8360-c90899049c3c}']
    procedure GetDescription(aDescription: nsAString); safecall;
    function GetEnabledPlugin(): nsIDOMPlugin; safecall;
    property EnabledPlugin: nsIDOMPlugin read GetEnabledPlugin;
    procedure GetSuffixes(aSuffixes: nsAString); safecall;
    procedure GetType(aType: nsAString); safecall;
  end;

  nsIDOMPlugin = interface(nsISupports)
  ['{f6134681-f28b-11d2-8360-c90899049c3c}']
    procedure GetDescription(aDescription: nsAString); safecall;
    procedure GetFilename(aFilename: nsAString); safecall;
    procedure GetName(aName: nsAString); safecall;
    function GetLength(): PRUint32; safecall;
    property Length: PRUint32 read GetLength;
    function Item(index: PRUint32): nsIDOMMimeType; safecall;
    function NamedItem(const name: nsAString): nsIDOMMimeType; safecall;
  end;

  nsIDOMNSHTMLElement = interface(nsISupports)
  ['{eac0a4ee-2e4f-403c-9b77-5cf32cfb42f7}']
    function GetOffsetTop(): PRInt32; safecall;
    property OffsetTop: PRInt32 read GetOffsetTop;
    function GetOffsetLeft(): PRInt32; safecall;
    property OffsetLeft: PRInt32 read GetOffsetLeft;
    function GetOffsetWidth(): PRInt32; safecall;
    property OffsetWidth: PRInt32 read GetOffsetWidth;
    function GetOffsetHeight(): PRInt32; safecall;
    property OffsetHeight: PRInt32 read GetOffsetHeight;
    function GetOffsetParent(): nsIDOMElement; safecall;
    property OffsetParent: nsIDOMElement read GetOffsetParent;
    procedure GetInnerHTML(aInnerHTML: nsAString); safecall;
    procedure SetInnerHTML(const aInnerHTML: nsAString); safecall;
    function GetScrollTop(): PRInt32; safecall;
    procedure SetScrollTop(aScrollTop: PRInt32); safecall;
    property ScrollTop: PRInt32 read GetScrollTop write SetScrollTop;
    function GetScrollLeft(): PRInt32; safecall;
    procedure SetScrollLeft(aScrollLeft: PRInt32); safecall;
    property ScrollLeft: PRInt32 read GetScrollLeft write SetScrollLeft;
    function GetScrollHeight(): PRInt32; safecall;
    property ScrollHeight: PRInt32 read GetScrollHeight;
    function GetScrollWidth(): PRInt32; safecall;
    property ScrollWidth: PRInt32 read GetScrollWidth;
    function GetClientTop(): PRInt32; safecall;
    property ClientTop: PRInt32 read GetClientTop;
    function GetClientLeft(): PRInt32; safecall;
    property ClientLeft: PRInt32 read GetClientLeft;
    function GetClientHeight(): PRInt32; safecall;
    property ClientHeight: PRInt32 read GetClientHeight;
    function GetClientWidth(): PRInt32; safecall;
    property ClientWidth: PRInt32 read GetClientWidth;
    function GetTabIndex(): PRInt32; safecall;
    procedure SetTabIndex(aTabIndex: PRInt32); safecall;
    property TabIndex: PRInt32 read GetTabIndex write SetTabIndex;
    procedure GetContentEditable(aContentEditable: nsAString); safecall;
    procedure SetContentEditable(const aContentEditable: nsAString); safecall;
    procedure Blur(); safecall;
    procedure Focus(); safecall;
    procedure ScrollIntoView(top: PRBool); safecall;
    function GetSpellcheck(): PRBool; safecall;
    procedure SetSpellcheck(aSpellcheck: PRBool); safecall;
    property Spellcheck: PRBool read GetSpellcheck write SetSpellcheck;
  end;

  nsIDOMNSDocument = interface(nsISupports)
  ['{533a8131-8d0c-4ebf-990b-7fad7cd514ee}']
    procedure GetCharacterSet(aCharacterSet: nsAString); safecall;
    procedure GetDir(aDir: nsAString); safecall;
    procedure SetDir(const aDir: nsAString); safecall;
    function GetLocation(): nsIDOMLocation; safecall;
    property Location: nsIDOMLocation read GetLocation;
    procedure GetTitle(aTitle: nsAString); safecall;
    procedure SetTitle(const aTitle: nsAString); safecall;
    procedure GetContentType(aContentType: nsAString); safecall;
    procedure GetLastModified(aLastModified: nsAString); safecall;
    procedure GetReferrer(aReferrer: nsAString); safecall;
    function GetBoxObjectFor(elt: nsIDOMElement): nsIBoxObject; safecall;
    function HasFocus(): PRBool; safecall;
    function GetActiveElement(): nsIDOMElement; safecall;
    property ActiveElement: nsIDOMElement read GetActiveElement;
    function GetElementsByClassName(const classes: nsAString): nsIDOMNodeList; safecall;
    function ElementFromPoint(x: PRInt32; y: PRInt32): nsIDOMElement; safecall;
  end;

  nsIDOMWindowUtils = interface(nsISupports)
  ['{7a55fc2b-afb3-41c6-9e50-3fee341fa87c}']
    function GetImageAnimationMode(): PRUint16; safecall;
    procedure SetImageAnimationMode(aImageAnimationMode: PRUint16); safecall;
    property ImageAnimationMode: PRUint16 read GetImageAnimationMode write SetImageAnimationMode;
    function GetDocCharsetIsForced(): PRBool; safecall;
    property DocCharsetIsForced: PRBool read GetDocCharsetIsForced;
    procedure GetDocumentMetadata(const aName: nsAString; _retval: nsAString); safecall;
    procedure Redraw(); safecall;
    procedure SendMouseEvent(const aType: nsAString; aX: PRInt32; aY: PRInt32; aButton: PRInt32; aClickCount: PRInt32; aModifiers: PRInt32); safecall;
    procedure SendKeyEvent(const aType: nsAString; aKeyCode: PRInt32; aCharCode: PRInt32; aModifiers: PRInt32); safecall;
    procedure Focus(aElement: nsIDOMElement); safecall;
    procedure GarbageCollect(); safecall;
  end;

  nsIDOMNSHTMLDocument = interface(nsISupports)
  ['{79beb289-3644-4b54-9432-9fb993945629}']
    function GetWidth(): PRInt32; safecall;
    property Width: PRInt32 read GetWidth;
    function GetHeight(): PRInt32; safecall;
    property Height: PRInt32 read GetHeight;
    procedure GetAlinkColor(aAlinkColor: nsAString); safecall;
    procedure SetAlinkColor(const aAlinkColor: nsAString); safecall;
    procedure GetLinkColor(aLinkColor: nsAString); safecall;
    procedure SetLinkColor(const aLinkColor: nsAString); safecall;
    procedure GetVlinkColor(aVlinkColor: nsAString); safecall;
    procedure SetVlinkColor(const aVlinkColor: nsAString); safecall;
    procedure GetBgColor(aBgColor: nsAString); safecall;
    procedure SetBgColor(const aBgColor: nsAString); safecall;
    procedure GetFgColor(aFgColor: nsAString); safecall;
    procedure SetFgColor(const aFgColor: nsAString); safecall;
    procedure GetDomain(aDomain: nsAString); safecall;
    procedure SetDomain(const aDomain: nsAString); safecall;
    function GetEmbeds(): nsIDOMHTMLCollection; safecall;
    property Embeds: nsIDOMHTMLCollection read GetEmbeds;
    procedure GetSelection(_retval: nsAString); safecall;
    function Open(const aContentType: nsACString; aReplace: PRBool): nsIDOMDocument; safecall;
    procedure Write(); safecall;
    procedure Writeln(); safecall;
    procedure Clear(); safecall;
    procedure CaptureEvents(eventFlags: PRInt32); safecall;
    procedure ReleaseEvents(eventFlags: PRInt32); safecall;
    procedure RouteEvent(evt: nsIDOMEvent); safecall;
    procedure GetCompatMode(aCompatMode: nsAString); safecall;
    function GetPlugins(): nsIDOMHTMLCollection; safecall;
    property Plugins: nsIDOMHTMLCollection read GetPlugins;
    procedure GetDesignMode(aDesignMode: nsAString); safecall;
    procedure SetDesignMode(const aDesignMode: nsAString); safecall;
    function ExecCommand(const commandID: nsAString; doShowUI: PRBool; const value: nsAString): PRBool; safecall;
    function ExecCommandShowHelp(const commandID: nsAString): PRBool; safecall;
    function QueryCommandEnabled(const commandID: nsAString): PRBool; safecall;
    function QueryCommandIndeterm(const commandID: nsAString): PRBool; safecall;
    function QueryCommandState(const commandID: nsAString): PRBool; safecall;
    function QueryCommandSupported(const commandID: nsAString): PRBool; safecall;
    procedure QueryCommandText(const commandID: nsAString; _retval: nsAString); safecall;
    procedure QueryCommandValue(const commandID: nsAString; _retval: nsAString); safecall;
  end;

implementation

end.
