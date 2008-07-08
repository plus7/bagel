unit USearchEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus;

type
  TfrmSearchEdit = class(TForm)
    PageControl1: TPageControl;
    EngineSheet: TTabSheet;
    GroupSheet: TTabSheet;
    btnOK: TButton;
    btnCancel: TButton;
    Label77: TLabel;
    edtCaptionE: TEdit;
    edtPrefixE: TEdit;
    Label78: TLabel;
    Label79: TLabel;
    edtSuffixE: TEdit;
    Label80: TLabel;
    cboEncodeE: TComboBox;
    Label81: TLabel;
    edtShortcutE: TEdit;
    edtCaptionG: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtShortcutG: TEdit;
    EnginePopup: TPopupMenu;
    GroupBox1: TGroupBox;
    btnAddG: TButton;
    btnDelG: TButton;
    lstEngine: TListBox;
    procedure btnDelGClick(Sender: TObject);
    procedure EnginePopupPopup(Sender: TObject);
    procedure btnAddGClick(Sender: TObject);
    procedure lstEngineStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure lstEngineDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstEngineDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    Mode:Integer;//0-Modify　1-New
    procedure AddEngineMenu(EngineName:String);
    procedure AddEngine(Sender:TObject);
  end;

var
  frmSearchEdit: TfrmSearchEdit;

implementation

{$R *.dfm}

var
  PrevItemIndex: Integer;

// 移動先を示す罫線を描画する手続き
procedure DrawMoveLine(ListBox: TListBox; const Index: Integer);
var
  r: TRect;
  y: Integer;
begin
  ListBox.Canvas.Pen.Mode := pmXor;
  ListBox.Canvas.Pen.Color := $00FFFFFF;
  ListBox.Canvas.Pen.Width := 3;
  if Index <> -1 then
  begin
    r := ListBox.ItemRect(Index);
    if ListBox.ItemIndex < Index then y := r.Bottom else y := r.Top;
    ListBox.Canvas.MoveTo(0, y);
    ListBox.Canvas.LineTo(ListBox.Width, y);
  end;
end;

procedure TfrmSearchEdit.btnDelGClick(Sender: TObject);
begin
  if lstEngine.ItemIndex>-1 then
  lstEngine.DeleteSelected;
end;

procedure TfrmSearchEdit.AddEngineMenu(EngineName:String);
var
mi:TMenuItem;
begin
  mi:=TMenuItem.Create(Self);
  mi.OnClick:=AddEngine;
  mi.Caption:=EngineName;
  EnginePopup.Items.Add(mi);
end;

procedure TfrmSearchEdit.AddEngine(Sender:TObject);
begin
  if lstEngine.Items.IndexOf(TMenuItem(Sender).Caption)<0 then
    lstEngine.Items.Add(TMenuItem(Sender).Caption);
end;

procedure TfrmSearchEdit.EnginePopupPopup(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to EnginePopup.Items.Count-1 do begin
    if lstEngine.Items.IndexOf(EnginePopup.Items.Items[i].Caption) < 0 then
      EnginePopup.Items.Items[i].Enabled:=true
    else
      EnginePopup.Items.Items[i].Enabled:=false;
  end;
end;

procedure TfrmSearchEdit.btnAddGClick(Sender: TObject);
var
 pt:Tpoint;
begin
  pt:=btnAddG.ClientToScreen(Point(0,btnAddG.Height));
  EnginePopup.Popup(pt.X,pt.Y);
end;

procedure TfrmSearchEdit.lstEngineStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  PrevItemIndex := -1;
end;

procedure TfrmSearchEdit.lstEngineDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  idx:integer;
begin
  // 自分自身からのドラッグのみ許可する。
  // また、選択されている項目（移動するアイテム）がないとダメ。
  // 上記にあてはまらない場合、直ちに処理を抜ける。
  Accept := (Source = Sender) and (TListBox(Source).ItemIndex <> -1);
  if not Accept then Exit;

  // カーソルのある位置のアイテムインデックスを取得。
  idx := TListBox(Source).ItemAtPos(Point(X, Y), True);

  // 直前のドロップ先表示用罫線を消す
  DrawMoveLine(TListBox(Sender), PrevItemIndex);

  // 新しいドロップ先表示用罫線を描画する
  DrawMoveLine(TListBox(Sender), idx);

  PrevItemIndex := idx;
end;

procedure TfrmSearchEdit.lstEngineDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  idx: Integer;
begin
  // カーソルのある位置のアイテムインデックスを取得。
  idx := TListBox(Source).ItemAtPos(Point(X, Y), True);

  // 直前のドロップ先表示用罫線を消す
  DrawMoveLine(TListBox(Sender), PrevItemIndex);

  // 並べ替える
  if idx <> -1 then
    TListBox(Sender).Items.Move(TListBox(Sender).ItemIndex, idx);
end;

end.
