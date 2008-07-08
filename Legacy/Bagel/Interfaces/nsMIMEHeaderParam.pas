unit nsMIMEHeaderParam;

interface

uses nsXPCOM, nsTypes, nsGeckoStrings;

const
  NS_IMIMEHEADERPARAM_IID: TGUID = '{ddbbdfb8-a1c0-4dd5-a31b-5d2a7a3bb6ec}';

type
  nsIMIMEHeaderParam = interface;
  nsIMIMEHeaderParam = interface(nsISupports)
  ['{ddbbdfb8-a1c0-4dd5-a31b-5d2a7a3bb6ec}']
    procedure GetParameter(const aHeaderVal: nsACString; const aParamName: PAnsiChar; const aFallbackCharset: nsACString; aTryLocaleCharset: PRBool; out aLang: PAnsiChar; _retval: nsAString); safecall;
    function GetParameterInternal(const aHeaderVal: PAnsiChar; const aParamName: PAnsiChar; out aCharset: PAnsiChar; out aLang: PAnsiChar): PAnsiChar; safecall;
    function DecodeRFC2047Header(const aHeaderVal: PAnsiChar; const aDefaultCharset: PAnsiChar; aOverrideCharset: PRBool; aEatContinuation: PRBool): nsACString; safecall;
    function DecodeParameter(const aParamValue: nsACString; const aCharset: PAnsiChar; const aDefaultCharset: PAnsiChar; aOverrideCharset: PRBool): nsACString; safecall;
  end;

implementation

end.
