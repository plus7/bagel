unit nsFileProtocolHandler;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IFILEPROTOCOLHANDLER_IID: TGUID = '{255602ea-c31f-4d29-8f35-905ead3f76f4}';

type
  nsIFileProtocolHandler = interface;
  nsIFileProtocolHandler = interface(nsIProtocolHandler)
  ['{255602ea-c31f-4d29-8f35-905ead3f76f4}']
    function NewFileURI(aFile: nsIFile): nsIURI; safecall;
    procedure GetURLSpecFromFile(_file: nsIFile; _retval: nsACString); safecall;
    function GetFileFromURLSpec(const url: nsACString): nsIFile; safecall;
    function ReadURLFile(_file: nsIFile): nsIURI; safecall;
  end;

implementation

end.
