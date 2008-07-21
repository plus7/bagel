unit UBookmarkEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ImgList, ExtCtrls, UBookmark,
  StdCtrls,BagelPref, BookmarkTreeView, BookmarkListView;

type
  TfrmBookmarkEditor = class(TForm)
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    tbNewBkmk: TToolButton;
    tbNewFolder: TToolButton;
    tbProperty: TToolButton;
    tbRenameItem: TToolButton;
    tbDeleteItem: TToolButton;
    ImageList1: TImageList;
    ToolButton6: TToolButton;
    tbLiveChecker: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ModifyTimer: TTimer;
    PopupLv: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Property1: TMenuItem;
    Delete1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    {}procedure CreateParams(var Params:TCreateParams); override;
    {}procedure Delete1Click(Sender: TObject);
    //procedure DeleteNodeByBkmk(bkmk:TBkmkBase);
    {}procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {}procedure FormCreate(Sender: TObject);
    procedure ModifyTimerTimer(Sender: TObject);
    {}procedure N1Click(Sender: TObject);
    {}procedure N2Click(Sender: TObject);
    {}procedure N4Click(Sender: TObject);
    {}procedure Property1Click(Sender: TObject);
    {}procedure lvItemsDblClick(Sender: TObject);
    procedure lvItemsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvItemsDragOver(Sender, Source: TObject; X, Y: Integer;      State: TDragState; var Accept: Boolean);
    {}procedure lvItemsKeyPress(Sender: TObject; var Key: Char);
    {}procedure tbDeleteItemClick(Sender: TObject);
    {}procedure tbNewBkmkClick(Sender: TObject);
    {}procedure tbNewFolderClick(Sender: TObject);
    {}procedure tbPropertyClick(Sender: TObject);
    {}procedure tbRenameItemClick(Sender: TObject);
    {}procedure tvFoldersChange(Sender: TObject; Node: TTreeNode);
    {}procedure tvFoldersCollapsing(Sender: TObject; Node: TTreeNode;  var AllowCollapse: Boolean);
    procedure tvFoldersDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvFoldersDragOver(Sender, Source: TObject; X, Y: Integer;      State: TDragState; var Accept: Boolean);
    {}procedure tvFoldersKeyPress(Sender: TObject; var Key: Char);

  private
    { Private 宣言 }
    {}FRootBookmarks:TBookmarks;
    {}FBaseFolder:TBookmarkList;
    {}FSmallImages:TImageList;
    {}FLargeImages:TImageList;
    {}procedure SetRootBookmarks(Value:TBookmarks);
    {}procedure SetBaseFolder(Value:TBookmarkList);
    {}procedure SetSmallImages(Value:TImageList);
    {}procedure SetLargeImages(Value:TImageList);
  public
    {}tvFolders:TBookmarkTreeView;
    {}lvItems:TBookmarkListView;
    {}Splitter1:TSplitter;
    { Public 宣言 }
    {}property RootBookmark:TBookmarks read FRootBookmarks write SetRootBookmarks;
    {}property BaseFolder:TBookmarkList read FBaseFolder write SetBaseFolder;
    {}property SmallImages:TImageList read FSmallImages write SetSmallImages;
    {}property LargeImages:TImageList read FLargeImages write SetLargeImages;
  end;

var
  frmBookmarkEditor: TfrmBookmarkEditor;
  Updating:Boolean;

implementation

uses BookmarkUnit, UBagel;

{$R *.dfm}


function getItemByData(lv:TBookmarkListView;Data:Pointer):TListItem;
var
i:Integer;
//item:TListItem;
begin
  Result:=nil;
  for i:=0 to lv.Items.Count-1 do begin
    if lv.Items[i].Data=Data then begin
      Result:=lv.Items[i];
      break;
    end;
  end;
end;

function getNodeByData(tv:TBookmarkTreeView;Data:Pointer):TTreeNode;
var
i:Integer;
//node:TTreeNode;
begin
  Result:=nil;
  for i:=0 to tv.Items.Count-1 do begin
    if tv.Items.Item[i].Data=Data then begin
      Result:=tv.Items.Item[i];
      break;
    end;
  end;
