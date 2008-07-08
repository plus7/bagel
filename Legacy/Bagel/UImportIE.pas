unit UImportIE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShellCtrls, StdCtrls, ExtCtrls,ubookmark,inifiles;

type
  TfrmImportIE = class(TForm)
    btnImport: TButton;
    Label1: TLabel;
    btnCancel: TButton;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    chkAddToRootFolder: TCheckBox;
    StatusBar1: TStatusBar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProcessFolder(bkmkFolder:TBookmarkList; Path:String);
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    ShellTreeView1: TShellTreeView;
  end;

var
  frmImportIE: TfrmImportIE;

implementation

uses UBagel;

{$R *.dfm}

procedure TfrmImportIE.btnCancelClick(Sender: TObject);
begin
Self.ModalResult := mrCancel;
end;

procedure TfrmImportIE.btnImportClick(Sender: TObject);
var
bl:TBookmarkList;
a:olevariant;
begin
  if chkAddToRootFolder.Checked then
  begin
    bl:=BagelMainForm.bookmarks;
  end
  else
  begin
    bl := TBookmarkList.Create(BagelMainForm.bookmarks);
    bl.name := 'インポートしたIEのお気に入り';
    BagelMainForm.bookmarks.Insert(BagelMainForm.bookmarks.Count,bl);
  end;
  ProcessFolder(bl,ShellTreeView1.Path);
  BagelMainForm.SaveBookmarks(true);
//  BagelMainForm.UpdateBookmarksTree;
  Self.ModalResult:=mrOK;
end;

procedure TfrmImportIE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmImportIE.FormCreate(Sender: TObject);
begin
  ShellTreeView1 := TShellTreeView.Create(Self);
  ShellTreeView1.Parent := Self;
  with ShellTreeView1 do begin
    Left := 8;
    Top := 40;
    Width := 201;
    Height := 137;
    AutoContextMenus := False;
    ObjectTypes := [otFolders];
    Root := 'rfFavorites';
    UseShellImages := True;
    AutoRefresh := False;
    Indent := 19 ;
    ParentColor := False ;
    RightClickSelect := True ;
    ShowRoot := False ;
    TabOrder := 0 ;
  end;
end;

procedure TfrmImportIE.ProcessFolder(bkmkFolder:TBookmarkList; Path:String);
  function NewFolder(parent: TBookmarkList;name:String): TBookmarkList;
  begin
    result := TBookmarkList.Create(parent);
    result.name := name;
    parent.Insert(parent.Count,result);
  end;
//▼登録場所を指定できるように
procedure RegisterBookmark(URI:String;Title:String;
                                    parent: TBookmarkList);
var
  fav: TBookmark;
begin

  fav := TBookmark.Create(BagelMainForm.bookmarks);
  fav.URI:=URI;
  fav.name:=title;
  parent.Insert(parent.Count, fav);
end;
var
  SearchRec: TSearchRec;
  DirectoryName:String;
  URLFile:TIniFile;
  strURL:String;
begin
//
//ProcessFolder(bkmkFolder:TBookmarkList; Path:String);
  DirectoryName:= IncludeTrailingBackslash(Path);
  // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
  if 0=FindFirst(DirectoryName+'*.*', faAnyFile, SearchRec) then try
    repeat
      if SearchRec.Attr and faDirectory <> 0 then begin
        // カレントディレクトリや親ディレクトリをスキップ
        if (SearchRec.Name='.') or (SearchRec.Name='..') then
          Continue;
        // ディレクトリに対する処理
        // SearchRec.Name にディレクトリ名が入っている
        // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
          StatusBar1.SimpleText := SearchRec.Name;
          ProcessFolder(
                NewFolder(bkmkFolder,SearchRec.Name),
                DirectoryName+SearchRec.Name);
      end else begin
        // ファイルに対する処理
        // SearchRec.Name にファイル名が入っている
        // たとえば、Memo1.Lines.Add('File:'+DirectoryName+SearchRec.Name);
        if LowerCase(ExtractFileExt(SearchRec.Name)) = '.url' then
        begin
            URLFile := TIniFile.Create(DirectoryName+SearchRec.Name);
            strURL := URLFile.ReadString('InternetShortcut','URL','');
            URLFile.Free;
            RegisterBookmark(strURL,ChangeFileExt(SearchRec.Name,''),bkmkFolder);
        end;
      end;
    until 0<>FindNext(SearchRec);
  finally
    FindClose(SearchRec);
  end;
//ここ、列挙ループ
//Anfang
  //ファイルなら　parentに追加
  //フォルダなら
    //フォルダを作成してparentに追加し、
    //再帰(さっきのフォルダ、今のPath)
//ende

end;

{
procedure Form1.EnumFiles(DirectoryName: string);
var
  SearchRec: TSearchRec;
begin
  // 一番後ろに '\' がついていなければ付ける
    DirectoryName:= IncludeTrailingBackslash(DirectoryName);

  // FindFirst が成功した場合のみ FindClose を呼ぶ必要がある
  if 0=FindFirst(DirectoryName+'*.*', faAnyFile, SearchRec) then try
    repeat
      if SearchRec.Attr and faDirectory <> 0 then begin
        // カレントディレクトリや親ディレクトリをスキップ
        if (SearchRec.Name='.') and (SearchRec.Name='..') then
          Continue;
        // ディレクトリに対する処理
        // SearchRec.Name にディレクトリ名が入っている
        // たとえば、Memo1.Lines.Add('Dir :'+DirectoryName+SearchRec.Name);
      end else begin
        // ファイルに対する処理
        // SearchRec.Name にファイル名が入っている
        // たとえば、Memo1.Lines.Add('File:'+DirectoryName+SearchRec.Name);
      end;
    until 0<>FindNext(SearchRec);
  finally
    FindClose(SearchRec);
  end;
end;
}

end.
