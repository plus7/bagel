unit nsGlobalHistory;

interface
uses nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IGLOBALHISTORY2_IID: TGUID = '{cf777d42-1270-4b34-be7b-2931c93feda5}';

  NS_IBROWSERHISTORY_IID: TGUID = '{c43079c3-3d8d-4b7c-af14-0e30ab46865f}';

type
  nsIGlobalHistory2 = interface;
  nsIBrowserHistory = interface;
  nsIGlobalHistory2 = interface(nsISupports)
  ['{cf777d42-1270-4b34-be7b-2931c93feda5}']
    procedure AddURI(aURI: nsIURI; aRedirect: PRBool; aToplevel: PRBool; aReferrer: nsIURI); safecall;
    function IsVisited(aURI: nsIURI): PRBool; safecall;
    procedure SetPageTitle(aURI: nsIURI; const aTitle: nsAString); safecall;
  end;

  nsIBrowserHistory = interface(nsIGlobalHistory2)
  ['{c43079c3-3d8d-4b7c-af14-0e30ab46865f}']
    procedure AddPageWithDetails(aURI: nsIURI; const aTitle: PWideChar; aLastVisited: PRInt64); safecall;
    procedure GetLastPageVisited(aLastPageVisited: nsACString); safecall;
    function GetCount(): PRUint32; safecall;
    property Count: PRUint32 read GetCount;
    procedure RemovePage(aURI: nsIURI); safecall;
    procedure RemovePagesFromHost(const aHost: nsACString; aEntireDomain: PRBool); safecall;
    procedure RemoveAllPages(); safecall;
    procedure HidePage(aURI: nsIURI); safecall;
    procedure MarkPageAsTyped(aURI: nsIURI); safecall;
  end;

implementation

end.
