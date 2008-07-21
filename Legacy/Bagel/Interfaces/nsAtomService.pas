unit nsAtomService;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IATOMSERVICE_IID: TGUID = '{8c0e6018-6a06-47f5-bfa1-2e051705c9de}';

type
  nsIAtomService = interface;
  nsIAtomService = interface(nsISupports)
  ['{8c0e6018-6a06-47f5-bfa1-2e051705c9de}']
    function GetAtom(const value: PWideChar): nsIAtom; safecall;
    function GetPermanentAtom(const value: PWideChar): nsIAtom; safecall;
    function GetAtomUTF8(const value: PAnsiChar): nsIAtom; safecall;
    function GetPermanentAtomUTF8(const value: PAnsiChar): nsIAtom; safecall;
  end;

implementation

end.
