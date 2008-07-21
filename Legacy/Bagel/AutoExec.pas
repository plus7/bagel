unit AutoExec;

interface

uses
  Classes, SysUtils, StrUtils, Dialogs, Controls, splitjoin;

type
  (*-------------------------------------------------------*)
  PCondition = ^TCondition;
  TCondition = record
    Pattern: String;
    MatchType: Integer;
    Commands:String;
  end;

  type TIntArr = Array of Integer;

  TAutoExecManager = class(TObject)
  private
    FList:TList;
    function GetCount:Integer;
    function GetItems(index: integer): TCondition;
    function GetIndexByCondition(Pattern:String;MatchType:Integer):Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(Pattern:String;MatchType:Integer;Command:String);
    procedure Delete(index: integer);
    property Count: Integer read GetCount;
    property Items[index: integer]: TCondition read GetItems;
    procedure LoadFromFile(path:String);
    procedure SaveToFile(path:String);
  end;
  
implementation

function NewConditionData(CD:TCondition):PCondition;
begin
  New(result);
  result^ := CD;
end;


constructor TAutoExecManager.Create;
begin
  FList:=TList.Create;
end;

destructor TAutoExecManager.Destroy;
var
i:Integer;
begin
  for i:=FList.Count-1 downto 0 do begin
    Self.Delete(i);
  end;
  FList.Free;
end;

procedure TAutoExecManager.Add(Pattern:String;MatchType:Integer;Command:String);
var
CIndex:Integer;
cond:TCondition;
cond2:TCondition;
begin
  CIndex:=GetIndexbyCondition(Pattern,MatchType);
  if CIndex<>-1 then begin
    cond:=Self.Items[CIndex];
    cond.Commands:=cond.Commands+','+Command;
  end
  else begin
    cond2.Pattern:=Pattern;
    cond2.MatchType:=MatchType;
    cond2.Commands:=Command;
    FList.Add(NewConditionData(cond2));
  end;
end;

function TAutoExecManager.GetItems(index: integer): TCondition;
begin
  Result:=PCondition(FList.Items[index])^;
end;

function TAutoExecManager.GetCount:Integer;
begin
  Result:=FList.Count;
end;

function TAutoExecManager.GetIndexByCondition(Pattern:String;MatchType:Integer):Integer;
var
cond:TCondition;
i:Integer;
begin
  Result:=-1;
  For i:=0 to FList.Count-1 do begin
    cond:=PCondition(FList.Items[i])^;
    if (cond.Pattern=Pattern) and (cond.MatchType=MatchType) then begin
      Result:=i;
      Exit;
    end;
  end;
end;

procedure TAutoExecManager.Delete(index: integer);
var
  cond:PCondition;
begin
  cond:=PCondition(FList.Items[index]);
  FList.Delete(Index);
  Dispose(cond);
end;

procedure TAutoExecManager.LoadFromFile(path:String);
var
sl:TStringList;
sl2:TStringList;
i:Integer;
begin
  sl:=TStringList.Create;
  sl2:=TStringList.Create;
  try
    sl.LoadFromFile(path);
    for i:=0 to sl.Count -1 do begin
      sl2.CommaText:=sl.Strings[i];
      Self.Add(sl2.Strings[0], StrToInt(sl2.Strings[1]), sl2.Strings[2]);
    end;
  finally
    sl.Free;
    sl2.Free;
  end;
end;

procedure TAutoExecManager.SaveToFile(path:String);
var
sl:TStringList;
sl2:TStringList;
i:Integer;
begin
  sl:=TStringList.Create;
  sl2:=TStringList.Create;
  try
    for i:=0 to Self.Count - 1 do begin
      sl2.Add(Self.Items[i].Pattern);
      sl2.Add(IntToStr(Self.Items[i].MatchType));
      sl2.Add(Self.Items[i].Commands);
      sl.Add(sl2.CommaText);
      sl2.Clear;
    end;
    sl.SaveToFile(path);
  finally
    sl.Free;
    sl2.Free;
  end;
end;

end.
