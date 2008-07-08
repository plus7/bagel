unit BrwsFldr;

// SHBrowseForFolder のフォルダ選択ダイアログのオブジェクト

interface

uses
        Windows, ShlObj, ActiveX;

type
        TBrowseFolderBox = class
        private
                FHandle         : HWND;         //ダイアログの hwnd
                FBrowseInfo     : TBrowseInfo;  //BROWSEINFO
                FRootFolderNum  : Integer;      //CSIDL_??? ルートフォルダ
                FInitFolder     : String;       //初期選択フォルダ
                FSelectFolder   : String;       //選択されたフォルダパス
                FDisplayName    : String;       //選択されたフォルダ文字列
                FTitle          : String;       //タイトル
                FStatusText     : String;       //ステータス文字列
                FFlags          : UINT;         //ダイアログのフラグ
                FPosX, FPosY    : Integer;      //ダイアログの位置
                FSizeX, FSizeY  : Integer;      //ダイアログのサイズの増減
                procedure       ResizeOwnDialog;
        public
                constructor     Create;
                function        Execute: Boolean;
        published
                property        Handle: HWND            read FHandle;
                property        SelectFolder: String    read FSelectFolder;
                property        DisplayName: String     read FDisplayName;
                property        RootFolderNum: Integer  read FRootFolderNum
                                                        write FRootFolderNum;
                property        InitFolder: String      read FInitFolder
                                                        write FInitFolder;
                property        Title: String           read FTitle
                                                        write FTitle;
                property        StatusText: String      read FStatusText;
                property        Flags: UINT             read FFlags
                                                        write FFlags;
                property        PosX: Integer           read FPosX
                                                        write FPosX;
                property        PosY: Integer           read FPosY
                                                        write FPosY;
                property        SizeX: Integer          read FSizeX
                                                        write FSizeX;
                property        SizeY: Integer          read FSizeY
                                                        write FSizeY;
        end;

const
        bifReturnOnlyFSDIRs = BIF_RETURNONLYFSDIRS;
        bifDontGoBelowDomain = BIF_DONTGOBELOWDOMAIN;
        bifStatusText = BIF_STATUSTEXT;
        bifReturnFSAncestors = BIF_RETURNFSANCESTORS;
        bifBrowseForComputer = BIF_BROWSEFORCOMPUTER;
        bifBrowseForPrinter = BIF_BROWSEFORPRINTER;
        bifBrowseIncludeFiles = BIF_BROWSEINCLUDEFILES;

implementation

function GetClientPos(hOwner, hChild: THandle): TPoint;
 (* 子ウインドウの親ウインドウクライアント座標 *)
var
        rc: TRect;
begin
        GetWindowRect(hChild, rc);
        Result := rc.TopLeft;
        Windows.ScreenToClient(hOwner, Result);
end;

constructor TBrowseFolderBox.Create;
begin
        {* プロパティ初期値 *}
        FFlags := BIF_RETURNONLYFSDIRS;
        FRootFolderNum := CSIDL_DESKTOP;
end;

procedure TBrowseFolderBox.ResizeOwnDialog;
 (* ダイアログのサイズ、位置変更 *)
type    sResizeType = ( rtOwner, rtSize, rtAncRB );
        TResizeTable = Record
                Parent : Boolean;
                Name, Text : String;
                ReType : sResizeType;
        end;
const   ResizeTable : array [0..4] of TResizeTable = (
                ( Parent:False; Name:'SysTreeView32'; Text:''; ReType:rtSize ),
                ( Parent:False; Name:'Button'; Text:'OK'; ReType:rtAncRB ),
                ( Parent:False; Name:'Button'; Text:'ｷｬﾝｾﾙ'; ReType:rtAncRB ),
                ( Parent:True;  Name:' '; ReType:rtOwner ),
                ( Parent:False; Name:'' )
        );
var
        wnd : HWND;
        idx, OrgCX, OrgCY : Integer;
        rect : TRect; 
        Pnt : TPoint;
