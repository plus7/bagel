unit UBagelMemo;

interface

uses SysUtils,Classes,IniFiles;

type

  TBagelMemoItem=class;
  
  TBagelMemo = class(TObject)
  private
    FList:TList;//
    FPath:String; //
    FTitle:String;
    FActiveindex:Integer;
    function GetCount:integer;//
    function GetItems(index:Integer):TBagelMemoItem;//
  public
    constructor Create; //
    destructor Destroy; override;//
    property Count:Integer read GetCount;//
    property Items[index:Integer]:TBagelMemoItem read GetItems;//
    property Path:String read FPath write FPath; //
    property Title :String read FTitle write FTitle;
    property ActiveIndex :Integer read FActiveindex write FActiveindex;
    procedure Clear;//
    procedure LoadFromFile(filePath:String);
    procedure SaveToFile(filePath:String);
    procedure Add(Item:TBagelMemoItem);//
    procedure Insert(Item:TBagelMemoItem;Index:Integer); //
    procedure Delete(index:Integer); //
    procedure Remove(Item:TBagelMemoItem);  //
  end;

  TBagelMemoItem = class(TObject)
  private
    FTags:TStringList;
    FTitle:String;
    FContent:String;
    FDate:TDateTime;
    procedure SetTitle(newval:String);
  public
    constructor Create(Text:String);// override;
    destructor Destroy; override;
    property Title:String read FTitle write SetTitle;
    property Content:String read FContent write FContent;
    property Date:TDateTime read FDate write FDate;
    property Tags:TStringList read FTags write FTags;
  end;          

implementation

constructor TBagelMemo.Create;
begin
  inherited Create;
  FList:=TList.Create;
  FActiveindex:=0;
end;


destructor TBagelMemo.Destroy;
var
i:Integer;
item:TBagelMemoItem;
begin
  inherited Destroy;
  for i:=FList.Count-1 downto 0 do begin
    item:=FList.Items[i];
    FList.Delete(i);
    item.Free;
  end;
  FList.Free;
end;

procedure TBagelMemo.Clear;
var
i:Integer;
item:TBagelMemoItem;
begin
  for i:=FList.Count-1 downto 0 do begin
    item:=FList.Items[i];
    FList.Delete(i);
    item.Free;
  end;
end;

procedure TBagelMemo.Add(Item:TBagelMemoItem);
begin
  FList.Add(Item);
end;

procedure TBagelMemo.Insert(Item:TBagelMemoItem;Index:Integer);
begin
  FList.Insert(index,item);
end;

procedure TBagelMemo.Delete(index:integer);
begin
  FList.Delete(index);
end;

procedure TBagelMemo.Remove(Item:TBagelMemoItem);
begin
  FList.Remove(Item);
end;

function TBagelMemo.GetCount:integer;
begin
  Result:=FList.Count;
end;
function TBagelMemo.GetItems(index:Integer):TBagelMemoItem;
begin
  Result:=TBagelMemoItem(FList.Items[index]);
end;

procedure TBagelMemo.LoadFromFile(filePath:String);
var
  i:integer;
  sl:TStringList;
  itemSl:TStringList;
  item:TBagelMemoItem;
begin
  sl:=TStringList.Create;
  FPath:=filePath;
  itemsl:=TStringList.Create;
  try
    sl.LoadFromFile(filePath);
    for i:=0 to sl.Count-1 do begin
      if sl.Strings[i]='' then begin
        if itemsl.Text<>'' then begin
          item:=TBagelMemoItem.Create(itemsl.Text);
          FList.Add(item);
          itemsl.Clear;
        end;
      end
      else begin
        itemsl.Add(sl.Strings[i]);
      end;

              {
      if Copy(sl.Strings[i],1,1)=#9  then begin
        itemsl.Add(sl.Strings[i]);
      end
      else if sl.Strings[i]='' then begin
      end
      else begin
        if i=0 then begin
          itemsl.Add(sl.Strings[i]);
        end
        else begin

        end;
      end;   }
      
    end;
  finally
    sl.Free;
    itemsl.Free;
    
  end;
end;

procedure TBagelMemo.SaveToFile(filePath:String);
var
  i,j:integer;
  sl:TStringList;
  itemSl:TStringList;
begin
  sl:=TStringList.Create;
  itemSl:=TStringList.Create;
  ForceDirectories(ExtractFilePath(filePath));
  try
    For i:=0 to FList.Count-1 do begin
      Self.Items[i].Tags.Delimiter:=' ';
      sl.Append(
          FormatDateTime('yyyy/mm/dd hh:nn',Self.Items[i].Date)
          +' '
          (*+Self.Items[i].Tags.DelimitedText
          +':'*)
          +Self.Items[i].Title
      );
      itemSl.Text:=Self.Items[i].Content;
      For j:=0 to itemSl.Count-1 do begin
        sl.Append(#9+itemSl.Strings[j]);
      end;
      sl.Append('');
    end;
    sl.SaveToFile(filePath);
  finally
    sl.Free;
    itemSL.Free;
  end;

end;

constructor TbagelMemoItem.Create(Text:String);
var
  sl:TStringList;
  i:Integer;
  currentl:String;
  colonPos:Integer;
begin
  sl:=TStringList.Create;
  FTags:=TStringList.Create;
  self.FTags.Delimiter:=' ';
  //LongTimeFormat := 'yyyy/mm/dd hh:nn';
  try
    sl.Text:=Text;
    
    currentl:=sl.Strings[0];
    self.FDate:=StrToDateTime(Copy(currentl,1,16)+':00');
    Delete(currentl,1,17);
    colonPos:=Pos(':',currentl);
    self.FTags.DelimitedText:=Copy(currentl,1,colonPos-1);
    //Delete(currentl,1,colonPos);
    Self.FTitle:=currentl;
    sl.Delete(0);

    for i:=0 to sl.Count -1 do begin
      currentl:=sl.Strings[i];
      Delete(currentl,1,1);
      sl.Strings[i]:=currentl;
    end;
    FContent:=sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TBagelMemoItem.SetTitle(newval:String);
var
colonPos:Integer;
begin
    FTitle:=Newval;
    colonPos:=Pos(':',FTitle);
    self.FTags.DelimitedText:=Copy(FTitle,1,colonPos-1);
end;

destructor TbagelMemoItem.Destroy;
begin
FTags.Free;
end;

end.
