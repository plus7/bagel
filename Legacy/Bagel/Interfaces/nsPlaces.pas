unit nsPlaces;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_INAVHISTORYRESULTNODE_IID: TGUID = '{47cf89e3-4777-46bf-9677-21793870ce62}';
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_URI = 0;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_VISIT = 1;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_FULL_VISIT = 2;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_DYNAMIC_CONTAINER = 4;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_QUERY = 5;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_FOLDER = 6;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_SEPARATOR = 7;
  NS_INAVHISTORYRESULTNODE_RESULT_TYPE_FOLDER_SHORTCUT = 9;

  NS_INAVHISTORYVISITRESULTNODE_IID: TGUID = '{8e2c5a86-b33d-4fa6-944b-559af7e95fcd}';

  NS_INAVHISTORYFULLVISITRESULTNODE_IID: TGUID = '{c49fd9d5-56e2-43eb-932c-f933f28cba85}';

  NS_INAVHISTORYCONTAINERRESULTNODE_IID: TGUID = '{f9c8e1c1-e701-44ad-893c-8504c3956929}';

  NS_INAVHISTORYQUERYRESULTNODE_IID: TGUID = '{ea17745a-1852-4155-a98f-d1dd1763b3df}';

  NS_INAVHISTORYRESULTVIEWER_IID: TGUID = '{e60f4429-3787-45c8-a8c0-18ef52621bbf}';

  NS_INAVHISTORYRESULTTREEVIEWER_IID: TGUID = '{fa77e4e9-9fc8-45d2-9507-0fe4f0602505}';
  NS_INAVHISTORYRESULTTREEVIEWER_INDEX_INVISIBLE = 4294967295;

  NS_INAVHISTORYRESULT_IID: TGUID = '{d1562f6f-8d5a-4042-8524-72f747a51b18}';

  NS_INAVHISTORYOBSERVER_IID: TGUID = '{eacb76eb-3eeb-419b-a963-9b3a9d65f356}';
  NS_INAVHISTORYOBSERVER_ATTRIBUTE_FAVICON = 3;

  NS_INAVHISTORYQUERY_IID: TGUID = '{53b51afe-9de8-40ad-9c81-f2cc1701f1ff}';
  NS_INAVHISTORYQUERY_TIME_RELATIVE_EPOCH = 0;
  NS_INAVHISTORYQUERY_TIME_RELATIVE_TODAY = 1;
  NS_INAVHISTORYQUERY_TIME_RELATIVE_NOW = 2;

  NS_INAVHISTORYQUERYOPTIONS_IID: TGUID = '{a46c132e-35f3-4e1e-bb3d-4e3043657248}';
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
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_TAGS_ASCENDING = 17;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_TAGS_DESCENDING = 18;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_ANNOTATION_ASCENDING = 19;
  NS_INAVHISTORYQUERYOPTIONS_SORT_BY_ANNOTATION_DESCENDING = 20;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_URI = 0;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_VISIT = 1;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_FULL_VISIT = 2;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_DATE_QUERY = 3;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_SITE_QUERY = 4;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_DATE_SITE_QUERY = 5;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_TAG_QUERY = 6;
  NS_INAVHISTORYQUERYOPTIONS_RESULTS_AS_TAG_CONTENTS = 7;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_HISTORY = 0;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_BOOKMARKS = 1;
  NS_INAVHISTORYQUERYOPTIONS_QUERY_TYPE_UNIFIED = 2;

  NS_INAVHISTORYSERVICE_IID: TGUID = '{8b258ff6-b591-4da5-8b7c-0665b27d09cc}';
  NS_INAVHISTORYSERVICE_TRANSITION_LINK = 1;
  NS_INAVHISTORYSERVICE_TRANSITION_TYPED = 2;
  NS_INAVHISTORYSERVICE_TRANSITION_BOOKMARK = 3;
  NS_INAVHISTORYSERVICE_TRANSITION_EMBED = 4;
  NS_INAVHISTORYSERVICE_TRANSITION_REDIRECT_PERMANENT = 5;
  NS_INAVHISTORYSERVICE_TRANSITION_REDIRECT_TEMPORARY = 6;
  NS_INAVHISTORYSERVICE_TRANSITION_DOWNLOAD = 7;

  NS_INAVHISTORYBATCHCALLBACK_IID: TGUID = '{5143f2bb-be0a-4faf-9acb-b0ed3f82952c}';

  NS_IPROPERTYBAG_IID: TGUID = '{bfcd37b0-a49f-11d5-910d-0010a4e73d9a}';

  NS_IWRITABLEPROPERTYBAG_IID: TGUID = '{96fc4671-eeb4-4823-9421-e50fb70ad353}';

