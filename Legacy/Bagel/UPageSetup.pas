unit UPageSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, nsXPCOM, nsXPCOMGlue, nsPrintSettingsService;

type
  TfrmPageSetup = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    rdVertical: TRadioButton;
    rdHorizontal: TRadioButton;
    Label2: TLabel;
    edtZoom: TEdit;
    chkShrinkToFit: TCheckBox;
    GroupBox2: TGroupBox;
    chkPrintBgImg: TCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtHeaderLeft: TEdit;
    edtHeaderMid: TEdit;
    edtHeaderRight: TEdit;
    edtFooterLeft: TEdit;
    edtFooterMid: TEdit;
    edtFooterRight: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    chkPrintBgColor: TCheckBox;
    GroupBox4: TGroupBox;
    edtSpaceTop: TEdit;
    edtSpaceLeft: TEdit;
    edtSpaceRight: TEdit;
    edtSpaceBottom: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
    Settings:nsIPrintSettings;
  end;

var
  frmPageSetup: TfrmPageSetup;

implementation

{$R *.dfm}

procedure TfrmPageSetup.FormShow(Sender: TObject);
begin
  if Settings.Orientation = NS_IPRINTSETTINGS_kPortraitOrientation then rdVertical.Checked:=true
  else rdHorizontal.Checked:=true;

  edtZoom.Text:=FloatToStr(Settings.Scaling*100);

  chkShrinkToFit.Checked:=Settings.ShrinkToFit;
  chkPrintBgColor.Checked:=Settings.PrintBGColors;
  chkPrintBgImg.Checked:=Settings.PrintBGImages;

  edtHeaderLeft.Text := Settings.HeaderStrLeft;
  edtHeaderMid.Text := Settings.HeaderStrCenter;
  edtHeaderRight.Text:=Settings.HeaderStrRight;

  edtFooterLeft.Text:=Settings.FooterStrLeft;
  edtFooterMid.Text:=Settings.FooterStrCenter;
  edtFooterRight.Text:=Settings.FooterStrRight;

  edtSpaceTop.Text:=FormatFloat('0.00',Settings.MarginTop);
  edtSpaceBottom.Text:=FormatFloat('0.00',Settings.MarginBottom);
  edtSpaceLeft.Text:=FormatFloat('0.00',Settings.MarginLeft);
  edtSpaceRight.Text:=FormatFloat('0.00',Settings.MarginRight);
end;

procedure TfrmPageSetup.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPageSetup.Button1Click(Sender: TObject);
var
  Scaling:Double;

  HLeft,HCenter,HRight,FLeft,FCenter,FRight:PWideChar;

  pss:nsIPrintSettingsService;
begin
  if rdVertical.Checked then Settings.SetOrientation(NS_IPRINTSETTINGS_kPortraitOrientation)
  else if rdHorizontal.Checked then Settings.SetOrientation(NS_IPRINTSETTINGS_kLandscapeOrientation);

  Scaling:=StrToIntDef(edtZoom.Text,100) / 100;
  Settings.SetScaling(Scaling);

  Settings.SetShrinkToFit(chkShrinkToFit.Checked);
  Settings.SetPrintBGColors(chkPrintBgColor.Checked);
  Settings.SetPrintBGImages(chkPrintBgImg.Checked);

  HLeft:=PWideChar(WideString(edtHeaderLeft.Text));
  Settings.SetHeaderStrLeft(HLeft);
  HCenter:=PWideChar(WideString(edtHeaderMid.Text));
  Settings.SetHeaderStrCenter(HCenter);
  HRight:=PWideChar(WideString(edtHeaderRight.Text));
  Settings.SetHeaderStrRight(HRight);

  FLeft:=PWideChar(WideString(edtFooterLeft.Text));
  Settings.SetFooterStrLeft(FLeft);
  FCenter:=PWideChar(WideString(edtFooterMid.Text));
  Settings.SetFooterStrCenter(FCenter);
  FRight:=PWideChar(WideString(edtFooterRight.Text));
  Settings.SetFooterStrRight(FRight);

  {FRight:='';
  Settings.GetFooterStrRight(FRight);
  ShowMessage(FRight);}

  Settings.SetMarginTop(StrToFloatDef(edtSpaceTop.Text,0.5));
  Settings.SetMarginLeft(StrToFloatDef(edtSpaceLeft.Text,0.5));
  Settings.SetMarginRight(StrToFloatDef(edtSpaceRight.Text,0.5));
  Settings.SetMarginBottom(StrToFloatDef(edtSpaceBottom.Text,0.5));

  NS_GetService('@mozilla.org/gfx/printsettings-service;1',nsIPrintSettingsService,pss);
  pss.SavePrintSettingsToPrefs(Settings,true,NS_IPRINTSETTINGS_kInitSaveAll);

  Self.Close;
end;

end.
