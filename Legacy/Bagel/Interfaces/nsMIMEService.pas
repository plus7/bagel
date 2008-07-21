unit nsMIMEService;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsMIMEInfo;

const
  NS_IMIMESERVICE_IID: TGUID = '{5b3675a1-02db-4f8f-a560-b34736635f47}';

type
  nsIMIMEService = interface;
  nsIMIMEService = interface(nsISupports)
  ['{5b3675a1-02db-4f8f-a560-b34736635f47}']
    function GetFromTypeAndExtension(const aMIMEType: nsACString; const aFileExt: nsACString): nsIMIMEInfo; safecall;
    function GetTypeFromExtension(const aFileExt: nsACString): nsACString; safecall;
    function GetTypeFromURI(aURI: nsIURI): nsACString; safecall;
    function GetTypeFromFile(aFile: nsIFile): nsACString; safecall;
    procedure GetPrimaryExtension(const aMIMEType: nsACString; const aFileExt: nsACString; _retval: nsACString); safecall;
  end;

implementation

end.
