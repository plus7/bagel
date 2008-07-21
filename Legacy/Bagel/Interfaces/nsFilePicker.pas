unit nsFilePicker;

interface

uses nsXPCOM, nsTypes, nsGeckoStrings;

const
  NS_IFILEPICKER_IID: TGUID = '{d24ef0aa-d555-4117-84af-9cbbb7406909}';
  NS_IFILEPICKER_modeOpen = 0;
  NS_IFILEPICKER_modeSave = 1;
  NS_IFILEPICKER_modeGetFolder = 2;
  NS_IFILEPICKER_modeOpenMultiple = 3;
  NS_IFILEPICKER_returnOK = 0;
  NS_IFILEPICKER_returnCancel = 1;
  NS_IFILEPICKER_returnReplace = 2;
  NS_IFILEPICKER_filterAll = 1;
  NS_IFILEPICKER_filterHTML = 2;
  NS_IFILEPICKER_filterText = 4;
  NS_IFILEPICKER_filterImages = 8;
  NS_IFILEPICKER_filterXML = 16;
  NS_IFILEPICKER_filterXUL = 32;
  NS_IFILEPICKER_filterApps = 64;
  NS_IFILEPICKER_filterAllowURLs = 128;

type
  nsIFilePicker = interface;
  nsIFilePicker = interface(nsISupports)
  ['{d24ef0aa-d555-4117-84af-9cbbb7406909}']
    procedure Init(parent: nsIDOMWindow; const title: nsAString; mode: PRInt16); safecall;
    procedure AppendFilters(filterMask: PRInt32); safecall;
    procedure AppendFilter(const title: nsAString; const filter: nsAString); safecall;
    procedure GetDefaultString(aDefaultString: nsAString); safecall;
    procedure SetDefaultString(const aDefaultString: nsAString); safecall;
    procedure GetDefaultExtension(aDefaultExtension: nsAString); safecall;
    procedure SetDefaultExtension(const aDefaultExtension: nsAString); safecall;
    function GetFilterIndex(): PRInt32; safecall;
    procedure SetFilterIndex(aFilterIndex: PRInt32); safecall;
    property FilterIndex: PRInt32 read GetFilterIndex write SetFilterIndex;
    function GetDisplayDirectory(): nsILocalFile; safecall;
    procedure SetDisplayDirectory(aDisplayDirectory: nsILocalFile); safecall;
    property DisplayDirectory: nsILocalFile read GetDisplayDirectory write SetDisplayDirectory;
    function GetFile(): nsILocalFile; safecall;
    property _File: nsILocalFile read GetFile;
    function GetFileURL(): nsIURI; safecall;
    property FileURL: nsIURI read GetFileURL;
    function GetFiles(): nsISimpleEnumerator; safecall;
    property Files: nsISimpleEnumerator read GetFiles;
    function Show(): PRInt16; safecall;
  end;

implementation

end.
