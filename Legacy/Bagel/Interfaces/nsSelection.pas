unit nsSelection;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings, nsEnumerator;

const
  NS_ISELECTION2_IID: TGUID = '{b515878d-3b06-433b-bc9e-5c53d2fa3eff}';

  NS_ISELECTIONDISPLAY_IID: TGUID = '{0ddf9e1c-1dd2-11b2-a183-908a08aa75ae}';
  NS_ISELECTIONDISPLAY_DISPLAY_TEXT = 1;
  NS_ISELECTIONDISPLAY_DISPLAY_IMAGES = 2;
  NS_ISELECTIONDISPLAY_DISPLAY_FRAMES = 4;
  NS_ISELECTIONDISPLAY_DISPLAY_ALL = 7;

  NS_ISELECTIONCONTROLLER_IID: TGUID = '{5f8f41cb-f182-4010-9e38-7c873e8e8a9f}';
  NS_ISELECTIONCONTROLLER_SELECTION_NONE = 0;
  NS_ISELECTIONCONTROLLER_SELECTION_NORMAL = 1;
  NS_ISELECTIONCONTROLLER_SELECTION_SPELLCHECK = 2;
  NS_ISELECTIONCONTROLLER_SELECTION_IME_RAWINPUT = 4;
  NS_ISELECTIONCONTROLLER_SELECTION_IME_SELECTEDRAWTEXT = 8;
  NS_ISELECTIONCONTROLLER_SELECTION_IME_CONVERTEDTEXT = 16;
  NS_ISELECTIONCONTROLLER_SELECTION_IME_SELECTEDCONVERTEDTEXT = 32;
  NS_ISELECTIONCONTROLLER_SELECTION_ACCESSIBILITY = 64;
  NS_ISELECTIONCONTROLLER_NUM_SELECTIONTYPES = 8;
  NS_ISELECTIONCONTROLLER_SELECTION_ANCHOR_REGION = 0;
  NS_ISELECTIONCONTROLLER_SELECTION_FOCUS_REGION = 1;
  NS_ISELECTIONCONTROLLER_NUM_SELECTION_REGIONS = 2;
  NS_ISELECTIONCONTROLLER_SELECTION_OFF = 0;
  NS_ISELECTIONCONTROLLER_SELECTION_HIDDEN = 1;
  NS_ISELECTIONCONTROLLER_SELECTION_ON = 2;
  NS_ISELECTIONCONTROLLER_SELECTION_DISABLED = 3;
  NS_ISELECTIONCONTROLLER_SELECTION_ATTENTION = 4;

  NS_ISELECTIONLISTENER_IID: TGUID = '{a6cf90e2-15b3-11d2-932e-00805f8add32}';
  NS_ISELECTIONLISTENER_NO_REASON = 0;
  NS_ISELECTIONLISTENER_DRAG_REASON = 1;
  NS_ISELECTIONLISTENER_MOUSEDOWN_REASON = 2;
  NS_ISELECTIONLISTENER_MOUSEUP_REASON = 4;
  NS_ISELECTIONLISTENER_KEYPRESS_REASON = 8;
  NS_ISELECTIONLISTENER_SELECTALL_REASON = 16;

  NS_ISELECTIONPRIVATE_IID: TGUID = '{b416c692-eeb8-4186-addd-c444e81b68e5}';
  NS_ISELECTIONPRIVATE_ENDOFPRECEDINGLINE = 0;
  NS_ISELECTIONPRIVATE_STARTOFNEXTLINE = 1;
  NS_ISELECTIONPRIVATE_TABLESELECTION_NONE = 0;
  NS_ISELECTIONPRIVATE_TABLESELECTION_CELL = 1;
  NS_ISELECTIONPRIVATE_TABLESELECTION_ROW = 2;
  NS_ISELECTIONPRIVATE_TABLESELECTION_COLUMN = 3;
  NS_ISELECTIONPRIVATE_TABLESELECTION_TABLE = 4;
  NS_ISELECTIONPRIVATE_TABLESELECTION_ALLCELLS = 5;

