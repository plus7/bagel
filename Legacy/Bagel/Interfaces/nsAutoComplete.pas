unit nsAutoComplete;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IAUTOCOMPLETECONTROLLER_IID: TGUID = '{6f08d134-8536-4b28-b456-d150fbaa66a9}';
  NS_IAUTOCOMPLETECONTROLLER_STATUS_NONE = 1;
  NS_IAUTOCOMPLETECONTROLLER_STATUS_SEARCHING = 2;
  NS_IAUTOCOMPLETECONTROLLER_STATUS_COMPLETE_NO_MATCH = 3;
  NS_IAUTOCOMPLETECONTROLLER_STATUS_COMPLETE_MATCH = 4;

  NS_IAUTOCOMPLETEINPUT_IID: TGUID = '{f5eddd39-f8e0-43b7-bc3d-03623f595e52}';

  NS_IAUTOCOMPLETEPOPUP_IID: TGUID = '{1b9d7d8a-6dd0-11dc-8314-0800200c9a66}';

  NS_IAUTOCOMPLETERESULT_IID: TGUID = '{d2fcba9a-3f5c-40fc-a9fc-4adc87dc61ef}';
  NS_IAUTOCOMPLETERESULT_RESULT_IGNORED = 1;
  NS_IAUTOCOMPLETERESULT_RESULT_FAILURE = 2;
  NS_IAUTOCOMPLETERESULT_RESULT_NOMATCH = 3;
  NS_IAUTOCOMPLETERESULT_RESULT_SUCCESS = 4;
  NS_IAUTOCOMPLETERESULT_RESULT_NOMATCH_ONGOING = 5;
  NS_IAUTOCOMPLETERESULT_RESULT_SUCCESS_ONGOING = 6;

  NS_IAUTOCOMPLETEBASERESULT_IID: TGUID = '{e6396544-921d-4776-aa62-8bf2dc1ae058}';

  NS_IAUTOCOMPLETEMDBRESULT_IID: TGUID = '{f7e7b341-2d5c-4d04-9f51-496cb2ce178c}';
  NS_IAUTOCOMPLETEMDBRESULT_kUnicharType = 0;
  NS_IAUTOCOMPLETEMDBRESULT_kCharType = 1;
  NS_IAUTOCOMPLETEMDBRESULT_kIntType = 2;

  NS_IAUTOCOMPLETEMDBRESULT2_IID: TGUID = '{148c9dc5-0fbb-408b-80fe-544f6a85b433}';

  NS_IAUTOCOMPLETESEARCH_IID: TGUID = '{de8db85f-c1de-4d87-94ba-7844890f91fe}';

  NS_IAUTOCOMPLETEOBSERVER_IID: TGUID = '{18c36504-9a4c-4ac3-8494-bd05e00ae27f}';

  NS_IAUTOCOMPLETESIMPLERESULT_IID: TGUID = '{f9841787-ad26-49e6-a2dd-ba9020ee1c64}';

  NS_IAUTOCOMPLETESIMPLERESULTLISTENER_IID: TGUID = '{004efdc5-1989-4874-8a7a-345bf2fa33af}';

