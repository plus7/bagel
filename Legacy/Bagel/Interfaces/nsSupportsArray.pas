unit nsSupportsArray;

interface

uses nsTypes, nsXPCOM, nsCollection;

const
  NS_ISUPPORTSARRAY_IID: TGUID = '{791eafa0-b9e6-11d1-8031-006008159b5a}';

type
  nsISupportsArrayEnumFunc = Pointer;
  nsISupportsArray = interface;
  nsISupportsArray = interface(nsICollection)
  ['{791eafa0-b9e6-11d1-8031-006008159b5a}']
    function Equals(other: nsISupportsArray): PRBool; stdcall;
    function ElementAt(aIndex: PRUint32): nsISupports; stdcall;
    function IndexOf(aPossibleElement: nsISupports): PRInt32; stdcall;
    function IndexOfStartingAt(aPossibleElement: nsISupports; aStartIndex: PRUint32): PRInt32; stdcall;
    function LastIndexOf(aPossibleElement: nsISupports): PRInt32; stdcall;
    function GetIndexOf(aPossibleElement: nsISupports): PRInt32; safecall;
    function GetIndexOfStartingAt(aPossibleElement: nsISupports; aStartIndex: PRUint32): PRInt32; safecall;
    function GetLastIndexOf(aPossibleElement: nsISupports): PRInt32; safecall;
    function InsertElementAt(aElement: nsISupports; aIndex: PRUint32): PRBool; stdcall;
    function ReplaceElementAt(aElement: nsISupports; aIndex: PRUint32): PRBool; stdcall;
    function RemoveElementAt(aIndex: PRUint32): PRBool; stdcall;
    function RemoveLastElement(aElement: nsISupports): PRBool; stdcall;
    procedure DeleteLastElement(aElement: nsISupports); safecall;
    procedure DeleteElementAt(aIndex: PRUint32); safecall;
    function AppendElements(aElements: nsISupportsArray): PRBool; stdcall;
    procedure Compact(); safecall;
    function EnumerateForwards(aFunc: nsISupportsArrayEnumFunc; aData: Pointer): PRBool; stdcall;
    function EnumerateBackwards(aFunc: nsISupportsArrayEnumFunc; aData: Pointer): PRBool; stdcall;
    function Clone(): nsISupportsArray; safecall;
    function MoveElement(aFrom: PRInt32; aTo: PRInt32): PRBool; stdcall;
    function InsertElementsAt(aOther: nsISupportsArray; aIndex: PRUint32): PRBool; stdcall;
    function RemoveElementsAt(aIndex: PRUint32; aCount: PRUint32): PRBool; stdcall;
    function SizeTo(aSize: PRInt32): PRBool; stdcall;
  end;

implementation

end.
