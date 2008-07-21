unit nsTooltipListener;

interface

uses nsTypes, nsXPCOM;

const
  NS_ITOOLTIPLISTENER_IID: TGUID = '{44b78386-1dd2-11b2-9ad2-e4eee2ca1916}';

type
  nsITooltipListener = interface;
  nsITooltipListener = interface(nsISupports)
  ['{44b78386-1dd2-11b2-9ad2-e4eee2ca1916}']
    procedure OnShowTooltip(aXCoords: PRInt32; aYCoords: PRInt32; const aTipText: PWideChar); safecall;
    procedure OnHideTooltip(); safecall;
  end;

implementation

end.
