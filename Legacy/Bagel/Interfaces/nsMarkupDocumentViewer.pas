unit nsMarkupDocumentViewer;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IMARKUPDOCUMENTVIEWER_IID: TGUID = '{40b2282a-a882-4483-a634-dec468d88377}';

type
  nsIMarkupDocumentViewer = interface;
  nsIMarkupDocumentViewer = interface(nsISupports)
  ['{40b2282a-a882-4483-a634-dec468d88377}']
    procedure ScrollToNode(node: nsIDOMNode); safecall;
    function GetTextZoom(): Single; safecall;
    procedure SetTextZoom(aTextZoom: Single); safecall;
    property TextZoom: Single read GetTextZoom write SetTextZoom;
    function GetFullZoom(): Single; safecall;
    procedure SetFullZoom(aFullZoom: Single); safecall;
    property FullZoom: Single read GetFullZoom write SetFullZoom;
    function GetAuthorStyleDisabled(): PRBool; safecall;
    procedure SetAuthorStyleDisabled(aAuthorStyleDisabled: PRBool); safecall;
    property AuthorStyleDisabled: PRBool read GetAuthorStyleDisabled write SetAuthorStyleDisabled;
    procedure GetDefaultCharacterSet(aDefaultCharacterSet: nsACString); safecall;
    procedure SetDefaultCharacterSet(const aDefaultCharacterSet: nsACString); safecall;
    procedure GetForceCharacterSet(aForceCharacterSet: nsACString); safecall;
    procedure SetForceCharacterSet(const aForceCharacterSet: nsACString); safecall;
    procedure GetHintCharacterSet(aHintCharacterSet: nsACString); safecall;
    procedure SetHintCharacterSet(const aHintCharacterSet: nsACString); safecall;
    function GetHintCharacterSetSource(): PRInt32; safecall;
    procedure SetHintCharacterSetSource(aHintCharacterSetSource: PRInt32); safecall;
    property HintCharacterSetSource: PRInt32 read GetHintCharacterSetSource write SetHintCharacterSetSource;
    procedure GetPrevDocCharacterSet(aPrevDocCharacterSet: nsACString); safecall;
    procedure SetPrevDocCharacterSet(const aPrevDocCharacterSet: nsACString); safecall;
    procedure SizeToContent(); safecall;
    function GetBidiTextDirection(): PRUint8; safecall;
    procedure SetBidiTextDirection(aBidiTextDirection: PRUint8); safecall;
    property BidiTextDirection: PRUint8 read GetBidiTextDirection write SetBidiTextDirection;
    function GetBidiTextType(): PRUint8; safecall;
    procedure SetBidiTextType(aBidiTextType: PRUint8); safecall;
    property BidiTextType: PRUint8 read GetBidiTextType write SetBidiTextType;
    function GetBidiControlsTextMode(): PRUint8; safecall;
    procedure SetBidiControlsTextMode(aBidiControlsTextMode: PRUint8); safecall;
    property BidiControlsTextMode: PRUint8 read GetBidiControlsTextMode write SetBidiControlsTextMode;
    function GetBidiNumeral(): PRUint8; safecall;
    procedure SetBidiNumeral(aBidiNumeral: PRUint8); safecall;
    property BidiNumeral: PRUint8 read GetBidiNumeral write SetBidiNumeral;
    function GetBidiSupport(): PRUint8; safecall;
    procedure SetBidiSupport(aBidiSupport: PRUint8); safecall;
    property BidiSupport: PRUint8 read GetBidiSupport write SetBidiSupport;
    function GetBidiCharacterSet(): PRUint8; safecall;
    procedure SetBidiCharacterSet(aBidiCharacterSet: PRUint8); safecall;
    property BidiCharacterSet: PRUint8 read GetBidiCharacterSet write SetBidiCharacterSet;
    function GetBidiOptions(): PRUint32; safecall;
    procedure SetBidiOptions(aBidiOptions: PRUint32); safecall;
    property BidiOptions: PRUint32 read GetBidiOptions write SetBidiOptions;
  end;

implementation

end.
