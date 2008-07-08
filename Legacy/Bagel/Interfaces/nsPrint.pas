unit nsPrint;

interface
uses nsTypes, nsXPCOM;

const
  NS_IPRINTSETTINGSSERVICE_IID: TGUID = '{841387c8-72e6-484b-9296-bf6eea80d58a}';

type
  nsIPrintSettingsService = interface;
  nsIPrintSettingsService = interface(nsISupports)
  ['{841387c8-72e6-484b-9296-bf6eea80d58a}']
    function GetGlobalPrintSettings(): nsIPrintSettings; safecall;
    property GlobalPrintSettings: nsIPrintSettings read GetGlobalPrintSettings;
    function GetNewPrintSettings(): nsIPrintSettings; safecall;
    property NewPrintSettings: nsIPrintSettings read GetNewPrintSettings;
    function GetDefaultPrinterName(): PWideChar; safecall;
    property DefaultPrinterName: PWideChar read GetDefaultPrinterName;
    procedure InitPrintSettingsFromPrinter(const aPrinterName: PWideChar; aPrintSettings: nsIPrintSettings); safecall;
    procedure InitPrintSettingsFromPrefs(aPrintSettings: nsIPrintSettings; aUsePrinterNamePrefix: PRBool; aFlags: PRUint32); safecall;
    procedure SavePrintSettingsToPrefs(aPrintSettings: nsIPrintSettings; aUsePrinterNamePrefix: PRBool; aFlags: PRUint32); safecall;
  end;

implementation

end.
