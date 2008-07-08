unit Mutex;

interface

uses Windows;


const
  INFINITE      = Windows.INFINITE;
  WAIT_FAILED   = Windows.WAIT_FAILED;
  WAIT_OBJECT_0 = Windows.WAIT_OBJECT_0;
type
  (*-------------------------------------------------------*)
  //From OpenJane
  THogeMutex = class(TObject)
  protected
    FHandle: THandle;
    FLastError: longword;
  public
    constructor Create(initialOwner: boolean = false; name: PChar = nil);
    destructor Destroy; override;
    function Wait(millisec: longword = INFINITE): longword;
    function Release: boolean;
    property handle: THandle read FHandle;
    property lastError: longword read FLastError;
  end;

implementation

(*=======================================================*)
constructor THogeMutex.Create(initialOwner: boolean; name: PChar);
begin
  inherited Create;
  FHandle := CreateMutex(nil, initialOwner, name);
  FLastError := GetLastError;
end;

destructor THogeMutex.Destroy;
begin
  if FHandle <> 0 then
    CloseHandle(FHandle);
end;

function THogeMutex.Wait(millisec: longword): longword;
begin
  result := WaitForSingleObject(FHandle, millisec);
  FLastError := GetLastError;
end;

function THogeMutex.Release: boolean;
begin
  result := boolean(ReleaseMutex(FHandle));
  FLastError := GetLastError;
end;

end.
 