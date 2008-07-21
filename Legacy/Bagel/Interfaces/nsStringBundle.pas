unit nsStringBundle;

interface

uses nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_ISTRINGBUNDLE_IID: TGUID = '{d85a17c2-aa7c-11d2-9b8c-00805f8a16d9}';

  NS_ISTRINGBUNDLESERVICE_IID: TGUID = '{d85a17c0-aa7c-11d2-9b8c-00805f8a16d9}';

type
  nsIStringBundle = interface;
  nsIStringBundleService = interface;
  nsIStringBundle = interface(nsISupports)
  ['{d85a17c2-aa7c-11d2-9b8c-00805f8a16d9}']
    function GetStringFromID(aID: PRInt32): PWideChar; safecall;
    function GetStringFromName(const aName: PWideChar): PWideChar; safecall;
    function FormatStringFromID(aID: PRInt32; const params_array; length: PRUint32): PWideChar; safecall;
    function FormatStringFromName(const aName: PWideChar; const params_array; length: PRUint32): PWideChar; safecall;
    function GetSimpleEnumeration(): nsISimpleEnumerator; safecall;
  end;

  nsIStringBundleService = interface(nsISupports)
  ['{d85a17c0-aa7c-11d2-9b8c-00805f8a16d9}']
    function CreateBundle(const aURLSpec: PAnsiChar): nsIStringBundle; safecall;
    function CreateExtensibleBundle(const aRegistryKey: PAnsiChar): nsIStringBundle; safecall;
    function FormatStatusMessage(aStatus: nsresult; const aStatusArg: PWideChar): PWideChar; safecall;
    procedure FlushBundles(); safecall;
  end;

implementation

end.
