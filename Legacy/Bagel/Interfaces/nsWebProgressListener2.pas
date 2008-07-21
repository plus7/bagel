unit nsWebProgressListener2;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_IWEBPROGRESSLISTENER2_IID: TGUID = '{dde39de0-e4e0-11da-8ad9-0800200c9a66}';

type
  nsIWebProgressListener2 = interface;
  nsIWebProgressListener2 = interface(nsIWebProgressListener)
  ['{dde39de0-e4e0-11da-8ad9-0800200c9a66}']
    procedure OnProgressChange64(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64); safecall;
    function OnRefreshAttempted(aWebProgress: nsIWebProgress; aRefreshURI: nsIURI; aMillis: PRInt32; aSameURI: PRBool): PRBool; safecall;
  end;

implementation

end.