end;

procedure TfrmBookmarkEditor.SetRootBookmarks(Value:TBookmarks);
begin
  FRootBookmarks := Value;
  tvFolders.Root := Value;
  lvItems.Root := Value;
  tvFolders.Selected := getNodeByData(tvFolders,FBaseFolder);
end;

procedure TfrmBookmarkEditor.SetBaseFolder(Value:TBookmarkList);
begin
  FBaseFolder := Value;
  lvItems.Root := FBaseFolder;
  tvFolders.Selected := getNodeByData(tvFolders,FBaseFolder);
end;

procedure TfrmBookmarkEditor.SetSmallImages(Value:TImageList);
begin
  FSmallImages := Value;
  if Assigned(tvFolders) then tvFolders.Images := Value;
  if Assigned(lvItems) then lvItems.SmallImages := Value;
end;

procedure TfrmBookmarkEditor.SetLargeImages(Value:TImageList);
begin
  FSmallImages := Value;
  if Assigned(lvItems) then lvItems.LargeImages := Value;
end;

procedure TfrmBookmarkEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmBookmarkEditor.FormCreate(Sender: TObject);
begin
  Splitter1 := TSplitter.Create(Self);
  Splitter1.Width := 4;
  Splitter1.Align := alLeft;
  Splitter1.Parent := Self;

  tvFolders := TBookmarkTreeView.Create(Self);
  tvFolders.Parent := Self;
  tvFolders.Align := alLeft;
  tvFolders.Width := 150;
  tvFolders.OnKeyPress := Self.tvFoldersKeyPress;
  tvFolders.OnCollapsing := Self.tvFoldersCollapsing;
  tvFolders.OnChange := Self.tvFoldersChange;

  lvItems := TBookmarkListView.Create(Self);
  lvItems.Parent := Self;
  lvItems.Align := alClient;
  lvItems.ViewStyle := vsSmallIcon;
  lvItems.OnKeyPress := Self.lvItemsKeyPress;
  lvItems.OnDblClick := Self.lvItemsDblClick;
end;

procedure TfrmBookmarkEditor.tvFoldersChange(Sender: TObject;
  Node: TTreeNode);
begin
  if tvFolders.Selected<>nil then begin
    if TObject(tvFolders.Selected.Data) is TBookmarkList then
    BaseFolder := TBookmarkList(tvFolders.Selected.Data);
    //lvItems.Root := BaseFolder;
  end;
end;

procedure TfrmBookmarkEditor.CreateParams(var Params:TCreateParams);
begin
  inherited;  {
  if FormStyle in [fsNormal, fsStayOnTop] then
    if BorderStyle in [bsSingle, bsSizeable] then
      //if Config.wrtFmUseTaskBar then
      begin
        Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
        Params.WndParent := 0;
      end;// else
        //Params.ExStyle := Params.ExStyle and (not WS_EX_APPWINDOW);
        }
end;
                           (*
procedure TfrmBookmarkEditor.DeleteNodeByBkmk(bkmk:TBkmkBase);
//var
//i:Integer;
//node:TTreeNode;
begin
  {for i:=0 to tvFolders.Items.Count-1 do begin
    if TBookmark(tvFolders.Items.Item[i].Data)=bkmk then begin
      tvFolders.Items.Item[i].Free;
      break;
    end;
  end;}
  GetNodeByData(tvFolders,bkmk).Free;
end;                       *)

