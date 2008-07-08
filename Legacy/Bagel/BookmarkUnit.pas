unit BookmarkUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UBagel,GeckoBrowser,ComCtrls,ubookmark,BagelPref;

type
  TBookmarkForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    LabeledEditTitle: TLabeledEdit;
    LabeledEditURI: TLabeledEdit;
    GroupBox11: TGroupBox;
    chkAllowFrames: TCheckBox;
    chkAllowImg: TCheckBox;
    chkAllowPlugins: TCheckBox;
    chkAllowMeta: TCheckBox;
    chkAllowJs: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    chkUseExProperty: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function  GetDocShellState:String;
    procedure SetDocShellState(state:String);
    function  GetReloadState:String;
    procedure Button1Click(Sender: TObject);
    procedure LabeledEditTitleChange(Sender: TObject);
    procedure LabeledEditURIChange(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
    mode:String;//'create','property'
    changed:Boolean;
    ParentBkmk:TBookmarkList;
    target:TBkmkBase;
    URI:String;
    Title:String;
    DocShellState:String;
  end;

var
  BookmarkForm: TBookmarkForm;
  

implementation



{$R *.dfm}


procedure TBookmarkForm.FormShow(Sender: TObject);
begin
  Self.ModalResult:=mrCancel;
  changed:=false;
  if mode='create' then
  begin
    LabeledEditTitle.Text := Title;//b.Title;
    LabeledEditURI.Text := URI;//Form1.GetUrlForB(b);
    SetDocShellState('');
  end
  else if mode='panelcreate' then
  begin
    LabeledEditTitle.Text := Title;
    LabeledEditURI.Text := URI;
  end
  else if mode='property' then
  begin
    if target is TBookmarkList then
    begin
      LabeledEditTitle.Enabled:=true;
      LabeledEditTitle.Text := target.name;
      LabeledEditURI.Enabled:=false;
      LabeledEditURI.Text := ' ';
      chkUseExProperty.Enabled:=False;
      chkUseExProperty.Checked:=False;
    end
    else
    begin
      LabeledEditTitle.Enabled:=true;
      LabeledEditURI.Enabled:=true;
      LabeledEditTitle.Text := target.name;
      LabeledEditURI.Text := TBookmark(Target).URI;
      SetDocShellState(TBookmark(Target).DocShell);
    end;


  end;

end;

procedure TBookmarkForm.Button2Click(Sender: TObject);
begin
Self.ModalResult:=mrCancel;
Self.Close;
end;


function TBookmarkForm.GetDocShellState:String;
begin
  Result:='';
  if chkUseExProperty.Checked then
  Result:=IntToStr(
  Integer(chkAllowPlugins.Checked)*1+
  Integer(chkAllowJS.Checked)*2+
  Integer(chkAllowFrames.Checked)*4+
  Integer(chkAllowMeta.Checked)*8+
  Integer(chkAllowImg.Checked)*16);
end;

procedure TBookmarkForm.SetDocShellState(state:String);
var
  DocShell:Integer;
begin
  chkUseExProperty.Enabled:=True;
  chkUseExProperty.Checked:=(state<>'');
  if chkUseExProperty.Checked then begin
    DocShell:=StrToInt(state);
    chkAllowFrames.Checked:=(DocShell and 4)<>0;
    chkAllowImg.Checked   :=(DocShell and 16)<>0;
    chkAllowPlugins.Checked:=(DocShell and 1)<>0;
    chkAllowMeta.Checked :=(DocShell and 8)<>0;
    chkAllowJs.Checked   :=(DocShell and 2)<>0;
  end
  else
  begin
    chkAllowFrames.Checked:=True;
    chkAllowImg.Checked   :=True;
    chkAllowPlugins.Checked:=True;
    chkAllowMeta.Checked :=True;
    chkAllowJs.Checked   :=True;
  end;
{
         brwsr.DocShell.SetAllowPlugins((DocShell and 1)<>0);
         brwsr.DocShell.SetAllowJavascript((DocShell and 2)<>0);
         brwsr.DocShell.SetAllowMetaRedirects((DocShell and 8)<>0);
         brwsr.DocShell.SetAllowSubframes((DocShell and 4)<>0);
         brwsr.DocShell.SetAllowImages((DocShell and 16)<>0);}
end;

function TBookmarkForm.GetReloadState:String;
begin
                                     {
Integer(Self.DefaultAllowPlugins)*1+
Integer(Self.DefaultAllowJS)*2+
Integer(Self.DefaultAllowFrames)*4+
Integer(Self.DefaultAllowMeta)*8+
Integer(Self.DefaultAllowImg)*16;     }
end;

procedure TBookmarkForm.Button1Click(Sender: TObject);
//var
//  P:PBookMarkItem;
//  Node:TTreeNode;
begin
  if (LabeledEditTitle.Text <> '') and (LabeledEditURI.Text <> '') then
  begin
    if mode='create' then
    begin
      //Form1.RegisterBookmark(ParentBkmk.Count);
      Self.URI := LabeledEditURI.Text;
      Self.Title := LabeledEditTitle.Text;
      Self.DocShellState := GetDocShellState;
    end
    else if mode='panelcreate' then
    begin
      Self.URI := LabeledEditURI.Text;
      Self.Title := LabeledEditTitle.Text;
      //Self.DocShellState := GetDocShellState;
      //Form1.panellist.Add(LabeledEdit1.Text+'='+LabeledEdit2.Text);
    end
    else
    begin
     if changed then
     begin
      target.name := LabeledEditTitle.Text;
      if not (target is TBookmarkList) then
      begin
        TBookmark(target).URI := LabeledEditURI.Text;
        TBookmark(target).DocShell := GetDocShellState;
      end;
     end;
    end;
    //Form1.UpdateBookmarksTree;
    //Form1.VMenuSidebarClick(Self) ;
    Self.ModalResult := mrOk;
    Self.CloseModal;
  end;
end;

procedure TBookmarkForm.LabeledEditTitleChange(Sender: TObject);
begin
changed:=true;
end;

procedure TBookmarkForm.LabeledEditURIChange(Sender: TObject);
begin
changed:=true;
end;

end.
