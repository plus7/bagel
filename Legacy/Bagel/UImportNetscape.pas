unit UImportNetscape;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ShellCtrls, UBookmark, ShlObj;

type
  TfrmImportNetscape = class(TForm)
    GroupBox1: TGroupBox;
    chkAddToRootFolder: TCheckBox;
    btnImport: TButton;
    btnCancel: TButton;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    chkDetectWebPanel: TCheckBox;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    TreeView1: TTreeView;
    Label3: TLabel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    procedure btnImportClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BuildBmTree(path:String);
    procedure TreeView1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  frmImportNetscape: TfrmImportNetscape;

implementation

uses UBagel;

{$R *.dfm}

function InStr(StartPos:integer;const Str, SubStr:string):integer ;overload;
var
  pStr,p:PChar;
begin
  pStr := PChar(Str);
  p := AnsiStrPos(PChar(pStr+StartPos-1),PChar(SubStr));
  if p = nil then
    result := 0
  else
    result := p-pStr+1;
end;

function InStr(const Str, SubStr:string):integer ;overload;
begin
  result := InStr(1,Str,SubStr);
end;


procedure TfrmImportNetscape.btnImportClick(Sender: TObject);
var
  root:TBookmarkList;
  b:TBookmarkList;
//  i:Integer;
  ChildB:TBkmkBase;
begin
  root :=TBookmarkList(TreeView1.Items.Item[0]);
  b    :=TBookmarkList(TreeView1.Selected.Data);

  if chkAddToRootFolder.Checked then begin
    //for i:=0 to b.Count-1 do begin
    while b.Count>0 do begin
      ChildB:=b.Items[0];
      BagelMainForm.bookmarks.Insert(BagelMainForm.bookmarks.Count,ChildB);
    end;
    root.Free;

  end
  else begin
    if b=root then begin
      BagelMainForm.bookmarks.Insert(BagelMainForm.bookmarks.Count,root);
    end
    else begin
      TBookmarkList(b.parent).Delete(b);
      BagelMainForm.bookmarks.Insert(BagelMainForm.bookmarks.Count,b);
      root.Free;
    end;
  end;

  BagelMainForm.SaveBookmarks(true);
  Self.ModalResult:=mrOK;
end;

procedure TfrmImportNetscape.btnCancelClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmImportNetscape.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  root:TBookmarkList;
begin
  if (TreeView1.Items.Count>0) and (Self.ModalResult=mrCancel) then begin
    root :=TBookmarkList(TreeView1.Items.Item[0]);
    root.Free;
  end;
  Action:=caFree;
end;

procedure TfrmImportNetscape.BuildBmTree(path:String);
var
  bl:TBookmarkList;
  b:TBookmark;
  prev:TBkmkBase;
  parent:TBkmkbase;
  sl:TStringList;
  i:Integer;
  tmpStr:String;
  tmpName:String;
  strURL:String;
  tmpInt:Integer;
  tmpInt2:Integer;
  level:Integer;
  tmpTreeNode:TTreeNode;
  tmpPrevNode:TTreeNode;
  tmpParentnode:TTreenode;
begin
  Panel1.Visible:=true;

  sl:=TStringList.Create;
  sl.LoadFromFile(path);
  sl.Text:=Utf8toansi(sl.Text);
  for i:=0 to sl.Count-1 do
  begin
    tmpStr:=Trim(sl.Strings[i]);
    if Pos('<H1',tmpStr)<>0 then
    begin
      bl := TBookmarkList.Create(BagelMainForm.bookmarks);
      bl.name := 'インポートしたNetscapeのブックマーク';
//      tmpTreeNode:=TreeView1.Items.AddChildObject(TreeView1.Items.,bl.name,bl);
      tmpTreeNode:=TreeView1.Items.AddObject(nil,bl.name,bl);
      //AddFirstObject(nil,bl.name,bl);

      prev:=bl;
      tmpPrevnode:=tmpTreeNode;
//
    end
    else if Pos('<DL>',tmpStr)<>0 then
    begin
      inc(level);
      parent:=TBookmarkList(prev);
      tmpParentNode:=tmpPrevNode;
      prev:=nil;
    end
    else if Pos('</DL>',tmpStr)<>0 then
    begin
      dec(level);
      prev:=parent;
      tmpPrevNode:=tmpParentNode;
      parent:=TBookmarkList(prev.parent);
      tmpParentNode:=tmpPrevNode.Parent;
    end
    else if Pos('<H3',tmpStr)<>0 then
    begin
      bl := TBookmarkList.Create(BagelMainForm.bookmarks);
      tmpInt:=InStr(Pos('<H3',tmpStr),tmpStr,'>');//Pos('>',tmpStr);
      tmpInt2:=Pos('</H3>',tmpStr);
      tmpName:=Copy(tmpStr,tmpInt+1, tmpInt2-tmpInt-1);
      bl.name:=tmpName;
      TBookmarkList(parent).Add(bl);
      tmpTreeNode:=TreeView1.Items.AddChildObject(tmpParentNode,bl.name,bl);
      prev:=bl;
      tmpPrevNode:=tmpTreeNode;
    end
    else if Pos('<A HREF="',tmpStr)<>0 then
    begin
      tmpInt:=Pos('<A HREF="',tmpStr)+9;
      tmpInt2:=InStr(tmpInt,tmpStr,'"');
      strURL := Copy(tmpStr,tmpInt,tmpInt2-tmpInt);

      tmpInt:=InStr(tmpInt2,tmpStr,'>');
      tmpInt2:=InStr(tmpInt,tmpStr,'</A>');
      tmpName:=Copy(tmpStr,tmpInt+1,tmpInt2-tmpInt-1);

      b:=TBookmark.Create(BagelMainForm.bookmarks);
      b.name:=tmpName;
      b.URI:=strURL;
      TBookmarkList(parent).Add(b);
      //tmpTreenode:=TreeView1.Items.AddChildObject(tmpParentNode,b.name,b);
      prev:=b;
      //tmpPrevNode:=tmpTreeNode;
    end;
    Progressbar1.Position:=i * 100 div sl.count;
    Sleep(1);
  end;
  Panel1.Visible:=False;
  TreeView1.FullExpand;
  //Showmessage(TBookmarkList(TreeView1.Selected.Data).name);
  if TreeView1.Items.Count>0 then begin
    btnImport.Enabled:=True;
    TreeView1.Select(TreeView1.Items.Item[0]);
  end;
end;

procedure TfrmImportNetscape.FormActivate(Sender: TObject);
var
  Buf: array[0..MAX_PATH] of char;
begin
  Self.Visible:=True;
  SHGetSpecialFolderPath(Handle, Buf, CSIDL_APPDATA, FALSE);
  OpenDialog1.InitialDir:=String(Buf);
  if DirectoryExists(OpenDialog1.InitialDir+'\Mozilla') then OpenDialog1.InitialDir:=OpenDialog1.InitialDir+'\Mozilla';
  if OpenDialog1.Execute then
  begin
    BuildBmTree(OpenDialog1.FileName);

  end
  else begin
    Self.ModalResult := mrCancel;
  end;
end;

procedure TfrmImportNetscape.TreeView1Click(Sender: TObject);
begin
  {if TreeView1.Selected<>nil then begin
    Showmessage(TBookmarkList(TreeView1.Selected.Data).name);
  end;}
end;

end.
