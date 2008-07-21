unit UTabList;

interface

uses Windows,SysUtils,Classes,IniFiles;

type
  TTabListItem=class;
  TTabHistoryItem=class;
  
  TTabList = class(TObject)
  private
    FActiveIndex:Integer;
    FList:TList;
    function GetCount:integer;
    function GetTabs(index:Integer):TTabListItem;
  public
    constructor Create;// override;
    destructor Destroy; override;
    property ActiveIndex:Integer read FActiveIndex write FActiveIndex;
    property Count:Integer read GetCount;
    property Tabs[index:Integer]:TTabListItem read GetTabs;

    procedure Clear;
    procedure LoadFromFile(filePath:String);
    procedure SaveToFile(filePath:String);
    procedure Add(Item:TTabListItem);
    procedure Insert(Item:TTabListItem;Index:Integer);
    procedure Delete(index:Integer);
    procedure Remove(Item:TTabListItem);
  end;

  TTabListItem = class(TObject)
  private
    FHistoryPosition:Integer;
    FURI:String;
    FTitle:String;
    FList:TList;
    FSecurity:integer;
    FReload:Integer;
    FIsLocked:Boolean;
    FIsRead:Boolean;
    
    function GetHistoryCount:Integer;
    function GetHistoryItem(index:Integer):TTabHistoryItem;
  public
    constructor Create;// override;
    destructor Destroy; override;
    property HistoryPosition:Integer read FHistoryPosition write FHistoryPosition;
    property HistoryCount:Integer read GetHistoryCount;
    property HistoryItem[index:Integer]:TTabHistoryItem read GetHistoryItem;
    property URI:String read FURI write FURI;
    property Title:String read FTitle write FTitle;
    property Security:Integer read FSecurity write FSecurity;
    property Reload:Integer read FReload write FReload;
    property IsLocked:Boolean read FIsLocked write FIsLocked;
    property IsRead:Boolean read FIsRead write FIsRead;
    procedure AddHistoryItem(HistoryItem:TTabHistoryItem);
    procedure InsertHistoryItem(HistoryItem:TTabHistoryItem;Index:Integer);
    procedure DeleteHistoryItem(index:Integer);
  end;

  TTabHistoryItem = class(TObject)
  private
    FURI:String;
    FTitle:String;
  public
    property URI:String read FURI write FURI;
    property Title:String read FTitle write FTitle;
  end;

implementation

constructor TTabList.Create;
begin
FList:=TList.Create;
end;

destructor TTabList.Destroy;
var
i:Integer;
item:TTabListItem;
begin
  inherited Destroy;
  for i:=FList.Count-1 downto 0 do begin
    item:=FList.Items[i];
    FList.Delete(i);
    item.Free;
  end;
  FList.Free;
end;

procedure TTabList.Clear;
var
i:Integer;
item:TTabListItem;
begin
  for i:=FList.Count-1 downto 0 do begin
    item:=FList.Items[i];
    FList.Delete(i);
    item.Free;
  end;
end;

procedure TTabList.LoadFromFile(filePath:String);
var
  i:Integer;
  j:Integer;
  tabcount:Integer;
  historyCount:Integer;
  ini:TMemIniFile;
  tabsec:String;
  item:TTabListItem;
  histEntry:TTabHistoryItem;
