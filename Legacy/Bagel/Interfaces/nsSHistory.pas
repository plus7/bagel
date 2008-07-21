unit nsSHistory;

interface
uses nsTypes, nsXPCOM, nsDocShell, nsGeckoStrings, nsSupportsArray;

const
  NS_ISHTRANSACTION_IID: TGUID = '{2edf705f-d252-4971-9f09-71dd0f760dc6}';

  NS_ISHISTORYINTERNAL_IID: TGUID = '{9c47c121-1c6e-4d8f-b904-3ac968116e88}';

type
  nsISHTransaction = interface;
  nsISHistoryInternal = interface;

  nsISHTransaction = interface(nsISupports)
  ['{2edf705f-d252-4971-9f09-71dd0f760dc6}']
    function GetSHEntry(): nsISHEntry; safecall;
    procedure SetSHEntry(aSHEntry: nsISHEntry); safecall;
    property SHEntry: nsISHEntry read GetSHEntry write SetSHEntry;
    function GetPrev(): nsISHTransaction; safecall;
    procedure SetPrev(aPrev: nsISHTransaction); safecall;
    property Prev: nsISHTransaction read GetPrev write SetPrev;
    function GetNext(): nsISHTransaction; safecall;
    procedure SetNext(aNext: nsISHTransaction); safecall;
    property Next: nsISHTransaction read GetNext write SetNext;
    function GetPersist(): PRBool; safecall;
    procedure SetPersist(aPersist: PRBool); safecall;
    property Persist: PRBool read GetPersist write SetPersist;
    procedure Create(aSHEntry: nsISHEntry; aPrev: nsISHTransaction); safecall;
  end;

  nsISHistoryInternal = interface(nsISupports)
  ['{9c47c121-1c6e-4d8f-b904-3ac968116e88}']
    procedure AddEntry(aEntry: nsISHEntry; aPersist: PRBool); safecall;
    function GetRootTransaction(): nsISHTransaction; safecall;
    property RootTransaction: nsISHTransaction read GetRootTransaction;
    function GetRootDocShell(): nsIDocShell; safecall;
    procedure SetRootDocShell(aRootDocShell: nsIDocShell); safecall;
    property RootDocShell: nsIDocShell read GetRootDocShell write SetRootDocShell;
    procedure UpdateIndex(); safecall;
    procedure ReplaceEntry(aIndex: PRInt32; aReplaceEntry: nsISHEntry); safecall;
    function GetListener(): nsISHistoryListener; safecall;
    property Listener: nsISHistoryListener read GetListener;
    procedure EvictContentViewers(previousIndex: PRInt32; index: PRInt32); safecall;
    procedure EvictExpiredContentViewerForEntry(aEntry: nsISHEntry); safecall;
  end;

implementation

end.
