unit nsDownload;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsWebProgressListener2,nsMIMEInfo,
  nsHelperApp,mozStorage;

const
  NS_ITRANSFER_IID: TGUID = '{23c51569-e9a1-4a92-adeb-3723db82ef7c}';

  NS_IDOWNLOAD_IID: TGUID = '{c891111e-92a6-47b8-bc46-874ebb61ac9d}';

  NS_IDOWNLOADER_IID: TGUID = '{fafe41a9-a531-4d6d-89bc-588a6522fb4e}';

  NS_IDOWNLOADOBSERVER_IID: TGUID = '{44b3153e-a54e-4077-a527-b0325e40924e}';

  NS_IDOWNLOADHISTORY_IID: TGUID = '{202533cd-a8f1-4ee4-8d20-3a6a0d2c6c51}';

  NS_IDOWNLOADMANAGER_IID: TGUID = '{88a2df08-47f7-4268-bb16-81bab231f1bf}';
  NS_IDOWNLOADMANAGER_DOWNLOAD_TYPE_DOWNLOAD = 0;
  NS_IDOWNLOADMANAGER_DOWNLOAD_NOTSTARTED = -1;
  NS_IDOWNLOADMANAGER_DOWNLOAD_DOWNLOADING = 0;
  NS_IDOWNLOADMANAGER_DOWNLOAD_FINISHED = 1;
  NS_IDOWNLOADMANAGER_DOWNLOAD_FAILED = 2;
  NS_IDOWNLOADMANAGER_DOWNLOAD_CANCELED = 3;
  NS_IDOWNLOADMANAGER_DOWNLOAD_PAUSED = 4;
  NS_IDOWNLOADMANAGER_DOWNLOAD_QUEUED = 5;
  NS_IDOWNLOADMANAGER_DOWNLOAD_BLOCKED_PARENTAL = 6;
  NS_IDOWNLOADMANAGER_DOWNLOAD_SCANNING = 7;
  NS_IDOWNLOADMANAGER_DOWNLOAD_DIRTY = 8;
  NS_IDOWNLOADMANAGER_DOWNLOAD_BLOCKED_POLICY = 9;

  NS_IDOWNLOADMANAGERUI_IID: TGUID = '{ca7663d5-69e3-4c4a-b754-f462bd36b05f}';
  NS_IDOWNLOADMANAGERUI_REASON_USER_INTERACTED = 0;
  NS_IDOWNLOADMANAGERUI_REASON_NEW_DOWNLOAD = 1;

  NS_IDOWNLOADPROGRESSLISTENER_IID: TGUID = '{7acb07ea-cac2-4c15-a3ad-23aaa789ed51}';

