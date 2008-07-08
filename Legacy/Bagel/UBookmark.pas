unit UBookmark;
(* お気に入り *)
(* Copyright (c) 2001,2002 hetareprog@hotmail.com *)

{plus7(http://tkm.s31.xrea.com/)がBagel用(一般ブラウザ用)にいろいろ変更}
{変更点:
＊Unit名：UFavorite＞UBookmark
＊TFavBase＞TBkmkBase
＊TFavoriteList＞TBookmarkList
}

interface

uses
  Classes, SysUtils, StrUtils, Dialogs, Controls,
  UXMLSub,BufStream;

type
  TBookmark = class;
  TBookmarks = class;
  TBookmarkList = class;

  (*-------------------------------------------------------*)
  TBkmkBase = class(TObject)
  protected
    changed: boolean;
    procedure SetName(const name: string);
  public
    FName:     string;
    parent:   TBkmkBase;
    constructor Create(parentNode: TBkmkBase);
    destructor Destroy; override;
    procedure Remove;
    procedure Delete(obj: TBkmkBase); virtual;
//    procedure NotifyChange(type:Integer;item:TBkmkBase);
    property name: string read FName write SetName;
  end;

  (*-------------------------------------------------------*)
  TBookmark = class(TBkmkBase)
  public
    {secJavascript: boolean;
    secPlugins:    boolean;
    secFrames:     boolean;
    secMeta:       boolean;
    secImg:        boolean;
    secReferer:    boolean;}
    DocShell       :String;
    {scrX:          integer;
    scrY:          integer;}
    ScreenPos      :String;
    ReloadIntv     :String;
    //css:           string;
{    addedDate:     integer;
    lastModified:  integer;
    lastVisited:   Integer;}
    URI:           string;
    constructor    Create(parentNode: TBookmarkList);
    destructor     Destroy; override;
  end;


  TLiveBookmark = class(TBkmkBase)
  public
    DocShell       :String;
    FeedURI:           string;
    constructor    Create(parentNode: TBookmarkList);
    destructor     Destroy; override;
  end;

  (*-------------------------------------------------------*)
  TBookmarkList = class(TBkmkBase)
  protected
    list: TList;
    function GetCount: integer;
    function GetItems(index: integer): TBkmkBase;
  public
    expanded:    boolean;
    constructor Create(parentNode: TBookmarkList);
    destructor Destroy; override;
    procedure Clear;
    procedure Add(obj: TBkmkBase);
    procedure Insert(index: integer; item: TBkmkBase);
    procedure Delete(obj: TBkmkBase); override;
    procedure FindDelete(const URI: string);
    function IndexOf(item: TBkmkBase): integer;
    function Find(const URI: string; strict: boolean = false): TBookmark;
    function IsChanged: boolean;
    procedure ClearChanged;
    property Count: integer read Getcount;
    property Items[index: integer]: TBkmkBase read GetItems;
  end;

  IBookmarkObserver = interface;

  IBookmarkObserver = interface(IInterface)
  ['{A4AD80A9-987D-4BE4-97F2-8AA4B330BB10}']
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure Added(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
  end;

  TBookmarkObserverService = class(TObject)
  protected
    FObservers:TInterfaceList;
  public
    constructor Create;
    destructor Destroy;
    procedure AddObserver(Observer:IBookmarkObserver; Bookmarks:TBookmarkList);
    procedure RemoveObserver(Observer:IBookmarkObserver; Bookmarks:TBookmarkList);
    procedure NotifyDeleting(item:TBkmkBase);
    procedure NotifyDeleted(item:TBkmkBase);
    procedure NotifyChanged(item:TBkmkBase);
    procedure NotifyAdded(item:TBkmkBase);
  end;


  TBookmarks = class(TBookmarkList)
  protected
//    FSelected: integer;
    FTop:      integer;
//    procedure SetSelected(val: integer);
    procedure SetTop(val: integer);
  public
    constructor Create;
    function Load(const path: string): boolean;
    procedure Save(const path: string);
//    property selected: integer read FSelected write SetSelected;
    property top: integer read FTop write SetTop;
  end;


var
  BookmarkObserverService:TBookmarkObserverService;

(*=======================================================*)
implementation
(*=======================================================*)
constructor TBkmkBase.Create(parentNode: TBkmkBase);
begin
  parent := parentNode;
  changed:= false;
end;

destructor TBkmkBase.Destroy;
begin
  Remove;
  inherited;
end;

procedure TBkmkBase.Remove;
begin
  if parent <> nil then
  begin
    parent.Delete(self);
    parent := nil;
  end;
end;

procedure TBkmkBase.Delete(obj: TBkmkBase);
begin
end;

procedure TBkmkBase.SetName(const name: string);
begin
  FName := name;
  changed := true;
  BookmarkObserverService.NotifyChanged(Self);
end;

(*=======================================================*)
constructor TBookmark.Create(parentNode: TBookmarkList);
begin
  parent := parentNode;
end;

destructor TBookmark.Destroy;
begin
  //category := '';
  //board := '';
  URI := '';
  inherited;
end;


(*=======================================================*)
constructor TLiveBookmark.Create(parentNode: TBookmarkList);
begin
  parent := parentNode;
end;

destructor TLiveBookmark.Destroy;
begin
  //category := '';
  //board := '';
  FeedURI := '';
  inherited;
end;


(*=======================================================*)
constructor TBookmarkList.Create(parentNode: TBookmarkList);
begin
  inherited Create(parentNode);
  list := TList.Create;
end;


destructor TBookmarkList.Destroy;
begin
  Clear;
  list.Free;
  inherited Destroy;
end;

procedure TBookmarkList.Clear;
begin
  while 0 < list.Count do
    TBkmkBase(list.Items[0]).Free;
end;

procedure TBookmarkList.Add(obj: TBkmkBase);
begin
  if obj is TBookmarkList then
  begin
    if TBookmarkList(obj).parent <> self then
    begin
      TBookmarkList(obj).Remove;
      TBookmarkList(obj).parent := self;
    end;
    list.Add(obj);
    changed := true;
    BookmarkObserverService.NotifyAdded(obj);
  end
  else if obj is TBookmark then
  begin
    if TBookmark(obj).parent <> self then
    begin
      TBookmark(obj).Remove;
      TBookmark(obj).parent := self;
    end;
    list.Add(obj);
    changed := true;
    BookmarkObserverService.NotifyAdded(obj);
  end;
end;

procedure TBookmarkList.Insert(index: integer; item: TBkmkBase);
begin
  if item is TBookmarkList then
  begin
    if TBookmarkList(item).parent <> self then
    begin
      TBookmarkList(item).Remove;
      TBookmarkList(item).parent := self;
    end;
    list.Insert(index, item);
    changed := true;
    BookmarkObserverService.NotifyAdded(item);
  end
  else if item is TBookmark then
  begin
    if TBookmark(item).parent <> self then
    begin
      TBookmark(item).Remove;
      TBookmark(item).parent := self;
    end;
    list.Insert(index, item);
    changed := true;
    BookmarkObserverService.NotifyAdded(item);
  end;
end;


procedure TBookmarkList.Delete(obj: TBkmkBase);
var
  i: integer;
begin
  i := list.IndexOf(obj);
  if i < 0 then
    exit;
  BookmarkObserverService.NotifyDeleting(obj);
  list.Delete(i);
  BookmarkObserverService.NotifyDeleted(obj);
  changed := true;
end;

procedure TBookmarkList.FindDelete(const URI: string);
var
  item: TBookmark;
begin
  item := nil;
  repeat
    if (item <> nil) and (item.parent <> nil) then
    begin
      item.parent.Delete(item);
      item.Free;
    end;
    item := Find(URI);
  until item = nil;
end;

function TBookmarkList.GetCount: integer;
begin
  result := list.Count;
end;

function TBookmarkList.GetItems(index: integer): TBkmkBase;
begin
  result := list.Items[index];
end;

function TBookmarkList.IndexOf(item: TBkmkBase): integer;
begin
  result := list.IndexOf(item);
end;

function TBookmarkList.Find(const URI: string; strict: boolean = false): TBookmark;
var
  i: integer;
  item: TBookmark;
begin
  for i := 0 to list.Count -1 do
  begin
    if Items[i] is TBookmarkList then
    begin
      result := (Items[i] as TBookmarkList).Find(URI);
      if (result <> nil) then
        exit;
    end
    else begin
      item := (Items[i] as TBookmark);
      if (item.URI = URI)// and (item.datName = datName) and
         //(not strict or (item.host = host)) then
         then
      begin
        result := item;
        exit;
      end;
    end;
  end;
  result := nil;
end;

function TBookmarkList.IsChanged: boolean;
var
  i: integer;
begin
  if changed then
  begin
    result := true;
    exit;
  end;
  for i := 0 to list.Count -1 do
  begin
    if Items[i] is TBookmarkList then
    begin
      result := (Items[i] as TBookmarkList).IsChanged;
      if result then
        exit;
    end
    else begin
      result := (Items[i] as TBookmark).changed;
      if result then
        exit;
    end;
  end;
  result := false;
end;

procedure TBookmarkList.ClearChanged;
var
  i: integer;
begin
  changed := false;
  for i := 0 to list.Count -1 do
  begin
    if Items[i] is TBookmarkList then
      (Items[i] as TBookmarkList).ClearChanged
    else
      (Items[i] as TBookmark).changed := false;
  end;
end;

(*=======================================================*)
constructor TBookmarks.Create;
begin
  inherited Create(nil);
  top := 0;
//  selected := -1;
  FName := 'ブックマーク';
  //FObservers:=TInterfaceList.Create;
end;
  {
destructor TBookmarks.Destroy;
begin
//  inherited Destroy(nil);
  //FObservers.Free;
  inherited Destroy;
end;

procedure TBookmarks.AddObserver(Observer:IBookmarkObserver);
begin
  //FObservers.Add(Observer);
end;

procedure TBookmarks.RemoveObserver(Observer:IBookmarkObserver);
begin
  //FObservers.Remove(Observer);
end;}

(*  *)
function TBookmarks.Load(const path: string): boolean;
var
  bkmkFolder: TBookmarkList;
  modified: boolean;
  procedure AddNode(parent: TBookmarkList; element: TXMLElement);
  var
    i: integer;
    el: TXMLElement;
    bkmkNode: TBookmark;
    bkmkFeed: TLiveBookmark;
    len: integer;
  begin
    bkmkNode := nil;
    for i := 0 to element.Count -1 do
    begin
      el := element.Items[i];
      if (el.elementType = xmleELEMENT) then
      begin
        if el.text = 'folder' then
        begin
          bkmkFolder := TBookmarkList.Create(parent);
          try bkmkFolder.FName := el.attrib.Values['name']; except end;
          try bkmkFolder.expanded := (el.attrib.Values['expanded'] = 'true'); except end;
          parent.Add(bkmkFolder);
          AddNode(bkmkFolder, el);
        end
        else if el.text = 'item' then
        begin
          bkmkNode := TBookmark.Create(parent);
          try bkmkNode.FName := el.attrib.Values['name']; except end;
          try bkmkNode.DocShell := el.attrib.Values['docshell']; except end;
          try bkmkNode.ReloadIntv := el.attrib.Values['reload']; except end;
          try bkmkNode.URI := el.attrib.Values['URI']; except end;

          parent.Add(bkmkNode);
        end
        else if el.text = 'feed' then
        begin
          bkmkFeed := TLiveBookmark.Create(parent);
          try bkmkFeed.FName := el.attrib.Values['name']; except end;
          try bkmkFeed.DocShell := el.attrib.Values['docshell']; except end;
          try bkmkFeed.FeedURI := el.attrib.Values['URI']; except end;

          parent.Add(bkmkFeed);
        end;
        (* しまった。datの形式を変えちゃった。ので置換えコード *)
        (*if bkmkNode <> nil then
          bkmkNode.datName := ChangeFileExt(bkmkNode.datName, '');*)
      end;
    end;
  end;
var
  fstream: TFileStream;
  doc: TXMLDoc;
  elem: TXMLElement;
  i: integer;
begin
  result := false;
  modified := false;
  fstream := nil;
  doc := nil;
  while true do
  try
    fstream := TBufFileStream.Create(path, fmOpenRead);
    doc := TXMLDoc.Create;
    doc.LoadFromStream(fstream);
    Clear;
    (* Bookmarkを探す *)
    for i := 0 to doc.Count -1 do
    begin
      elem := doc.Items[i];
      if (elem.elementType = xmleELEMENT) and
         (elem.text = 'bookmark') then
      begin
        try expanded := (elem.attrib.Values['expanded'] <> 'false'); except end;
        try top := StrToInt(elem.attrib.Values['top']); except end;
//        try self.selected := StrToInt(elem.attrib.Values['selected']); except end;
        AddNode(self, elem);
        break;
      end;
    end;
    fstream.Free;
    doc.Free;
    result := true;
    break;
  except
    if fstream <> nil then
      fstream.Free;
    if doc <> nil then
      doc.Free;
    if not FileExists(path) then
    begin
      result := true;
      break;
    end;
    if MessageDlg('お気に入りの読み込みに失敗しました。' + #10 +
                  '他のソフト等でbookmarks.datを使用している場合は終了させて下さい。',
                  mtError, [mbAbort, mbRetry], 0) = mrAbort then
    begin
      result := false;
      break;
    end;
  end;
  ClearChanged;

  (* データ修正用コードです *)
  if result and modified then
    Save(path);
end;

const
  TrueFalse: array[0..1] of string = ('false', 'true');

procedure TBookmarks.Save(const path: string);
var
  bkmkFile: TStringList;
  procedure SetOutputList(listNode: TBookmarkList; indent: integer);
  var
    i: integer;
  begin
    for i := 0 to listNode.Count -1 do
    begin
      if TObject(listNode.Items[i]) is TBookmark then
      begin
        with TBookmark(listNode.Items[i]) do
        begin
          bkmkFile.Add(StringOfChar(' ', indent * 2)
                      + Format('<item name="%s" docshell="%s" reload="%s" URI="%s"/>',
                      [XMLQuoteEncode(name),
                      (DocShell),  // XMLQuoteEncode
                      (ReloadIntv),//   XMLQuoteEncode
                       {XMLQuoteEncode(category),
                       XMLQuoteEncode(board),
                       XMLQuoteEncode(host),
                       XMLQuoteEncode(bbs),}
                       XMLQuoteEncode(URI)]));
        end;
      end
      else if TObject(listNode.Items[i]) is TLiveBookmark then
      begin
        with TLiveBookmark(listNode.Items[i]) do
        begin
          bkmkFile.Add(StringOfChar(' ', indent * 2)
                      + Format('<feed name="%s" docshell="%s" URI="%s"/>',
                      [XMLQuoteEncode(name),
                      (DocShell),  // XMLQuoteEncode
                       {XMLQuoteEncode(category),
                       XMLQuoteEncode(board),
                       XMLQuoteEncode(host),
                       XMLQuoteEncode(bbs),}
                       XMLQuoteEncode(FeedURI)]));
        end;
      end
      else if TObject(listNode.Items[i]) is TBookmarkList then
      begin
        with TBookmarkList(listNode.Items[i]) do
        begin
          bkmkFile.Add(StringOfChar(' ', indent * 2)
                      + Format('<folder name="%s" expanded="%s">',
                      [XMLQuoteEncode(name), TrueFalse[Integer(expanded)]]));
          SetOutputList(TBookmarkList(listNode.Items[i]), indent + 1);
          bkmkFile.Add(StringOfChar(' ', indent * 2)
                      + '</folder>');
        end;
      end;
    end;
  end;
begin
  
if not IsChanged then
    exit;
  bkmkFile := TStringList.Create;
  bkmkFile.Add(Format('<bookmark top="%d">', [top]));// selected="%d"       , selected
  SetOutputList(self, 1);
  bkmkFile.Add('</bookmark>');
  try
    bkmkFile.SaveToFile(path);
  except
  end;
  bkmkFile.Free;
end;
                                {
procedure TBookmarks.SetSelected(val: integer);
begin
  if FSelected <> val then
  begin
    FSelected := val;
    changed := true;
  end;
end;                             }

procedure TBookmarks.SetTop(val: integer);
begin
  if FTop <> val then
  begin
    FTop := val;
    changed := true;
  end;
end;

(*=======================================================*)
constructor TBookmarkObserverService.Create;
begin
  inherited Create;
  FObservers:=TInterfaceList.Create;
end;

destructor TBookmarkObserverService.Destroy;
begin
  FObservers.Free;
  inherited Destroy;
end;

procedure TBookmarkObserverService.AddObserver(Observer:IBookmarkObserver; Bookmarks:TBookmarkList);
begin
  FObservers.Add(Observer);
end;

procedure TBookmarkObserverService.RemoveObserver(Observer:IBookmarkObserver; Bookmarks:TBookmarkList);
begin
  FObservers.Remove(Observer);
end;

procedure TBookmarkObserverService.NotifyDeleting(item:TBkmkBase);
var
i:Integer;
begin
  for i:=0 to FObservers.Count-1 do begin
    IBookmarkObserver(FObservers.Items[i]).Deleting(item);
  end;
end;

procedure TBookmarkObserverService.NotifyDeleted(item:TBkmkBase);
var
i:Integer;
begin
  for i:=0 to FObservers.Count-1 do begin
    IBookmarkObserver(FObservers.Items[i]).Deleted(item);
  end;
end;

procedure TBookmarkObserverService.NotifyChanged(item:TBkmkBase);
var
i:Integer;
begin
  for i:=0 to FObservers.Count-1 do begin
    IBookmarkObserver(FObservers.Items[i]).Changed(item);
  end;
end;

procedure TBookmarkObserverService.NotifyAdded(item:TBkmkBase);
var
i:Integer;
begin
  for i:=0 to FObservers.Count-1 do begin
    IBookmarkObserver(FObservers.Items[i]).Added(item);
  end;
end;

initialization
  BookmarkObserverService:=TBookmarkObserverService.Create;

finalization
	if BookmarkObserverService <> nil then begin
    BookmarkObserverService.Free;
	  BookmarkObserverService := nil;
	end;


end.
