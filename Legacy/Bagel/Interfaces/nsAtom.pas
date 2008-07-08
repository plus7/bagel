unit nsAtom;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IATOM_IID: TGUID = '{3d1b15b0-93b4-11d1-895b-006008911b81}';

  NS_IATOMSERVICE_IID: TGUID = '{8c0e6018-6a06-47f5-bfa1-2e051705c9de}';

type
  nsIAtom = interface;
  nsIAtomService = interface;
  nsIAtom = interface(nsISupports)
  ['{3d1b15b0-93b4-11d1-895b-006008911b81}']
    procedure ToString(_retval: nsAString); safecall;
    procedure ToUTF8String(_retval: nsACString); safecall;
    procedure GetUTF8String(out aResult: PAnsiChar); safecall;
    function Equals(const aString: nsAString): PRBool; safecall;
    function EqualsUTF8(const aString: nsACString): PRBool; safecall;
  end;

  nsIAtomService = interface(nsISupports)
  ['{8c0e6018-6a06-47f5-bfa1-2e051705c9de}']
    function GetAtom(const value: PWideChar): nsIAtom; safecall;
    function GetPermanentAtom(const value: PWideChar): nsIAtom; safecall;
    function GetAtomUTF8(const value: PAnsiChar): nsIAtom; safecall;
    function GetPermanentAtomUTF8(const value: PAnsiChar): nsIAtom; safecall;
  end;

implementation

end.
