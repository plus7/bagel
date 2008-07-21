unit nsPref;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IPREF_IID: TGUID = '{a22ad7b0-ca86-11d1-a9a4-00805f8a7ac4}';
  NS_IPREF_ePrefInvalid = 0;
  NS_IPREF_ePrefLocked = 1;
  NS_IPREF_ePrefUserset = 2;
  NS_IPREF_ePrefConfig = 4;
  NS_IPREF_ePrefRemote = 8;
  NS_IPREF_ePrefLilocal = 16;
  NS_IPREF_ePrefString = 32;
  NS_IPREF_ePrefInt = 64;
  NS_IPREF_ePrefBool = 128;
  NS_IPREF_ePrefValuetypeMask = 224;

type
  PrefChangedFunc = Pointer;
  PrefEnumerationFunc = Pointer;

  nsIPref = interface;
  nsIPref = interface(nsISupports)
  ['{a22ad7b0-ca86-11d1-a9a4-00805f8a7ac4}']
    procedure ReadUserPrefs(aFile: nsIFile); safecall;
    procedure ResetPrefs(); safecall;
    procedure ResetUserPrefs(); safecall;
    procedure SavePrefFile(aFile: nsIFile); safecall;
    function GetBranch(const aPrefRoot: PAnsiChar): nsIPrefBranch; safecall;
    function GetDefaultBranch(const aPrefRoot: PAnsiChar): nsIPrefBranch; safecall;
    function GetRoot(): PAnsiChar; safecall;
    property Root: PAnsiChar read GetRoot;
    function GetPrefType(const aPrefName: PAnsiChar): PRInt32; safecall;
    function GetBoolPref(const aPrefName: PAnsiChar): PRBool; safecall;
    procedure SetBoolPref(const aPrefName: PAnsiChar; aValue: PRInt32); safecall;
    function GetCharPref(const aPrefName: PAnsiChar): PAnsiChar; safecall;
    procedure SetCharPref(const aPrefName: PAnsiChar; const aValue: PAnsiChar); safecall;
    function GetIntPref(const aPrefName: PAnsiChar): PRInt32; safecall;
    procedure SetIntPref(const aPrefName: PAnsiChar; aValue: PRInt32); safecall;
    procedure GetComplexValue(const aPrefName: PAnsiChar; const aType: TGUID; out aValue); safecall;
    procedure SetComplexValue(const aPrefName: PAnsiChar; const aType: TGUID; aValue: nsISupports); safecall;
    procedure ClearUserPref(const aPrefName: PAnsiChar); safecall;
    function PrefIsLocked(const aPrefName: PAnsiChar): PRBool; safecall;
    procedure LockPref(const aPrefName: PAnsiChar); safecall;
    procedure UnlockPref(const aPrefName: PAnsiChar); safecall;
    procedure ResetBranch(const aStartingAt: PAnsiChar); safecall;
    procedure DeleteBranch(const aStartingAt: PAnsiChar); safecall;
    procedure GetChildList(const aStartingAt: PAnsiChar; out aCount: PRUint32; out aChildArray_array); safecall;
    procedure AddObserver(const aDomain: PAnsiChar; aObserver: nsIObserver; aHoldWeak: PRBool); safecall;
    procedure RemoveObserver(const aDomain: PAnsiChar; aObserver: nsIObserver); safecall;
    function CopyCharPref(const pref: PAnsiChar): PAnsiChar; safecall;
    function CopyDefaultCharPref(const pref: PAnsiChar): PAnsiChar; safecall;
    function GetDefaultBoolPref(const pref: PAnsiChar): PRBool; safecall;
    function GetDefaultIntPref(const pref: PAnsiChar): PRInt32; safecall;
    procedure SetDefaultBoolPref(const pref: PAnsiChar; value: PRBool); safecall;
    procedure SetDefaultCharPref(const pref: PAnsiChar; const value: PAnsiChar); safecall;
    procedure SetDefaultIntPref(const pref: PAnsiChar; value: PRInt32); safecall;
    function CopyUnicharPref(const pref: PAnsiChar): PWideChar; safecall;
    function CopyDefaultUnicharPref(const pref: PAnsiChar): PWideChar; safecall;
    procedure SetUnicharPref(const pref: PAnsiChar; const value: PWideChar); safecall;
    procedure SetDefaultUnicharPref(const pref: PAnsiChar; const value: PWideChar); safecall;
    function GetLocalizedUnicharPref(const pref: PAnsiChar): PWideChar; safecall;
    function GetDefaultLocalizedUnicharPref(const pref: PAnsiChar): PWideChar; safecall;
    function GetFilePref(const pref: PAnsiChar): nsIFileSpec; safecall;
    procedure SetFilePref(const pref: PAnsiChar; value: nsIFileSpec; setDefault: PRBool); safecall;
    function GetFileXPref(const pref: PAnsiChar): nsILocalFile; safecall;
    procedure SetFileXPref(const pref: PAnsiChar; value: nsILocalFile); safecall;
    procedure RegisterCallback(const domain: PAnsiChar; callback: PrefChangedFunc; closure: Pointer); safecall;
    procedure UnregisterCallback(const domain: PAnsiChar; callback: PrefChangedFunc; closure: Pointer); safecall;
    procedure EnumerateChildren(const parent: PAnsiChar; callback: PrefEnumerationFunc; data: Pointer); safecall;
  end;

implementation

end.
