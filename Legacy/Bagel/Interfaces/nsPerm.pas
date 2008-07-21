unit nsPerm;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IPERMISSION_IID: TGUID = '{28f16d80-157b-11d5-a542-0010a401eb10}';

  NS_IPERMISSIONMANAGER_IID: TGUID = '{00708302-684c-42d6-a5a3-995d51b1d17c}';
  NS_IPERMISSIONMANAGER_UNKNOWN_ACTION = 0;
  NS_IPERMISSIONMANAGER_ALLOW_ACTION = 1;
  NS_IPERMISSIONMANAGER_DENY_ACTION = 2;

type
  nsIPermission = interface;
  nsIPermissionManager = interface;
  nsIPermission = interface(nsISupports)
  ['{28f16d80-157b-11d5-a542-0010a401eb10}']
    procedure GetHost(aHost: nsACString); safecall;
    procedure GetType(aType: nsACString); safecall;
    function GetCapability(): PRUint32; safecall;
    property Capability: PRUint32 read GetCapability;
  end;

  nsIPermissionManager = interface(nsISupports)
  ['{00708302-684c-42d6-a5a3-995d51b1d17c}']
    procedure Add(uri: nsIURI; const _type: PAnsiChar; permission: PRUint32); safecall;
    procedure Remove(const host: nsACString; const _type: PAnsiChar); safecall;
    procedure RemoveAll(); safecall;
    function TestPermission(uri: nsIURI; const _type: PAnsiChar): PRUint32; safecall;
    function TestExactPermission(uri: nsIURI; const _type: PAnsiChar): PRUint32; safecall;
    function GetEnumerator(): nsISimpleEnumerator; safecall;
    property Enumerator: nsISimpleEnumerator read GetEnumerator;
  end;

implementation

end.
