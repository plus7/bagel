unit UExtAppEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ActnList, CommandAction,IniFiles;

type
  TfrmExtAppEditor = class(TForm)
    lbExtApp: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtName: TEdit;
    btnInsert: TButton;
    edtCaption: TEdit;
    edtOption: TEdit;
    btnAdd: TButton;
    btnOverride: TButton;
    btnDel: TButton;
    InsertPopup: TPopupMenu;
    OpenDialog1: TOpenDialog;
    File1: TMenuItem;
    URI1: TMenuItem;
    URI2: TMenuItem;
    N1: TMenuItem;
    procedure btnInsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbExtAppClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnOverrideClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
    Trash:TList;
  end;

  PExtAppData = ^TExtAppData;
  TExtAppData = record
    Name    :String;
    Caption  :String;
    Option :String;
  end;

var
  frmExtAppEditor: TfrmExtAppEditor;

implementation

uses UBagel;

{$R *.dfm}

function NewExtAppData(EAD:TExtAppData):PExtAppData;
begin
  New(result);
  result^ := EAD;
end;

procedure TfrmExtAppEditor.btnInsertClick(Sender: TObject);
var
  pt,pt2:TPoint;
begin
  pt.x:=0;
  pt.y:=btnInsert.Height;
  pt2:=btnInsert.ClientToScreen(pt);
  InsertPopup.Popup(pt2.X,pt2.Y);
end;

procedure TfrmExtAppEditor.FormShow(Sender: TObject);
var
  i:Integer;
  act:TAction;
  EAD:TExtAppData;
  PEAD:PExtAppData;
begin
  For i:=0 to BagelMainForm.ActionList1.ActionCount-1 do begin
    act:=TAction(BagelMainForm.ActionList1.Actions[i]);
    if act is TCommandAction then begin
      if LowerCase(TCommandAction(act).Command) = 'run' then begin
        EAD.Name:=TCommandAction(act).Name;
        EAD.Caption:=TCommandAction(act).Caption;
        EAD.Option:=TCommandAction(act).Option;
        PEAD:=NewExtAppData(EAD);
        lbExtApp.Items.AddObject(PEAD^.Caption,TObject(PEAD));
      end;
    end;
  end;
  Trash:=TList.Create;
end;

procedure TfrmExtAppEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
i:Integer;
begin
  for i:=0 to Trash.Count-1 do begin
    Dispose(PExtAppData(Trash.Items[i]));
  end;
  Trash.Free;
  for i:=0 to lbExtApp.Items.Count-1 do begin
    Dispose(PExtAppData(lbExtApp.Items.Objects[i]));
  end;
  Action:=caFree;
end;

procedure TfrmExtAppEditor.lbExtAppClick(Sender: TObject);
var
  ead:PExtAppData;
begin
  if lbExtApp.ItemIndex=-1 then exit;
  ead:=PExtAppData(lbExtApp.Items.Objects[lbExtApp.ItemIndex]);
  edtName.Text:=ead^.Name;
  edtCaption.Text:=ead^.Caption;
  edtOption.Text:=ead^.Option;
  btnOverride.Enabled:=true;
  btnAdd.Enabled:=false;
end;

procedure TfrmExtAppEditor.btnDelClick(Sender: TObject);

procedure AddToTrash(Data:PExtAppData);
var
i:Integer;
begin
  for i:=0 to Trash.Count-1 do begin
    if Data.Name = PExtAppData(Trash.Items[i]).Name then begin
      Dispose(Data);
      exit;
    end;
  end;
  Trash.Add(Data);
end;

begin
  if lbExtApp.ItemIndex=-1 then exit;
  AddToTrash(PExtAppData(lbExtApp.Items.Objects[lbExtApp.ItemIndex]));
  lbExtApp.Items.Delete(lbExtApp.ItemIndex);
  edtName.Text:='';
  edtCaption.Text:='';
  edtOption.Text:='';
end;

procedure TfrmExtAppEditor.btnOverrideClick(Sender: TObject);
var
  ead:PExtAppData;
begin
  if lbExtApp.ItemIndex=-1 then exit;
  ead:=PExtAppData(lbExtApp.Items.Objects[lbExtApp.ItemIndex]);
  ead.Name:=edtname.Text;
  ead.Caption:=edtCaption.Text;
  ead.Option:=edtOption.Text;
end;

procedure TfrmExtAppEditor.btnAddClick(Sender: TObject);
var
  EAD:TExtAppData;
  PEAD,obs:PExtAppData;
  i:Integer;
