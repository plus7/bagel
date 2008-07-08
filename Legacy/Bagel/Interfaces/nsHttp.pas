unit nsHttp;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IPROTOCOLHANDLER_IID: TGUID = '{15fd6940-8ea7-11d3-93ad-00104ba0fd40}';
  NS_IPROTOCOLHANDLER_URI_STD = 0;
  NS_IPROTOCOLHANDLER_URI_NORELATIVE = 1;
  NS_IPROTOCOLHANDLER_URI_NOAUTH = 2;
  NS_IPROTOCOLHANDLER_URI_INHERITS_SECURITY_CONTEXT = 16;
  NS_IPROTOCOLHANDLER_URI_FORBIDS_AUTOMATIC_DOCUMENT_REPLACEMENT = 32;
  NS_IPROTOCOLHANDLER_URI_LOADABLE_BY_ANYONE = 64;
  NS_IPROTOCOLHANDLER_URI_DANGEROUS_TO_LOAD = 128;
  NS_IPROTOCOLHANDLER_URI_IS_UI_RESOURCE = 256;
  NS_IPROTOCOLHANDLER_URI_IS_LOCAL_FILE = 512;
  NS_IPROTOCOLHANDLER_URI_NON_PERSISTABLE = 1024;
  NS_IPROTOCOLHANDLER_URI_DOES_NOT_RETURN_DATA = 2048;
  NS_IPROTOCOLHANDLER_ALLOWS_PROXY = 4;
  NS_IPROTOCOLHANDLER_ALLOWS_PROXY_HTTP = 8;

  NS_IPROXIEDPROTOCOLHANDLER_IID: TGUID = '{0a24fed4-1dd2-11b2-a75c-9f8b9a8f9ba7}';

  NS_IHTTPPROTOCOLHANDLER_IID: TGUID = '{122c91c0-2485-40ba-89c9-b895934921bc}';

type
  nsIProtocolHandler = interface;
  nsIProxiedProtocolHandler = interface;
  nsIHttpProtocolHandler = interface;
  nsIProxyInfo = interface end;
  nsIProtocolHandler = interface(nsISupports)
  ['{15fd6940-8ea7-11d3-93ad-00104ba0fd40}']
    procedure GetScheme(aScheme: nsACString); safecall;
    function GetDefaultPort(): PRInt32; safecall;
    property DefaultPort: PRInt32 read GetDefaultPort;
    function GetProtocolFlags(): PRUint32; safecall;
    property ProtocolFlags: PRUint32 read GetProtocolFlags;
    function NewURI(const aSpec: nsACString; const aOriginCharset: PAnsiChar; aBaseURI: nsIURI): nsIURI; safecall;
    function NewChannel(aURI: nsIURI): nsIChannel; safecall;
    function AllowPort(port: PRInt32; const scheme: PAnsiChar): PRBool; safecall;
  end;

  nsIProxiedProtocolHandler = interface(nsIProtocolHandler)
  ['{0a24fed4-1dd2-11b2-a75c-9f8b9a8f9ba7}']
    function NewProxiedChannel(uri: nsIURI; proxyInfo: nsIProxyInfo): nsIChannel; safecall;
  end;

  nsIHttpProtocolHandler = interface(nsIProxiedProtocolHandler)
  ['{122c91c0-2485-40ba-89c9-b895934921bc}']
    procedure GetUserAgent(aUserAgent: nsACString); safecall;
    procedure GetAppName(aAppName: nsACString); safecall;
    procedure GetAppVersion(aAppVersion: nsACString); safecall;
    procedure GetVendor(aVendor: nsACString); safecall;
    procedure SetVendor(const aVendor: nsACString); safecall;
    procedure GetVendorSub(aVendorSub: nsACString); safecall;
    procedure SetVendorSub(const aVendorSub: nsACString); safecall;
    procedure GetVendorComment(aVendorComment: nsACString); safecall;
    procedure SetVendorComment(const aVendorComment: nsACString); safecall;
    procedure GetProduct(aProduct: nsACString); safecall;
    procedure SetProduct(const aProduct: nsACString); safecall;
    procedure GetProductSub(aProductSub: nsACString); safecall;
    procedure SetProductSub(const aProductSub: nsACString); safecall;
    procedure GetProductComment(aProductComment: nsACString); safecall;
    procedure SetProductComment(const aProductComment: nsACString); safecall;
    procedure GetPlatform(aPlatform: nsACString); safecall;
    procedure GetOscpu(aOscpu: nsACString); safecall;
    procedure GetLanguage(aLanguage: nsACString); safecall;
    procedure SetLanguage(const aLanguage: nsACString); safecall;
    procedure GetMisc(aMisc: nsACString); safecall;
    procedure SetMisc(const aMisc: nsACString); safecall;
  end;

implementation

end.
