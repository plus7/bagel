unit PromptSupports;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IPROMPTSERVICE2_IID: TGUID = '{cf86d196-dbee-4482-9dfa-3477aa128319}';

  NS_IAUTHINFORMATION_IID: TGUID = '{0d73639c-2a92-4518-9f92-28f71fea5f20}';
  NS_IAUTHINFORMATION_AUTH_HOST = 1;
  NS_IAUTHINFORMATION_AUTH_PROXY = 2;
  NS_IAUTHINFORMATION_NEED_DOMAIN = 4;
  NS_IAUTHINFORMATION_ONLY_PASSWORD = 8;

  NS_IAUTHPROMPTCALLBACK_IID: TGUID = '{bdc387d7-2d29-4cac-92f1-dd75d786631d}';

type
  nsIPromptService2 = interface;
  nsIAuthInformation = interface;
  nsIAuthPromptCallback = interface;
  nsICancelable = interface end;
  nsIPromptService2 = interface(nsIPromptService)
  ['{cf86d196-dbee-4482-9dfa-3477aa128319}']
    function PromptAuth(aParent: nsIDOMWindow; aChannel: nsIChannel; level: PRUint32; authInfo: nsIAuthInformation; const checkboxLabel: PWideChar; out checkValue: PRBool): PRBool; safecall;
    function AsyncPromptAuth(aParent: nsIDOMWindow; aChannel: nsIChannel; aCallback: nsIAuthPromptCallback; aContext: nsISupports; level: PRUint32; authInfo: nsIAuthInformation; const checkboxLabel: PWideChar; out checkValue: PRBool): nsICancelable; safecall;
  end;

  nsIAuthInformation = interface(nsISupports)
  ['{0d73639c-2a92-4518-9f92-28f71fea5f20}']
    function GetFlags(): PRUint32; safecall;
    property Flags: PRUint32 read GetFlags;
    procedure GetRealm(aRealm: nsAString); safecall;
    procedure GetAuthenticationScheme(aAuthenticationScheme: nsACString); safecall;
    procedure GetUsername(aUsername: nsAString); safecall;
    procedure SetUsername(const aUsername: nsAString); safecall;
    procedure GetPassword(aPassword: nsAString); safecall;
    procedure SetPassword(const aPassword: nsAString); safecall;
    procedure GetDomain(aDomain: nsAString); safecall;
    procedure SetDomain(const aDomain: nsAString); safecall;
  end;

  nsIAuthPromptCallback = interface(nsISupports)
  ['{bdc387d7-2d29-4cac-92f1-dd75d786631d}']
    procedure OnAuthAvailable(aContext: nsISupports; aAuthInfo: nsIAuthInformation); safecall;
    procedure OnAuthCancelled(aContext: nsISupports; userCancel: PRBool); safecall;
  end;

implementation

end.
