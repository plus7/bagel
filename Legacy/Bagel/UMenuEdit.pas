unit UMenuEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, COMMCTRL, ImgList,
  Menus, ExtCtrls, ToolWin ,ActnList, BagelActnMan;

type
  TfrmMenuEdit = class(TForm)
    TreeView1: TTreeView;
    GroupBox22: TGroupBox;
    Label1: TLabel;
    ImageList1: TImageList;
    btnSave: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtCaption: TEdit;
    lblItemName: TLabel;
    lblItemType: TLabel;
    Label5: TLabel;
    PopupMenu: TPopupMenu;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    miNewParentMenu: TMenuItem;
    pasItemEmbeddedAction1: TMenuItem;
    SystemMenu1: TMenuItem;
    SystemMenu2: TMenuItem;
    SystemMenu3: TMenuItem;
    SystemMenu4: TMenuItem;
    SystemMenu5: TMenuItem;
    SystemMenu6: TMenuItem;
    SystemMenu7: TMenuItem;
    SystemMenu8: TMenuItem;
    SystemMenu9: TMenuItem;
    SystemMenu10: TMenuItem;
    SystemMenu11: TMenuItem;
    SystemMenu12: TMenuItem;
    SystemMenu13: TMenuItem;
    miNewSeparator: TMenuItem;
    N10: TMenuItem;
    GroupBox1: TGroupBox;
    chkShowOnLink: TCheckBox;
    chkShowOnImg: TCheckBox;
    chkShowOnBgImg: TCheckBox;
    chkShowOnSel: TCheckBox;
    chkShowOnFrame: TCheckBox;
    chkShowOnTextBox: TCheckBox;
    chkShowOnQuote: TCheckBox;
    chkGlobal: TCheckBox;
    SystemMenu14: TMenuItem;
    SystemMenu15: TMenuItem;
    SystemMenu16: TMenuItem;
    //procedure Button28Click(Sender: TObject);
    function GetNewContainer(Owner: TComponent):TBagelActionContainer;
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure TreeView1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ActionClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure miNewParentMenuClick(Sender: TObject);
    procedure miNewSeparatorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkShowOnLinkClick(Sender: TObject);
    procedure chkShowOnImgClick(Sender: TObject);
    procedure chkShowOnBgImgClick(Sender: TObject);
    procedure chkShowOnSelClick(Sender: TObject);
    procedure chkShowOnFrameClick(Sender: TObject);
    procedure chkShowOnTextBoxClick(Sender: TObject);
    procedure chkShowOnQuoteClick(Sender: TObject);
    procedure chkGlobalClick(Sender: TObject);
    procedure edtCaptionChange(Sender: TObject);
    procedure SystemMenuClick(Sender: TObject);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    f_DropTarget: TTreeNode; { 挿入バーを描画したノード }
    FHovering:TTreeNode;
    procedure MoveNode(Parent, Source: TTreeNode);
    function IsFamily(Parent, Source: TTreeNode):boolean;
  public
    { Public 宣言 }
    Source:TBagelActionContainer;
  end;

var
  frmMenuEdit: TfrmMenuEdit;

type
  PItemData = ^TItemData;
  TItemData = record
    Action:TComponent;
    Caption:String;
    ShowFlags:Integer;
    Id:String;
    IconIndex:Integer;
    Icon:String;
  end;
  
//const
//  TV_FIRST                = 0x1100;
//  TVM_SETINSERTMARKCOLOR  = (TV_FIRST + 37);
//  TVM_GETINSERTMARKCOLOR  = (TV_FIRST + 38);

implementation

uses UBagelPref, UBagel;


function NewItemData(ID:TItemData):PItemData;
begin
  New(result);
  result^ := ID;
end;

//uses UBagelPref;

