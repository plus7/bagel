unit nsObjectIOStream;

interface
uses nsTypes, nsXPCOM, nsBinaryIOStream;

const
  NS_IOBJECTINPUTSTREAM_IID: TGUID = '{6c248606-4eae-46fa-9df0-ba58502368eb}';

  NS_IOBJECTOUTPUTSTREAM_IID: TGUID = '{92c898ac-5fde-4b99-87b3-5d486422094b}';

type
  nsIObjectInputStream = interface;
  nsIObjectOutputStream = interface;
  nsIObjectInputStream = interface(nsIBinaryInputStream)
  ['{6c248606-4eae-46fa-9df0-ba58502368eb}']
    function ReadObject(aIsStrongRef: PRBool): nsISupports; safecall;
    function ReadID(out aID: TGUID): nsresult; stdcall;
    function GetBuffer(aLength: PRUint32; aAlignMask: PRUint32): Pchar; stdcall;
    procedure PutBuffer(aBuffer: Pchar; aLength: PRUint32); stdcall;
  end;

  nsIObjectOutputStream = interface(nsIBinaryOutputStream)
  ['{92c898ac-5fde-4b99-87b3-5d486422094b}']
    procedure WriteObject(aObject: nsISupports; aIsStrongRef: PRBool); safecall;
    procedure WriteSingleRefObject(aObject: nsISupports); safecall;
    procedure WriteCompoundObject(aObject: nsISupports; const aIID: TGUID; aIsStrongRef: PRBool); safecall;
    procedure WriteID(const aID: TGUID); safecall;
    function GetBuffer(aLength: PRUint32; aAlignMask: PRUint32): Pchar; stdcall;
    procedure PutBuffer(aBuffer: Pchar; aLength: PRUint32); stdcall;
  end;

implementation

end.
