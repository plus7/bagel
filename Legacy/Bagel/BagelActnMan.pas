unit BagelActnMan;

interface

uses
  Windows, Messages, SysUtils, Classes, ActnList, ActnGen,
  Menus, ComCtrls, splitjoin, UBookmark;

type

  TBagelActionContainer = class;
                              {
  TBagelActionManager = class (TComponent)
  private
    FList:TList;
    function GetActionContainer(Index:Integer):TBagelActionContainer;
    procedure SetActionContainer(Index:Integer;Value:TBagelActionContainer);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;
    property ActionContainer[Index: Integer]: TBagelActionContainer
      read GetActionContainer write SetActionContainer;
  end;                         }

  TBagelActionContainer = class (TComponent)
  private
    FAction:TComponent;
    FList:TList;
    FCaption:String;
    FParent:TBagelActionContainer;
    FShowFlags:Integer;
    FTag:Integer;
    FChecked: Boolean;
    FOnClick:TNotifyEvent;
    FId:String;
  	procedure SetAction(Value:TComponent);
    function GetItem(Index:Integer):TBagelActionContainer;
    function GetCount:Integer;
    //function GetParent:TBagelActionContainer;
    procedure SetParent(Value:TBagelActionContainer);
//    procedure SetItem(Index:Integer;Value:TBagelActionContainer);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;
  	property Action:TComponent read FAction write SetAction;
  	property Item[Index: Integer]: TBagelActionContainer read GetItem;// write SetItem;
    property Count: Integer read GetCount;
    property Caption:String read FCaption write FCaption;
    property Parent:TBagelActionContainer read FParent write SetParent;
    property ShowFlags:Integer read FShowFlags write FShowFlags;
  	procedure Clear;
  	procedure Update;
    procedure Add(Item:TBagelActionContainer);
    procedure Delete(Item:TBagelActionContainer);
    function ConvertToText:String;
  	procedure LoadFromFile(const FileName:String);
  	procedure SaveToFile(const FileName:String);
    procedure Click;
    property Tag:Integer read FTag write FTag;
    property OnClick:TNotifyEvent read FOnClick write FOnClick;
    property Checked:Boolean read FChecked write FChecked;
    property Id:String read FId write FId;
  end;

  TBagelBookmarkContainer = class(TBagelActionContainer)
  private
    FBkmk:TBkmkBase;
  public
    property Bookmark: TBkmkBase read FBkmk write FBkmk;
  end; 

implementation
                              {
function TBagelActionManager.GetActionContainer(Index:Integer):TBagelActionContainer;
begin
  //
end;
procedure TBagelActionManager.SetActionContainer(Index:Integer;Value:TBagelActionContainer);
begin
  //
end;
constructor TBagelActionManager.Create(AOwner:TComponent);
begin
  //
end;
destructor TBagelActionManager.Destroy;
begin
  //
end;                         }
function TBagelActionContainer.GetCount:Integer;
begin
  Result := FList.Count;
end;
procedure TBagelActionContainer.SetAction(Value:TComponent);
begin
  FAction := Value;
end;

function TBagelActionContainer.GetItem(Index:Integer):TBagelActionContainer;
begin
  Result := TBagelActionContainer(FList.Items[Index]);
end;
                  {
procedure TBagelActionContainer.SetItem(Index:Integer;Value:TBagelActionContainer);
begin
  //
end;               }

constructor TBagelActionContainer.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FList:=TList.Create;
end;

destructor TBagelActionContainer.Destroy;
var
  i: Integer;
begin
  if Assigned(FParent) then
    FParent.Delete(Self);
  for i := FList.Count - 1 downto 0 do
    Self.Item[i].Free;
  FList.Free;
  inherited Destroy;
end;

procedure TBagelActionContainer.Clear;
var
  i: Integer;
begin
  for i := FList.Count - 1 downto 0 do
    Self.Item[i].Free;
end;
procedure TBagelActionContainer.Click;
var
  i:Integer;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
  for i := 0 to Self.Count - 1 do begin
    Self.Item[i].Update;
  end;
