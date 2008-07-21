unit nsCache;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_ICACHE_IID: TGUID = '{ec1c0063-197d-44bb-84ba-7525d50fc937}';
  NS_ICACHE_ACCESS_NONE = 0;
  NS_ICACHE_ACCESS_READ = 1;
  NS_ICACHE_ACCESS_WRITE = 2;
  NS_ICACHE_ACCESS_READ_WRITE = 3;
  NS_ICACHE_STORE_ANYWHERE = 0;
  NS_ICACHE_STORE_IN_MEMORY = 1;
  NS_ICACHE_STORE_ON_DISK = 2;
  NS_ICACHE_STORE_ON_DISK_AS_FILE = 3;
  NS_ICACHE_STORE_OFFLINE = 4;
  NS_ICACHE_NOT_STREAM_BASED = 0;
  NS_ICACHE_STREAM_BASED = 1;
  NS_ICACHE_NON_BLOCKING = 0;
  NS_ICACHE_BLOCKING = 1;

  NS_ICACHEVISITOR_IID: TGUID = '{f8c08c4b-d778-49d1-a59b-866fdc500d95}';

  NS_ICACHEDEVICEINFO_IID: TGUID = '{31d1c294-1dd2-11b2-be3a-c79230dca297}';

  NS_ICACHEENTRYINFO_IID: TGUID = '{fab51c92-95c3-4468-b317-7de4d7588254}';

  NS_ICACHEENTRYDESCRIPTOR_IID: TGUID = '{49c1a11d-f5d2-4f09-8262-551e64908ada}';

  NS_ICACHEMETADATAVISITOR_IID: TGUID = '{22f9a49c-3cf8-4c23-8006-54efb11ac562}';

  NS_ICACHELISTENER_IID: TGUID = '{638c3848-778b-4851-8ff3-9400f65b8773}';

  NS_ICACHESERVICE_IID: TGUID = '{98dd0187-aad4-4cab-82c5-1adddef3629d}';

  NS_ICACHESESSION_IID: TGUID = '{ae9e84b5-3e2d-457e-8fcd-5bbd2a8b832e}';

