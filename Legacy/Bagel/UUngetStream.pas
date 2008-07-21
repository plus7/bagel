unit UUngetStream;
(* Copyright (c) 2001,2002 Twiddle <hetareprog@hotmail.com> *)

interface

uses
  Classes, StrUtils;

type
  (* seek不可でもungetcの機能が使えるストリーム *)
  TUngetStream = class(TStream)
  protected
    FStream: TStream;
    ungets: string;
  public
    constructor Create(stream: TStream);
    destructor Destroy; override;
    procedure Unget(c: Char);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;


(*=======================================================*)
implementation
(*=======================================================*)

constructor TUngetStream.Create(stream: TStream);
begin
  FStream := stream;
end;

destructor TUngetStream.Destroy;
begin
  inherited;
end;

procedure TUngetStream.Unget(c: Char);
begin
  ungets := ungets + c;
end;

function TUngetStream.Read(var Buffer; Count: Longint): Longint;
var
  ptr: PByte;
  len: integer;
begin
  ptr := @Buffer;
  result := 0;
  while (result < Count) do
  begin
    len := length(ungets);
    if 0 < len then
    begin
      ptr^ := Ord(ungets[len]);
      SetLength(ungets, len-1);
      Inc(ptr);
      Inc(result);
    end
    else begin
      Inc(result, FStream.Read(ptr^, Count - result));
      break;
    end;
  end;
end;

function TUngetStream.Write(const Buffer; Count: Longint): Longint;
begin
  result := inherited Write(Buffer, Count);
end;


end.