procedure TfrmBookmarkEditor.tbDeleteItemClick(Sender: TObject);
var
item:TBkmkbase;
i:Integer;
begin
  if ActiveControl=lvItems then begin
    lvItems.Items.BeginUpdate;
    tvFolders.Items.BeginUpdate;
    for i:=lvItems.Items.Count-1 downto 0 do begin
      if not lvItems.Items.Item[i].Selected then continue;
      Item:=TBkmkbase(lvItems.Items.Item[i].Data);
      item.parent.Delete(item);
    end;
    lvItems.Items.EndUpdate;
    tvFolders.Items.EndUpdate;
  end
  else if ActiveControl=tvFolders then begin
    lvItems.Items.BeginUpdate;
    tvFolders.Items.BeginUpdate;
    for i:=tvFolders.SelectionCount-1 downto 0 do begin
      item:=TBkmkBase(tvFolders.Selections[i].Data);
      item.parent.Delete(item);
    end;
    lvItems.Items.EndUpdate;
    tvFolders.Items.EndUpdate;
    BagelMainForm.SaveBookmarks(true); //削除後の保存
  end;

end;

procedure TfrmBookmarkEditor.tbRenameItemClick(Sender: TObject);
begin
  if ActiveControl = lvItems then begin
    lvItems.Selected.EditCaption;
  end
  else if ActiveControl = tvFolders then begin
    tvFolders.Selected.EditText;
  end;
  BagelMainForm.SaveBookmarks(true);
end;

procedure TfrmBookmarkEditor.tbPropertyClick(Sender: TObject);
var
item:TBkmkBase;
f:TBookmarkForm;
begin
  f:=TBookmarkForm.Create(Self);
  if lvItems.Selected<>nil then begin
    f.mode:='property';
    item := TBkmkBase(lvItems.Selected.Data);
    f.target:=TBookmark(item);
    f.ShowModal;
    BagelMainForm.SaveBookmarks(true);
  end;
end;

procedure TfrmBookmarkEditor.tbNewBkmkClick(Sender: TObject);
var
  f:TBookmarkForm;
  NewItem:TBookmark;
begin
  f:=TBookmarkForm.Create(Self);
  f.mode:='create';
  f.ParentBkmk:=BaseFolder;
  f.Title:='New Bookmark';
  if (f.ShowModal=mrOk) then begin
    NewItem := TBookmark.Create(BaseFolder);
    NewItem.name := f.Title;
    NewItem.URI  := f.URI;
    BaseFolder.Add(NewItem);
  end;
  f.Free;
  BagelMainForm.SaveBookmarks(true);
end;

procedure TfrmBookmarkEditor.tbNewFolderClick(Sender: TObject);
var
  NewFolder:TBookmarkList;
//  NewListItem:TListItem;
//  NewNode:TTreeNode;
begin
//parent.Insert(parent.IndexOf(node.Data), NewFolder(parent));
  NewFolder := TBookmarkList.Create(BaseFolder);
  NewFolder.name := 'New Folder';

  if lvItems.ItemIndex>=0 then BaseFolder.Insert(lvItems.ItemIndex,NewFolder)
  else BaseFolder.Insert(0,NewFolder);

  getItemByData(lvItems,NewFolder).EditCaption;

  BagelMainForm.SaveBookmarks(true);

end;

procedure TfrmBookmarkEditor.tvFoldersCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  AllowCollapse := not (TObject(Node.Data) is TBookmarks);
end;

function IsPosterity(target: TBkmkBase; node: TBkmkBase): boolean;
begin
  if target.Parent = nil then
    result := false
  else if target.Parent = node then
    result := true
  else
    result := IsPosterity(target.Parent, node);
end;

procedure TfrmBookmarkEditor.tvFoldersDragDrop(Sender, Source: TObject; X,
  Y: Integer);

