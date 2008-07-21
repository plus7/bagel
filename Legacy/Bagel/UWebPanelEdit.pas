unit UWebPanelEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmWebPanelEditor = class(TForm)
    lstExtGo: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    btnAdd: TButton;
    btnDel: TButton;

    procedure btnAddClick(Sender: TObject);//
    procedure btnDelClick(Sender: TObject);//
    procedure btnOKClick(Sender: TObject);//
    procedure FormShow(Sender: TObject);//
    procedure btnCancelClick(Sender: TObject);//
    procedure lstExtGoDblClick(Sender: TObject);
    procedure lstExtGoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lstExtGoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    TheList:TStringList;
    constructor Create(AOwner: TComponent; List:TStringList); overload;
    constructor Create(AOwner: TComponent); overload;
    destructor Destroy; override;
  end;

var
  frmWebPanelEditor: TfrmWebPanelEditor;

implementation

uses UBagel;

{$R *.dfm}

constructor TfrmWebPanelEditor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TheList:=TStringList.Create;
end;

constructor TfrmWebPanelEditor.Create(AOwner: TComponent; List:TStringList);
begin
  inherited Create(AOwner);
  TheList:=TStringList.Create;
  TheList.Assign(List);
end;

destructor TfrmWebPanelEditor.Destroy;
begin
  TheList.Free;
  inherited Destroy;
end;

procedure TfrmWebPanelEditor.btnAddClick(Sender: TObject);
var
  Cap,URI:String;
begin
  if not InputQuery('キャプションを入力してください','',Cap) then Exit;
  if Cap='-' then begin
    TheList.Add('-=');
    lstExtGo.AddItem(Cap,nil);
  end
  else begin
    if not InputQuery('URIを入力してください','',URI) then Exit;
    TheList.Add(Cap+'='+URI);
    lstExtGo.AddItem(Cap,nil);
  end;
end;

procedure TfrmWebPanelEditor.btnDelClick(Sender: TObject);
begin
  if lstExtGo.ItemIndex>0 then begin
    TheList.Delete(lstExtGo.ItemIndex);
    lstExtGo.DeleteSelected;
  end;
end;

procedure TfrmWebPanelEditor.btnOKClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
  Self.Close;
end;

procedure TfrmWebPanelEditor.FormShow(Sender: TObject);
var
  i:Integer;
  Str:WideString;
begin
  for i:=0 to TheList.Count-1 do begin
    str:=TheList.Strings[i];
    lstExtGo.AddItem(Copy(str,0,Pos('=',str)-1),nil);
  end;
end;

procedure TfrmWebPanelEditor.btnCancelClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
  Self.Close;
end;

procedure TfrmWebPanelEditor.lstExtGoDblClick(Sender: TObject);
var
  Cap,URI:WideString;
  tmpCap,tmpURI:String;
begin
  if lstExtGo.ItemIndex>-1 then begin
    URI:=TheList.Strings[lstExtGo.ItemIndex];
    Cap:=Copy(URI,0,Pos('=',URI)-1);
    URI:=Copy(URI,Length(Cap)+2,Length(URI)-Length(Cap)-1);
    tmpCap:=Cap;
    tmpURI:=URI;
    if not InputQuery('キャプションを入力してください','',tmpCap) then Exit;
    if tmpCap='-' then begin
      TheList.Strings[lstExtGo.ItemIndex]:='-=';
      lstExtGo.Items.Strings[lstExtGo.ItemIndex]:='-';
    end
    else begin
      if not InputQuery('URIを入力してください','',tmpURI) then Exit;
      TheList.Strings[lstExtGo.ItemIndex]:=tmpCap+'='+tmpURI;
      lstExtGo.Items.Strings[lstExtGo.ItemIndex]:=tmpCap;
    end;
    //http://www.monkeyheaven.com/gallery.html
  end;
end;

procedure TfrmWebPanelEditor.lstExtGoDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  idx:Integer;
  pt:TPoint;
begin
  pt.X:=X;
  pt.Y:=Y;
  idx:=lstExtGo.ItemAtPos(pt,true);
  theList.Move(lstExtGo.ItemIndex,idx);
  lstExtGo.Items.Move(lstExtGo.ItemIndex,idx);
end;

procedure TfrmWebPanelEditor.lstExtGoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept:=True;
end;

end.
