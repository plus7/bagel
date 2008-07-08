unit BufStream;

interface

uses
  Classes, SysUtils;

type
  TBufFileStream = class(TFileStream)
  private
    FBuf: PChar;          //バッファ
    FBufSize: Longint;    //バッファサイズ
    FBufPos: Longint;     //バッファ内の位置
    FBufEnd: Longint;     //バッファの終わり
    FFilePos: Longint;    //ファイルの位置(Seekで必要)
  public
    constructor Create(const FileName: string; Mode: Word; BufSize: Byte = 16);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override; //あるだけ
    function Seek(Offset: Longint; Origin: Word): Longint; override;
  end;

implementation

{ TBufFileStream }

constructor TBufFileStream.Create(const FileName: string; Mode: Word;
  BufSize: Byte = 16);
begin
  inherited Create(FileName, Mode);
  FBufSize := BufSize * 1024;
  GetMem(FBuf, FBufSize);
end;

destructor TBufFileStream.Destroy;
begin
  FreeMem(FBuf);
  inherited Destroy;
end;

function TBufFileStream.Read(var Buffer; Count: Integer): Longint;
var
  Rest, Len, ForwardSize: Longint;
begin
  if Count > FBufSize then
    raise Exception.Create('バッファの大きさを越えています。');

  ForwardSize := Count;
  if FBufEnd = 0 then //バッファが無い場合
  begin
    FBufEnd := inherited Read(FBuf[0], FBufSize);
    if FBufEnd = 0 then
    begin
      Result := 0;
      Exit;
    end;
    if FBufEnd < Count then ForwardSize := FBufEnd; //長さ調整
  end
  else
  begin
    Rest := FBufEnd - FBufPos; //バッファの残り
    if Count > Rest then      //バッファ内にない場合
    begin
      Move(FBuf[FBufSize - Rest], FBuf[0], Rest);          //残りを先頭にずらす
      Len := inherited Read(FBuf[Rest], FBufSize - Rest); //追加読み込み
      FBufEnd := Rest + Len;
      if Len = 0 then
      begin
        if FBufEnd = 0 then
        begin
          Result := 0;
          Exit;
        end;
        if FBufEnd < Count then ForwardSize := FBufEnd; //長さ調整
      end
      else
        FBufPos := 0; //バッファ内位置初期化
    end;
  end;
  Move(FBuf[FBufPos], Buffer, ForwardSize); //バッファから転送
  Result := ForwardSize;
  Inc(FBufPos, ForwardSize);
  Inc(FFilePos, ForwardSize);
end;

function TBufFileStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result := inherited Write(Buffer, Count);
end;

function TBufFileStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  case Origin of
    soFromCurrent:
      Result := inherited Seek(FFilePos + Offset, soFromBeginning);
    else
      Result := inherited Seek(Offset, Origin);
  end;
  FBufPos := 0;
  FBufEnd := 0;
  FFilePos := Result;
end;

end.

