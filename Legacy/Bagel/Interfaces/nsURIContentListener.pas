unit nsURIContentListener;

interface

uses nsTypes, nsXPCOM;

const
  NS_IURICONTENTLISTENER_IID: TGUID = '{94928ab3-8b63-11d3-989d-001083010e9b}';

type
  nsIRequest = interface end;
  nsIURIContentListener = interface;
  nsIURIContentListener = interface(nsISupports)
  ['{94928ab3-8b63-11d3-989d-001083010e9b}']
    function OnStartURIOpen(aURI: nsIURI): PRBool; safecall;
    function DoContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; aRequest: nsIRequest; out aContentHandler: nsIStreamListener): PRBool; safecall;
    function IsPreferred(const aContentType: PAnsiChar; out aDesiredContentType: PAnsiChar): PRBool; safecall;
    function CanHandleContent(const aContentType: PAnsiChar; aIsContentPreferred: PRBool; out aDesiredContentType: PAnsiChar): PRBool; safecall;
    function GetLoadCookie(): nsISupports; safecall;
    procedure SetLoadCookie(aLoadCookie: nsISupports); safecall;
    property LoadCookie: nsISupports read GetLoadCookie write SetLoadCookie;
    function GetParentContentListener(): nsIURIContentListener; safecall;
    procedure SetParentContentListener(aParentContentListener: nsIURIContentListener); safecall;
    property ParentContentListener: nsIURIContentListener read GetParentContentListener write SetParentContentListener;
  end;

implementation

end.
