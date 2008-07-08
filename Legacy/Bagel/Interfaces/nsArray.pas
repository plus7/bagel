unit nsArray;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IARRAY_IID: TGUID = '{114744d9-c369-456e-b55a-52fe52880d2d}';

type
  nsIArray = interface;
  nsIArray = interface(nsISupports)
  ['{114744d9-c369-456e-b55a-52fe52880d2d}']
    function GetLength(): PRUint32; safecall;
    property Length: PRUint32 read GetLength;
    procedure QueryElementAt(index: PRUint32; const uuid: TGUID; out _result); safecall;
    function IndexOf(startIndex: PRUint32; element: nsISupports): PRUint32; safecall;
    function Enumerate(): nsISimpleEnumerator; safecall;
  end;

implementation

end.
