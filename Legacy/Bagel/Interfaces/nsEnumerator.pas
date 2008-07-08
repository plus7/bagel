unit nsEnumerator;

interface
uses nsTypes, nsXPCOM;

const
  NS_IENUMERATOR_IID: TGUID = '{ad385286-cbc4-11d2-8cca-0060b0fc14a3}';

  NS_IBIDIRECTIONALENUMERATOR_IID: TGUID = '{75f158a0-cadd-11d2-8cca-0060b0fc14a3}';

type
  nsIEnumerator = interface;
  nsIBidirectionalEnumerator = interface;
  nsIEnumerator = interface(nsISupports)
  ['{ad385286-cbc4-11d2-8cca-0060b0fc14a3}']
    procedure First(); safecall;
    procedure Next(); safecall;
    function CurrentItem(): nsISupports; safecall;
    procedure IsDone(); safecall;
  end;

  nsIBidirectionalEnumerator = interface(nsIEnumerator)
  ['{75f158a0-cadd-11d2-8cca-0060b0fc14a3}']
    procedure Last(); safecall;
    procedure Prev(); safecall;
  end;

implementation

end.
