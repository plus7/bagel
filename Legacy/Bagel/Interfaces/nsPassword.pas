unit nsPassword;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IPASSWORDMANAGER_IID: TGUID = '{173562f0-2173-11d5-a54c-0010a401eb10}';

  NS_IPASSWORDMANAGERINTERNAL_IID: TGUID = '{a448531f-dc92-4dc1-9012-da841febcbe0}';

type
  nsIPasswordManager = interface;
  nsIPasswordManagerInternal = interface;
  nsIPasswordManager = interface(nsISupports)
  ['{173562f0-2173-11d5-a54c-0010a401eb10}']
    procedure AddUser(const aHost: nsACString; const aUser: nsAString; const aPassword: nsAString); safecall;
    procedure RemoveUser(const aHost: nsACString; const aUser: nsAString); safecall;
    procedure AddReject(const aHost: nsACString); safecall;
    procedure RemoveReject(const aHost: nsACString); safecall;
    function GetEnumerator(): nsISimpleEnumerator; safecall;
    property Enumerator: nsISimpleEnumerator read GetEnumerator;
    function GetRejectEnumerator(): nsISimpleEnumerator; safecall;
    property RejectEnumerator: nsISimpleEnumerator read GetRejectEnumerator;
  end;

  nsIPasswordManagerInternal = interface(nsISupports)
  ['{a448531f-dc92-4dc1-9012-da841febcbe0}']
    procedure FindPasswordEntry(const aHostURI: nsACString; const aUsername: nsAString; const aPassword: nsAString; aHostURIFound: nsACString; aUsernameFound: nsAString; aPasswordFound: nsAString); safecall;
    procedure AddUserFull(const aKey: nsACString; const aUser: nsAString; const aPassword: nsAString; const aUserFieldName: nsAString; const aPassFieldName: nsAString); safecall;
    procedure AddUserFull2(const aKey: nsACString; const aUser: nsAString; const aPassword: nsAString; const aUserFieldName: nsAString; const aPassFieldName: nsAString; const ActionURL: nsACString); safecall;
    procedure ReadPasswords(aPasswordFile: nsIFile); safecall;
  end;

implementation

end.