type
  nsIMdbEnv = interface end;
  nsIMdbTable = interface end;
  nsIMdbRow = interface end;
  mdb_scope = PRUint32;
  mdb_column  = PRUint32;

  nsIAutoCompleteController = interface;
  nsIAutoCompleteInput = interface;
  nsIAutoCompletePopup = interface;
  nsIAutoCompleteResult = interface;
  nsIAutoCompleteBaseResult = interface;
  nsIAutoCompleteMdbResult = interface;
  nsIAutoCompleteMdbResult2 = interface;
  nsIAutoCompleteSearch = interface;
  nsIAutoCompleteObserver = interface;
  nsIAutoCompleteSimpleResult = interface;
  nsIAutoCompleteSimpleResultListener = interface;
  nsIAutoCompleteController = interface(nsISupports)
  ['{6f08d134-8536-4b28-b456-d150fbaa66a9}']
    function GetInput(): nsIAutoCompleteInput; safecall;
    procedure SetInput(aInput: nsIAutoCompleteInput); safecall;
    property Input: nsIAutoCompleteInput read GetInput write SetInput;
    function GetSearchStatus(): PRUint16; safecall;
    property SearchStatus: PRUint16 read GetSearchStatus;
    function GetMatchCount(): PRUint32; safecall;
    property MatchCount: PRUint32 read GetMatchCount;
    procedure StartSearch(const searchString: nsAString); safecall;
    procedure StopSearch(); safecall;
    procedure HandleText(aIgnoreSelection: PRBool); safecall;
    function HandleEnter(aIsPopupSelection: PRBool): PRBool; safecall;
    function HandleEscape(): PRBool; safecall;
    procedure HandleStartComposition(); safecall;
    procedure HandleEndComposition(); safecall;
    procedure HandleTab(); safecall;
    function HandleKeyNavigation(key: PRUint32): PRBool; safecall;
    function HandleDelete(): PRBool; safecall;
    procedure GetValueAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetCommentAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetStyleAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetImageAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetSearchString(aSearchString: nsAString); safecall;
    procedure SetSearchString(const aSearchString: nsAString); safecall;
  end;

  nsIAutoCompleteInput = interface(nsISupports)
  ['{f5eddd39-f8e0-43b7-bc3d-03623f595e52}']
    function GetPopup(): nsIAutoCompletePopup; safecall;
    property Popup: nsIAutoCompletePopup read GetPopup;
    function GetController(): nsIAutoCompleteController; safecall;
    property Controller: nsIAutoCompleteController read GetController;
    function GetPopupOpen(): PRBool; safecall;
    procedure SetPopupOpen(aPopupOpen: PRBool); safecall;
    property PopupOpen: PRBool read GetPopupOpen write SetPopupOpen;
    function GetDisableAutoComplete(): PRBool; safecall;
    procedure SetDisableAutoComplete(aDisableAutoComplete: PRBool); safecall;
    property DisableAutoComplete: PRBool read GetDisableAutoComplete write SetDisableAutoComplete;
    function GetCompleteDefaultIndex(): PRBool; safecall;
    procedure SetCompleteDefaultIndex(aCompleteDefaultIndex: PRBool); safecall;
    property CompleteDefaultIndex: PRBool read GetCompleteDefaultIndex write SetCompleteDefaultIndex;
    function GetCompleteSelectedIndex(): PRBool; safecall;
    procedure SetCompleteSelectedIndex(aCompleteSelectedIndex: PRBool); safecall;
    property CompleteSelectedIndex: PRBool read GetCompleteSelectedIndex write SetCompleteSelectedIndex;
    function GetForceComplete(): PRBool; safecall;
    procedure SetForceComplete(aForceComplete: PRBool); safecall;
    property ForceComplete: PRBool read GetForceComplete write SetForceComplete;
    function GetMinResultsForPopup(): PRUint32; safecall;
    procedure SetMinResultsForPopup(aMinResultsForPopup: PRUint32); safecall;
    property MinResultsForPopup: PRUint32 read GetMinResultsForPopup write SetMinResultsForPopup;
    function GetMaxRows(): PRUint32; safecall;
    procedure SetMaxRows(aMaxRows: PRUint32); safecall;
    property MaxRows: PRUint32 read GetMaxRows write SetMaxRows;
    function GetShowCommentColumn(): PRBool; safecall;
    procedure SetShowCommentColumn(aShowCommentColumn: PRBool); safecall;
    property ShowCommentColumn: PRBool read GetShowCommentColumn write SetShowCommentColumn;
    function GetShowImageColumn(): PRBool; safecall;
    procedure SetShowImageColumn(aShowImageColumn: PRBool); safecall;
    property ShowImageColumn: PRBool read GetShowImageColumn write SetShowImageColumn;
    function GetTimeout(): PRUint32; safecall;
    procedure SetTimeout(aTimeout: PRUint32); safecall;
    property Timeout: PRUint32 read GetTimeout write SetTimeout;
    procedure GetSearchParam(aSearchParam: nsAString); safecall;
    procedure SetSearchParam(const aSearchParam: nsAString); safecall;
    function GetSearchCount(): PRUint32; safecall;
    property SearchCount: PRUint32 read GetSearchCount;
    function GetSearchAt(index: PRUint32): nsACString; safecall;
    procedure GetTextValue(aTextValue: nsAString); safecall;
    procedure SetTextValue(const aTextValue: nsAString); safecall;
    function GetSelectionStart(): PRInt32; safecall;
    property SelectionStart: PRInt32 read GetSelectionStart;
    function GetSelectionEnd(): PRInt32; safecall;
    property SelectionEnd: PRInt32 read GetSelectionEnd;
    procedure SelectTextRange(startIndex: PRInt32; endIndex: PRInt32); safecall;
    procedure OnSearchBegin(); safecall;
    procedure OnSearchComplete(); safecall;
    function OnTextEntered(): PRBool; safecall;
    function OnTextReverted(): PRBool; safecall;
    function GetConsumeRollupEvent(): PRBool; safecall;
    property ConsumeRollupEvent: PRBool read GetConsumeRollupEvent;
  end;

  nsIAutoCompletePopup = interface(nsISupports)
  ['{1b9d7d8a-6dd0-11dc-8314-0800200c9a66}']
    function GetInput(): nsIAutoCompleteInput; safecall;
    property Input: nsIAutoCompleteInput read GetInput;
    procedure GetOverrideValue(aOverrideValue: nsAString); safecall;
    function GetSelectedIndex(): PRInt32; safecall;
    procedure SetSelectedIndex(aSelectedIndex: PRInt32); safecall;
    property SelectedIndex: PRInt32 read GetSelectedIndex write SetSelectedIndex;
    function GetPopupOpen(): PRBool; safecall;
    property PopupOpen: PRBool read GetPopupOpen;
    procedure OpenAutocompletePopup(input: nsIAutoCompleteInput; element: nsIDOMElement); safecall;
    procedure ClosePopup(); safecall;
    procedure Invalidate(); safecall;
    procedure SelectBy(reverse: PRBool; page: PRBool); safecall;
  end;

  nsIAutoCompleteResult = interface(nsISupports)
  ['{d2fcba9a-3f5c-40fc-a9fc-4adc87dc61ef}']
    procedure GetSearchString(aSearchString: nsAString); safecall;
    function GetSearchResult(): PRUint16; safecall;
    property SearchResult: PRUint16 read GetSearchResult;
    function GetDefaultIndex(): PRInt32; safecall;
    property DefaultIndex: PRInt32 read GetDefaultIndex;
    procedure GetErrorDescription(aErrorDescription: nsAString); safecall;
    function GetMatchCount(): PRUint32; safecall;
    property MatchCount: PRUint32 read GetMatchCount;
    procedure GetValueAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetCommentAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetStyleAt(index: PRInt32; _retval: nsAString); safecall;
    procedure GetImageAt(index: PRInt32; _retval: nsAString); safecall;
    procedure RemoveValueAt(rowIndex: PRInt32; removeFromDb: PRBool); safecall;
  end;

  nsIAutoCompleteBaseResult = interface(nsIAutoCompleteResult)
  ['{e6396544-921d-4776-aa62-8bf2dc1ae058}']
    procedure SetSearchString(const searchString: nsAString); safecall;
    procedure SetErrorDescription(const errorDescription: nsAString); safecall;
    procedure SetDefaultIndex(defaultIndex: PRInt32); safecall;
    procedure SetSearchResult(searchResult: PRUint32); safecall;
  end;

  nsIAutoCompleteMdbResult = interface(nsIAutoCompleteBaseResult)
  ['{f7e7b341-2d5c-4d04-9f51-496cb2ce178c}']
    procedure Init(env: nsIMdbEnv; table: nsIMdbTable); safecall;
    procedure SetTokens(valueToken: mdb_scope; valueType: PRInt16; commentToken: mdb_scope; commentType: PRInt16); safecall;
    procedure AddRow(row: nsIMdbRow); safecall;
    function GetRowAt(rowIndex: PRUint32): nsIMdbRow; safecall;
    procedure GetRowValue(row: nsIMdbRow; col: mdb_column; _retval: nsAString); safecall;
    procedure GetUTF8RowValue(row: nsIMdbRow; col: mdb_column; _retval: nsACString); safecall;
    function GetIntRowValue(row: nsIMdbRow; col: mdb_column): PRInt32; safecall;
  end;

  nsIAutoCompleteMdbResult2 = interface(nsIAutoCompleteMdbResult)
  ['{148c9dc5-0fbb-408b-80fe-544f6a85b433}']
    function GetReverseByteOrder(): PRBool; safecall;
    procedure SetReverseByteOrder(aReverseByteOrder: PRBool); safecall;
    property ReverseByteOrder: PRBool read GetReverseByteOrder write SetReverseByteOrder;
  end;

  nsIAutoCompleteSearch = interface(nsISupports)
  ['{de8db85f-c1de-4d87-94ba-7844890f91fe}']
    procedure StartSearch(const searchString: nsAString; const searchParam: nsAString; previousResult: nsIAutoCompleteResult; listener: nsIAutoCompleteObserver); safecall;
    procedure StopSearch(); safecall;
  end;

  nsIAutoCompleteObserver = interface(nsISupports)
  ['{18c36504-9a4c-4ac3-8494-bd05e00ae27f}']
    procedure OnSearchResult(search: nsIAutoCompleteSearch; _result: nsIAutoCompleteResult); safecall;
  end;

  nsIAutoCompleteSimpleResult = interface(nsIAutoCompleteResult)
  ['{f9841787-ad26-49e6-a2dd-ba9020ee1c64}']
    procedure SetSearchString(const aSearchString: nsAString); safecall;
    procedure SetErrorDescription(const aErrorDescription: nsAString); safecall;
    procedure SetDefaultIndex(aDefaultIndex: PRInt32); safecall;
    procedure SetSearchResult(aSearchResult: PRUint16); safecall;
    procedure AppendMatch(const aValue: nsAString; const aComment: nsAString; const aImage: nsAString; const aStyle: nsAString); safecall;
    procedure SetListener(aListener: nsIAutoCompleteSimpleResultListener); safecall;
  end;

  nsIAutoCompleteSimpleResultListener = interface(nsISupports)
  ['{004efdc5-1989-4874-8a7a-345bf2fa33af}']
    procedure OnValueRemoved(aResult: nsIAutoCompleteSimpleResult; const aValue: nsAString; aRemoveFromDb: PRBool); safecall;
  end;

implementation

end.
