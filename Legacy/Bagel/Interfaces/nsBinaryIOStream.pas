unit nsBinaryIOStream;

interface

uses nsTypes, nsXPCOM, nsGeckoStrings;

const
  NS_IBINARYINPUTSTREAM_IID: TGUID = '{7b456cb0-8772-11d3-90cf-0040056a906e}';

  NS_IBINARYOUTPUTSTREAM_IID: TGUID = '{204ee610-8765-11d3-90cf-0040056a906e}';

type
  nsIBinaryInputStream = interface;
  nsIBinaryOutputStream = interface;
  nsIBinaryInputStream = interface(nsIInputStream)
  ['{7b456cb0-8772-11d3-90cf-0040056a906e}']
    procedure SetInputStream(aInputStream: nsIInputStream); safecall;
    function ReadBoolean(): PRBool; safecall;
    function Read8(): PRUint8; safecall;
    function Read16(): PRUint16; safecall;
    function Read32(): PRUint32; safecall;
    function Read64(): PRUint64; safecall;
    function ReadFloat(): Single; safecall;
    function ReadDouble(): Double; safecall;
    function ReadCString(): nsACString; safecall;
    procedure ReadString(_retval: nsAString); safecall;
    procedure ReadBytes(aLength: PRUint32; out aString: PAnsiChar); safecall;
    procedure ReadByteArray(aLength: PRUint32; out aBytes_array); safecall;
  end;

  nsIBinaryOutputStream = interface(nsIOutputStream)
  ['{204ee610-8765-11d3-90cf-0040056a906e}']
    procedure SetOutputStream(aOutputStream: nsIOutputStream); safecall;
    procedure WriteBoolean(aBoolean: PRBool); safecall;
    procedure Write8(aByte: PRUint8); safecall;
    procedure Write16(a16: PRUint16); safecall;
    procedure Write32(a32: PRUint32); safecall;
    procedure Write64(a64: PRUint64); safecall;
    procedure WriteFloat(aFloat: Single); safecall;
    procedure WriteDouble(aDouble: Double); safecall;
    procedure WriteStringZ(const aString: PAnsiChar); safecall;
    procedure WriteWStringZ(const aString: PWideChar); safecall;
    procedure WriteUtf8Z(const aString: PWideChar); safecall;
    procedure WriteBytes(const aString: PAnsiChar; aLength: PRUint32); safecall;
    procedure WriteByteArray(const aBytes_array; aLength: PRUint32); safecall;
  end;

implementation

end.
