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
 
unit BookmarkListView;

interface

uses
  SysUtils, Classes, Controls, ComCtrls, UBookmark;

type

  TBookmarkListView = class(TCustomListView, IBookmarkObserver)
  private
    { Private 宣言 }
    FBookmarkList:TBookmarkList;
    procedure SetBookmarkList(Value: TBookmarkList);
    // IBookmarkObserver
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure Added(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
  protected
    { Protected 宣言 }
    procedure RefreshBookmarkList;
    procedure BookmarkEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure BookmarkEditing(Sender: TObject; Item: TListItem;
              var AllowEdit: Boolean);
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published 宣言}
    property OnKeyPress;
    property OnDblClick;
    //property
    property Items;
    property LargeImages;
    property SmallImages;
    property ViewStyle;
    property HideSelection;
    property Root:TBookmarkList read FBookmarkList write SetBookmarkList;
  end;

implementation

constructor TBookmarkListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Columns.Add.Width := 400;
  Self.OnEdited := BookmarkEdited;
  Self.OnEditing := BookmarkEditing;
end;

destructor TBookmarkListView.Destroy;
begin
  BookmarkObserverService.RemoveObserver(Self,FBookmarkList);
  //SetBookmarkList(nil);
  inherited;
end;


procedure TBookmarkListView.BookmarkEdited(Sender: TObject; Item: TListItem; var S: string);
begin
  TBkmkBase(Item.Data).name := S;
end;

procedure TBookmarkListView.BookmarkEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
  //if (Item.Data = FBookmarkList) and (FBookmarkList is TBookmarks) then
  //  AllowEdit := false;
end;


procedure TBookmarkListView.SetBookmarkList(Value: TBookmarkList);
begin
  if Assigned(FBookmarkList) then begin
    //Remove Bookmark Listener
    BookmarkObserverService.RemoveObserver(Self,FBookmarkList);
    //リストをクリア
    Self.Clear;
  end;
  FBookmarkList := Value;
  if Value<>Nil then begin
    //すべてのブックマークを表示
    RefreshBookmarkList;
    //Observerを登録
    BookmarkObserverService.AddObserver(Self,Value);
  end;
end;

procedure TBookmarkListView.RefreshBookmarkList;
var
  i:Integer;
  item:TBkmkBase;
  NewListItem:TListItem;
begin
  Items.BeginUpdate;
  Clear;
  
  for i:=0 to Root.Count-1 do begin
    item:=Root.Items[i];
    NewListItem := Items.Add;
    NewListItem.Data := item;
    newListItem.Caption := item.name;
    if item is TBookmarkList then begin
      NewListItem.ImageIndex:=7;
    end
    else begin
      NewListItem.ImageIndex:=9;
    end;
  end;
  Items.EndUpdate;
end;

procedure TBookmarkListView.Deleting(item:TBkmkBase);
var
  i:Integer;
begin
  for i := 0 to Items.Count - 1 do begin
    if Items.Item[i].Data = item then begin
      Items.Item[i].Free;
      Exit;
    end;
  end;
end;

procedure TBookmarkListView.Deleted(item:TBkmkBase);
begin
  //
end;

procedure TBookmarkListView.Added(item:TBkmkBase);
var
  i:Integer;
  NewListItem:TListItem;
begin
  if item.parent <> Root then Exit
  else begin
    NewListItem := Items.Insert(Root.IndexOf(item));
    NewListItem.Data:=item;
    NewListItem.Caption:=item.name;
    if item is TBookmarkList then begin
      NewListItem.ImageIndex:=7;
    end
    else begin
      NewListItem.ImageIndex:=9;
    end;
  end;
end;

procedure TBookmarkListView.Changed(item:TBkmkBase);
var
  i:Integer;
begin
  for i := 0 to Items.Count - 1 do begin
    if Items.Item[i].Data = item then begin
      Items.Item[i].Caption := item.name;
      Exit;
    end;
  end;
end;


end.
