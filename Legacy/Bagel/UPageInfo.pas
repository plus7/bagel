unit UPageInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmPageInfo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    Label1: TLabel;
    edtTitle: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtMIMEType: TEdit;
    edtRenderingMode: TEdit;
    edtCacheType: TEdit;
    edtEncoding: TEdit;
    edtSize: TEdit;
    edtReferer: TEdit;
    edtLastModified: TEdit;
    edtExpire: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmPageInfo: TfrmPageInfo;

implementation

{$R *.dfm}

procedure TfrmPageInfo.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPageInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
