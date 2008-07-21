unit nsDOMWindowInternal;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IDOMWINDOWINTERNAL_IID: TGUID = '{0d12a345-3fe2-491e-af0d-bcfd5c4baa03}';

type
  nsIDOMWindowInternal = interface;
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

implementation

end.
