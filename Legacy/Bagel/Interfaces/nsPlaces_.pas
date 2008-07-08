unit nsPlaces;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsTree;

const
  NS_INAVHISTORYRESULTNODE_IID: TGUID = '{62c517f4-046e-474d-adba-975bf8924703}';
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_URI = 0;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_VISIT = 1;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_FULL_VISIT = 2;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_HOST = 3;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_DYNAMIC_CONTAINER = 4;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_QUERY = 5;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_FOLDER = 6;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_SEPARATOR = 7;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_DAY = 8;

  NS_INAVHISTORYVISITRESULTNODE_IID: TGUID = '{8e2c5a86-b33d-4fa6-944b-559af7e95fcd}';

  NS_INAVHISTORYFULLVISITRESULTNODE_IID: TGUID = '{c49fd9d5-56e2-43eb-932c-f933f28cba85}';

  NS_INAVHISTORYCONTAINERRESULTNODE_IID: TGUID = '{f9c8e1c1-e701-44ad-893c-8504c3956929}';

  NS_INAVHISTORYQUERYRESULTNODE_IID: TGUID = '{dcd6a2b7-3d50-4c78-b1cb-2f0f18ac5864}';

  NS_INAVHISTORYRESULTVIEWOBSERVER_IID: TGUID = '{b34d5ca4-ce8e-49a6-9201-a59ae2128d2c}';
  NS_INAVHISTORYRESULTVIEWOBSERVER_DROP_BEFORE = -1;
  NS_INAVHISTORYRESULTVIEWOBSERVER_DROP_ON = 0;
  NS_INAVHISTORYRESULTVIEWOBSERVER_DROP_AFTER = 1;

  NS_INAVHISTORYRESULTVIEWER_IID: TGUID = '{f208e54c-834f-4a6c-bd4d-a476015bc139}';

  NS_INAVHISTORYRESULTTREEVIEWER_IID: TGUID = '{ecd6ad22-8eb0-4824-8a57-5edad9a08ae6}';
  NS_INAVHISTORYRESULTTREEVIEWER_INDEX_INVISIBLE = 4294967295;

  NS_INAVHISTORYRESULT_IID: TGUID = '{d1562f6f-8d5a-4042-8524-72f747a51b18}';

  NS_INAVHISTORYOBSERVER_IID: TGUID = '{849e2184-3dee-416f-91cd-6a619ca49d1c}';
  NS_INAVHISTORYOBSERVER_ATTRIBUTE_FAVICON = 3;

  NS_INAVHISTORYQUERY_IID: TGUID = '{53b51afe-9de8-40ad-9c81-f2cc1701f1ff}';
  NS_INAVHISTORYQUERY_TIME_RELATIVE_EPOCH = 0;
  NS_INAVHISTORYQUERY_TIME_RELATIVE_TODAY = 1;
  NS_INAVHISTORYQUERY_TIME_RELATIVE_NOW = 2;

  NS_INAVHISTORYQUERYOPTIONS_IID: TGUID = '{ff73bf85-2755-4c1a-a48d-8c91ccca770e}';
  NS_INAVHISTORYQUERYOPTIONS_GROUP_BY_DAY = 0;
  NS_INAVHISTORYQUERYOPTIONS_GROUP_BY_HOST = 1;
  NS_INAVHISTORYQUERYOPTIONS_GROUP_BY_DOMAIN = 2;
  NS_INAVHISTORYQUERYOPTIONS_GROUP_BY_FOLDER = 3;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_NONE = 0;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_TITLE_ASCENDING = 1;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_TITLE_DESCENDING = 2;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_DATE_ASCENDING = 3;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_DATE_DESCENDING = 4;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_URI_ASCENDING = 5;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_URI_DESCENDING = 6;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_VISITCOUNT_ASCENDING = 7;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_VISITCOUNT_DESCENDING = 8;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_KEYWORD_ASCENDING = 9;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_KEYWORD_DESCENDING = 10;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_DATEADDED_ASCENDING = 11;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_DATEADDED_DESCENDING = 12;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_LASTMODIFIED_ASCENDING = 13;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_LASTMODIFIED_DESCENDING = 14;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_COUNT_ASCENDING = 15;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_COUNT_DESCENDING = 16;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_ANNOTATION_ASCENDING = 17;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_ANNOTATION_DESCENDING = 18;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_URI = 0;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_VISIT = 1;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_FULL_VISIT = 2;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_HISTORY = 0;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_BOOKMARKS = 1;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_UNIFIED = 2;

  NS_INAVHISTORYSERVICE_IID: TGUID = '{c5846d2c-5340-4cfb-9c0d-c15feca939ce}';
  NS_INAVHISTORYSERVICE_TRANSITION_LINK = 1;
  NS_INAVHISTORYSERVICE_TRANSITION_TYPED = 2;
  NS_INAVHISTORYSERVICE_TRANSITION_BOOKMARK = 3;
  NS_INAVHISTORYSERVICE_TRANSITION_EMBED = 4;
  NS_INAVHISTORYSERVICE_TRANSITION_REDIRECT_PERMANENT = 5;
  NS_INAVHISTORYSERVICE_TRANSITION_REDIRECT_TEMPORARY = 6;
  NS_INAVHISTORYSERVICE_TRANSITION_DOWNLOAD = 7;

  NS_INAVHISTORYBATCHCALLBACK_IID: TGUID = '{5143f2bb-be0a-4faf-9acb-b0ed3f82952c}';

  NS_INAVBOOKMARKOBSERVER_IID: TGUID = '{f9828ba8-9c70-4d95-b926-60d9e4378d7d}';

  NS_INAVBOOKMARKSSERVICE_IID: TGUID = '{fb8dc678-681b-453b-a5fe-ab3cc19b3698}';
  NS_INAVBOOKMARKSSERVICE_DEFAULT_INDEX = -1;
  NS_INAVBOOKMARKSSERVICE_TYPE_BOOKMARK = 1;
  NS_INAVBOOKMARKSSERVICE_TYPE_FOLDER = 2;
  NS_INAVBOOKMARKSSERVICE_TYPE_SEPARATOR = 3;
  NS_INAVBOOKMARKSSERVICE_TYPE_DYNAMIC_CONTAINER = 4;

  NS_IPROPERTYBAG_IID: TGUID = '{bfcd37b0-a49f-11d5-910d-0010a4e73d9a}';

  NS_IWRITABLEPROPERTYBAG_IID: TGUID = '{96fc4671-eeb4-4823-9421-e50fb70ad353}';

