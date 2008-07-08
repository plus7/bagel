object HelperDlg: THelperDlg
  Left = 260
  Top = 314
  BorderStyle = bsDialog
  Caption = #12501#12449#12452#12523#12398#12480#12454#12531#12525#12540#12489
  ClientHeight = 196
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 253
    Height = 12
    Caption = #12371#12398#12501#12449#12452#12523#12434#20445#23384#12377#12427#12363#12289#12414#12383#12399#23455#34892#12375#12414#12377#12363#65311
  end
  object Label2: TLabel
    Left = 156
    Top = 36
    Width = 4
    Height = 12
  end
  object Label3: TLabel
    Left = 124
    Top = 36
    Width = 21
    Height = 12
    Caption = 'URI:'
  end
  object Label4: TLabel
    Left = 53
    Top = 76
    Width = 92
    Height = 12
    Caption = #31278#39006'(MIME'#12479#12452#12503'):'
  end
  object Label5: TLabel
    Left = 107
    Top = 96
    Width = 38
    Height = 12
    Caption = #30330#20449#20803':'
  end
  object Label6: TLabel
    Left = 119
    Top = 56
    Width = 26
    Height = 12
    Caption = #21517#21069':'
  end
  object Image1: TImage
    Left = 16
    Top = 40
    Width = 32
    Height = 32
    Transparent = True
  end
  object lblName: TLabel
    Left = 156
    Top = 56
    Width = 41
    Height = 12
    Caption = 'lblName'
  end
  object lblMime: TLabel
    Left = 156
    Top = 76
    Width = 39
    Height = 12
    Caption = 'lblMime'
  end
  object lblSource: TLabel
    Left = 156
    Top = 96
    Width = 47
    Height = 12
    Caption = 'lblSource'
  end
  object btnSave: TButton
    Left = 148
    Top = 124
    Width = 93
    Height = 21
    Caption = #20445#23384'(&S)'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 348
    Top = 124
    Width = 93
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
  end
  object btnExecute: TButton
    Left = 248
    Top = 124
    Width = 93
    Height = 21
    Caption = #23455#34892'(&E)'
    ModalResult = 6
    TabOrder = 2
  end
  object chkRememberThisPref: TCheckBox
    Left = 20
    Top = 160
    Width = 233
    Height = 17
    Caption = #20170#24460#12371#12398#31278#39006#12398#12501#12449#12452#12523#12399#21516#27096#12395#20966#29702#12377#12427'(&A)'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS UI Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtURI: TEdit
    Left = 156
    Top = 36
    Width = 293
    Height = 13
    BorderStyle = bsNone
    Color = clBtnFace
    TabOrder = 4
    Text = 'edtURI'
  end
  object SaveDialog1: TSaveDialog
    Left = 312
    Top = 76
  end
end
