unit PropertiesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmProperties = class(TForm)
    gbLinkProps: TGroupBox;
    gbImgProps: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    gbInsDelProps: TGroupBox;
    gbQuoteProps: TGroupBox;
    gbMiscProps: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnOK: TButton;
    edtLinkURI: TEdit;
    edtLinkWillOpenTo: TEdit;
    edtImgAddr: TEdit;
    edtImgHeight: TEdit;
    edtImgWidth: TEdit;
    edtImgFilesize: TEdit;
    edtImgAlt: TEdit;
    edtInsDelDatetime: TEdit;
    edtInsDelCite: TEdit;
    edtQuoteCite: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CreateParams(var Params:TCreateParams); override;
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmProperties: TfrmProperties;

implementation

{$R *.dfm}

procedure TfrmProperties.btnOKClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmProperties.FormShow(Sender: TObject);
var
  tmp,Base:Integer;
begin
  Base := 8;
  if gbLinkProps.Visible then Base := Base + gbLinkProps.Height + 8;

  if gbImgProps.Visible then begin
    gbImgProps.Top := base;
    Base := base + gbImgProps.Height + 8;
  end;

  if gbInsDelProps.Visible then begin
    gbInsDelProps.Top := base;
    Base := base + gbInsDelProps.Height + 8;
  end;

  if gbQuoteProps.Visible then begin
    gbQuoteProps.Top := base;
    Base := base + gbQuoteProps.Height + 8;
  end;

  if gbMiscProps.Visible then begin
    gbMiscProps.Top := base;
    Base := base + gbMiscProps.Height + 8;
  end;

  btnOK.Top:=Base;

  Base:=Base+btnOK.Height+8;

  tmp := Self.Height - Self.ClientHeight;

  Self.Height := tmp + base;

end;

procedure TfrmProperties.CreateParams(var Params:TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

end.
