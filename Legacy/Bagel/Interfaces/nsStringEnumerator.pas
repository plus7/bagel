unit nsStringEnumerator;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_ISTRINGENUMERATOR_IID: TGUID = '{50d3ef6c-9380-4f06-9fb2-95488f7d141c}';

  NS_IUTF8STRINGENUMERATOR_IID: TGUID = '{9bdf1010-3695-4907-95ed-83d0410ec307}';

type
  nsIStringEnumerator = interface;
  nsIUTF8StringEnumerator = interface;
  nsIStringEnumerator = interface(nsISupports)
  ['{50d3ef6c-9380-4f06-9fb2-95488f7d141c}']
    function HasMore(): PRBool; safecall;
    procedure GetNext(_retval: nsAString); safecall;
  end;

  nsIUTF8StringEnumerator = interface(nsISupports)
  ['{9bdf1010-3695-4907-95ed-83d0410ec307}']
    function HasMore(): PRBool; safecall;
    procedure GetNext(_retval: nsACString); safecall;
  end;

implementation

end.
