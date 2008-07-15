unit nsLogin;

interface

const
  NS_ILOGININFO_IID: TGUID = '{9c87a9bd-bf8b-4fae-bdb8-70513b2877df}';

  NS_ILOGINMANAGER_IID: TGUID = '{579f45b7-682f-479f-9085-3f8075488803}';

  NS_ILOGINMANAGERIEMIGRATIONHELPER_IID: TGUID = '{8a59ea3d-b8d0-48af-a3e2-63e27a02cde7}';

  NS_ILOGINMANAGERPROMPTER_IID: TGUID = '{68b3cb59-51b8-4c57-bd7f-b2ce955a593d}';

  NS_ILOGINMANAGERSTORAGE_IID: TGUID = '{18b5acbd-36dc-496d-9212-6f1a3c068a84}';

type
  nsILoginInfo = interface;
  nsILoginManager = interface;
  nsILoginManagerIEMigrationHelper = interface;
  nsILoginManagerPrompter = interface;
  nsILoginManagerStorage = interface;
  nsILoginInfo = interface(nsISupports)
  ['{9c87a9bd-bf8b-4fae-bdb8-70513b2877df}']
    procedure GetHostname(aHostname: nsAString); safecall;
    procedure SetHostname(const aHostname: nsAString); safecall;
    procedure GetFormSubmitURL(aFormSubmitURL: nsAString); safecall;
    procedure SetFormSubmitURL(const aFormSubmitURL: nsAString); safecall;
    procedure GetHttpRealm(aHttpRealm: nsAString); safecall;
    procedure SetHttpRealm(const aHttpRealm: nsAString); safecall;
    procedure GetUsername(aUsername: nsAString); safecall;
    procedure SetUsername(const aUsername: nsAString); safecall;
    procedure GetUsernameField(aUsernameField: nsAString); safecall;
    procedure SetUsernameField(const aUsernameField: nsAString); safecall;
    procedure GetPassword(aPassword: nsAString); safecall;
    procedure SetPassword(const aPassword: nsAString); safecall;
    procedure GetPasswordField(aPasswordField: nsAString); safecall;
    procedure SetPasswordField(const aPasswordField: nsAString); safecall;
    procedure Init(const aHostname: nsAString; const aFormSubmitURL: nsAString; const aHttpRealm: nsAString; const aUsername: nsAString; const aPassword: nsAString; const aUsernameField: nsAString; const aPasswordField: nsAString); safecall;
    function Equals(aLoginInfo: nsILoginInfo): PRBool; safecall;
    function Matches(aLoginInfo: nsILoginInfo; ignorePassword: PRBool): PRBool; safecall;
  end;

  nsILoginManager = interface(nsISupports)
  ['{579f45b7-682f-479f-9085-3f8075488803}']
    procedure AddLogin(aLogin: nsILoginInfo); safecall;
    procedure RemoveLogin(aLogin: nsILoginInfo); safecall;
    procedure ModifyLogin(oldLogin: nsILoginInfo; newLogin: nsILoginInfo); safecall;
    procedure RemoveAllLogins(); safecall;
    procedure GetAllLogins(out count: PRUint32; out logins_array); safecall;
    procedure GetAllDisabledHosts(out count: PRUint32; out hostnames_array); safecall;
    function GetLoginSavingEnabled(const aHost: nsAString): PRBool; safecall;
    procedure SetLoginSavingEnabled(const aHost: nsAString; isEnabled: PRBool); safecall;
    procedure FindLogins(out count: PRUint32; const aHostname: nsAString; const aActionURL: nsAString; const aHttpRealm: nsAString; out logins_array); safecall;
    function CountLogins(const aHostname: nsAString; const aActionURL: nsAString; const aHttpRealm: nsAString): PRUint32; safecall;
    function AutoCompleteSearch(const aSearchString: nsAString; aPreviousResult: nsIAutoCompleteResult; aElement: nsIDOMHTMLInputElement): nsIAutoCompleteResult; safecall;
  end;

  nsILoginManagerIEMigrationHelper = interface(nsISupports)
  ['{8a59ea3d-b8d0-48af-a3e2-63e27a02cde7}']
    procedure MigrateAndAddLogin(aLogin: nsILoginInfo); safecall;
  end;

  nsILoginManagerPrompter = interface(nsISupports)
  ['{68b3cb59-51b8-4c57-bd7f-b2ce955a593d}']
    procedure Init(aWindow: nsIDOMWindow); safecall;
    procedure PromptToSavePassword(aLogin: nsILoginInfo); safecall;
    procedure PromptToChangePassword(aOldLogin: nsILoginInfo; aNewLogin: nsILoginInfo); safecall;
    procedure PromptToChangePasswordWithUsernames(const logins_array; count: PRUint32; aNewLogin: nsILoginInfo); safecall;
  end;

  nsILoginManagerStorage = interface(nsISupports)
  ['{18b5acbd-36dc-496d-9212-6f1a3c068a84}']
    procedure Init(); safecall;
    procedure InitWithFile(aInputFile: nsIFile; aOutputFile: nsIFile); safecall;
    procedure AddLogin(aLogin: nsILoginInfo); safecall;
    procedure RemoveLogin(aLogin: nsILoginInfo); safecall;
    procedure ModifyLogin(oldLogin: nsILoginInfo; newLogin: nsILoginInfo); safecall;
    procedure RemoveAllLogins(); safecall;
    procedure GetAllLogins(out count: PRUint32; out logins_array); safecall;
    procedure GetAllDisabledHosts(out count: PRUint32; out hostnames_array); safecall;
    function GetLoginSavingEnabled(const aHost: nsAString): PRBool; safecall;
    procedure SetLoginSavingEnabled(const aHost: nsAString; isEnabled: PRBool); safecall;
    procedure FindLogins(out count: PRUint32; const aHostname: nsAString; const aActionURL: nsAString; const aHttpRealm: nsAString; out logins_array); safecall;
    function CountLogins(const aHostname: nsAString; const aActionURL: nsAString; const aHttpRealm: nsAString): PRUint32; safecall;
  end;

implementation

end.
