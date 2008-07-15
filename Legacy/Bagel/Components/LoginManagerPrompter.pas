unit LoginManagerPrompter;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings, nsLogin;

type
  TLoginManagerPrompter = class(TInterfacedObject, nsILoginManagerPrompter)
    procedure Init(aWindow: nsIDOMWindow); safecall;
    procedure PromptToSavePassword(aLogin: nsILoginInfo); safecall;
    procedure PromptToChangePassword(aOldLogin: nsILoginInfo; aNewLogin: nsILoginInfo); safecall;
    procedure PromptToChangePasswordWithUsernames(const logins_array; count: PRUint32; aNewLogin: nsILoginInfo); safecall;
  end;

implementation

end.
