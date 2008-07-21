unit nsMIMEInfo;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings, nsStringEnumerator;

const
  NS_IHANDLERINFO_IID: TGUID = '{325e56a7-3762-4312-aec7-f1fcf84b4145}';
  NS_IHANDLERINFO_saveToDisk = 0;
  NS_IHANDLERINFO_alwaysAsk = 1;
  NS_IHANDLERINFO_useHelperApp = 2;
  NS_IHANDLERINFO_handleInternally = 3;
  NS_IHANDLERINFO_useSystemDefault = 4;

  NS_IMIMEINFO_IID: TGUID = '{cd7083f8-5fe9-4248-bb09-0b0e2982fde8}';

  NS_IHANDLERAPP_IID: TGUID = '{8d298761-0963-4c90-99e2-6ea498825e82}';

  NS_ILOCALHANDLERAPP_IID: TGUID = '{9812be73-273c-478c-8170-c3e0db08ae7c}';

  NS_IWEBHANDLERAPP_IID: TGUID = '{7521a093-c498-45ce-b462-df7ba0d882f6}';

type
  nsIHandlerInfo = interface;
  nsIMIMEInfo = interface;
  nsIHandlerApp = interface;
  nsILocalHandlerApp = interface;
  nsIWebHandlerApp = interface;
  nsHandlerInfoAction = PRInt32;
  nsIHandlerInfo = interface(nsISupports)
  ['{325e56a7-3762-4312-aec7-f1fcf84b4145}']
    procedure GetType(aType: nsACString); safecall;
    procedure GetDescription(aDescription: nsAString); safecall;
    procedure SetDescription(const aDescription: nsAString); safecall;
    function GetPreferredApplicationHandler(): nsIHandlerApp; safecall;
    procedure SetPreferredApplicationHandler(aPreferredApplicationHandler: nsIHandlerApp); safecall;
    property PreferredApplicationHandler: nsIHandlerApp read GetPreferredApplicationHandler write SetPreferredApplicationHandler;
    function GetPossibleApplicationHandlers(): nsIMutableArray; safecall;
    property PossibleApplicationHandlers: nsIMutableArray read GetPossibleApplicationHandlers;
    function GetHasDefaultHandler(): PRBool; safecall;
    property HasDefaultHandler: PRBool read GetHasDefaultHandler;
    procedure GetDefaultDescription(aDefaultDescription: nsAString); safecall;
    procedure LaunchWithURI(aURI: nsIURI; aWindowContext: nsIInterfaceRequestor); safecall;
    function GetPreferredAction(): nsHandlerInfoAction; safecall;
    procedure SetPreferredAction(aPreferredAction: nsHandlerInfoAction); safecall;
    property PreferredAction: nsHandlerInfoAction read GetPreferredAction write SetPreferredAction;
    function GetAlwaysAskBeforeHandling(): PRBool; safecall;
    procedure SetAlwaysAskBeforeHandling(aAlwaysAskBeforeHandling: PRBool); safecall;
    property AlwaysAskBeforeHandling: PRBool read GetAlwaysAskBeforeHandling write SetAlwaysAskBeforeHandling;
  end;

  nsIMIMEInfo = interface(nsIHandlerInfo)
  ['{cd7083f8-5fe9-4248-bb09-0b0e2982fde8}']
    function GetFileExtensions(): nsIUTF8StringEnumerator; safecall;
    procedure SetFileExtensions(const aExtensions: nsACString); safecall;
    function ExtensionExists(const aExtension: nsACString): PRBool; safecall;
    procedure AppendExtension(const aExtension: nsACString); safecall;
    procedure GetPrimaryExtension(aPrimaryExtension: nsACString); safecall;
    procedure SetPrimaryExtension(const aPrimaryExtension: nsACString); safecall;
    procedure GetMIMEType(aMIMEType: nsACString); safecall;
    function GetMacType(): PRUint32; safecall;
    procedure SetMacType(aMacType: PRUint32); safecall;
    property MacType: PRUint32 read GetMacType write SetMacType;
    function GetMacCreator(): PRUint32; safecall;
    procedure SetMacCreator(aMacCreator: PRUint32); safecall;
    property MacCreator: PRUint32 read GetMacCreator write SetMacCreator;
    function Equals(aMIMEInfo: nsIMIMEInfo): PRBool; safecall;
    function GetPossibleLocalHandlers(): nsIArray; safecall;
    property PossibleLocalHandlers: nsIArray read GetPossibleLocalHandlers;
    procedure LaunchWithFile(aFile: nsIFile); safecall;
  end;

  nsIHandlerApp = interface(nsISupports)
  ['{8d298761-0963-4c90-99e2-6ea498825e82}']
    procedure GetName(aName: nsAString); safecall;
    procedure SetName(const aName: nsAString); safecall;
    function Equals(aHandlerApp: nsIHandlerApp): PRBool; safecall;
    procedure LaunchWithURI(aURI: nsIURI; aWindowContext: nsIInterfaceRequestor); safecall;
  end;

  nsILocalHandlerApp = interface(nsIHandlerApp)
  ['{9812be73-273c-478c-8170-c3e0db08ae7c}']
    function GetExecutable(): nsIFile; safecall;
    procedure SetExecutable(aExecutable: nsIFile); safecall;
    property Executable: nsIFile read GetExecutable write SetExecutable;
  end;

  nsIWebHandlerApp = interface(nsIHandlerApp)
  ['{7521a093-c498-45ce-b462-df7ba0d882f6}']
    procedure GetUriTemplate(aUriTemplate: nsACString); safecall;
    procedure SetUriTemplate(const aUriTemplate: nsACString); safecall;
  end;

implementation

end.
