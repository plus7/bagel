unit BagelToolbar;

interface

uses
  Windows, Messages, SysUtils, Classes, ActnList,
  Menus, ComCtrls, BagelActnMan, Controls, splitjoin, UBookmark,
  CommCtrl;

  //TBagelCoolbar:gikoNaviのTGikoCoolbar由来のコードを含む。
  //該当するコードの著作権はギコナビ プロジェクトにあります。

const
  //RBBS_USECHEVRON		= $00000200;
  RBN_CHEVRONPUSHED = RBN_FIRST - 10;

type
	tagNMREBARCHEVRON = packed record
		hdr: TNMHdr;
		uBand: UINT;
		wID: UINT;
		lParam: LPARAM;
		rc: TRect;
		lParamNM: LPARAM;
	end;
	PNMRebarChevron = ^TNMRebarChevron;
	TNMRebarChevron = tagNMRebarChevron;
  TChevronClickEvent = procedure(Sender: TObject; RebarChevron: PNMRebarChevron) of object;

  IBagelUI = interface;

  IBagelUI = interface(IInterface)
  ['{06D75C06-9967-41b7-867A-F05701547499}']
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
    property Container:TBagelActionContainer read GetContainer write SetContainer;
  end;

  TBagelCoolbar = class(TCoolbar)
  private
    FOnChevronClick: TChevronClickEvent;
  	procedure RBInsertBand(var Message: TMessage); message RB_INSERTBAND;
		procedure RBSetBandInfo(var Message: TMessage); message RB_SETBANDINFO;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  public
    property OnChevronClick: TChevronClickEvent read FOnChevronClick write FOnChevronClick;
  end;

  TBagelMenuItem = class(TMenuItem,IBagelUI)
  private
    FContainer:TBagelActionContainer;
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
  public
    property Container:TBagelActionContainer
      read GetContainer write SetContainer;
    procedure Click; override;
  end;

  TBagelPopupMenu = class (TPopupMenu,IBagelUI)
  private
    FContainer:TBagelActionContainer;
    FShowFlags:Integer;
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
    procedure Refresh;
  public
    property Container:TBagelActionContainer
      read GetContainer write SetContainer;
    property ShowFlags:Integer read FShowFlags write FShowFlags default -1; 
    procedure Popup(X:Integer;Y:Integer); override;
  end;

  TBagelToolButton = class(TToolButton,IBagelUI)
  private
    FContainer:TBagelActionContainer;
    FParentMenu:TBagelPopupMenu;
    FIsMenu:Boolean;
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
  public
    property Container:TBagelActionContainer
      read GetContainer write SetContainer;
    property IsMenu:Boolean read FIsMenu write FIsMenu;
  end;

  TBagelMainMenu = class(TMainMenu,IBagelUI)
  private
    FContainer:TBagelActionContainer;
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
  public
    property Container:TBagelActionContainer
      read GetContainer write SetContainer;
  end;

  TBagelToolbar = class (TToolbar,IBagelUI)
  private
    FContainer:TBagelActionContainer;
    FIsMenu:Boolean;
    function  GetContainer:TBagelActionContainer;
    procedure SetContainer(Value:TBagelActionContainer);
  public
    property Container:TBagelActionContainer
      read GetContainer write SetContainer;
    property IsMenu:Boolean read FIsMenu write FIsMenu;
  end;

  TOpenBookmarkEvent = procedure(Sender: TObject; Item: TBkmkBase) of object;

  TBagelLinkbar = class (TToolbar,IBookmarkObserver)
  private
    FRoot: TBookmarkList;
    FOnOpenBookmark: TOpenBookmarkEvent;
    FOnOpenAllBookmarks: TOpenBookmarkEvent;
    procedure SetRoot(Value: TBookmarkList);
    //IBookmarkObserver
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure Added(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent);  override;
    destructor Destroy; override;
    procedure RefreshLinkbar;
    property Root:TBookmarkList read FRoot write SetRoot;
    property OnOpenBookmark:TOpenBookmarkEvent read FOnOpenBookmark write FOnOpenBookmark;
    property OnOpenAllBookmarks:TOpenBookmarkEvent read FOnOpenAllBookmarks write FOnOpenAllBookmarks;
  end;

  TBagelBookmarkMenu = class (TMenuItem, IBookmarkObserver)
  private
    FBookmark: TBkmkBase;
    FLinkbar: TBagelLinkbar; //TODO Linkbar限定なのはよくない
  public
    //IBookmarkObserver
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure Added(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
    procedure SetBookmark(Value:TBkmkBase);
    //TBagelBookmarkMenu
    procedure CreateChilds;
    function FindMenuItemByBookmark(item:TBkmkBase):TBagelBookmarkMenu;
    property Bookmark:TBkmkBase read FBookmark write SetBookmark;
    property Linkbar:TBagelLinkbar read FLinkbar write FLinkbar;
    //TMenuItem
    procedure Click; override;
  end;

  TBagelBookmarkToolButton = class (TToolButton, IBookmarkObserver)
  private
    FBookmark: TBkmkBase;
    FMenu: TBagelBookmarkMenu;
    FLinkbar: TBagelLinkbar; //TODO
  public
    //IBookmarkObserver
    procedure Deleting(item:TBkmkBase);
    procedure Deleted(item:TBkmkBase);
    procedure Added(item:TBkmkBase);
    procedure Changed(item:TBkmkBase);
    procedure SetBookmark(Value:TBkmkBase);
    //TBagelBookmarkToolButton
    property Bookmark:TBkmkBase read FBookmark write SetBookmark;
    property Linkbar:TBagelLinkbar read FLinkbar write FLinkbar;
    destructor Destroy; override;
    procedure Click; override;
  end;

implementation

procedure TBagelCoolbar.RBInsertBand(var Message: TMessage);
begin
	{if Assigned(FOnBandInfo) then
		FOnBandInfo(Self, PReBarBandInfo(Message.LParam));}
	inherited;
end;

procedure TBagelCoolbar.RBSetBandInfo(var Message: TMessage);
begin
	{if Assigned(FOnBandInfo) then
		FOnBandInfo(Self, PReBarBandInfo(Message.LParam));}
	inherited;
end;

procedure TBagelCoolbar.CNNotify(var Message: TWMNotify);
begin
	if Message.NMHdr^.code = RBN_CHEVRONPUSHED then begin
		if Assigned(FOnChevronClick) then begin
			FOnChevronClick(Self, PNMRebarChevron(Message.NMHdr));
		end;
	end;
	inherited;
end;

procedure TBagelPopupMenu.Refresh;
var
  i:Integer;
//  tb:TToolButton;
  mi:TMenuItem;
  Child:TBagelMenuItem;
begin
  Self.Items.Clear;
  if FContainer.Count=0 then begin
    if FContainer.Action is TBagelActionContainer then begin
      TBagelActionContainer(FContainer.Action).Click;
      For i := 0 to TBagelActionContainer(FContainer.Action).Count-1 do begin
        Child := TBagelMenuItem.Create(Self);
        Child.Container := TBagelActionContainer(FContainer.Action).Item[i];
        Self.Items.Add(Child);
        if Child.Container.Count > 0 then begin
          mi := TMenuItem.Create(Self);
          mi.Visible := False;
          Child.Add(mi);
        end;
      end;
    end;
  end
  else begin
    For i := 0 To FContainer.Count-1 do begin
      if (FContainer.Item[i].Caption<>'-') and
         (Self.ShowFlags > 0) and
         (((not FContainer.Item[i].ShowFlags) and Self.ShowFlags) = 0) then continue;
      if FContainer.Item[i].Action is TBagelActionContainer then
      begin
        Child := TBagelMenuItem.Create(Self);
        Child.Container := TBagelActionContainer(FContainer.Item[i].Action);
        Self.Items.Add(Child);
        Child.Container.Click;
        if Child.Container.Count > 0 then begin
          mi := TMenuItem.Create(Self);
          mi.Visible := False;
          Child.Add(mi);
        end;
      end
      else begin
        Child := TBagelMenuItem.Create(Self);
        Child.Container := FContainer.Item[i];
        Self.Items.Add(Child);
        if Child.Container.Count > 0 then begin
          mi := TMenuItem.Create(Self);
          mi.Visible := False;
          Child.Add(mi);
        end;
      end;
    end;
  end;
end;

procedure TBagelPopupMenu.Popup(X:Integer;Y:Integer);
begin
  Refresh;
  inherited Popup(X,Y);
end;

function TBagelPopupMenu.GetContainer:TBagelActionContainer;
begin
  Result := FContainer;
end;

procedure TBagelPopupMenu.SetContainer(Value:TBagelActionContainer);
begin
  FContainer := Value;
  Self.Refresh;
end;

procedure TBagelMenuItem.Click;
var
  i, j:Integer;
  mi:TMenuItem;
  Child:TBagelMenuItem;
begin
  if Assigned(FContainer.OnClick) then
    FContainer.OnClick(FContainer);
  if FContainer.Count > 0 then begin
    while Self.Count > 1 do Self.Items[1].Free;
    For i := 0 To FContainer.Count-1 do begin
      if False then
      begin end
      else begin
        Child:=TBagelMenuItem.Create(Self);
        FContainer.Item[i].Update;
        Child.Container := FContainer.Item[i];
        Self.Add(Child);
        if Child.Container.Count > 0 then begin
          mi := TMenuItem.Create(Self);
          mi.Visible := False;
          Child.Add(mi);
        end;
      end;
    end;
  end;
  inherited Click;
end;

function TBagelMenuItem.GetContainer:TBagelActionContainer;
begin
  Result := FContainer;
end;

procedure TBagelMenuItem.SetContainer(Value:TBagelActionContainer);
//var
//  mi:TMenuItem;
begin
  FContainer := Value;

  if FContainer.Action is TCustomAction then
    Self.Action := TCustomAction(FContainer.Action)
  else
    Self.Caption := FContainer.Caption;

  {if FContainer.Count > 0 then begin
    if Self.Items[0].Visible = True then begin

    end;
  end;}
end;

function TBagelMainMenu.GetContainer:TBagelActionContainer;
begin
  Result := FContainer;
end;

procedure TBagelMainMenu.SetContainer(Value:TBagelActionContainer);
var
  i:Integer;
//  tb:TBagelToolButton;
  ChildMenu:TBagelMenuItem;
begin
  FContainer := Value;
  Self.Items.Clear;
  For i:=0 to FContainer.Count-1 do begin
    ChildMenu := TBagelMenuItem.Create(Self);
    ChildMenu.Container := FContainer.Item[i];
    Self.Items.Add(ChildMenu);
  end;
end;

function GetWidthAllToolButton(ToolBar: TToolBar): Integer;
var
	i: Integer;
begin
	Result := 0;
	for i := 0 to ToolBar.ButtonCount - 1 do
		if ToolBar.Buttons[i].Visible then
			Result := Result + ToolBar.Buttons[i].Width;
end;

function TBagelToolButton.GetContainer:TBagelActionContainer;
begin
  Result := FContainer;
end;

procedure TBagelToolButton.SetContainer(Value:TBagelActionContainer);
//var
//  i:Integer;
//  tb:TToolButton;
  //ParentMenu:TBagelMenuItem;
begin
  FContainer := Value;
  if FContainer.Count=0 then begin
    if FContainer.Action is TCustomAction then begin
      Self.Action := TCustomAction(FContainer.Action);
      if (Self.Action is TAction) and (TAction(Self.Action).GroupIndex > 0) then
        Self.Grouped := True;
      
      if TCustomAction(FContainer.Action).ImageIndex < 0 then Self.Style := tbsTextButton;      
      if FContainer.Caption<>'' then Self.Caption := FContainer.Caption
      else Self.Caption := TCustomAction(FContainer.Action).Caption;
      if (FContainer.Action is TControlAction) and
        (not Self.IsMenu) then begin
        Self.Style := tbsDropDown;
        Self.DropdownMenu := TControlAction(FContainer.Action).DropdownMenu;
      end;
    end
    else if FContainer.Action is TBagelActionContainer then begin
      if not Assigned(FParentMenu) then
        FParentMenu := TBagelPopupMenu.Create(Self);
      FParentMenu.ShowFlags := -1;
      FParentMenu.Container := TBagelActionContainer(FContainer.Action);
      Self.DropdownMenu := FParentMenu;
      Self.Style := tbsTextButton;
      Self.SetAutoSize(True);
      Self.Caption := FContainer.Caption;
    end
    else if FContainer.Caption='-' then begin
      Self.Style := tbsSeparator;
      Self.AutoSize := False;
      Self.Width := 10;
    end;

  end
  else begin
    if not Assigned(FParentMenu) then
      FParentMenu := TBagelPopupMenu.Create(Self);
    FParentMenu.ShowFlags := -1;
    FParentMenu.Container := FContainer;
    Self.DropdownMenu := FParentMenu;
    Self.Style := tbsTextButton;
    Self.Caption := FContainer.Caption;
  end;
  Self.Height := 23;
  {For i:=0 to Self.ControlCount-1 do
    Self.Controls[0].Free;
  For i:=0 to FContainer.Count-1 do begin
    tb := TToolButton.Create(Self);
    if FContainer.Item[i].Action is TActionGenerator then begin
      ParentMenu := TBagelMenuItem.Create(tb);
      ParentMenu.ActionGenerator := TActionGenerator(FContainer.Item[i].Action);
      tb.MenuItem := ParentMenu;
    end
    else if FContainer.Item[i].Action is TMenuItem then begin
      tb.MenuItem := TMenuItem(FContainer.Item[i].Action);
    end;
  end;}
end;

function TBagelToolbar.GetContainer:TBagelActionContainer;
begin
  Result := FContainer;
end;

procedure TBagelToolbar.SetContainer(Value:TBagelActionContainer);
var
  i:Integer;
  tb:TBagelToolButton;
  btn:TControl;
//  ParentMenu:TBagelMenuItem;
begin
  Self.ShowHint := True;
  FContainer := Value;
  For i:=0 to Self.ControlCount-1 do begin
    btn := Self.Controls[0];
    Self.RemoveControl(btn);
    btn.Free;
  end;


  if FContainer<>nil then
  For i:=FContainer.Count-1 downto 0 do begin
    tb := TBagelToolButton.Create(Self);
    //if (Self.List) then
    tb.AutoSize := True;
    tb.IsMenu := Self.isMenu;
    tb.Grouped := Self.IsMenu;
    tb.Container := FContainer.Item[i];
    tb.Parent := Self;
    //tb.Left := GetWidthAllToolButton(Self);
  end;
end;


{
procedure TBagelMainForm.MenuBarChevronMenu;
var
	i: Integer;
//  j: Integer;
	w: Integer;
	bw: Integer;
	Item: TMenuItem;                      //  MainMenu.Images;
  tmpItem:TMenuItem;
//  tmpItem2:TMenuItem;
  dummymi:TMenuItem;
begin
  SafeClear(ChevronPopupMenu.Items);
	if Pref.ShowMenuIcon then ChevronPopupMenu.Images := ImageList1;
	bw := GetWidthAllToolButton(MenuToolBar);
	if MenuToolBar.Width < bw then begin
		w := 0;
		for i := 0 to MenuToolBar.ButtonCount - 1 do begin
			w := w + MenuToolBar.Buttons[i].Width;
			if MenuToolBar.Width <= w then begin
				///Item := TMenuItem.Create(Self);
        if MenuToolBar.Buttons[i].MenuItem<>nil then begin
          if MenuToolBar.Buttons[i].MenuItem.Name<>'' then begin
            Item := MenuToolBar.Buttons[i].MenuItem;
            if Item.parent<>nil then
            Item.parent.Remove(Item);
          end
          else begin
            Item := TMenuItem.Create(Self);
            tmpItem:=MenuToolBar.Buttons[i].MenuItem;
            Item.Tag:=tmpItem.Tag;
            Item.OnClick:=OnCustomMenuClick;
            Item.Caption := tmpItem.Caption;
            dummymi:=TMenuItem.Create(Self);
            dummymi.Visible:=False;
            Item.Add(dummymi);
          end;
        end else if MenuToolBar.Buttons[i].Action<>nil then begin
          Item := TMenuItem.Create(Self);
          Item.Action:=MenuToolBar.Buttons[i].Action;
        end;
				//Item.Caption := MenuToolBar.Buttons[i].MenuItem.Caption;
				//Item.Action := MenuToolBar.Buttons[i].MenuItem.Action;
				ChevronPopupMenu.Items.Add(Item);
				//SetSubMenu(MenuToolbar.Buttons[i].MenuItem, Item);
			end;
		end;
	end;
end;

}
(*
procedure TBagelMainForm.ControlToolBarChevronMenu;
var
	i: Integer;
//  j: Integer;
	w: Integer;
	bw: Integer;
	Item: TMenuItem;                      //  MainMenu.Images;
//  tmpItem:TMenuItem;
//  tmpItem2:TMenuItem;
//  dummymi:TMenuItem;
begin
  SafeClear(ChevronPopupMenu.Items);
	if Pref.ShowMenuIcon then ChevronPopupMenu.Images := ImageList1;
	bw := GetWidthAllToolButton(ControlToolBar);
	if ControlToolBar.Width < bw then begin
		w := 0;
		for i := 0 to ControlToolBar.ButtonCount - 1 do begin
			w := w + ControlToolBar.Buttons[i].Width*Abs(Integer(ControlToolBar.Buttons[i].Visible));
			if ControlToolBar.Width <= w then begin
				///Item := TMenuItem.Create(Self);
        if not ControlToolBar.Buttons[i].Visible then continue;
        if ControlToolBar.Buttons[i].MenuItem<>nil then begin
          {if ControlToolBar.Buttons[i].MenuItem.Name<>'' then begin
            Item := ControlToolBar.Buttons[i].MenuItem;
            if Item.parent<>nil then
            Item.parent.Remove(Item);
          end
          else begin
            Item := TMenuItem.Create(Self);
            tmpItem:=ControlToolBar.Buttons[i].MenuItem;
            Item.Tag:=tmpItem.Tag;
            Item.OnClick:=OnCustomMenuClick;
            Item.Caption := tmpItem.Caption;
            dummymi:=TMenuItem.Create(Self);
            dummymi.Visible:=False;
            Item.Add(dummymi);
          end;}
        end else if ControlToolBar.Buttons[i].Action<>nil then begin
          Item := TMenuItem.Create(Self);
          Item.Action:=ControlToolBar.Buttons[i].Action;
          Item.ImageIndex:=ControlToolBar.Buttons[i].ImageIndex;
          if (Item.Action is TCommandAction) and
             (LowerCase(TCommandAction(Item.Action).Command)='run') then begin
            Item.OnDrawItem:=ExeMenuDrawItem;
          end;
          ChevronPopupMenu.Items.Add(Item);
        end;

			end;
		end;
	end;
end;
*)

constructor TBagelLinkbar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.ShowCaptions := True;
  Self.List := True;
end;

destructor TBagelLinkbar.Destroy;
begin
  BookmarkObserverService.RemoveObserver(Self,FRoot);
  inherited;
end;

procedure TBagelLinkbar.SetRoot(Value: TBookmarkList);
var
  btn:TBagelBookmarkToolButton;
  i:Integer;
  //m:TBagelBookmarkMenu;
begin

  if Assigned(FRoot) then begin
    //Remove Bookmark Listener
    BookmarkObserverService.RemoveObserver(Self,FRoot);
    //ボタンをクリア
    for i := 0 to Self.ButtonCount - 1 do
      Self.Buttons[0].Free;
  end;
  FRoot := Value;
  if Value<>nil then begin
    for i := 0 to Value.Count - 1 do
    begin
      btn := TBagelBookmarkToolButton.Create(Self);
      btn.Style := tbsButton;
      btn.Linkbar := Self;
      btn.Bookmark := Value.Items[i];
      btn.AutoSize := True;
      btn.Grouped := True;
      btn.Parent := Self;
    end;
    BookmarkObserverService.AddObserver(Self,Value);
  end;
end;

procedure TBagelLinkbar.Deleting(item:TBkmkBase);
begin
  if item = Root then begin
    Root := nil;
  end;
end;

procedure TBagelLinkbar.Deleted(item:TBkmkBase);
begin
  //
end;

procedure TBagelLinkbar.Added(item:TBkmkBase);
begin
  //
end;

procedure TBagelLinkbar.Changed(item:TBkmkBase);
var
  i:Integer;
begin
  for i := 0 to Self.ButtonCount - 1 do
    if Integer(item) = Self.Buttons[i].Tag then
      Self.Buttons[i].Caption := item.name;
end;

procedure TBagelLinkbar.RefreshLinkbar;
begin
  //
end;

procedure TBagelBookmarkMenu.CreateChilds;
var
  menuitem:TBagelBookmarkMenu;
  i:Integer;
begin
  if not (FBookmark is TBookmarkList) then Exit;
  for i := 0 to TBookmarkList(FBookmark).Count - 1 do begin
    menuitem := TBagelBookmarkMenu.Create(Self);
    menuitem.Bookmark := TBookmarkList(FBookmark).Items[i];
    menuitem.Linkbar := Self.Linkbar;
    Self.Add(menuitem); 
  end;
end;

function TBagelBookmarkMenu.FindMenuItemByBookmark(item:TBkmkBase):TBagelBookmarkMenu;
var
  menuitem:TBagelBookmarkMenu;
  i:Integer;
begin
  Result := nil;
  if not (FBookmark is TBookmarkList) then Exit;
  for i := 0 to Self.Count - 1 do begin
    if not (Items[i] is TBagelBookmarkMenu) then continue;
    menuitem := TBagelBookmarkMenu(Items[i]);
    if item = menuitem.Bookmark then begin
      Result := menuitem;
      Exit;
    end;
  end;
end;

procedure TBagelBookmarkMenu.Deleting(item:TBkmkBase);
begin

end;

procedure TBagelBookmarkMenu.Deleted(item:TBkmkBase);
var
  menuitem:TBagelBookmarkMenu;
begin
  if item.parent <> FBookmark then Exit;
  menuitem := FindMenuItemByBookmark(item);
  menuitem.Free;
end;

procedure TBagelBookmarkMenu.Added(item:TBkmkBase);
var
  i:Integer;
  newmenuitem:TBagelBookmarkMenu;
begin
  if item.parent <> FBookmark then Exit;
  i := TBookmarkList(FBookmark).IndexOf(item);
  newmenuitem := TBagelBookmarkMenu.Create(Self);
  newmenuitem.Bookmark := item;
  Self.Insert(i, newmenuitem);
end;

procedure TBagelBookmarkMenu.Changed(item:TBkmkBase);
var
  menuitem:TBagelBookmarkMenu;
begin
  if item = FBookmark then
    Self.Caption := item.name;
end;

procedure TBagelBookmarkMenu.SetBookmark(Value:TBkmkBase);
begin
  Self.Clear;

  if Assigned(FBookmark) and (FBookmark is TBookmarkList) then
    BookmarkObserverService.RemoveObserver(Self, TBookmarkList(FBookmark));

  FBookmark := Value;

  if FBookmark<>nil then begin
    if FBookmark is TBookmarkList then begin
      BookmarkObserverService.AddObserver(Self, TBookmarkList(Value));
    end;
    Self.Caption := FBookmark.name;
    CreateChilds;
  end
  else begin
    Self.Caption := '';
  end;
end;

procedure TBagelBookmarkMenu.Click;
begin
  inherited;
  if Assigned(FLinkbar) and Assigned(FLinkbar.OnOpenBookmark) then begin
    FLinkbar.OnOpenBookmark(Self, Self.Bookmark);
  end;
end;

procedure TBagelBookmarkToolButton.Deleting(item:TBkmkBase);
begin

end;

procedure TBagelBookmarkToolButton.Deleted(item:TBkmkBase);
begin

end;

procedure TBagelBookmarkToolButton.Added(item:TBkmkBase);
begin

end;

procedure TBagelBookmarkToolButton.Changed(item:TBkmkBase);
begin
  if item = FBookmark then
    Self.Caption := item.name;
end;

procedure TBagelBookmarkToolButton.SetBookmark(Value:TBkmkBase);
begin
  FBookmark := Value;
  Self.Caption := FBookmark.name;
  
  if Value is TBookmarkList then begin
    Self.ImageIndex := 7;
    if not Assigned(FMenu) then FMenu := TBagelBookmarkMenu.Create(Self);
    FMenu.Linkbar := Self.Linkbar;
    FMenu.Bookmark := FBookmark;
    Self.MenuItem := FMenu;
  end
  else begin
    if Assigned(FMenu) then begin
      Self.MenuItem := nil;
      FMenu.Free;
      FMenu := nil;
    end;
    Self.ImageIndex := 9;
  end;
end;

destructor TBagelBookmarkToolButton.Destroy; 
begin
  inherited;
end;

procedure TBagelBookmarkToolButton.Click;
begin
  inherited;
  if Assigned(FLinkbar) and Assigned(FLinkbar.OnOpenBookmark) then begin
    FLinkbar.OnOpenBookmark(Self, Self.Bookmark);
  end;
end;

(*
procedure TBagelMainForm.LinkBarChevronMenu;
  {procedure CloneMenu(Source:TMenuItem;Clone:TMenuItem);
  var
    i:Integer;
    item:TMenuItem;
    itemchild:TMenuItem;
  begin
    For i:=0 to Source.Count-1 do begin
      if Source.Items[i].Tag = 0 then continue;
      item:=TMenuItem.Create(Source);
      item.Caption:=Source.Items[i].Caption;
      item.Tag:=Source.Items[i].Tag;
      item.ImageIndex:=Source.Items[i].ImageIndex;
      if Source.Items[i].Count>0 then
        item.OnClick:=BkmkMenuCreate
      else
        item.OnClick:=OnBookmarkShortcutMenuClick;
      if item.Tag=-1 then begin
        itemchild:=TMenuItem.Create(item);
        CloneMenu(item,itemchild);
      end;
      Clone.Add(item);
    end;
  end;}

var
	i: Integer;
  j: Integer;
	w: Integer;
	bw: Integer;
  bkmk: TBkmkBase;
  link:TBookmarkList;
  bkmkList:TBookmarkList;
	Item: TMenuItem;
  child:TMenuItem;                 //  MainMenu.Images;
begin
  ChevronLinkMenu.Items.Clear;
	if Pref.ShowMenuIcon then ChevronLinkMenu.Images := ImageList1;
	bw := GetWidthAllToolButton(LinkBar);
	if LinkBar.Width < bw then begin                    //    *Abs(Integer(LinkBar.Buttons[i].Visible))
		w := 0;
    link:=getLinkBkmkList;
		for i := 0 to LinkBar.ButtonCount - 1 do begin
			w := w + LinkBar.Buttons[i].Width;
			if LinkBar.Width <= w then begin
				///Item := TMenuItem.Create(Self);
        //if not LinkBar.Buttons[i].Visible then continue;
        if LinkBar.Buttons[i].MenuItem<>nil then begin
          //Item:=TMenuItem.Create(Self);
          //CloneMenu(LinkBar.Buttons[i].MenuItem,Item);
          //ChevronLinkMenu.Items.Add(Item);
          {if LinkBar.Buttons[i].MenuItem.Tag=-1 then begin
            Item:=TMenuItem.Create(Self);
            CloneMenu(LinkBar.Buttons[i].MenuItem,item);
            ChevronLinkMenu.Items.Add(Item);
          end else begin }
            bkmk:=link.Items[i];
            Item:=TMenuItem.Create(Self);
            if Pref.BookmarkMenuMaxLength> 0 then begin
              item.Caption := StringReplace(LeftStr(bkmk.name,Pref.BookmarkMenuMaxLength), '&', '&&', [rfReplaceAll]);
            end
            else begin
              item.Caption := StringReplace(bkmk.name, '&', '&&', [rfReplaceAll]);
            end;
            ChevronLinkMenu.Items.Add(Item);
            if bkmk is TBookmarkList then begin
              item.ImageIndex := 7;
              item.Tag := Integer(bkmk);
              item.OnClick := BkmkMenuCreate;
              bkmkList := TBookmarkList(bkmk);
              for j := 0 to bkmkList.Count -1 do
              begin
                child := TMenuItem.Create(item);
                //child.Caption := StringReplace(bkmkChild.Items[j].name, '&', '&&', [rfReplaceAll]) ;
                if Pref.BookmarkMenuMaxLength> 0 then begin
                  child.Caption := StringReplace(LeftStr(bkmkList.Items[j].name,Pref.BookmarkMenuMaxLength), '&', '&&', [rfReplaceAll])
                end
                else begin
                  child.Caption := StringReplace(bkmkList.Items[j].name, '&', '&&', [rfReplaceAll])
                end;

                item.Add(child);
                if bkmkList.Items[j] is TBookmarkList then
                begin
                  child.ImageIndex := 7; // ※[JS]
                  child.Tag := Integer(bkmkList.Items[j]);
                  child.OnClick := BkmkMenuCreate;
                end else
                begin
                  if Length(TBookmark(bkmkList.Items[j]).URI) > 0 then
                    child.ImageIndex := 9
                  else
                    child.ImageIndex := 9;
                  child.Tag := Integer(bkmkList.Items[j]);
                  child.OnClick := OnBookmarkShortcutMenuClick;
                end;
              end;
            end else begin
              item.ImageIndex := 9;
              item.Tag := Integer(bkmk);
              item.OnClick := OnBookmarkShortcutMenuClick;
            end;
          //end;
          //ChevronLinkMenu.Items.Add(item);
        end;

			end;
		end;
	end;

*)

end.
