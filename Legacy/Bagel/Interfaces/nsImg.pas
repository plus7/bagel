unit nsImg;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings;

const
  IMGICACHE_IID: TGUID = '{f1b74aae-5661-4753-a21c-66dd644afebc}';

type
  imgICache = interface;
  imgICache = interface(nsISupports)
  ['{f1b74aae-5661-4753-a21c-66dd644afebc}']
    procedure ClearCache(chrome: PRBool); safecall;
    procedure RemoveEntry(uri: nsIURI); safecall;
    function FindEntryProperties(uri: nsIURI): nsIProperties; safecall;
  end;

implementation

end.