begin
        idx := 0;
        while ResizeTable[idx].Name<>'' do begin
                if ResizeTable[idx].Parent then
                        wnd := FHandle
                else
                        wnd := FindWindowEx( FHandle, 0,
                                        PChar( ResizeTable[idx].Name ),
                                        PChar( ResizeTable[idx].Text ) );
                if wnd<>0 then begin
                        // Pnt が元のクライアント座標
                        Pnt := GetClientPos( FHandle, wnd );
                        // OrgCX, OrgCY が元のサイズ
                        GetWindowRect( wnd, rect );
                        OrgCX := rect.Right-rect.Left;
                        OrgCY := rect.Bottom-rect.Top;

                        //移動、サイズ変更
                        case ResizeTable[idx].ReType of
                                //親ウインドウ
                                rtOwner : MoveWindow( wnd, FPosX, FPosY,
                                        OrgCX+FSizeX, OrgCY+FSizeY, True );
                                //サイズ変更（場所はそのまま）
                                rtSize : MoveWindow( wnd, Pnt.X, Pnt.Y,
                                        OrgCX+FSizeX, OrgCY+FSizeY, False );
                                //右下をアンカーにして移動（サイズはそのまま）
                                rtAncRB : MoveWindow( wnd,
                                        Pnt.X+FSizeX, Pnt.Y+FSizeY,
                                        OrgCX, OrgCY, False );
                        end;
                end;
                inc( idx );
        end;
end;

function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam, lpData: LPARAM)
: Integer; stdcall;
 (* SHBrowseForFolder のコールバック *)
var
        ppmem : IMalloc;
        Path : String;
begin
        Result:= 0;
        SetLength( Path, MAX_PATH );
        SHGetMalloc( ppmem );

        with ( TObject( lpData ) as TBrowseFolderBox ) do begin
                //ダイアログの hwnd を設定
                if FHandle=0 then FHandle := hwnd;

                if uMsg=BFFM_INITIALIZED then begin
                        //初期フォルダの設定
                        SendMessage( hwnd, BFFM_SETSELECTION, 1,
                        Longint( PChar( FInitFolder ) ) );
                        ResizeOwnDialog;
                end
                else if uMsg=BFFM_SELCHANGED then begin
                        SHGetPathFromIDList( PItemIDList( lParam ),
                                        PChar( Path ) );
                        FStatusText := Path;
                        //ステータスにカーソル位置フォルダ表示
                        if ( BIF_STATUSTEXT and FFlags <>0 ) then begin
                                SendMessage( hwnd, BFFM_SETSTATUSTEXT, 0,
                                        Longint( PChar( FStatusText ) ) );
                        end;
                        ppmem.Free( PItemIDList( lParam ) );
                end;
        end;
end;

function TBrowseFolderBox.Execute: Boolean;
 (* ダイアログボックスを出す *)
var
        pidlRoot, pidlSelect : PItemIDList;
        ppmem : IMalloc;
        DisplayNameBuf, SelectFolderBuf : array [0..MAX_PATH] of Char;
begin
        Result := FALSE;
        SHGetMalloc( ppmem );

        if not SUCCEEDED( SHGetSpecialFolderLocation( 0, FRootFolderNum,
        pidlRoot ) ) then Exit;
        // BROWSEINFO を設定
        with FBrowseInfo do begin
                pidlRoot := pidlRoot;
                pszDisplayName := DisplayNameBuf;
                lpszTitle := PChar( FTitle );
                ulFlags := FFlags;
                lpfn := @BrowseCallbackProc;
                lParam := Longint( Self );
        end;

        //ダイアログボックスを出す
        pidlSelect := SHBrowseForFolder( FBrowseInfo );
        FHandle := 0;
        //フォルダが選択されたか？
        if Assigned( pidlSelect ) then begin
                if SHGetPathFromIDList( pidlSelect, SelectFolderBuf )
                then begin
                        Result := True;
                        FSelectFolder := String( SelectFolderBuf );
                        FDisplayName := String( DisplayNameBuf );
                end;
                ppmem.Free( pidlSelect );
        end;
        ppmem.Free( pidlRoot );
end;

end.
