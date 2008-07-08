unit nsMutableArray;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsArray;

const
  NS_IMUTABLEARRAY_IID: TGUID = '{af059da0-c85b-40ec-af07-ae4bfdc192cc}';

type
  nsIMutableArray = interface;
  nsIMutableArray = interface(nsIArray)
  ['{af059da0-c85b-40ec-af07-ae4bfdc192cc}']
    procedure AppendElement(element: nsISupports; weak: PRBool); safecall;
    procedure RemoveElementAt(index: PRUint32); safecall;
    procedure InsertElementAt(element: nsISupports; index: PRUint32; weak: PRBool); safecall;
    procedure ReplaceElementAt(element: nsISupports; index: PRUint32; weak: PRBool); safecall;
    procedure Clear(); safecall;
  end;

implementation

end.
