unit BagelBrowser;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, GeckoBrowser, ExtCtrls,Dialogs,nsXPCOM,nsTypes;

type
  TBagelBrowser = class(TGeckoBrowser)
  private
    { Private êÈåæ }
    FReloadTimer:TTimer;
    FLocked:Boolean;
    FRead:Boolean;
    FAutoHighlight:Boolean;
    FId:Cardinal;
    FProgress:Integer;
    
    procedure SetReload(Value:Integer);
    function GetReload:Integer;

{    procedure SetLocked(Value:Boolean);
    function GetLocked:Boolean;       }

    procedure ExecAutoReload(Sender:TObject);

//    function IsPreferred(const aContentType: PAnsiChar; out aDesiredContentType: PAnsiChar; out _retval: PRBool): nsresult; override;
  protected
    { Protected êÈåæ }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published êÈåæ }
    property ReloadTime:Integer read GetReload write SetReload;
    property Locked:Boolean read FLocked write FLocked;
    property Id:Cardinal read FId;
    property IsRead:Boolean read FRead write FRead;
    property AutoHighlight:Boolean read FAutoHighlight write FAutoHighlight;
    property Progress:Integer read FProgress write FProgress;
  end;

implementation

constructor TBagelBrowser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FReloadTimer:=TTimer.Create(Self);
  FReloadTimer.OnTimer := ExecAutoReload;
  FReloadTimer.Interval := 0;
  FId := GetTickCount;
  FRead:=False;
  FProgress:=0;
end;

destructor TBagelBrowser.Destroy;
begin
  if Assigned(FReloadTimer) then FReloadTimer.Free;
  inherited Destroy;
end;

procedure TBagelBrowser.ExecAutoReload(Sender:TObject);
begin
  Self.Reload;
end;

//function TBagelBrowser.IsPreferred(const aContentType: PAnsiChar; out aDesiredContentType: PAnsiChar; out _retval: PRBool): nsresult;
//begin
  //_retval:=False;
  //if FLocked <>true then Result := Self.CanHandleContent(aContentType, True, aDesiredContentType, _retval);
//end;

procedure TBagelBrowser.SetReload(Value:Integer);
begin
  if Assigned(FReloadTimer) then
  begin
    FReloadTimer.Interval := Value;
  end;
end;

function TBagelBrowser.GetReload:Integer;
begin
  Result := 0;
  if Assigned(FReloadTimer) then Result := FReloadTimer.Interval;
end;

end.