end;
procedure TBagelActionContainer.Update;
begin
  if Self.Action is TCustomAction then begin
    TCustomAction(Self.Action).Update;
  end; 
end;
procedure TBagelActionContainer.Add(Item:TBagelActionContainer);
begin
  FList.Add(Item);
  Item.Parent := Self;
end;
procedure TBagelActionContainer.Delete(Item:TBagelActionContainer);
begin
  Item.Parent := nil;
  FList.Delete(FList.IndexOf(item));
end;

procedure TBagelActionContainer.SetParent(Value:TBagelActionContainer);
begin
  //
  FParent := Value;
end;
procedure TBagelActionContainer.LoadFromFile(const FileName:String);
var
  sl:TStringList;
  i:Integer;
  CurrentLine:String;
  CurrentLineArr:TStrArray;
  NewItem, Current: TBagelActionContainer;
begin
  if not FileExists(FileName) then Exit;

  Current := Self;

  sl:=TStringList.Create;
  try
    sl.LoadFromFile(FileName);
    For i := 0 to sl.Count - 1 do begin
      CurrentLine := Trim(sl.Strings[i]);
      //空行 または コメントアウト
      if (CurrentLine='') or (CurrentLine[1] = ';') then continue;
      if CurrentLine[1] = '>' then begin
        //新しいフォルダを作る
        NewItem := TBagelActionContainer.Create(Self);
        System.Delete(CurrentLine,1,1);
        CurrentLineArr := btSplitToArray(CurrentLine,',');
        NewItem.Name := CurrentLineArr[0];
        NewItem.Caption := CurrentLineArr[1];
        NewItem.ShowFlags := StrToIntDef(CurrentLineArr[3],0);
        Current.Add(NewItem);
        Current := NewItem;
      end
      else if CurrentLine = '<' then begin
        //親フォルダに移動
        Current := Current.Parent;
      end
      else if CurrentLine = '-' then begin
        NewItem := TBagelActionContainer.Create(Self);
        NewItem.Caption := '-';
        Current.Add(NewItem);
      end
      else begin
        NewItem := TBagelActionContainer.Create(Self);
        CurrentLineArr := btSplitToArray(CurrentLine,',');
        //NewItem.Name := CurrentLineArr[0];
        NewItem.Caption := CurrentLineArr[1];
        NewItem.ShowFlags := StrToIntDef(CurrentLineArr[3],0);
        NewItem.Action := Owner.FindComponent(CurrentLineArr[0]);
        Current.Add(NewItem);
      end;
    end;
  finally
    sl.Free;
  end;

end;
function TBagelActionContainer.ConvertToText:String;
var
  tmp:String;
  i:Integer;
begin
  if Self.Count = 0 then begin
    if Self.Action <> nil then begin
      Result := Self.Action.Name + ',' + Self.Caption + ',,' + IntToStr(Self.ShowFlags) + #13#10;
    end
    else begin
      if Self.Caption = '-' then begin
        Result := '-' + #13#10;
      end
      else begin
        Result := '>' + Self.Name + ',' + Self.Caption + ',,' + IntToStr(Self.ShowFlags) + #13#10 + '<' + #13#10;
      end;
    end;
  end
  else begin
    tmp := '>' + Self.Name + ',' + Self.Caption + ',,' + IntToStr(Self.ShowFlags) + #13#10;
    For i:= 0 to Self.Count - 1 do begin
      tmp := tmp + Self.Item[i].ConvertToText; 
    end;
    tmp:=tmp+'<'+#13#10;
    Result := tmp;
  end;
end;
procedure TBagelActionContainer.SaveToFile(const FileName:String);
var
  sl:TStringList;
  i:Integer;
begin
  sl:=TStringList.Create;
  try
    For i:=0 to Self.Count - 1 do begin
      sl.Add(Self.Item[i].ConvertToText);
    end;
    sl.SaveToFile(FileName);
  finally
    sl.Free;
  end;
end;

end.
