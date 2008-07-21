unit nsTextToURI;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_ITEXTTOSUBURI_IID: TGUID = '{8b042e24-6f87-11d3-b3c8-00805f8a6670}';

type
  nsITextToSubURI = interface;
  nsITextToSubURI = interface(nsISupports)
  ['{8b042e24-6f87-11d3-b3c8-00805f8a6670}']
    function ConvertAndEscape(const charset: PAnsiChar; const text: PWideChar): PAnsiChar; safecall;
    function UnEscapeAndConvert(const charset: PAnsiChar; const text: PAnsiChar): PWideChar; safecall;
    procedure UnEscapeURIForUI(const aCharset: nsACString; const aURIFragment: nsACString; _retval: nsAString); safecall;
    procedure UnEscapeNonAsciiURI(const aCharset: nsACString; const aURIFragment: nsACString; _retval: nsAString); safecall;
  end;

implementation

end.
