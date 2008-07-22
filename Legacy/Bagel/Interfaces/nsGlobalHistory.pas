unit nsGlobalHistory;

interface

uses nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IGLOBALHISTORY2_IID: TGUID = '{cf777d42-1270-4b34-be7b-2931c93feda5}';

  NS_IGLOBALHISTORY3_IID: TGUID = '{24306852-c60e-49c3-a455-90f6747118ba}';

  NS_IBROWSERHISTORY_IID: TGUID = '{96602bf3-de2a-42ed-812f-a83b130e6299}';

type
  nsIGlobalHistory2 = interface;
  nsIGlobalHistory3 = interface;
  nsIBrowserHistory = interface;
  nsIGlobalHistory2 = interface(nsISupports)
  ['{cf777d42-1270-4b34-be7b-2931c93feda5}']
    procedure AddURI(aURI: nsIURI; aRedirect: PRBool; aToplevel: PRBool; aReferrer: nsIURI); safecall;
    function IsVisited(aURI: nsIURI): PRBool; safecall;
    procedure SetPageTitle(aURI: nsIURI; const aTitle: nsAString); safecall;
  end;

  nsIGlobalHistory3 = interface(nsIGlobalHistory2)
  ['{24306852-c60e-49c3-a455-90f6747118ba}']
    procedure AddDocumentRedirect(aOldChannel: nsIChannel; aNewChannel: nsIChannel; aFlags: PRInt32; aTopLevel: PRBool); safecall;
    function GetURIGeckoFlags(aURI: nsIURI): PRUint32; safecall;
    procedure SetURIGeckoFlags(aURI: nsIURI; aFlags: PRUint32); safecall;
  end;

  nsIBrowserHistory = interface(nsIGlobalHistory2)
  ['{96602bf3-de2a-42ed-812f-a83b130e6299}']
    procedure AddPageWithDetails(aURI: nsIURI; const aTitle: PWideChar; aLastVisited: PRInt64); safecall;
    procedure GetLastPageVisited(aLastPageVisited: nsACString); safecall;
    function GetCount(): PRUint32; safecall;
    property Count: PRUint32 read GetCount;
    procedure RemovePage(aURI: nsIURI); safecall;
    procedure RemovePages(const aURIs_array; aLength: PRUint32; aDoBatchNotify: PRBool); safecall;
    procedure RemovePagesFromHost(const aHost: nsACString; aEntireDomain: PRBool); safecall;
    procedure RemovePagesByTimeframe(aBeginTime: PRInt64; aEndTime: PRInt64); safecall;
    procedure RemoveAllPages(); safecall;
    procedure HidePage(aURI: nsIURI); safecall;
    procedure MarkPageAsTyped(aURI: nsIURI); safecall;
  end;

implementation

end.
