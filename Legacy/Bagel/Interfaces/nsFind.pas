unit nsFind;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IFIND_IID: TGUID = '{75125d55-37ee-4575-b9b5-f33bfa68c2a1}';

type
  nsIFind = interface;
  nsIFind = interface(nsISupports)
  ['{75125d55-37ee-4575-b9b5-f33bfa68c2a1}']
    function GetFindBackwards(): PRBool; safecall;
    procedure SetFindBackwards(aFindBackwards: PRBool); safecall;
    property FindBackwards: PRBool read GetFindBackwards write SetFindBackwards;
    function GetCaseSensitive(): PRBool; safecall;
    procedure SetCaseSensitive(aCaseSensitive: PRBool); safecall;
    property CaseSensitive: PRBool read GetCaseSensitive write SetCaseSensitive;
    function GetWordBreaker(): nsIWordBreaker; safecall;
    procedure SetWordBreaker(aWordBreaker: nsIWordBreaker); safecall;
    property WordBreaker: nsIWordBreaker read GetWordBreaker write SetWordBreaker;
    function Find(const aPatText: PWideChar; aSearchRange: nsIDOMRange; aStartPoint: nsIDOMRange; aEndPoint: nsIDOMRange): nsIDOMRange; safecall;
  end;

implementation

end.
