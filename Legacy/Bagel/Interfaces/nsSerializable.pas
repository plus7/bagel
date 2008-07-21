unit nsSerializable;

interface

uses nsTypes, nsXPCOM, nsObjectIOStream;

const
  NS_ISERIALIZABLE_IID: TGUID = '{91cca981-c26d-44a8-bebe-d9ed4891503a}';

type
  nsISerializable = interface;
  nsISerializable = interface(nsISupports)
  ['{91cca981-c26d-44a8-bebe-d9ed4891503a}']
    procedure Read(aInputStream: nsIObjectInputStream); safecall;
    procedure Write(aOutputStream: nsIObjectOutputStream); safecall;
  end;

implementation

end.