type
  nsINavHistoryResultNode = interface;
  nsINavHistoryVisitResultNode = interface;
  nsINavHistoryFullVisitResultNode = interface;
  nsINavHistoryContainerResultNode = interface;
  nsINavHistoryQueryResultNode = interface;
  nsINavHistoryResultViewer = interface;
  nsINavHistoryResultTreeViewer = interface;
  nsINavHistoryResult = interface;
  nsINavHistoryObserver = interface;
  nsINavHistoryQuery = interface;
  nsINavHistoryQueryOptions = interface;
  nsINavHistoryService = interface;
  nsINavHistoryBatchCallback = interface;
  nsIPropertyBag = interface;
  nsIWritablePropertyBag = interface;
  nsINavHistoryResultNode = interface(nsISupports)
  ['{47cf89e3-4777-46bf-9677-21793870ce62}']
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
    procedure GetTags(aTags: nsAString); safecall;
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
  ['{ea17745a-1852-4155-a98f-d1dd1763b3df}']
    procedure GetQueries(out queryCount: PRUint32; out queries_array); safecall;
    function GetQueryOptions(): nsINavHistoryQueryOptions; safecall;
    property QueryOptions: nsINavHistoryQueryOptions read GetQueryOptions;
    function GetFolderItemId(): PRInt64; safecall;
    property FolderItemId: PRInt64 read GetFolderItemId;
  end;

  nsINavHistoryResultViewer = interface(nsISupports)
  ['{e60f4429-3787-45c8-a8c0-18ef52621bbf}']
    procedure ItemInserted(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aNewIndex: PRUint32); safecall;
    procedure ItemRemoved(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aOldIndex: PRUint32); safecall;
    procedure ItemMoved(aItem: nsINavHistoryResultNode; aOldParent: nsINavHistoryContainerResultNode; aOldIndex: PRUint32; aNewParent: nsINavHistoryContainerResultNode; aNewIndex: PRUint32); safecall;
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
  end;

  nsINavHistoryResultTreeViewer = interface(nsINavHistoryResultViewer)
  ['{fa77e4e9-9fc8-45d2-9507-0fe4f0602505}']
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
  ['{eacb76eb-3eeb-419b-a963-9b3a9d65f356}']
    procedure OnBeginUpdateBatch(); safecall;
    procedure OnEndUpdateBatch(); safecall;
    procedure OnVisit(aURI: nsIURI; aVisitID: PRInt64; aTime: PRTime; aSessionID: PRInt64; aReferringID: PRInt64; aTransitionType: PRUint32; out aAdded: PRUint32); safecall;
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
  ['{a46c132e-35f3-4e1e-bb3d-4e3043657248}']
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
    function GetQueryType(): PRUint16; safecall;
    procedure SetQueryType(aQueryType: PRUint16); safecall;
    property QueryType: PRUint16 read GetQueryType write SetQueryType;
    function Clone(): nsINavHistoryQueryOptions; safecall;
  end;

  nsINavHistoryService = interface(nsISupports)
  ['{8b258ff6-b591-4da5-8b7c-0665b27d09cc}']
    function GetHasHistoryEntries(): PRBool; safecall;
    property HasHistoryEntries: PRBool read GetHasHistoryEntries;
    procedure GetPageTitle(aURI: nsIURI; _retval: nsAString); safecall;
    procedure MarkPageAsFollowedBookmark(aURI: nsIURI); safecall;
    procedure GetCharsetForURI(aURI: nsIURI; _retval: nsAString); safecall;
    procedure SetCharsetForURI(aURI: nsIURI; const aCharset: nsAString); safecall;
    function CanAddURI(aURI: nsIURI): PRBool; safecall;
    function AddVisit(aURI: nsIURI; aTime: PRTime; aReferringURI: nsIURI; aTransitionType: PRInt32; aIsRedirect: PRBool; aSessionID: PRInt64): PRInt64; safecall;
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