var
node: TTreeNode;
src:TBkmkBase;
//NewNode:TTreeNode;
begin

  node := tvFolders.DropTarget; //BookmarksTree2.DropTarget;
  if node = nil then
    exit;

  if Source=tvFolders then begin
    src := TBkmkbase(tvFolders.Selected.Data);
  end
  else if Source=lvItems then begin
    src := TBkmkBase(lvItems.Selected.Data);
  end
  else exit;


  if (src = nil) or (src = TBkmkBase(node.Data)) then
    exit;
  //if src = Form1.bookmarks then
    //exit;
  if IsPosterity(TBkmkBase(node.data), src) then
    exit;

    if src.parent = BaseFolder then begin
      getItemByData(lvITems,src).Free;
    end;

  src.Remove;

  if (TObject(node.Data) is TBookmarkList) and
     ((0 <= GetKeyState(VK_CONTROL)) or (TBookmarkList(node.Data) = RootBookmark))
  then
  begin

    {if src is TBookmarkList then begin
      getNodeByData(tvFolders,src).MoveTo(node, naAddChildFirst);
    end;}

    TBookmarkList(node.Data).Insert(0, src);
    tvFolders.Selected:=getNodeByData(tvFolders,src);

  end
  else begin
    TBookmarkList(node.Parent.Data)
      .Insert(TBookmarkList(node.Parent.Data).IndexOf(node.Data),
              src);
    if src.parent = BaseFolder then begin
      getItemByData(lvITems,src).Free;
    end;
  end;
  //BookmarksTree2.Selected := src;
  //src.Focused := true;
//  node.Focused:=true;
  //Form1.SaveBookmarks(false);
  BagelMainForm.SaveBookmarks(true);
end;

procedure TfrmBookmarkEditor.tvFoldersDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

(*
procedure TForm1.BookmarksTree2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
//var
//  node: TTreeNode;
 // si: TScrollInfo;
begin         {
  FavTreeScrlTimer.Enabled := false;
  FavTreeExpndTimer.Enabled := false;}
  Accept := true;
            {
  // 自動スクロール
  si.cbSize := sizeof(TScrollInfo);
  si.fMask := SIF_RANGE or SIF_POS;
  GetScrollInfo(FavoriteView.Handle, SB_VERT, si);
  if (si.nPos > si.nMin) and (Y < 25) then
  begin
    FavTreeScrlTimer.Tag := 0; //UP
    FavTreeScrlTimer.Enabled := true;
    exit;
  end
  else if (si.nPos < si.nMax) and (Y > FavoriteView.Height -45) then
  begin
    FavTreeScrlTimer.Tag := 1; //DOWN
    FavTreeScrlTimer.Enabled := true;
    exit;
  end;       }
          {
  // 自動展開
  node := FavoriteView.GetNodeAt(X, Y);
  if (node <> nil) and (not node.Expanded) and (0 < node.Count) then
  begin
    FavTreeExpndTimer.Tag := node.AbsoluteIndex;
    FavTreeExpndTimer.Enabled := true;
  end;     }
end;

procedure TForm1.BookmarksTree2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
  function IsPosterity(target: TTreeNode; node: TTreeNode): boolean;
  begin
    if target.Parent = nil then
      result := false
    else if target.Parent = node then
      result := true
    else
      result := IsPosterity(target.Parent, node);
  end;
var
  node, src: TTreeNode;
//  board: TBoard;
//  thread: TThreadItem;
//  viewItem: TViewItem;
begin
  {FavTreeScrlTimer.Enabled := False;
  FavTreeExpndTimer.Enabled :=false;}
  node := BookmarksTree2.DropTarget;
  if node = nil then
    exit;

  //▼タブドロップでお気に入りのその位置に登録
  {if Source = ListTabControl then
  begin
    board := ListTabControl.Tabs.Objects[tabDragSourceIndex] as TBoard;
    //▼重複許可
    if not Config.optAllowFavoriteDuplicate and IsFavorite(board) then
      exit;
    if TObject(node.Data) is TFavoriteList then
      RegisterFavorite(board, TFavoriteList(node.Data), 0)
    else
      RegisterFavorite(board, TFavoriteList(node.Parent.Data), node.Index);
    exit;
  end
  else }if Source = TabControl1 then
  begin       {
    viewItem := viewList.Items[tabDragSourceIndex];
    thread := viewItem.thread;
    if thread = nil then
      exit;
    //▼重複許可
    if not Config.optAllowFavoriteDuplicate and IsFavorite(thread) then
      exit;
    if TObject(node.Data) is TFavoriteList then
      RegisterFavorite(thread, TFavoriteList(node.Data), 0)
    else
      RegisterFavorite(thread, TFavoriteList(node.Parent.Data), node.Index);
    UpdateThreadInfo(thread);
    exit;      }
    exit;
  end;

  src := BookmarksTree2.Selected;
  if (src = nil) or (src = node) then
    exit;
  if src.Data = bookmarks then
    exit;
  if IsPosterity(node, src) then
    exit;
  TBkmkBase(src.Data).Remove;
  if (TObject(node.Data) is TBookmarkList) and
     ((0 <= GetKeyState(VK_CONTROL)) or (TBookmarkList(node.Data) = bookmarks))
  then
  begin
    TBookmarkList(node.Data).Insert(0, TBkmkBase(src.Data));
    src.MoveTo(node, naAddChildFirst);
  end
  else begin
    TBookmarkList(node.Parent.Data)
      .Insert(TBookmarkList(node.Parent.Data).IndexOf(node.Data),
              TBkmkBase(src.Data));
    src.MoveTo(node, naInsert);
  end;
  BookmarksTree2.Selected := src;
  src.Focused := true;
  SaveBookmarks(false);
  if TObject(src.Data) is TBookmarkList then
    //UpdateFavorites
    UpdateBookmarksTree
  else
    UpdateBookmarks2;
    //UpdateFavoritesMenu;
end;
*)