begin
  Self.Clear;
  if not FileExists(filePath) then exit;
  ini:=TMemIniFile.Create(filePath);
  try
    tabcount:=ini.ReadInteger('head','tabcount',0);
    Self.ActiveIndex:=ini.ReadInteger('head','tabindex',0);
    for i:=0 to tabcount-1 do
    begin
      tabsec:='tab'+IntToStr(i);
      item:=TTabListItem.Create;
      historyCount:=ini.ReadInteger(tabsec,'history_count',0);
      item.HistoryPosition:=ini.ReadInteger(tabsec,'history_position',0);
      item.URI:=ini.ReadString(tabsec,'location','about:blank');
      item.Title:=ini.ReadString(tabsec,'title','');
      for j:=0 to historyCount-1 do begin
        histEntry:=TTabHistoryItem.Create;
        histEntry.title:=ini.ReadString(tabsec,'history'+IntToStr(j)+'_title','');
        histEntry.URI:=ini.ReadString(tabsec,'history'+IntToStr(j)+'_URI','');
        item.AddHistoryItem(histEntry);
      end;
      Self.Add(item);
    end;
  finally
    ini.Free;
  end;
{
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Default.bfg') then exit;
  try
    ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Default.bfg');
    tabcount:=ini.ReadInteger('head','tabcount',0);
    tabindex:=ini.ReadInteger('head','tabindex',0);

    for i:=0 to tabcount-1 do
    begin

      uri:=ini.ReadString('tab'+IntToStr(i),'location','about:blank');
      AddTab(uri,0,0,'',Pref.DocShellDefault);

    end;
  finally

    ini.Free;
  end;
}
end;

procedure TTabList.SaveToFile(filepath:String);
var
  i:Integer;
  j:Integer;
  ini:TMemIniFile;
  tabsec:String;
begin
  DeleteFile(FilePath);
  ini:=TMemIniFile.Create(Filepath);
  try
    ini.WriteInteger('head','tabindex',Self.ActiveIndex);
    ini.WriteInteger('head','tabcount',Self.Count);
    for i:=0 to Self.Count-1 do begin
      tabsec:='tab'+IntToStr(i);
      ini.WriteInteger(tabsec,'history_count',Self.Tabs[i].HistoryCount);
      ini.WriteInteger(tabsec,'history_position',Self.Tabs[i].HistoryPosition);

      ini.WriteString(tabsec,'title',Self.Tabs[i].Title);
      ini.WriteString(tabsec,'location',Self.Tabs[i].URI);
      for j:=0 to Self.Tabs[i].HistoryCount-1 do begin
        ini.WriteString(tabsec,'history'+IntToStr(j)+'_title',Self.Tabs[i].HistoryItem[j].Title);
        ini.WriteString(tabsec,'history'+IntToStr(j)+'_URI',Self.Tabs[i].HistoryItem[j].URI);
      end;
    end;
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

procedure TTabList.Add(Item:TTabListItem);
begin
  FList.Add(Item);
end;

procedure TTablist.Insert(Item:TTabListItem;Index:Integer);
begin
  FList.Insert(index,item);
end;

procedure TTabList.Delete(index:integer);
begin
  FList.Delete(index);
end;

procedure TTabList.Remove(Item:TTabListItem);
begin
  FList.Remove(Item);
end;

function TTabList.GetCount:integer;
begin
  Result:=FList.Count;
end;
function TTabList.GetTabs(index:Integer):TTabListItem;
begin
  Result:=TTabListItem(FList.Items[index]);
end;

constructor TTabListItem.Create;
begin
  FList:=TList.Create;
end;

destructor TTabListItem.Destroy;
var
item:TTabHistoryItem;
i:Integer;
begin
  inherited Destroy;
  for i := FList.Count-1 downto 0 do begin
    item:=FList.Items[i];
    FList.Delete(i);
    item.Free;
  end;
  FList.Free;
end;

function TTabListItem.GetHistoryCount:Integer;
begin
  Result:=FList.Count;
end;

function TTabListItem.GetHistoryItem(index:Integer):TTabHistoryItem;
begin
  Result:=TTabHistoryItem(FList.Items[index]);
end;

procedure TTabListItem.AddHistoryItem(HistoryItem:TTabHistoryItem);
begin
  FList.Add(HistoryItem);
end;

procedure TTabListItem.InsertHistoryItem(HistoryItem:TTabHistoryItem;Index:Integer);
begin
  FList.Insert(index,HistoryItem);
end;

procedure TTabListItem.DeleteHistoryItem(index:Integer);
begin
  FList.Delete(index);
end;

end.
 