type
  nsISelection2 = interface;
  nsISelectionDisplay = interface;
  nsISelectionController = interface;
  nsISelectionListener = interface;
  nsISelectionPrivate = interface;
  nsISelection2 = interface(nsISelection)
  ['{b515878d-3b06-433b-bc9e-5c53d2fa3eff}']
    procedure GetRangesForInterval(beginNode: nsIDOMNode; beginOffset: PRInt32; endNode: nsIDOMNode; endOffset: PRInt32; allowAdjacent: PRBool; out resultCount: PRUint32; out results_array); safecall;
    procedure GetRangesForIntervalCOMArray(beginNode: nsIDOMNode; beginOffset: PRInt32; endNode: nsIDOMNode; endOffset: PRInt32; allowAdjacent: PRBool; results: (*PnsCOMArray<nsIDOMRange>*)Pointer); safecall;
    procedure ScrollIntoView(aRegion: PRInt16; aIsSynchronous: PRBool; aVPercent: PRInt16; aHPercent: PRInt16); safecall;
  end;

  nsISelectionDisplay = interface(nsISupports)
  ['{0ddf9e1c-1dd2-11b2-a183-908a08aa75ae}']
    procedure SetSelectionFlags(toggle: PRInt16); safecall;
    function GetSelectionFlags(): PRInt16; safecall;
  end;

  nsISelectionController = interface(nsISelectionDisplay)
  ['{5f8f41cb-f182-4010-9e38-7c873e8e8a9f}']
    procedure SetDisplaySelection(toggle: PRInt16); safecall;
    function GetDisplaySelection(): PRInt16; safecall;
    function GetSelection(_type: PRInt16): nsISelection; safecall;
    procedure ScrollSelectionIntoView(_type: PRInt16; region: PRInt16; isSynchronous: PRBool); safecall;
    procedure RepaintSelection(_type: PRInt16); safecall;
    procedure SetCaretEnabled(enabled: PRBool); safecall;
    procedure SetCaretReadOnly(readOnly: PRBool); safecall;
    function GetCaretEnabled(): PRBool; safecall;
    function GetCaretVisible(): PRBool; safecall;
    property CaretVisible: PRBool read GetCaretVisible;
    procedure SetCaretVisibilityDuringSelection(visibility: PRBool); safecall;
    procedure CharacterMove(forward: PRBool; extend: PRBool); safecall;
    procedure WordMove(forward: PRBool; extend: PRBool); safecall;
    procedure WordExtendForDelete(forward: PRBool); safecall;
    procedure LineMove(forward: PRBool; extend: PRBool); safecall;
    procedure IntraLineMove(forward: PRBool; extend: PRBool); safecall;
    procedure PageMove(forward: PRBool; extend: PRBool); safecall;
    procedure CompleteScroll(forward: PRBool); safecall;
    procedure CompleteMove(forward: PRBool; extend: PRBool); safecall;
    procedure ScrollPage(forward: PRBool); safecall;
    procedure ScrollLine(forward: PRBool); safecall;
    procedure ScrollHorizontal(left: PRBool); safecall;
    procedure SelectAll(); safecall;
    function CheckVisibility(node: nsIDOMNode; startOffset: PRInt16; endOffset: PRInt16): PRBool; safecall;
  end;

  nsISelectionListener = interface(nsISupports)
  ['{a6cf90e2-15b3-11d2-932e-00805f8add32}']
    procedure NotifySelectionChanged(doc: nsIDOMDocument; sel: nsISelection; reason: PRInt16); safecall;
  end;

  nsISelectionPrivate = interface(nsISupports)
  ['{b416c692-eeb8-4186-addd-c444e81b68e5}']
    function GetInterlinePosition(): PRBool; safecall;
    procedure SetInterlinePosition(aInterlinePosition: PRBool); safecall;
    property InterlinePosition: PRBool read GetInterlinePosition write SetInterlinePosition;
    procedure StartBatchChanges(); safecall;
    procedure EndBatchChanges(); safecall;
    function GetEnumerator(): nsIEnumerator; safecall;
    function ToStringWithFormat(const formatType: PAnsiChar; flags: PRUint32; wrapColumn: PRInt32): PWideChar; safecall;
    procedure AddSelectionListener(newListener: nsISelectionListener); safecall;
    procedure RemoveSelectionListener(listenerToRemove: nsISelectionListener); safecall;
    function GetTableSelectionType(range: nsIDOMRange): PRInt32; safecall;
    procedure SetPresShell(aPresShell: nsIPresShell); safecall;
    function GetCanCacheFrameOffset(): PRBool; safecall;
    procedure SetCanCacheFrameOffset(aCanCacheFrameOffset: PRBool); safecall;
    property CanCacheFrameOffset: PRBool read GetCanCacheFrameOffset write SetCanCacheFrameOffset;
    procedure GetCachedFrameOffset(aFrame: nsIFrame; inOffset: PRInt32; var aPoint: nsPoint); safecall;
    function GetFrameSelection(): PnsFrameSelection; safecall;
    procedure SetAncestorLimiter(aContent: nsIContent); safecall;
  end;

implementation

end.