procedure TfrmBookmarkEditor.lvItemsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
item: TListItem;
src:TBkmkBase;
Newitem:TlistItem;
tmpInt:Integer;
//tmpParent:TTreeNode;
{NewNode,}tmpNode:TTreenode;
begin
  item:=lvItems.DropTarget;
  if item=nil then exit;
  
  if Source=tvFolders then begin
    src := TBkmkbase(tvFolders.Selected.Data);
  end
  else if Source=lvItems then begin
    src := TBkmkBase(lvItems.Selected.Data);
  end
  else exit;

  if (src = nil) or (src = TBkmkBase(item.Data)) then
    exit;
  if IsPosterity(TBkmkBase(item.data), src) then
    exit;


  lvItems.Items.BeginUpdate;
  if TBkmkBase(item.Data) is TBookmarkList then begin//フォルダ上にD&D

    getItemByData(lvITems,src).Free;
    if src is TBookmarkList then begin
      tmpnode:=getNodeByData(tvFolders,src);
      tmpnode.MoveTo(getnodebyData(tvFolders,item.Data), naAddChildFirst);
    end;
    src.Remove;
    TBookmarkList(item.Data).Insert(0, src);
    
  end
  else begin//アイテム上にD&D
    if src.parent = BaseFolder then begin
      newitem:=getItemByData(lvITems,src);
      //lvItems.Items.Delete(lvItems.Items.IndexOf(newitem));
      //lvItems.MoveSelection(lvItems);
      newitem.Free;
      src.Remove;

      tmpint:=TBookmarkList(TBkmkBase(item.Data).parent).IndexOf(item.Data);
      
      TBookmarkList(TBkmkBase(item.Data).parent).Insert(tmpint, src);

      lvItems.ItemIndex:=tmpint;

      {newitem:=lvItems.Items.Insert(tmpint);
      newitem.Data:=src;
      newitem.Caption:=src.name;
      if src is TBookmarkList then
      newitem.ImageIndex:=7
      else newitem.ImageIndex:=9;}
    end;
  end;
  lvItems.Items.EndUpdate;

  BagelMainForm.SaveBookmarks(true);

  
(*
    if src.parent = BaseFolder then begin
      getItemByData(lvITems,src).Free;
    end;

  src.Remove;

  if (TObject(item.Data) is TBookmarkList)
  then
  begin

    if src is TBookmarkList then begin
      getNodeByData(tvFolders,src).MoveTo(node, naAddChildFirst);
    end;

    TBookmarkList(node.Data).Insert(0, src);

  end
  else begin
    TBookmarkList(node.Parent.Data)
      .Insert(TBookmarkList(node.Parent.Data).IndexOf(node.Data),
              src);
    if src.parent = BaseFolder then begin
      getItemByData(lvITems,src).Free;
    end;
  end;*)
  //Form1.SaveBookmarks(false);
  //if src is TBookmarkList then
  //  Form1.UpdateBookmarksTree
  //else
  //  Form1.UpdateBookmarks2;