type
  nsITransaction = interface end;
  PnsTArray = Pointer;

  nsINavHistoryResultNode = interface;
  nsINavHistoryVisitResultNode = interface;
  nsINavHistoryFullVisitResultNode = interface;
  nsINavHistoryContainerResultNode = interface;
  nsINavHistoryQueryResultNode = interface;
  nsINavHistoryResultViewObserver = interface;
  nsINavHistoryResultViewer = interface;
  nsINavHistoryResultTreeViewer = interface;
  nsINavHistoryResult = interface;
  nsINavHistoryObserver = interface;
  nsINavHistoryQuery = interface;
  nsINavHistoryQueryOptions = interface;
  nsINavHistoryService = interface;
  nsINavHistoryBatchCallback = interface;
  nsINavBookmarkObserver = interface;
  nsINavBookmarksService = interface;
  nsIPropertyBag = interface;
  nsIWritablePropertyBag = interface;
  nsINavHistoryResultNode = interface(nsISupports)
  ['{62c517f4-046e-474d-adba-975bf8924703}']
    function GetParent(): nsINavHistoryContainerResultNode; safecall;
    property Parent: nsINavHistoryContainerResultNode read GetParent;
    function GetParentResult(): nsINavHistoryResult; safecall;
    property ParentResult: nsINavHistoryResult read GetParentResult;
    procedure GetUri(aUri: nsACString); safecall;
    function GetType(): PRUint32; safecall;
    property _Type: PRUint32 read GetType;
    procedure GetTitle(aTitle: nsACString); safecall;
    function GetAccessCount(): PRUint32; safecall;
    property AccessCount: PRUint32 read GetAccessCount;
    function GetTime(): PRTime; safecall;
    property Time: PRTime read GetTime;
    function GetIcon(): nsIURI; safecall;
    property Icon: nsIURI read GetIcon;
    function GetIndentLevel(): PRInt32; safecall;
    property IndentLevel: PRInt32 read GetIndentLevel;
    function GetViewIndex(): PRInt32; safecall;
    procedure SetViewIndex(aViewIndex: PRInt32); safecall;
    property ViewIndex: PRInt32 read GetViewIndex write SetViewIndex;
    function GetPropertyBag(): nsIWritablePropertyBag; safecall;
    property PropertyBag: nsIWritablePropertyBag read GetPropertyBag;
    function GetBookmarkIndex(): PRInt32; safecall;
    property BookmarkIndex: PRInt32 read GetBookmarkIndex;
    function GetItemId(): PRInt64; safecall;
    property ItemId: PRInt64 read GetItemId;
    function GetDateAdded(): PRTime; safecall;
    property DateAdded: PRTime read GetDateAdded;
    function GetLastModified(): PRTime; safecall;
    property LastModified: PRTime read GetLastModified;
  end;

  nsINavHistoryVisitResultNode = interface(nsINavHistoryResultNode)
  ['{8e2c5a86-b33d-4fa6-944b-559af7e95fcd}']
    function GetSessionId(): PRInt64; safecall;
    property SessionId: PRInt64 read GetSessionId;
  end;

  nsINavHistoryFullVisitResultNode = interface(nsINavHistoryVisitResultNode)
  ['{c49fd9d5-56e2-43eb-932c-f933f28cba85}']
    function GetVisitId(): PRInt64; safecall;
    property VisitId: PRInt64 read GetVisitId;
    function GetReferringVisitId(): PRInt64; safecall;
    property ReferringVisitId: PRInt64 read GetReferringVisitId;
    function GetTransitionType(): PRInt32; safecall;
    property TransitionType: PRInt32 read GetTransitionType;
  end;

  nsINavHistoryContainerResultNode = interface(nsINavHistoryResultNode)
  ['{f9c8e1c1-e701-44ad-893c-8504c3956929}']
    function GetContainerOpen(): PRBool; safecall;
    procedure SetContainerOpen(aContainerOpen: PRBool); safecall;
    property ContainerOpen: PRBool read GetContainerOpen write SetContainerOpen;
    function GetHasChildren(): PRBool; safecall;
    property HasChildren: PRBool read GetHasChildren;
    function GetChildCount(): PRUint32; safecall;
    property ChildCount: PRUint32 read GetChildCount;
    function GetChild(aIndex: PRUint32): nsINavHistoryResultNode; safecall;
    function GetChildrenReadOnly(): PRBool; safecall;
    property ChildrenReadOnly: PRBool read GetChildrenReadOnly;
    procedure GetDynamicContainerType(aDynamicContainerType: nsACString); safecall;
    function AppendURINode(const aURI: nsACString; const aTitle: nsACString; aAccessCount: PRUint32; aTime: PRTime; const aIconURI: nsACString): nsINavHistoryResultNode; safecall;
    function AppendFolderNode(aFolderId: PRInt64): nsINavHistoryContainerResultNode; safecall;
  end;

  nsINavHistoryQueryResultNode = interface(nsINavHistoryContainerResultNode)
  ['{dcd6a2b7-3d50-4c78-b1cb-2f0f18ac5864}']
    procedure GetQueries(out queryCount: PRUint32; out queries_array); safecall;
    function GetQueryOptions(): nsINavHistoryQueryOptions; safecall;
    property QueryOptions: nsINavHistoryQueryOptions read GetQueryOptions;
  end;

  nsINavHistoryResultViewObserver = interface(nsISupports)
  ['{b34d5ca4-ce8e-49a6-9201-a59ae2128d2c}']
    function CanDrop(index: PRInt32; orientation: PRInt32): PRBool; safecall;
    procedure OnDrop(row: PRInt32; orientation: PRInt32); safecall;
    procedure OnToggleOpenState(index: PRInt32); safecall;
    procedure OnCycleHeader(column: nsITreeColumn); safecall;
    procedure OnCycleCell(row: PRInt32; column: nsITreeColumn); safecall;
    procedure OnSelectionChanged(); safecall;
    procedure OnPerformAction(const action: PWideChar); safecall;
    procedure OnPerformActionOnRow(const action: PWideChar; row: PRInt32); safecall;
    procedure OnPerformActionOnCell(const action: PWideChar; row: PRInt32; column: nsITreeColumn); safecall;
  end;

  nsINavHistoryResultViewer = interface(nsISupports)
  ['{f208e54c-834f-4a6c-bd4d-a476015bc139}']
    procedure ItemInserted(parent: nsINavHistoryContainerResultNode; item: nsINavHistoryResultNode; newIndex: PRUint32); safecall;
    procedure ItemRemoved(parent: nsINavHistoryContainerResultNode; item: nsINavHistoryResultNode; oldIndex: PRUint32); safecall;
    procedure ItemChanged(item: nsINavHistoryResultNode); safecall;
    procedure ItemReplaced(parent: nsINavHistoryContainerResultNode; oldItem: nsINavHistoryResultNode; newItem: nsINavHistoryResultNode; index: PRUint32); safecall;
    procedure ContainerOpened(item: nsINavHistoryContainerResultNode); safecall;
    procedure ContainerClosed(item: nsINavHistoryContainerResultNode); safecall;
    procedure InvalidateContainer(item: nsINavHistoryContainerResultNode); safecall;
    procedure InvalidateAll(); safecall;
    procedure SortingChanged(sortingMode: PRUint16); safecall;
    function GetResult(): nsINavHistoryResult; safecall;
    procedure SetResult(aResult: nsINavHistoryResult); safecall;
    property _Result: nsINavHistoryResult read GetResult write SetResult;
    procedure AddViewObserver(observer: nsINavHistoryResultViewObserver; ownsWeak: PRBool); safecall;
    procedure RemoveViewObserver(observer: nsINavHistoryResultViewObserver); safecall;
  end;

  nsINavHistoryResultTreeViewer = interface(nsINavHistoryResultViewer)
  ['{ecd6ad22-8eb0-4824-8a57-5edad9a08ae6}']
    function GetCollapseDuplicates(): PRBool; safecall;
    procedure SetCollapseDuplicates(aCollapseDuplicates: PRBool); safecall;
    property CollapseDuplicates: PRBool read GetCollapseDuplicates write SetCollapseDuplicates;
    function GetFlatItemCount(): PRUint32; safecall;
    property FlatItemCount: PRUint32 read GetFlatItemCount;
    function NodeForTreeIndex(aIndex: PRUint32): nsINavHistoryResultNode; safecall;
    function TreeIndexForNode(aNode: nsINavHistoryResultNode): PRUint32; safecall;
  end;

  nsINavHistoryResult = interface(nsISupports)
  ['{d1562f6f-8d5a-4042-8524-72f747a51b18}']
    function GetSortingMode(): PRUint16; safecall;
    procedure SetSortingMode(aSortingMode: PRUint16); safecall;
    property SortingMode: PRUint16 read GetSortingMode write SetSortingMode;
    procedure GetSortingAnnotation(aSortingAnnotation: nsACString); safecall;
    procedure SetSortingAnnotation(const aSortingAnnotation: nsACString); safecall;
    function GetViewer(): nsINavHistoryResultViewer; safecall;
    procedure SetViewer(aViewer: nsINavHistoryResultViewer); safecall;
    property Viewer: nsINavHistoryResultViewer read GetViewer write SetViewer;
    function GetRoot(): nsINavHistoryContainerResultNode; safecall;
    property Root: nsINavHistoryContainerResultNode read GetRoot;
  end;

  nsINavHistoryObserver = interface(nsISupports)
  ['{849e2184-3dee-416f-91cd-6a619ca49d1c}']
    procedure OnBeginUpdateBatch(); safecall;
    procedure OnEndUpdateBatch(); safecall;
    procedure OnVisit(aURI: nsIURI; aVisitID: PRInt64; aTime: PRTime; aSessionID: PRInt64; aReferringID: PRInt64; aTransitionType: PRUint32); safecall;
    procedure OnTitleChanged(aURI: nsIURI; const aPageTitle: nsAString); safecall;
    procedure OnDeleteURI(aURI: nsIURI); safecall;
    procedure OnClearHistory(); safecall;
    procedure OnPageChanged(aURI: nsIURI; aWhat: PRUint32; const aValue: nsAString); safecall;
    procedure OnPageExpired(aURI: nsIURI; aVisitTime: PRTime; aWholeEntry: PRBool); safecall;
  end;

  nsINavHistoryQuery = interface(nsISupports)
  ['{53b51afe-9de8-40ad-9c81-f2cc1701f1ff}']
    function GetBeginTime(): PRTime; safecall;
    procedure SetBeginTime(aBeginTime: PRTime); safecall;
    property BeginTime: PRTime read GetBeginTime write SetBeginTime;
    function GetBeginTimeReference(): PRUint32; safecall;
    procedure SetBeginTimeReference(aBeginTimeReference: PRUint32); safecall;
    property BeginTimeReference: PRUint32 read GetBeginTimeReference write SetBeginTimeReference;
    function GetHasBeginTime(): PRBool; safecall;
    property HasBeginTime: PRBool read GetHasBeginTime;
    function GetAbsoluteBeginTime(): PRTime; safecall;
    property AbsoluteBeginTime: PRTime read GetAbsoluteBeginTime;
    function GetEndTime(): PRTime; safecall;
    procedure SetEndTime(aEndTime: PRTime); safecall;
    property EndTime: PRTime read GetEndTime write SetEndTime;
    function GetEndTimeReference(): PRUint32; safecall;
    procedure SetEndTimeReference(aEndTimeReference: PRUint32); safecall;
    property EndTimeReference: PRUint32 read GetEndTimeReference write SetEndTimeReference;
    function GetHasEndTime(): PRBool; safecall;
    property HasEndTime: PRBool read GetHasEndTime;
    function GetAbsoluteEndTime(): PRTime; safecall;
    property AbsoluteEndTime: PRTime read GetAbsoluteEndTime;
    procedure GetSearchTerms(aSearchTerms: nsAString); safecall;
    procedure SetSearchTerms(const aSearchTerms: nsAString); safecall;
    function GetHasSearchTerms(): PRBool; safecall;
    property HasSearchTerms: PRBool read GetHasSearchTerms;
    function GetMinVisits(): PRInt32; safecall;
    procedure SetMinVisits(aMinVisits: PRInt32); safecall;
    property MinVisits: PRInt32 read GetMinVisits write SetMinVisits;
    function GetMaxVisits(): PRInt32; safecall;
    procedure SetMaxVisits(aMaxVisits: PRInt32); safecall;
    property MaxVisits: PRInt32 read GetMaxVisits write SetMaxVisits;
    function GetOnlyBookmarked(): PRBool; safecall;
    procedure SetOnlyBookmarked(aOnlyBookmarked: PRBool); safecall;
    property OnlyBookmarked: PRBool read GetOnlyBookmarked write SetOnlyBookmarked;
    function GetDomainIsHost(): PRBool; safecall;
    procedure SetDomainIsHost(aDomainIsHost: PRBool); safecall;
    property DomainIsHost: PRBool read GetDomainIsHost write SetDomainIsHost;
    procedure GetDomain(aDomain: nsACString); safecall;
    procedure SetDomain(const aDomain: nsACString); safecall;
    function GetHasDomain(): PRBool; safecall;
    property HasDomain: PRBool read GetHasDomain;
    function GetUriIsPrefix(): PRBool; safecall;
    procedure SetUriIsPrefix(aUriIsPrefix: PRBool); safecall;
    property UriIsPrefix: PRBool read GetUriIsPrefix write SetUriIsPrefix;
    function GetUri(): nsIURI; safecall;
    procedure SetUri(aUri: nsIURI); safecall;
    property Uri: nsIURI read GetUri write SetUri;
    function GetHasUri(): PRBool; safecall;
    property HasUri: PRBool read GetHasUri;
    function GetAnnotationIsNot(): PRBool; safecall;
    procedure SetAnnotationIsNot(aAnnotationIsNot: PRBool); safecall;
    property AnnotationIsNot: PRBool read GetAnnotationIsNot write SetAnnotationIsNot;
    procedure GetAnnotation(aAnnotation: nsACString); safecall;
    procedure SetAnnotation(const aAnnotation: nsACString); safecall;
    function GetHasAnnotation(): PRBool; safecall;
    property HasAnnotation: PRBool read GetHasAnnotation;
    procedure GetFolders(out count: PRUint32; out folders_array); safecall;
    function GetFolderCount(): PRUint32; safecall;
    property FolderCount: PRUint32 read GetFolderCount;
    procedure SetFolders(const folders_array; folderCount: PRUint32); safecall;
    function Clone(): nsINavHistoryQuery; safecall;
  end;

  nsINavHistoryQueryOptions = interface(nsISupports)
  ['{ff73bf85-2755-4c1a-a48d-8c91ccca770e}']
    procedure GetGroupingMode(out groupCount: PRUint32; out groupingMode_array); safecall;
    procedure SetGroupingMode(const groupingMode_array; groupCount: PRUint32); safecall;
    function GetSortingMode(): PRUint16; safecall;
    procedure SetSortingMode(aSortingMode: PRUint16); safecall;
    property SortingMode: PRUint16 read GetSortingMode write SetSortingMode;
    procedure GetSortingAnnotation(aSortingAnnotation: nsACString); safecall;
    procedure SetSortingAnnotation(const aSortingAnnotation: nsACString); safecall;
    function GetResultType(): PRUint16; safecall;
    procedure SetResultType(aResultType: PRUint16); safecall;
    property ResultType: PRUint16 read GetResultType write SetResultType;
    function GetExcludeItems(): PRBool; safecall;
    procedure SetExcludeItems(aExcludeItems: PRBool); safecall;
    property ExcludeItems: PRBool read GetExcludeItems write SetExcludeItems;
    function GetExcludeQueries(): PRBool; safecall;
    procedure SetExcludeQueries(aExcludeQueries: PRBool); safecall;
    property ExcludeQueries: PRBool read GetExcludeQueries write SetExcludeQueries;
    function GetExcludeReadOnlyFolders(): PRBool; safecall;
    procedure SetExcludeReadOnlyFolders(aExcludeReadOnlyFolders: PRBool); safecall;
    property ExcludeReadOnlyFolders: PRBool read GetExcludeReadOnlyFolders write SetExcludeReadOnlyFolders;
    procedure GetExcludeItemIfParentHasAnnotation(aExcludeItemIfParentHasAnnotation: nsACString); safecall;
    procedure SetExcludeItemIfParentHasAnnotation(const aExcludeItemIfParentHasAnnotation: nsACString); safecall;
    function GetExpandQueries(): PRBool; safecall;
    procedure SetExpandQueries(aExpandQueries: PRBool); safecall;
    property ExpandQueries: PRBool read GetExpandQueries write SetExpandQueries;
    function GetIncludeHidden(): PRBool; safecall;
    procedure SetIncludeHidden(aIncludeHidden: PRBool); safecall;
    property IncludeHidden: PRBool read GetIncludeHidden write SetIncludeHidden;
    function GetShowSessions(): PRBool; safecall;
    procedure SetShowSessions(aShowSessions: PRBool); safecall;
    property ShowSessions: PRBool read GetShowSessions write SetShowSessions;
    function GetMaxResults(): PRUint32; safecall;
    procedure SetMaxResults(aMaxResults: PRUint32); safecall;
    property MaxResults: PRUint32 read GetMaxResults write SetMaxResults;
    function GetApplyOptionsToContainers(): PRBool; safecall;
    procedure SetApplyOptionsToContainers(aApplyOptionsToContainers: PRBool); safecall;
    property ApplyOptionsToContainers: PRBool read GetApplyOptionsToContainers write SetApplyOptionsToContainers;
    function GetQueryType(): PRUint16; safecall;
    procedure SetQueryType(aQueryType: PRUint16); safecall;
    property QueryType: PRUint16 read GetQueryType write SetQueryType;
    function Clone(): nsINavHistoryQueryOptions; safecall;
  end;

  nsINavHistoryService = interface(nsISupports)
  ['{c5846d2c-5340-4cfb-9c0d-c15feca939ce}']
    function GetHasHistoryEntries(): PRBool; safecall;
    property HasHistoryEntries: PRBool read GetHasHistoryEntries;
    procedure GetPageTitle(aURI: nsIURI; _retval: nsAString); safecall;
    procedure MarkPageAsFollowedBookmark(aURI: nsIURI); safecall;
    function CanAddURI(aURI: nsIURI): PRBool; safecall;
    procedure SetPageDetails(aURI: nsIURI; const aTitle: nsAString; aVisitCount: PRUint32; aHidden: PRBool; aTyped: PRBool); safecall;
    function AddVisit(aURI: nsIURI; aTime: PRTime; aReferringVisit: PRInt64; aTransitionType: PRInt32; aIsRedirect: PRBool; aSessionID: PRInt64): PRInt64; safecall;
    function GetNewQuery(): nsINavHistoryQuery; safecall;
    function GetNewQueryOptions(): nsINavHistoryQueryOptions; safecall;
    function ExecuteQuery(aQuery: nsINavHistoryQuery; options: nsINavHistoryQueryOptions): nsINavHistoryResult; safecall;
    function ExecuteQueries(const aQueries_array; aQueryCount: PRUint32; options: nsINavHistoryQueryOptions): nsINavHistoryResult; safecall;
    procedure QueryStringToQueries(const aQueryString: nsACString; out aQueries_array; out aResultCount: PRUint32; out options: nsINavHistoryQueryOptions); safecall;
    procedure QueriesToQueryString(const aQueries_array; aQueryCount: PRUint32; options: nsINavHistoryQueryOptions; _retval: nsACString); safecall;
    procedure AddObserver(observer: nsINavHistoryObserver; ownsWeak: PRBool); safecall;
    procedure RemoveObserver(observer: nsINavHistoryObserver); safecall;
    procedure RunInBatchMode(aCallback: nsINavHistoryBatchCallback; aClosure: nsISupports); safecall;
    function GetHistoryDisabled(): PRBool; safecall;
    property HistoryDisabled: PRBool read GetHistoryDisabled;
    procedure ImportHistory(_file: nsIFile); safecall;
  end;

  nsINavHistoryBatchCallback = interface(nsISupports)
  ['{5143f2bb-be0a-4faf-9acb-b0ed3f82952c}']
    procedure RunBatched(aUserData: nsISupports); safecall;
  end;

  nsINavBookmarkObserver = interface(nsISupports)
  ['{f9828ba8-9c70-4d95-b926-60d9e4378d7d}']
    procedure OnBeginUpdateBatch(); safecall;
    procedure OnEndUpdateBatch(); safecall;
    procedure OnItemAdded(aItemId: PRInt64; aFolder: PRInt64; aIndex: PRInt32); safecall;
    procedure OnItemRemoved(aItemId: PRInt64; aFolder: PRInt64; aIndex: PRInt32); safecall;
    procedure OnItemChanged(aBookmarkId: PRInt64; const aProperty: nsACString; aIsAnnotationProperty: PRBool; const aValue: nsACString); safecall;
    procedure OnItemVisited(aBookmarkId: PRInt64; aVisitID: PRInt64; time: PRTime); safecall;
    procedure OnItemMoved(aItemId: PRInt64; aOldParent: PRInt64; aOldIndex: PRInt32; aNewParent: PRInt64; aNewIndex: PRInt32); safecall;
  end;

  nsINavBookmarksService = interface(nsISupports)
  ['{fb8dc678-681b-453b-a5fe-ab3cc19b3698}']
    function GetPlacesRoot(): PRInt64; safecall;
    property PlacesRoot: PRInt64 read GetPlacesRoot;
    function GetBookmarksMenuFolder(): PRInt64; safecall;
    property BookmarksMenuFolder: PRInt64 read GetBookmarksMenuFolder;
    function GetTagsFolder(): PRInt64; safecall;
    property TagsFolder: PRInt64 read GetTagsFolder;
    function GetUnfiledBookmarksFolder(): PRInt64; safecall;
    property UnfiledBookmarksFolder: PRInt64 read GetUnfiledBookmarksFolder;
    function GetToolbarFolder(): PRInt64; safecall;
    property ToolbarFolder: PRInt64 read GetToolbarFolder;
    function InsertBookmark(aParentFolder: PRInt64; aURI: nsIURI; aIndex: PRInt32; const aTitle: nsAString): PRInt64; safecall;
    procedure RemoveItem(aItemId: PRInt64); safecall;
    function CreateFolder(aParentFolder: PRInt64; const name: nsAString; index: PRInt32): PRInt64; safecall;
    function CreateDynamicContainer(aParentFolder: PRInt64; const aName: nsAString; const aContractId: nsAString; aIndex: PRInt32): PRInt64; safecall;
    procedure RemoveFolder(aFolder: PRInt64); safecall;
    function GetRemoveFolderTransaction(aFolder: PRInt64): nsITransaction; safecall;
    procedure RemoveFolderChildren(aFolder: PRInt64); safecall;
    procedure MoveItem(aFolder: PRInt64; newParent: PRInt64; aIndex: PRInt32); safecall;
    function GetChildFolder(aFolder: PRInt64; const aSubFolder: nsAString): PRInt64; safecall;
    function InsertSeparator(aFolder: PRInt64; aIndex: PRInt32): PRInt64; safecall;
    procedure RemoveChildAt(aFolder: PRInt64; aIndex: PRInt32); safecall;
    procedure GetItemGUID(aItemId: PRInt64; _retval: nsAString); safecall;
    procedure SetItemGUID(aItemId: PRInt64; const aGUID: nsAString); safecall;
    function GetItemIdForGUID(const aGUID: nsAString): PRInt64; safecall;
    procedure SetItemTitle(aItemId: PRInt64; const aTitle: nsAString); safecall;
    procedure GetItemTitle(aItemId: PRInt64; _retval: nsAString); safecall;
    procedure SetItemDateAdded(aItemId: PRInt64; aDateAdded: PRTime); safecall;
    function GetItemDateAdded(aItemId: PRInt64): PRTime; safecall;
    procedure SetItemLastModified(aItemId: PRInt64; aLastModified: PRTime); safecall;
    function GetItemLastModified(aItemId: PRInt64): PRTime; safecall;
    function GetBookmarkURI(aItemId: PRInt64): nsIURI; safecall;
    function GetItemIndex(aItemId: PRInt64): PRInt32; safecall;
    procedure SetItemIndex(aItemId: PRInt64; aNewIndex: PRInt32); safecall;
    function GetItemType(aItemId: PRInt64): PRUint16; safecall;
    function GetFolderReadonly(aFolder: PRInt64): PRBool; safecall;
    procedure SetFolderReadonly(aFolder: PRInt64; aReadOnly: PRBool); safecall;
    function IsBookmarked(aURI: nsIURI): PRBool; safecall;
    function GetBookmarkedURIFor(aURI: nsIURI): nsIURI; safecall;
    procedure ChangeBookmarkURI(aItemId: PRInt64; aNewURI: nsIURI); safecall;
    function GetFolderIdForItem(aItemId: PRInt64): PRInt64; safecall;
    procedure GetBookmarkIdsForURI(aURI: nsIURI; out count: PRUint32; out bookmarks_array); safecall;
    procedure GetBookmarkIdsForURITArray(aURI: nsIURI; aResult: Pointer{PnsTArray<PRInt64>}); safecall;
    procedure SetKeywordForBookmark(aItemId: PRInt64; const aKeyword: nsAString); safecall;
    procedure GetKeywordForURI(aURI: nsIURI; _retval: nsAString); safecall;
    procedure GetKeywordForBookmark(aItemId: PRInt64; _retval: nsAString); safecall;
    function GetURIForKeyword(const keyword: nsAString): nsIURI; safecall;
    procedure AddObserver(observer: nsINavBookmarkObserver; ownsWeak: PRBool); safecall;
    procedure RemoveObserver(observer: nsINavBookmarkObserver); safecall;
    procedure RunInBatchMode(aCallback: nsINavHistoryBatchCallback; aUserData: nsISupports); safecall;
  end;

  nsIPropertyBag = interface(nsISupports)
  ['{bfcd37b0-a49f-11d5-910d-0010a4e73d9a}']
    function GetEnumerator(): nsISimpleEnumerator; safecall;
    property Enumerator: nsISimpleEnumerator read GetEnumerator;
    function GetProperty(const name: nsAString): nsIVariant; safecall;
  end;

  nsIWritablePropertyBag = interface(nsIPropertyBag)
  ['{96fc4671-eeb4-4823-9421-e50fb70ad353}']
    procedure SetProperty(const name: nsAString; value: nsIVariant); safecall;
    procedure DeleteProperty(const name: nsAString); safecall;
  end;

implementation

end.
