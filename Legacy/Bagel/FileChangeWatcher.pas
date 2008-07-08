unit FileChangeWatcher;

interface

uses Classes, ShellAPI;

type
  TFileChangeWatcher = class(TComponent)
//  private
//    FPath:String;
//    procedure SetPath(Value: String);

//  public
//    property Path: String read FPath write SetPath;
  end;

(*
#include <windows.h>

#include <stdio.h>

int main()
{
    // C:\Tempの下を監視する
    HANDLE hFolder;
    int i;

    // 既存ファイルの書き込みがあった場合の監視を行う
    hFolder = FindFirstChangeNotification(
                    "c:\\temp" ,
                    FALSE ,
                    FILE_NOTIFY_CHANGE_LAST_WRITE);
    if( hFolder == INVALID_HANDLE_VALUE)
    {
        printf( "エラーだよ～～ %ld\n",
                    (long)GetLastError());
        return -1;
    }

    // 変更されるまで待機する
    for( i = 0 ; i < 3; i++)
    {
        // とりあえず無限に待ってみる
        if( WaitForSingleObject( hFolder, INFINITE) 
                            == WAIT_OBJECT_0)
        { 
            printf( "変更されたよ～～～\n");
        }
        else
        {
            printf( "何かエラー?\n");
            return -2;
        }

        // 再度、待機するための手続きを行う
        if( FindNextChangeNotification( hFolder)
                        == FALSE)
        {
            printf( "再手続き失敗...\n");
            return -3;
        }
    }

    // ハンドルをクローズ
    FindCloseChangeNotification( hFolder);

    return 0;
}
*)

(*
var
  hChange: THandle;
begin
  // ディレクトリの監視を開始
  hChange := FindFirstChangeNotification(
    'c:\windows',                 // 監視するディレクトリ
    LongBool(Integer(True)),      // サブディレクトリも監視するか
    FILE_NOTIFY_CHANGE_FILE_NAME  // 監視する内容
  );
  // エラーチェック
  if hChange = INVALID_HANDLE_VALUE then begin
    ShowMessage('監視できません (' + IntToStr(GetLastError) + ')');
    exit;
  end;
  // ボタンの無効化とメッセージ表示
  Button1.Enabled := False;
  Label1.Caption := '監視中です';
  Application.ProcessMessages;
  // 変更を監視
  WaitForSingleObject(hChange, INFINITE);
  // ボタンの有効化とメッセージ表示
  Button1.Enabled := True;
  Label1.Caption := '変更されました';
  // ハンドルを解放
  FindCloseChangeNotification(hChange);
end;
*)

implementation

end.
