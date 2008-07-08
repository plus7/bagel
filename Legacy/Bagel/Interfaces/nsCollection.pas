unit nsCollection;

interface

uses nsTypes, nsXPCOM, nsSerializable, nsEnumerator;

const
  NS_ICOLLECTION_IID: TGUID = '{83b6019c-cbc4-11d2-8cca-0060b0fc14a3}';

type
  nsICollection = interface;
  nsICollection = interface(nsISerializable)
  ['{83b6019c-cbc4-11d2-8cca-0060b0fc14a3}']
    function Count(): PRUint32; safecall;
    function GetElementAt(index: PRUint32): nsISupports; safecall;
    procedure QueryElementAt(index: PRUint32; const uuid: TGUID; out _result); safecall;
    procedure SetElementAt(index: PRUint32; item: nsISupports); safecall;
    procedure AppendElement(item: nsISupports); safecall;
    procedure RemoveElement(item: nsISupports); safecall;
    function Enumerate(): nsIEnumerator; safecall;
    procedure Clear(); safecall;
  end;

implementation

end.