type
  nsITransfer = interface;
  nsIDownload = interface;
  nsIDownloader = interface;
  nsIDownloadObserver = interface;
  nsIDownloadHistory = interface;
  nsIDownloadManager = interface;
  nsIDownloadManagerUI = interface;
  nsIDownloadProgressListener = interface;
  nsITransfer = interface(nsIWebProgressListener2)
  ['{23c51569-e9a1-4a92-adeb-3723db82ef7c}']
    procedure Init(aSource: nsIURI; aTarget: nsIURI; const aDisplayName: nsAString; aMIMEInfo: nsIMIMEInfo; startTime: PRTime; aTempFile: nsILocalFile; aCancelable: nsICancelable); safecall;
  end;

  nsIDownload = interface(nsITransfer)
  ['{c891111e-92a6-47b8-bc46-874ebb61ac9d}']
    function GetTargetFile(): nsILocalFile; safecall;
    property TargetFile: nsILocalFile read GetTargetFile;
    function GetPercentComplete(): PRInt32; safecall;
    property PercentComplete: PRInt32 read GetPercentComplete;
    function GetAmountTransferred(): PRInt64; safecall;
    property AmountTransferred: PRInt64 read GetAmountTransferred;
    function GetSize(): PRInt64; safecall;
    property Size: PRInt64 read GetSize;
    function GetSource(): nsIURI; safecall;
    property Source: nsIURI read GetSource;
    function GetTarget(): nsIURI; safecall;
    property Target: nsIURI read GetTarget;
    function GetCancelable(): nsICancelable; safecall;
    property Cancelable: nsICancelable read GetCancelable;
    procedure GetDisplayName(aDisplayName: nsAString); safecall;
    function GetStartTime(): PRInt64; safecall;
    property StartTime: PRInt64 read GetStartTime;
    function GetSpeed(): Double; safecall;
    property Speed: Double read GetSpeed;
    function GetMIMEInfo(): nsIMIMEInfo; safecall;
    property MIMEInfo: nsIMIMEInfo read GetMIMEInfo;
    function GetId(): PRUint32; safecall;
    property Id: PRUint32 read GetId;
    function GetState(): PRInt16; safecall;
    property State: PRInt16 read GetState;
    function GetReferrer(): nsIURI; safecall;
    property Referrer: nsIURI read GetReferrer;
    function GetResumable(): PRBool; safecall;
    property Resumable: PRBool read GetResumable;
  end;

  nsIDownloader = interface(nsIStreamListener)
  ['{fafe41a9-a531-4d6d-89bc-588a6522fb4e}']
    procedure Init(observer: nsIDownloadObserver; downloadLocation: nsIFile); safecall;
  end;

  nsIDownloadObserver = interface(nsISupports)
  ['{44b3153e-a54e-4077-a527-b0325e40924e}']
    procedure OnDownloadComplete(downloader: nsIDownloader; request: nsIRequest; ctxt: nsISupports; status: nsresult; _result: nsIFile); safecall;
  end;

  nsIDownloadHistory = interface(nsISupports)
  ['{202533cd-a8f1-4ee4-8d20-3a6a0d2c6c51}']
    procedure AddDownload(aSource: nsIURI; aReferrer: nsIURI; aStartTime: PRTime); safecall;
  end;

  nsIDownloadManager = interface(nsISupports)
  ['{88a2df08-47f7-4268-bb16-81bab231f1bf}']
    function AddDownload(aDownloadType: PRInt16; aSource: nsIURI; aTarget: nsIURI; const aDisplayName: nsAString; aMIMEInfo: nsIMIMEInfo; aStartTime: PRTime; aTempFile: nsILocalFile; aCancelable: nsICancelable): nsIDownload; safecall;
    function GetDownload(aID: PRUint32): nsIDownload; safecall;
    procedure CancelDownload(aID: PRUint32); safecall;
    procedure RemoveDownload(aID: PRUint32); safecall;
    procedure PauseDownload(aID: PRUint32); safecall;
    procedure ResumeDownload(aID: PRUint32); safecall;
    procedure RetryDownload(aID: PRUint32); safecall;
    function GetDBConnection(): mozIStorageConnection; safecall;
    property DBConnection: mozIStorageConnection read GetDBConnection;
    function GetCanCleanUp(): PRBool; safecall;
    property CanCleanUp: PRBool read GetCanCleanUp;
    procedure CleanUp(); safecall;
    function GetActiveDownloadCount(): PRInt32; safecall;
    property ActiveDownloadCount: PRInt32 read GetActiveDownloadCount;
    function GetActiveDownloads(): nsISimpleEnumerator; safecall;
    property ActiveDownloads: nsISimpleEnumerator read GetActiveDownloads;
    procedure AddListener(aListener: nsIDownloadProgressListener); safecall;
    procedure RemoveListener(aListener: nsIDownloadProgressListener); safecall;
    function GetDefaultDownloadsDirectory(): nsILocalFile; safecall;
    property DefaultDownloadsDirectory: nsILocalFile read GetDefaultDownloadsDirectory;
    function GetUserDownloadsDirectory(): nsILocalFile; safecall;
    property UserDownloadsDirectory: nsILocalFile read GetUserDownloadsDirectory;
  end;

  nsIDownloadManagerUI = interface(nsISupports)
  ['{ca7663d5-69e3-4c4a-b754-f462bd36b05f}']
    procedure Show(aWindowContext: nsIInterfaceRequestor; aID: PRUint32; aReason: PRInt16); safecall;
    function GetVisible(): PRBool; safecall;
    property Visible: PRBool read GetVisible;
    procedure GetAttention(); safecall;
  end;

  nsIDownloadProgressListener = interface(nsISupports)
  ['{7acb07ea-cac2-4c15-a3ad-23aaa789ed51}']
    function GetDocument(): nsIDOMDocument; safecall;
    procedure SetDocument(aDocument: nsIDOMDocument); safecall;
    property Document: nsIDOMDocument read GetDocument write SetDocument;
    procedure OnDownloadStateChange(aState: PRInt16; aDownload: nsIDownload); safecall;
    procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult; aDownload: nsIDownload); safecall;
    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64; aDownload: nsIDownload); safecall;
    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aState: PRUint32; aDownload: nsIDownload); safecall;
  end;

implementation

end.
