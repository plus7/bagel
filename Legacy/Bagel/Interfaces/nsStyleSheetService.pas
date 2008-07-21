unit nsStyleSheetService;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_ISTYLESHEETSERVICE_IID: TGUID = '{1f42a6a2-ab0a-45d4-8a96-396f58ea6c6d}';
  NS_ISTYLESHEETSERVICE_AGENT_SHEET = 0;
  NS_ISTYLESHEETSERVICE_USER_SHEET = 1;

type
  nsIStyleSheetService = interface;
  nsIStyleSheetService = interface(nsISupports)
  ['{1f42a6a2-ab0a-45d4-8a96-396f58ea6c6d}']
    procedure LoadAndRegisterSheet(sheetURI: nsIURI; _type: PRUint32); safecall;
    function SheetRegistered(sheetURI: nsIURI; _type: PRUint32): PRBool; safecall;
    procedure UnregisterSheet(sheetURI: nsIURI; _type: PRUint32); safecall;
  end;

implementation

end.