type
  nsICache = interface;
  nsICacheVisitor = interface;
  nsICacheDeviceInfo = interface;
  nsICacheEntryInfo = interface;
  nsICacheEntryDescriptor = interface;
  nsICacheMetaDataVisitor = interface;
  nsICacheListener = interface;
  nsICacheService = interface;
  nsICacheSession = interface;
  nsCacheStoragePolicy = PRInt32;
  nsCacheAccessMode = PRInt32;
  nsICache = interface
  ['{ec1c0063-197d-44bb-84ba-7525d50fc937}']
  end;

  nsICacheVisitor = interface(nsISupports)
  ['{f8c08c4b-d778-49d1-a59b-866fdc500d95}']
    function VisitDevice(const deviceID: PAnsiChar; deviceInfo: nsICacheDeviceInfo): PRBool; safecall;
    function VisitEntry(const deviceID: PAnsiChar; entryInfo: nsICacheEntryInfo): PRBool; safecall;
  end;

  nsICacheDeviceInfo = interface(nsISupports)
  ['{31d1c294-1dd2-11b2-be3a-c79230dca297}']
    function GetDescription(): PAnsiChar; safecall;
    property Description: PAnsiChar read GetDescription;
    function GetUsageReport(): PAnsiChar; safecall;
    property UsageReport: PAnsiChar read GetUsageReport;
    function GetEntryCount(): PRUint32; safecall;
    property EntryCount: PRUint32 read GetEntryCount;
    function GetTotalSize(): PRUint32; safecall;
    property TotalSize: PRUint32 read GetTotalSize;
    function GetMaximumSize(): PRUint32; safecall;
    property MaximumSize: PRUint32 read GetMaximumSize;
  end;

  nsICacheEntryInfo = interface(nsISupports)
  ['{fab51c92-95c3-4468-b317-7de4d7588254}']
    function GetClientID(): PAnsiChar; safecall;
    property ClientID: PAnsiChar read GetClientID;
    function GetDeviceID(): PAnsiChar; safecall;
    property DeviceID: PAnsiChar read GetDeviceID;
    procedure GetKey(aKey: nsACString); safecall;
    function GetFetchCount(): PRInt32; safecall;
    property FetchCount: PRInt32 read GetFetchCount;
    function GetLastFetched(): PRUint32; safecall;
    property LastFetched: PRUint32 read GetLastFetched;
    function GetLastModified(): PRUint32; safecall;
    property LastModified: PRUint32 read GetLastModified;
    function GetExpirationTime(): PRUint32; safecall;
    property ExpirationTime: PRUint32 read GetExpirationTime;
    function GetDataSize(): PRUint32; safecall;
    property DataSize: PRUint32 read GetDataSize;
    function IsStreamBased(): PRBool; safecall;
  end;

  nsICacheEntryDescriptor = interface(nsICacheEntryInfo)
  ['{49c1a11d-f5d2-4f09-8262-551e64908ada}']
    procedure SetExpirationTime(expirationTime: PRUint32); safecall;
    procedure SetDataSize(size: PRUint32); safecall;
    function OpenInputStream(offset: PRUint32): nsIInputStream; safecall;
    function OpenOutputStream(offset: PRUint32): nsIOutputStream; safecall;
    function GetCacheElement(): nsISupports; safecall;
    procedure SetCacheElement(aCacheElement: nsISupports); safecall;
    property CacheElement: nsISupports read GetCacheElement write SetCacheElement;
    function GetAccessGranted(): nsCacheAccessMode; safecall;
    property AccessGranted: nsCacheAccessMode read GetAccessGranted;
    function GetStoragePolicy(): nsCacheStoragePolicy; safecall;
    procedure SetStoragePolicy(aStoragePolicy: nsCacheStoragePolicy); safecall;
    property StoragePolicy: nsCacheStoragePolicy read GetStoragePolicy write SetStoragePolicy;
    function GetFile(): nsIFile; safecall;
    property _File: nsIFile read GetFile;
    function GetSecurityInfo(): nsISupports; safecall;
    procedure SetSecurityInfo(aSecurityInfo: nsISupports); safecall;
    property SecurityInfo: nsISupports read GetSecurityInfo write SetSecurityInfo;
    procedure Doom(); safecall;
    procedure DoomAndFailPendingRequests(status: nsresult); safecall;
    procedure MarkValid(); safecall;
    procedure Close(); safecall;
    function GetMetaDataElement(const key: PAnsiChar): PAnsiChar; safecall;
    procedure SetMetaDataElement(const key: PAnsiChar; const value: PAnsiChar); safecall;
    procedure VisitMetaData(visitor: nsICacheMetaDataVisitor); safecall;
  end;

  nsICacheMetaDataVisitor = interface(nsISupports)
  ['{22f9a49c-3cf8-4c23-8006-54efb11ac562}']
    function VisitMetaDataElement(const key: PAnsiChar; const value: PAnsiChar): PRBool; safecall;
  end;

  nsICacheListener = interface(nsISupports)
  ['{638c3848-778b-4851-8ff3-9400f65b8773}']
    procedure OnCacheEntryAvailable(descriptor: nsICacheEntryDescriptor; accessGranted: nsCacheAccessMode; status: nsresult); safecall;
  end;

  nsICacheService = interface(nsISupports)
  ['{98dd0187-aad4-4cab-82c5-1adddef3629d}']
    function CreateSession(const clientID: PAnsiChar; storagePolicy: nsCacheStoragePolicy; streamBased: PRBool): nsICacheSession; safecall;
    procedure VisitEntries(visitor: nsICacheVisitor); safecall;
    procedure EvictEntries(storagePolicy: nsCacheStoragePolicy); safecall;
    function CreateTemporaryClientID(storagePolicy: nsCacheStoragePolicy): nsACString; safecall;
  end;

  nsICacheSession = interface(nsISupports)
  ['{ae9e84b5-3e2d-457e-8fcd-5bbd2a8b832e}']
    function GetDoomEntriesIfExpired(): PRBool; safecall;
    procedure SetDoomEntriesIfExpired(aDoomEntriesIfExpired: PRBool); safecall;
    property DoomEntriesIfExpired: PRBool read GetDoomEntriesIfExpired write SetDoomEntriesIfExpired;
    function OpenCacheEntry(const key: nsACString; accessRequested: nsCacheAccessMode; blockingMode: PRBool): nsICacheEntryDescriptor; safecall;
    procedure AsyncOpenCacheEntry(const key: nsACString; accessRequested: nsCacheAccessMode; listener: nsICacheListener); safecall;
    procedure EvictEntries(); safecall;
    function IsStorageEnabled(): PRBool; safecall;
  end;

implementation

end.
