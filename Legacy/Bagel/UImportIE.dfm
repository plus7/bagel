object frmImportIE: TfrmImportIE
  Left = 279
  Top = 277
  BorderStyle = bsDialog
  Caption = 'IE'#12398#12362#27671#12395#20837#12426#12398#12452#12531#12509#12540#12488
  ClientHeight = 229
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 126
    Height = 24
    Caption = #12452#12531#12509#12540#12488#12377#12427#12501#12457#12523#12480#12434#36984#25246#12375#12390#12367#12384#12373#12356
    WordWrap = True
  end
  object Label2: TLabel
    Left = 224
    Top = 168
    Width = 226
    Height = 36
    Caption = #25313#24373#12503#12525#12497#12486#12451#12399'Bagel'#12398#12502#12483#12463#12510#12540#12463#12398#12458#12503#12471#12519#12531#12391#30456#24403#12377#12427#12392#24605#12431#12428#12427#12418#12398#12398#12415#24341#12365#32153#12364#12428#12414#12377#12290
    WordWrap = True
  end
  object btnImport: TButton
    Left = 8
    Top = 184
    Width = 97
    Height = 21
    Caption = #12452#12531#12509#12540#12488#38283#22987
    TabOrder = 0
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 112
    Top = 184
    Width = 97
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object RadioGroup1: TRadioGroup
    Left = 216
    Top = 56
    Width = 241
    Height = 105
    Caption = 'Donut'#12458#12503#12471#12519#12531#65288#29694#27573#38542#12391#12399#28961#21177#65289
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'URL'#24773#22577#20197#22806#24341#12365#32153#12364#12394#12356
      'unDonut'#12398#25313#24373#12503#12525#12497#12486#12451#12434#24341#12365#32153#12368
      'DonutRAPT'#12398#25313#24373#12503#12525#12497#12486#12451#12434#24341#12365#32153#12368)
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 8
    Width = 241
    Height = 41
    Caption = #12458#12503#12471#12519#12531
    TabOrder = 4
    object chkAddToRootFolder: TCheckBox
      Left = 8
      Top = 16
      Width = 225
      Height = 17
      Caption = #12523#12540#12488#12501#12457#12523#12480#12395#36861#21152#12377#12427
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 212
    Width = 465
    Height = 17
    Panels = <>
  end
end
