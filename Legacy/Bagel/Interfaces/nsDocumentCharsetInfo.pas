unit nsDocumentCharsetInfo;

interface
uses nsTypes, nsXPCOM, nsAtom;

const
  NS_IDOCUMENTCHARSETINFO_IID: TGUID = '{2d40b291-01e1-11d4-9d0e-0050040007b2}';

type
  nsIDocumentCharsetInfo = interface;
  nsIDocumentCharsetInfo = interface(nsISupports)
  ['{2d40b291-01e1-11d4-9d0e-0050040007b2}']
    function GetForcedCharset(): nsIAtom; safecall;
    procedure SetForcedCharset(aForcedCharset: nsIAtom); safecall;
    property ForcedCharset: nsIAtom read GetForcedCharset write SetForcedCharset;
    function GetForcedDetector(): PRBool; safecall;
    procedure SetForcedDetector(aForcedDetector: PRBool); safecall;
    property ForcedDetector: PRBool read GetForcedDetector write SetForcedDetector;
    function GetParentCharset(): nsIAtom; safecall;
    procedure SetParentCharset(aParentCharset: nsIAtom); safecall;
    property ParentCharset: nsIAtom read GetParentCharset write SetParentCharset;
    function GetParentCharsetSource(): PRInt32; safecall;
    procedure SetParentCharsetSource(aParentCharsetSource: PRInt32); safecall;
    property ParentCharsetSource: PRInt32 read GetParentCharsetSource write SetParentCharsetSource;
  end;

implementation

end.
