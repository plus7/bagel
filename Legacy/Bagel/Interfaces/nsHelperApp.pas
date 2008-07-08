unit nsHelperApp;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsMIMEInfo,nsWebProgressListener2;

const
  NS_IHELPERAPPLAUNCHERDIALOG_IID: TGUID = '{f3704fdc-8ae6-4eba-a3c3-f02958ac0649}';
  NS_IHELPERAPPLAUNCHERDIALOG_REASON_CANTHANDLE = 0;
  NS_IHELPERAPPLAUNCHERDIALOG_REASON_SERVERREQUEST = 1;
  NS_IHELPERAPPLAUNCHERDIALOG_REASON_TYPESNIFFED = 2;

  NS_ICANCELABLE_IID: TGUID = '{d94ac0a0-bb18-46b8-844e-84159064b0bd}';

  NS_IEXTERNALHELPERAPPSERVICE_IID: TGUID = '{9e456297-ba3e-42b1-92bd-b7db014268cb}';

  NS_PIEXTERNALAPPLAUNCHER_IID: TGUID = '{d0b5d7d3-9565-403d-9fb5-e5089c4567c6}';

  NS_IHELPERAPPLAUNCHER_IID: TGUID = '{cc75c21a-0a79-4f68-90e1-563253d0c555}';

type
  nsIHelperAppLauncherDialog = interface;
  nsICancelable = interface;
  nsIExternalHelperAppService = interface;
  nsPIExternalAppLauncher = interface;
  nsIHelperAppLauncher = interface;
  nsIHelperAppLauncherDialog = interface(nsISupports)
  ['{f3704fdc-8ae6-4eba-a3c3-f02958ac0649}']
    procedure Show(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; aReason: PRUint32); safecall;
    function PromptForSaveToFile(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; const aDefaultFileName: PWideChar; const aSuggestedFileExtension: PWideChar; aForcePrompt: PRBool): nsILocalFile; safecall;
  end;

  nsICancelable = interface(nsISupports)
  ['{d94ac0a0-bb18-46b8-844e-84159064b0bd}']
    procedure Cancel(aReason: nsresult); safecall;
  end;

  nsIExternalHelperAppService = interface(nsISupports)
  ['{9e456297-ba3e-42b1-92bd-b7db014268cb}']
    function DoContent(const aMimeContentType: nsACString; aRequest: nsIRequest; aWindowContext: nsIInterfaceRequestor; aForceSave: PRBool): nsIStreamListener; safecall;
    function ApplyDecodingForExtension(const aExtension: nsACString; const aEncodingType: nsACString): PRBool; safecall;
  end;

  nsPIExternalAppLauncher = interface(nsISupports)
  ['{d0b5d7d3-9565-403d-9fb5-e5089c4567c6}']
    procedure DeleteTemporaryFileOnExit(aTemporaryFile: nsIFile); safecall;
  end;

  nsIHelperAppLauncher = interface(nsICancelable)
  ['{cc75c21a-0a79-4f68-90e1-563253d0c555}']
    function GetMIMEInfo(): nsIMIMEInfo; safecall;
    property MIMEInfo: nsIMIMEInfo read GetMIMEInfo;
    function GetSource(): nsIURI; safecall;
    property Source: nsIURI read GetSource;
    procedure GetSuggestedFileName(aSuggestedFileName: nsAString); safecall;
    procedure SaveToDisk(aNewFileLocation: nsIFile; aRememberThisPreference: PRBool); safecall;
    procedure LaunchWithApplication(aApplication: nsIFile; aRememberThisPreference: PRBool); safecall;
    procedure SetWebProgressListener(aWebProgressListener: nsIWebProgressListener2); safecall;
    procedure CloseProgressWindow(); safecall;
    function GetTargetFile(): nsIFile; safecall;
    property TargetFile: nsIFile read GetTargetFile;
    function GetTargetFileIsExecutable(): PRBool; safecall;
    property TargetFileIsExecutable: PRBool read GetTargetFileIsExecutable;
    function GetTimeDownloadStarted(): PRTime; safecall;
    property TimeDownloadStarted: PRTime read GetTimeDownloadStarted;
  end;

implementation

end.