{$R *.dfm}
                                       {
procedure TfrmMenuEdit.Button28Click(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  BagelSettingForm.pasItemNoAction.Visible:=True;
  BagelSettingForm.pasItemNoAction.Caption:='新規親メニュー';
  pt.X:=0;
  pt.Y:=Button28.Height;
  pt2:=Button28.ClientToScreen(pt);
  BagelSettingForm.PopupActionSelector.Popup(pt2.X,pt2.Y);
  BagelSettingForm.pasTarget:=frmMenuEdit;
end;                                    }


// 移動と削除－－すべての子ノードを移動する
procedure TfrmMenuEdit.MoveNode(Parent, Source: TTreeNode);
var
  node: TTreeNode;
begin
  node := TreeView1.Items.AddChild(Parent,Source.Text);
  node.ImageIndex := Source.ImageIndex;
  node.SelectedIndex := Source.SelectedIndex;
  while Source.Count > 0  do
    // 再帰させる
    MoveNode(Node, TTreeNode(Source.Item[0]));
  Source.Delete;
end;

// Sourceの一族にParentがあれば true の判定
function TfrmMenuEdit.IsFamily(Parent, Source: TTreeNode):boolean;
var
  i:integer;
  node: TTreeNode;
begin
  result := false;
  for i := 0 to Source.Count - 1 do
  begin
    node := Source.Item[i];
    if Node.AbsoluteIndex = Parent.AbsoluteIndex then
      result := true
    else
      // 再帰させる
      result := IsFamily(Parent, Node);
    if result then break;
  end;
end;

procedure TfrmMenuEdit.TreeView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
{var
  Mode: TNodeAttachMode;
  HT: THitTests;
begin
  HT := TreeView1.GetHitTestInfoAt(X, Y);

  if htOnItem in HT then Mode := naAddChild
    else if htNowhere in HT then Mode := naAdd
      else if [htOnIndent, htOnButton] >= HT then Mode := naInsert;
  if TreeView1.GetNodeAt(X, Y)

    TreeView1.Selected.MoveTo(TreeView1.GetNodeAt(X, Y), Mode);
    f_DropTarget := nil;                                           }
Var
  Node:TTreeNode;
  R:TRect;
begin
  if (Sender is TTreeView) and (Source is TTreeView) then
  begin   //ツリーからツリー
    with Sender, Source as TTreeView do
    begin
      //新親の親
      Node := GetNodeAt(X,Y);
      if node=nil then Exit;
      if Node = Selected then
      begin
        //MessageDlg('同じ所に移動はできません。', mtInformation, [mbOk], 0);
        Exit;
      end;
      //ツリーのアイテムを移動し削除
      Items.BeginUpdate;
      if IsFamily(Node, Selected) then
        //無限循環を避ける
        //MessageDlg('この移動はできません。', mtInformation, [mbOk], 0)
      else begin
        //MoveNode(Node, Selected);
        r := node.DisplayRect(true);
        if node.ImageIndex = 0 then begin //フォルダ
          if Y < r.Top + (r.Bottom - r.Top) div 3 then
              // ノードの上
              TreeView1.Selected.MoveTo(node,naInsert)
          else if Y < r.Top + ((r.Bottom - r.Top) div 3)*2 then
              //ノードの中
              TreeView1.Selected.MoveTo(node,naAddChild)
          else if node.HasChildren and node.Expanded then
              // 子ノードのの上
              TreeView1.Selected.MoveTo(node,naAddChildFirst)
          else
              // ノードの下
              if node.getNextSibling=nil then
                TreeView1.Selected.MoveTo(node,naAdd)
              else
                TreeView1.Selected.MoveTo(node.getNextSibling,naInsert);
                
        end else begin//通常アイテム
          if Y < r.Top + (r.Bottom - r.Top) div 2 then
              // ノードの上
              TreeView1.Selected.MoveTo(node,naInsert)
          else
              // ノードの下
              if node.getNextSibling=nil then
                TreeView1.Selected.MoveTo(node,naAdd)
              else
                TreeView1.Selected.MoveTo(node.getNextSibling,naInsert);
        end;
      end;
      Items.EndUpdate;
    end;
  end;    
end;

procedure TfrmMenuEdit.TreeView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
    node: TTreeNode;
    r: TRect;
begin

    node := TreeView1.GetNodeAt(X, Y);
    Accept:=true;
 {   Accept := node <> nil;}
 { Accept := (Source = Sender)
    and (TreeView1.Selected <> nil)
    and ([htOnItem, htOnLabel, htOnIcon, htNowhere, htOnIndent, htOnButton]
        >= TreeView1.GetHitTestInfoAt(X, Y));}
    if node=TreeView1.Selected then Accept:=false;
    if IsFamily(Node, TreeView1.Selected) then Accept:=false;

    if (node = nil) or (not Accept) then
        Exit;

    //label1.Caption:=node.Text;

    FHovering:=node;

    { 前回書いたものは自動的に消える }
    r := node.DisplayRect(true);


    if node.ImageIndex = 0 then begin //フォルダ
      if Y < r.Top + (r.Bottom - r.Top) div 3 then
          // ノードの上に表示する
          TreeView1.Perform(TVM_SETINSERTMARK, 0, LParam(node.ItemId))
      else if Y < r.Top + ((r.Bottom - r.Top) div 3)*2 then begin FHovering:=nil;TreeView1.Perform(TVM_SETINSERTMARK, 0, 0); end
      else if node.HasChildren and node.Expanded then
          // 子ノードのの上に表示する
          TreeView1.Perform(TVM_SETINSERTMARK, 0, LParam(node[0].ItemId))
      else
          // ノードの下に表示する
          TreeView1.Perform(TVM_SETINSERTMARK, 1, LParam(node.ItemId));
    end else begin//通常アイテム
      if Y < r.Top + (r.Bottom - r.Top) div 2 then
          // ノードの上に表示する
          TreeView1.Perform(TVM_SETINSERTMARK, 0, LParam(node.ItemId))
      else
          // ノードの下に表示する
          TreeView1.Perform(TVM_SETINSERTMARK, 1, LParam(node.ItemId));
    end;
    {

    }
    //if (node.Data)

    // ドラッグカーソルの下に前回描画が残るので強制的に消す
    if f_DropTarget <> nil then
    begin
        r := f_DropTarget.DisplayRect(false);
        r.Top := r.Bottom;
        Inc(r.Bottom, 2);
        InvalidateRect(TreeView1.Handle, @r, true);
    end;

    f_DropTarget := node;

end;




procedure TfrmMenuEdit.TreeView1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
    // 色を指定する { FormCreate で設定しても OK }
    TreeView1.Perform(TVM_SETINSERTMARKCOLOR, 0, LParam(clNavy));

    f_DropTarget := nil;
end;

procedure TfrmMenuEdit.TreeView1EndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
    // 消去する
    TreeView1.Perform(TVM_SETINSERTMARK, 0, 0);
    FHovering:=nil;
    f_DropTarget:=nil;
end;

procedure TfrmMenuEdit.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var
r:TRect;
begin                   {
  if FHovering<>nil then begin
    DefaultDraw:=false;
    with TreeView1.Canvas do begin
      r:=Node.DisplayRect(true);
      TextRect(r,r.Left+2,r.Top+1,Node.Text);
    end;
  end;                   }
end;

procedure TfrmMenuEdit.FormShow(Sender: TObject);
  procedure CreateNode( ab : TBagelActionContainer ; Base : TTreenode );
  var
    node:TTreeNode;
    i:Integer;
    id:TitemData;
  begin
    // treeを作成
    for i := 0 to ab.Count-1 do
    begin
      node := TreeView1.Items.AddChild(Base,ab.Item[i].Caption);

      ID.Action:=ab.Item[i].Action;
      ID.Caption:=ab.Item[i].Caption;
      ID.ShowFlags:=ab.Item[i].ShowFlags;
      if ID.Action <> nil then
        ID.Id:=ab.Item[i].Action.Name
      else
        ID.Id:=ab.Item[i].Id;
      //TODO:
      //ID.IconIndex:=ab.Item[i].IconIndex;
      //ID.Icon:=ab.Item[i].Icon;

      node.Data:=TObject(NewItemData(ID));

      if ab.Item[i].Count>0 then begin
        CreateNode(ab.Item[i],node);
        node.ImageIndex := 0;
        node.SelectedIndex:=0;
      end
      else begin
        if TObject(ab.Item[i].Action) is TBagelActionContainer then begin
          node.Text:=TBagelActionContainer(ab.Item[i].Action).Caption;
          node.ImageIndex := 2;
          node.SelectedIndex:=2;
        end
        else begin
          node.ImageIndex := 1;
          node.SelectedIndex:=1;
        end;
      end;
    end;
  end;
  function GetMenu(Caption:String;Parent:TMenuItem):TMenuItem;
  var
    i:Integer;
    new:TMenuItem;
  begin
    for i:=0 to Parent.Count-1 do begin
      if Parent.Items[i].Caption=Caption then begin
        Result:=Parent.Items[i];
        Exit;
      end;
    end;
    new:=TMenuItem.Create(Parent);
    new.Caption:=Caption;
    Parent.Add(new);
    Result:=new;
  end;
var
  i:integer;
  Node:TTreeNode;
  newnode:TMenuItem;
  parent:TMenuItem;
  id:TitemData;
begin
  // treeを作成
  //TODO:
  if not (Source = BagelMainForm.ContextMenu) then GroupBox1.Visible:=false;

  for i := 0 to Source.Count-1 do
  begin
    node := TreeView1.Items.Add(nil,Source.Item[i].Caption);
    
    ID.Action   := Source.Item[i].Action;
    ID.ShowFlags:= Source.Item[i].ShowFlags;

    if Source.Item[i].Action = nil then begin
      ID.Caption  := Source.Item[i].Caption;
      ID.Id := Source.Item[i].Id;
    end
    else begin
      if Source.Item[i].Action is TBagelActionContainer then
        ID.Caption  := TBagelActionContainer(Source.Item[i].Action).Caption
      else if Source.Item[i].Action is TCustomAction then
        ID.Caption  := TCustomAction(Source.Item[i].Action).Caption;
      ID.Id := Source.Item[i].Action.Name;
    end;
    //TODO:
    //ID.IconIndex:=Source.Item[i].IconIndex;
    //ID.Icon:=Source.Item[i].Icon;

    node.Data:=TObject(NewItemData(ID));

    if Source.Item[i].Count>0 then begin
      CreateNode(Source.Item[i],node);
      node.ImageIndex := 0;
      node.SelectedIndex:=0;
    end
    else begin
      if TObject(Source.Item[i].Action) is TBagelActionContainer then begin
        node.Text:=TBagelActionContainer(Source.Item[i].Action).Caption;
        node.ImageIndex := 2;
        node.SelectedIndex:=2;
      end
      else begin
        node.ImageIndex := 1;
        node.SelectedIndex:=1;
      end;
    end;
  end;

  for i:=0 to BagelMainForm.ActionList1.ActionCount -1 do begin
    parent:=GetMenu(BagelMainForm.ActionList1.Actions[i].Category,PopupMenu.Items);
    newnode:=TMenuItem.Create(parent);

    newnode.Caption:=TAction(BagelMainForm.ActionList1.Actions[i]).Caption;
    newnode.Tag:=Integer(BagelMainForm.ActionList1.Actions[i]);
    newnode.OnClick:=ActionClick;
    parent.Add(newnode);
  end;

  //TODO:
  SystemMenu1.Tag:=Integer(BagelMainForm.RecentClosedURIMenu);
  SystemMenu2.Tag:=Integer(BagelMainForm.RecentOpenedURIMenu);
  (*SystemMenu3.Tag:=Integer(BagelMainForm.ViewPEncode);
  SystemMenu4.Tag:=Integer(BagelMainForm.VMenuSidebar); *)
  SystemMenu5.Tag:=Integer(BagelMainForm.BookmarkMenu);
  SystemMenu6.Tag:=Integer(BagelMainForm.AutoReloadMenu);
  //SystemMenu7.Tag:=Integer(BagelMainForm.TabPSecurity);
//  SystemMenu8.Tag:=Integer(BagelMainForm.ToolPQuickPref);
  SystemMenu9.Tag:=Integer(BagelMainForm.ToolPCmdExt);
//  SystemMenu10.Tag:=Integer(BagelMainForm.ToolPProxySwitch);
//  SystemMenu11.Tag:=Integer(BagelMainForm.ToolPUASwitch);
//  SystemMenu12.Tag:=Integer(BagelMainForm.ToolPSSSwitch);
  SystemMenu13.Tag:=Integer(BagelMainForm.ToolPCookieConfig);
//  SystemMenu14.Tag:=Integer(BagelMainForm.ExtCopyMenu);
//  SystemMenu15.Tag:=Integer(BagelMainForm.ExtAppMenu);
  SystemMenu16.Tag:=Integer(BagelMainForm.AddToMemo);
end;


  procedure DisposeNodeData(node:TTreeNode);
  var
    i:Integer;
  begin

    if PItemData(node.Data)<>nil then Dispose(PItemData(node.Data));
    node.Data:=nil;
    if node.Count>0 then begin
      for i:=0 to node.Count-1 do begin
        DisposeNodeData(node.Item[i]);
      end;
    end;
  end;
  
procedure TfrmMenuEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caNone;
end;

procedure TfrmMenuEdit.FormDestroy(Sender: TObject);
var
  i:Integer;
begin
  for  i:=0 to Treeview1.Items.Count-1 do begin
    DisposeNodeData(Treeview1.Items.Item[i]);
  end;
end;

procedure TfrmMenuEdit.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if node=nil then Exit;
  lblItemname.Caption:=PItemData(node.data).Id;
  edtCaption.Text:=Node.Text;
  case Node.ImageIndex of
    0:begin
      lblItemType.Caption:='親メニュー';
      edtCaption.Enabled:=true;
    end;
    1:begin
      if (PItemData(node.data).Id='') and (PItemData(node.data).Caption='-') then begin
        lblItemType.Caption:='セパレータ';
        edtCaption.Enabled:=False;
      end
      else begin
        lblItemType.Caption:='アクション';
        edtCaption.Enabled:=True;
      end;
    end;
    2:begin
      lblItemType.Caption:='組み込みメニュー';
      edtCaption.Enabled:=False;
    end;
  end;
  chkShowOnLink.Checked:=((PItemData(node.data).ShowFlags and 1) = 0);
  chkShowOnImg.Checked:=((PItemData(node.data).ShowFlags and 2) = 0);
  chkShowOnBgImg.Checked:=((PItemData(node.data).ShowFlags and 4) = 0);
  chkShowOnSel.Checked:=((PItemData(node.data).ShowFlags and 8) = 0);
  chkShowOnFrame.Checked:=((PItemData(node.data).ShowFlags and 16) = 0);
  chkShowOnTextBox.Checked:=((PItemData(node.data).ShowFlags and 32) = 0);
  chkShowOnQuote.Checked:=((PItemData(node.data).ShowFlags and 64) = 0);
  chkGlobal.Checked:=((PItemData(node.data).ShowFlags and 128) = 0);
end;


procedure TfrmMenuEdit.ActionClick(Sender: TObject);
var
  ID:TItemData;
  node:TTreeNode;
begin
  ID.Action:=TComponent(TMenuItem(Sender).Tag);
  ID.Caption:=TAction(ID.Action).Caption;
  ID.ShowFlags:=0;
  ID.Id:=TAction(ID.Action).Name;
  ID.IconIndex:=TAction(ID.Action).ImageIndex;
  ID.Icon:='';
  if TreeView1.Selected=nil then
    node := TreeView1.Items.Add(nil,ID.Caption)
  else
    node := TreeView1.Items.Add(TreeView1.Selected,ID.Caption);
  node.MoveTo(TreeView1.Selected,naInsert);
  node.Data:=TObject(NewItemData(ID));
  node.ImageIndex:=1;
  node.SelectedIndex:=1;
end;

procedure TfrmMenuEdit.btnCancelClick(Sender: TObject);
begin
  //Self.CloseModal;
  Self.ModalResult := mrCancel;
  //Self.Close;
end;

procedure TfrmMenuEdit.ToolButton2Click(Sender: TObject);
begin
  DisposeNodeData(TreeView1.Selected);
  TreeView1.Selected.Free;
end;

procedure TfrmMenuEdit.miNewParentMenuClick(Sender: TObject);
var
  ID:TItemData;
  node:TTreeNode;
begin
  ID.Action:=nil;
  ID.Caption:=InputBox('キャプション入力','キャプションを入力してください','新規メニュー');
  ID.ShowFlags:=0;
  ID.Id:=InputBox('内部名入力','内部名を入力してください(半角英数)','newmenu');;
  ID.IconIndex:=0;
  ID.Icon:='';
  if TreeView1.Selected=nil then
    node := TreeView1.Items.Add(nil,ID.Caption)
  else
    node := TreeView1.Items.Add(TreeView1.Selected,ID.Caption);
  node.MoveTo(TreeView1.Selected,naInsert);
  node.Data:=TObject(NewItemData(ID));
  node.ImageIndex:=0;
  node.SelectedIndex:=0;
end;

procedure TfrmMenuEdit.miNewSeparatorClick(Sender: TObject);
var
  ID:TItemData;
  node:TTreeNode;
begin
  ID.Action:=nil;
  ID.Caption:='-';
  ID.ShowFlags:=0;
  ID.Id:='';
  ID.IconIndex:=0;
  ID.Icon:='';
  if TreeView1.Selected=nil then
    node := TreeView1.Items.Add(nil,ID.Caption)
  else
    node := TreeView1.Items.Add(TreeView1.Selected,ID.Caption);
  node.MoveTo(TreeView1.Selected,naInsert);
  node.Data:=TObject(NewItemData(ID));
  node.ImageIndex:=1;
  node.SelectedIndex:=1;
end;

function CreateAbMenuByNode(Node:TTreeNode;parent:TBagelActionContainer;Owner:TComponent):TBagelActionContainer;
var
  ID:TItemData;
  retabmi:TBagelActionContainer;
  i:integer;
begin

  Result:=TBagelActionContainer.Create(Owner);
  if parent<>nil then parent.Add(Result);

  if Node.Data<>nil then begin
    ID:=PItemData(Node.Data)^;
    Result.Action:=ID.Action;
    Result.ShowFlags:=Id.ShowFlags;
    //Result.IconIndex:=id.IconIndex;
    Result.Caption:=ID.Caption;
    Result.Id := Id.Id;
    //Result.Id:=ID.Action.Name;
    //Result.Icon:=Id.Icon;
  end;

  for i:=0 to Node.Count-1 do begin
    retabmi := CreateAbMenuByNode(Node.Item[i],Result,Owner);
    //Result.Add(retabmi);
  end;
{  if Node.ImageIndex=0 then begin
  end
  else if Node.ImageIndex=1 then begin
  end
  else if Node.ImageIndex=2 then begin
  end;}
end;

function TfrmMenuEdit.GetNewContainer(Owner:TComponent):TBagelActionContainer;
var
  tmpNode:TTreeNode;
begin
  Result:=TBagelActionContainer.Create(Owner);
  tmpNode:=TreeView1.Items[0];
  while tmpNode<>nil do begin
    CreateAbMenuByNode(tmpNode,Result,Owner);
    tmpnode:=tmpNode.getNextSibling;
  end;
end;

procedure TfrmMenuEdit.btnSaveClick(Sender: TObject);
{var
  retabmi:TBagelActionContainer;
  tmpAbmi:TBagelActionContainer;
  tmpNode:TTreeNode;
  button:TToolbutton;
  ToolBtn:TToolbutton;
  i:Integer;
  mi:TmenuItem;
  dummymi:TmenuItem;}
begin
  {retAbmi:=TBagelActionContainer.Create(BagelMainForm);
  tmpNode:=TreeView1.Items[0];
  while tmpNode<>nil do begin
    CreateAbMenuByNode(tmpNode,retAbmi);
    tmpnode:=tmpNode.getNextSibling;
  end;}
  {if Source=BagelMainForm.TestActionContainer2 then begin
    BagelMainForm.TestActionContainer2.Free;
    BagelMainForm.TestActionContainer2 := retAbmi;
    BagelMainForm.MenuToolbar.Container := retAbmi;
  end;}
  //TODO:
  //else if Source=BagelMainForm.abCtxMenu then begin
    {BagelMainForm.abCtxMenu.Free;
    BagelMainForm.abCtxMenu:=retAbmi;}
  //end
  //else if Source=BagelMainForm.abTabMenu then begin
    {BagelMainForm.abTabMenu.Free;
    BagelMainForm.abTabMenu:=retAbmi;}
  //end;
  Self.ModalResult := mrOK;
//  Self.Close;
end;

procedure TfrmMenuEdit.chkShowOnLinkClick(Sender: TObject);
begin
{
  chkShowOnLink.Checked:=((PItemData(node.data).ShowFlags and 1) = 0);
  chkShowOnImg.Checked:=((PItemData(node.data).ShowFlags and 2) = 0);
  chkShowOnBgImg.Checked:=((PItemData(node.data).ShowFlags and 4) = 0);
  chkShowOnSel.Checked:=((PItemData(node.data).ShowFlags and 8) = 0);
  chkShowOnFrame.Checked:=((PItemData(node.data).ShowFlags and 16) = 0);
  chkShowOnTextBox.Checked:=((PItemData(node.data).ShowFlags and 32) = 0);
  chkShowOnQuote.Checked:=((PItemData(node.data).ShowFlags and 64) = 0);
}
  if TreeView1.Selected = nil then exit;
  
  if chkShowOnLink.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 1);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 1;
  end;