end;

procedure TfrmBookmarkEditor.lvItemsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;

procedure TfrmBookmarkEditor.lvItemsDblClick(Sender: TObject);
//var
//  bkmk:TBookmarkList;
begin
  if lvItems.Selected = nil then exit;
  if TObject(lvItems.Selected.Data) is TBookmarklist then begin
    BaseFolder := TBookmarkList(lvItems.Selected.Data);
  end
  else begin
    //TODO:
    //Form1.AddTab(TBookmark(lvItems.Selected.Data).URI,0,0,'',Pref.DocShellDefault);
  end;
end;

procedure TfrmBookmarkEditor.ModifyTimerTimer(Sender: TObject);
  function find(parent:TBookmarkList;target:Pointer):Boolean;
  var
    i:Integer;
  begin
    Result:=False;
    for i:=0 to parent.Count-1 do begin
      if target=parent.Items[i] then begin
        Result:=true;
        Exit;
      end;
      if parent.Items[i] is TBookmarklist then begin
        if find(TBookmarkList(parent.Items[i]),target) then begin
          Result:=true;
          exit;
        end;
      end;
    end;
  end;
var
//base:TBookmarkList;
CurNode{,NewNode}:TTreeNode;
begin
exit;
  if RootBookmark.IsChanged then begin
     //RootBookmark;//.SaveBookmarks;
     CurNode:=tvFolders.Selected;
     if find(RootBookmark,CurNode.Data) then begin
       tvFolders.Refresh;
     end
     else begin
        while not find(RootBookmark,CurNode.Data) do begin
          {if  then begin
            BaseFolder:=TBookmarkList(CurNode.Data);
          end
          else begin}
            CurNode:=CurNode.Parent;
//          end;
        end;
        BaseFolder:=TBookmarkList(CurNode.Data);
        tvFolders.Refresh;
     end;
  end;
{
  if Form1.bookmarks.IsChanged then begin
    Base:=BaseFolder;
    tvFolders.Items.Clear;
    NewNode:=tvFolders.Items.AddChild(nil,'ブックマーク');
    newNode.Data:=Form1.bookmarks;
    Init(Form1.bookmarks,NewNode);
    if getNodeByData(tvFolders,base)<>nil then begin
      tvFolders.Selected:=getNodeByData(tvFolders,base);
    end
    else begin
      tvFolders.Selected:=getNodeByData(tvFolders,Form1.bookmarks);
    end;
    tvFolders.FullExpand;
    Form1.bookmarks.ClearChanged;
  end;}
end;

procedure TfrmBookmarkEditor.N1Click(Sender: TObject);
begin
  tbNewBkmk.Click;
end;

procedure TfrmBookmarkEditor.N2Click(Sender: TObject);
begin
  tbNewFolder.Click;
end;

procedure TfrmBookmarkEditor.Delete1Click(Sender: TObject);
begin
  tbDeleteItem.Click;
end;

procedure TfrmBookmarkEditor.N4Click(Sender: TObject);
begin
  tbRenameItem.Click;
end;

procedure TfrmBookmarkEditor.Property1Click(Sender: TObject);
begin
  tbProperty.Click;
end;

procedure TfrmBookmarkEditor.lvItemsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=chr(VK_DELETE) then begin
    tbDeleteItem.Click;
  end
  else if Key=chr(VK_F2) then begin
    tbRenameItem.Click;
  end;
end;

procedure TfrmBookmarkEditor.tvFoldersKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=chr(VK_DELETE) then begin
    tbDeleteItem.Click;
  end
  else if Key=chr(VK_F2) then begin
    tbRenameItem.Click;
  end;
end;

end.
