(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Bagel Support Components.
 *
 * The Initial Developer of the Original Code is NOSE Takafumi.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 *
 * ***** END LICENSE BLOCK ***** *)
 
unit BookmarkTreeView;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, CommCtrl, ComCtrls, UBookmark;

type

  TBookmarkTreeView = class(TCustomTreeView,IBookmarkObserver)
  private
    { Private 宣言 }
    FBookmarkList:TBookmarkList;
    FFilter:String;
    procedure SetFilter(Value:String);
    procedure SetBookmarkList(Value: TBookmarkList);
    // IBookmarkObserver
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure IBookmarkObserver.Added = BookmarkAdded;
    procedure BookmarkAdded(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
    procedure AddNodes(parent: TTreeNode; bkmks: TBookmarkList);
    procedure BookmarkEdited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure BookmarkEditing(Sender: TObject; Node: TTreeNode;
              var AllowEdit: Boolean);
    function GetBookmark(Index:Integer):TBkmkBase;
  protected
    { Protected 宣言 }
    procedure RefreshBookmarkTree;
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent);  override;
    destructor Destroy; override;
    property Bookmarks[Index: Integer]: TBkmkBase read GetBookmark;
  published
    { Published 宣言 }
    //procedure BeginUpdate;
    //procedure EndUpdate;
    property OnKeyPress;
    property OnKeyDown;
    property OnKeyUp;
    property OnClick;
    property OnMouseDown;
    property OnCollapsing;
    property OnChange;
    property OnDragOver;
    property OnDragDrop;
    property Items;
    property HideSelection;
    property HotTrack;
    property Images;
    property PopupMenu;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property Selected;
    property RowSelect;
    property DragMode;
    property Filter:String read FFilter write SetFilter;
    property Root:TBookmarkList read FBookmarkList write SetBookmarkList;
  end;

implementation


constructor TBookmarkTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.OnEdited := BookmarkEdited;
  Self.OnEditing := BookmarkEditing;
end;

destructor TBookmarkTreeView.Destroy;
begin
  SetBookmarkList(nil);
  inherited;
end;

procedure TBookmarkTreeView.SetBookmarkList(Value: TBookmarkList);
begin
  if Assigned(FBookmarkList) then begin
    //Remove Bookmark Listener
    BookmarkObserverService.RemoveObserver(Self,FBookmarkList);
    //リストをクリア
    Self.TopItem;
  end;
  if Value<>Nil then begin
    FBookmarkList := Value;
    //すべてのブックマークを表示
    RefreshBookmarkTree;
    //Observerを登録
    BookmarkObserverService.AddObserver(Self,Value);
  end;
end;

function GetVisibleIndex(node: TTreeNode): integer;
begin
  result := -1;
  while node <> nil do
  begin
    node := node.GetPrevVisible;
    Inc(result);
  end;
end;



procedure TBookmarkTreeView.AddNodes(parent: TTreeNode; bkmks: TBookmarkList);
var
  i: integer;
  node,me: TTreeNode;
begin
  me := Items.AddChild(parent, bkmks.name);
  me.Data := bkmks;
  me.Expanded := bkmks.expanded;
  if bkmks is TBookmarkList then
  begin
    //※[JS]
    me.ImageIndex := 7;
    me.SelectedIndex := 7;
  end;
  for i := 0 to bkmks.Count -1 do
  begin
    if TObject(bkmks.Items[i]) is TBookmark then
    begin
      node := Items.AddChild(me, TBookmark(bkmks.Items[i]).name);
      node.Data := bkmks.Items[i];
      node.ImageIndex := 9;
      node.SelectedIndex := 9;
    end
    else if TObject(bkmks.Items[i]) is TBookmarkList then
    begin
      AddNodes(me, TBookmarkList(bkmks.Items[i]));
    end;
  end;
end;

procedure TBookmarkTreeView.Deleting(item:TBkmkBase);
var
  i:Integer;
  node:TTreeNode;
begin
  for i := 0 to Items.Count - 1 do begin
    if Items.Item[i].Data = item then begin
      Items.Item[i].Free;
      {if item is TBookmark then
      begin
        node := Items.AddChild(Items.Item[i], TBookmark(item).name);
        node.Data := item;
        node.ImageIndex := 9;
        node.SelectedIndex := 9;
      end
      else if item is TBookmarkList then
      begin
        AddNodes(Items.Item[i], TBookmarkList(item));
      end;}
      Break;
    end;
  end;
end;

procedure TBookmarkTreeView.Deleted(item:TBkmkBase);
begin
  //
end;

procedure TBookmarkTreeView.BookmarkAdded(item:TBkmkBase);
var
  i:Integer;
  node:TTreeNode;
begin
  for i := 0 to Items.Count - 1 do begin
    if Items.Item[i].Data = item.parent then begin
      if item is TBookmark then
      begin
        node := Items.AddChild(Items.Item[i], TBookmark(item).name);
        node.Data := item;
        node.ImageIndex := 9;
        node.SelectedIndex := 9;
      end
      else if item is TBookmarkList then
      begin
        AddNodes(Items.Item[i], TBookmarkList(item));
      end;
      Break;
    end;
  end;
end;

procedure TBookmarkTreeView.Changed(item:TBkmkBase);
var
  i:Integer;
  node:TTreeNode;
begin
  for i := 0 to Items.Count - 1 do begin
    if Items.Item[i].Data = item then begin
      Items.Item[i].Text := item.name;
      Break;
    end;
  end;
end;

procedure TBookmarkTreeView.RefreshBookmarkTree;
var
  i,c: integer;
begin
  Items.BeginUpdate;
  Items.Clear;
  AddNodes(nil, FBookmarkList);
  Items[0].Expanded := true;
  c := Items.Count;
  for i := 0 to c -1 do
  begin
    if TObject(Items[i].Data) is TBookmarkList then
    begin
      Items[i].Expanded := TBookmarkList(Items[i].Data).expanded;
    end;
    {if i = bookmarks.selected then
      BookmarksTree2.Selected := BookmarksTree2.Items[i];}
    {if i = favorites.top then
      FavoriteView.TopItem := FavoriteView.Items[i];}
  end;
  // 水平位置の補正の為だがTop位置への移動にTopItemを止めてSendMessage->WM_VSCROLLしてみた
  SendMessage(Handle, WM_VSCROLL, SB_TOP, 0);
  {SendMessage(Handle, WM_VSCROLL,
              MakeLong(SB_THUMBPOSITION, GetVisibleIndex(Items[FBookmarkList.top])), 0);}
  Items.EndUpdate;
end;

procedure TBookmarkTreeView.BookmarkEdited(Sender: TObject; Node: TTreeNode; var S: string);
begin
  TBkmkBase(Node.Data).name := S;
end;

procedure TBookmarkTreeView.BookmarkEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  if (Node.Data = FBookmarkList) and (FBookmarkList is TBookmarks) then
    AllowEdit := false;
end;

function TBookmarkTreeView.GetBookmark(Index: Integer):TBkmkBase;
begin
  Result := TBkmkBase(Items[Index].Data);
end;


procedure TBookmarkTreeView.SetFilter(Value:String);
begin
  //
end;

end.
