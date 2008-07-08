unit SearchListItem;

interface

uses
  Windows, Messages, SysUtils, Classes, ComCtrls;

type
  TSearchListItem = class(TListItem)
  private
    { Private éŒ¾ }
    FGroups:TStringList;
    FItemType:Integer;
    FEncode:String;
  protected
    { Protected éŒ¾ }
  public
    constructor Create(AOwner: TListItems);
    destructor Destroy; override;
    { Public éŒ¾ }
  published
    { Published éŒ¾ }
    property Groups:TStringList read FGroups;
    property ItemType:Integer read FitemType write FItemType;
    property Encode:String read FEncode write FEncode;
  end;

//procedure Register;

implementation

constructor TSearchListItem.Create(AOwner: TListItems);
begin
  inherited Create(AOwner);
  FGroups:=TStringList.Create;
end;

destructor TSearchListItem.Destroy;
begin
  FGroups.Free;
  inherited Destroy;
end;

end.