end;

procedure TfrmMenuEdit.chkShowOnImgClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;

  if chkShowOnImg.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 2);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 2;
  end;
end;

procedure TfrmMenuEdit.chkShowOnBgImgClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;
  
  if chkShowOnBgImg.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 4);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 4;
  end;
end;

procedure TfrmMenuEdit.chkShowOnSelClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;
  
  if chkShowOnSel.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 8);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 8;
  end;
end;

procedure TfrmMenuEdit.chkShowOnFrameClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;
  
  if chkShowOnFrame.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 16);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 16;
  end;
end;

procedure TfrmMenuEdit.chkShowOnTextBoxClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;
  
  if chkShowOntextBox.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 32);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 32;
  end;
end;

procedure TfrmMenuEdit.chkShowOnQuoteClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;

  if chkShowOnQuote.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 64);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 64;
  end;
end;

procedure TfrmMenuEdit.chkGlobalClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then exit;

  if chkGlobal.Checked then begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags and (not 128);
  end
  else begin
    PItemData(TreeView1.Selected.Data).ShowFlags := PItemData(TreeView1.Selected.Data).ShowFlags or 128;
  end;
end;

procedure TfrmMenuEdit.edtCaptionChange(Sender: TObject);
var
Node:TTreenode;
begin
  Node:=TreeView1.Selected;
  if Node = nil then exit;
  case Node.ImageIndex of
    0:begin
      PItemData(Node.Data).Caption:=edtCaption.Text;
      Node.Text:= edtCaption.Text;
    end;
    1:begin
      if (PItemData(node.data).Id='') and (PItemData(node.data).Caption='-') then begin
//        Don'tEdit
      end
      else begin
        PItemData(Node.Data).Caption:=edtCaption.Text;
        Node.Text:= edtCaption.Text;
      end;
    end;
    {2:begin
      DontEdit
    end;}
  end;
end;

procedure TfrmMenuEdit.SystemMenuClick(Sender: TObject);
var
  ID:TItemData;
  node:TTreeNode;
begin
  ID.Action:=TComponent(TMenuItem(Sender).Tag);
  ID.Caption:=TMenuItem(ID.Action).Caption;
  ID.ShowFlags:=0;
  ID.Id:=TMenuItem(ID.Action).Name;
//  ID.IconIndex:=TAction(ID.Action).ImageIndex;
  ID.IconIndex:=-1;
  ID.Icon:='';
  if TreeView1.Selected=nil then
    node := TreeView1.Items.Add(nil,ID.Caption)
  else
    node := TreeView1.Items.Add(TreeView1.Selected,ID.Caption);
  node.MoveTo(TreeView1.Selected,naInsert);
  node.Data:=TObject(NewItemData(ID));
  node.ImageIndex:=2;
  node.SelectedIndex:=2;
end;

procedure TfrmMenuEdit.TreeView1Editing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  AllowEdit:=False;
end;

end.