begin
  EAD.Name:=edtName.Text;
  EAD.Caption:=edtCaption.Text;
  EAD.Option:=edtOption.Text;
  PEAD:=NewExtAppData(EAD);
  lbExtApp.Items.AddObject(PEAD^.Caption,TObject(PEAD));
  lbExtApp.ItemIndex:=lbExtApp.Count-1;
  for i:=0 to Trash.Count-1 do begin
    obs:=Trash.Items[i];
    if obs.Name=EAD.Name then begin
      Trash.Delete(i);
      Dispose(obs);
    end;
  end;
end;

procedure TfrmExtAppEditor.File1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    edtOption.Text:=Copy(edtOption.Text,1,edtOption.SelStart)+'"'+OpenDialog1.FileName+'"'+Copy(edtOption.Text,edtOption.SelStart+1,Length(edtOption.Text)-edtOption.SelStart+1);
    //edtOpenDialog1.FileName;
  end;
end;

procedure TfrmExtAppEditor.btnOKClick(Sender: TObject);
var
  i:Integer;
  tmpAct:TCommandAction;
  IniFile:TIniFile;
begin
  IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Commands.ini');
  BagelMainForm.ExtAppList.Clear;
  try
    for i:= 0 to Trash.Count-1 do begin
      tmpAct:=TCommandAction(BagelMainForm.FindComponent(PExtAppData(Trash.Items[i]).Name));
      if tmpAct=nil then continue;
      //TODO:
      {BagelMainForm.abMainMenu.DeleteAll(Integer(tmpAct));
      BagelMainForm.abTabMenu.DeleteAll(Integer(tmpAct));
      BagelMainForm.abCtxMenu.DeleteAll(Integer(tmpAct));}
      IniFile.EraseSection(PExtAppData(Trash.Items[i]).Name);
      tmpAct.Free;
    end;

    for i:= 0 to lbExtApp.Count-1 do begin
      tmpAct:=TCommandAction(BagelMainForm.FindComponent(PExtAppData(lbExtApp.Items.Objects[i]).Name));
      if tmpAct=nil then begin
        tmpAct:=TCommandAction.Create(BagelMainForm);
        tmpAct.Name:=PExtAppData(lbExtApp.Items.Objects[i]).Name;
        tmpAct.Caption:=PExtAppData(lbExtApp.Items.Objects[i]).Caption;
        tmpAct.Command:='run';
        tmpAct.Option:=PExtAppData(lbExtApp.Items.Objects[i]).Option;
        tmpAct.Category:='ÉRÉ}ÉìÉhå^ägí£';
        tmpAct.ActionList:=BagelMainForm.ActionList1;
        tmpAct.OnExecute:=BagelMainForm.CommandExtExec;
        iniFile.WriteString(tmpAct.Name,'caption',tmpAct.Caption);
        iniFile.WriteString(tmpAct.Name,'commandname','run');
        iniFile.WriteString(tmpAct.Name,'option',tmpAct.Option);
      end
      else begin
        tmpAct.Option:=PExtAppData(lbExtApp.Items.Objects[i]).Option;
        tmpAct.Caption:=PExtAppData(lbExtApp.Items.Objects[i]).Caption;
        iniFile.WriteString(tmpAct.Name,'caption',tmpAct.Caption);
        iniFile.WriteString(tmpAct.Name,'option',tmpAct.Option);
      end;
      BagelMainForm.ExtAppList.Add(tmpAct);
    end;

  finally
    IniFIle.UpdateFile;
    IniFile.Free;
  end;
{
  for i:=0 to Form1.ExtAppList.Count-1 do begin
//    Form1.ExtAppList
  end;
}
  Self.Close;

end;

procedure TfrmExtAppEditor.edtNameChange(Sender: TObject);
function CanAdd(Name:String):Boolean;
var
i:Integer;
begin
  Result:=true;
  for i:=0 to lbExtApp.Count-1 do begin
    if PExtAppData(lbExtApp.Items.Objects[i]).Name = Name then begin
      Result:=false;
      Exit;
    end;
  end;
end;
begin
  if lbExtApp.ItemIndex=-1 then exit;

  if PExtAppData(lbExtApp.Items.Objects[lbExtApp.ItemIndex]).Name<>edtname.Text then btnOverride.Enabled:=false
  else btnOverride.Enabled:=true;

  if CanAdd(edtname.Text) then btnAdd.Enabled:=true
  else btnAdd.Enabled:=false;
  
end;

procedure TfrmExtAppEditor.btnCancelClick(Sender: TObject);
begin
Self.Close;
end;

end.
