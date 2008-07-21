unit ActnGen;

interface

uses
  Windows, Messages, SysUtils, Classes, ActnList,
  Menus, ComCtrls;

type
  TActionGenerator = class (TComponent)
  private
    FOnGenerate:TNotifyEvent;
    FActionList:TActionList;
    function GetCount:Integer;
    function GetAction(Index:Integer):TContainedAction;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    procedure Generate;
    property Count:Integer read GetCount;
    property Actions[Index:Integer]:TContainedAction read GetAction;
    property ActionList:TActionList read FActionList write FActionList;
    property OnGenerate:TNotifyEvent read FOnGenerate write FOnGenerate;
  end;

implementation

constructor TActionGenerator.Create(AOwner: TComponent);
begin
  FActionList := TActionList.Create(AOwner);
  inherited Create(AOwner);
end;

destructor TActionGenerator.Destroy;
begin
  FActionList.Free;
  inherited Destroy;
end;

function TActionGenerator.GetCount:Integer;
begin
  Result := FActionList.ActionCount;
end;

function TActionGenerator.GetAction(Index:Integer):TContainedAction;
begin
  Result := FActionList.Actions[Index];
end;

procedure TActionGenerator.Generate;begin
  while FActionList.ActionCount > 0 do FActionList.Actions[0].Free;
  if Assigned(FOnGenerate) then begin
    FOnGenerate(Self);
  end;
end;

end.
