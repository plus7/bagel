unit Unique;

interface

uses
  Windows, Sysutils,Messages;
const
  SIGNATURE_FILEOPEN: DWORD = $00838931;

implementation

procedure CopyDataToOld;
var
  wnd: HWND;
//  buf: PChar;
  i: Integer;
  cd: TCopyDataStruct;
  SendStr:String;
begin
  { ä˘Ç…ë∂ç›ÇµÇƒÇ¢ÇÈ TBagelMainForm ÇíTÇ∑ }
  Wnd := FindWindow('TBagelMainForm', nil);
  for i:=1 to ParamCount do
  begin
    SendStr:=SendStr+ParamStr(i)+#13#10;
  end;

  if Wnd<>0 then
  begin
    cd.dwData := SIGNATURE_FILEOPEN;
    cd.cbData := Length(SendStr)+1;
    cd.lpData := StrAlloc(cd.cbData);
    try
      StrCopy(cd.lpData, PChar(SendStr));
      SendMessage(wnd, WM_COPYDATA, WPARAM(wnd), LPARAM(@cd));
    finally
      StrDispose(cd.lpData);
    end;
  end;
end;

var
  UniqueName : string;
  hMutex: THandle;

initialization
  UniqueName := ExtractFileName(ParamStr(0));
  hMutex := OpenMutex(MUTEX_ALL_ACCESS, false, pchar(UniqueName));
  if hMutex <> 0 then
  begin
    CloseHandle(hMutex);
    CopyDataToOld;
    Halt;
  end;
  hMutex := CreateMutex(nil, false, pchar(UniqueName));

finalization
  ReleaseMutex(hMutex);
end.
