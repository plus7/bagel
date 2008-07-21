object frmPageSetup: TfrmPageSetup
  Left = 251
  Top = 156
  BorderStyle = bsDialog
  Caption = #12506#12540#12472#35373#23450
  ClientHeight = 304
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 81
    Caption = #26360#24335
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 24
      Width = 50
      Height = 12
      Caption = #21360#21047#26041#21521':'
    end
    object Label2: TLabel
      Left = 12
      Top = 52
      Width = 56
      Height = 12
      Caption = #25313#22823#12539#32302#23567':'
    end
    object rdVertical: TRadioButton
      Left = 76
      Top = 24
      Width = 49
      Height = 17
      Caption = #32294
      TabOrder = 0
    end
    object rdHorizontal: TRadioButton
      Left = 128
      Top = 24
      Width = 41
      Height = 17
      Caption = #27178
      TabOrder = 1
    end
    object edtZoom: TEdit
      Left = 76
      Top = 48
      Width = 65
      Height = 20
      TabOrder = 2
    end
    object chkShrinkToFit: TCheckBox
      Left = 152
      Top = 48
      Width = 137
      Height = 17
      Caption = #29992#32025#12395#21512#12358#12424#12358#12395#32302#23567
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 312
    Top = 8
    Width = 165
    Height = 81
    Caption = #12458#12503#12471#12519#12531
    TabOrder = 1
    object chkPrintBgImg: TCheckBox
      Left = 20
      Top = 24
      Width = 105
      Height = 17
      Caption = #32972#26223#30011#20687#12418#21360#21047
      TabOrder = 0
    end
    object chkPrintBgColor: TCheckBox
      Left = 20
      Top = 44
      Width = 105
      Height = 17
      Caption = #32972#26223#33394#12418#21360#21047
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 96
    Width = 297
    Height = 101
    Caption = #12504#12483#12480#12539#12501#12483#12479
    TabOrder = 2
    object Label3: TLabel
      Left = 12
      Top = 36
      Width = 31
      Height = 12
      Caption = #12504#12483#12480
    end
    object Label4: TLabel
      Left = 12
      Top = 64
      Width = 28
      Height = 12
      Caption = #12501#12483#12479
    end
    object Label5: TLabel
      Left = 76
      Top = 16
      Width = 12
      Height = 12
      Caption = #24038
    end
    object Label6: TLabel
      Left = 152
      Top = 16
      Width = 24
      Height = 12
      Caption = #20013#22830
    end
    object Label7: TLabel
      Left = 236
      Top = 16
      Width = 12
      Height = 12
      Caption = #21491
    end
    object edtHeaderLeft: TEdit
      Left = 48
      Top = 32
      Width = 73
      Height = 20
      TabOrder = 0
    end
    object edtHeaderMid: TEdit
      Left = 128
      Top = 32
      Width = 73
      Height = 20
      TabOrder = 1
    end
    object edtHeaderRight: TEdit
      Left = 208
      Top = 32
      Width = 73
      Height = 20
      TabOrder = 2
    end
    object edtFooterLeft: TEdit
      Left = 48
      Top = 60
      Width = 73
      Height = 20
      TabOrder = 3
    end
    object edtFooterMid: TEdit
      Left = 128
      Top = 60
      Width = 73
      Height = 20
      TabOrder = 4
    end
    object edtFooterRight: TEdit
      Left = 208
      Top = 60
      Width = 73
      Height = 20
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 312
    Top = 104
    Width = 165
    Height = 93
    BevelOuter = bvLowered
    TabOrder = 3
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 12
      Caption = '&&U:URI'
    end
    object Label9: TLabel
      Left = 8
      Top = 24
      Width = 55
      Height = 12
      Caption = '&&T:'#12479#12452#12488#12523
    end
    object Label10: TLabel
      Left = 8
      Top = 40
      Width = 41
      Height = 12
      Caption = '&&D:'#26085#20184
    end
    object Label11: TLabel
      Left = 8
      Top = 56
      Width = 74
      Height = 12
      Caption = '&&P:'#12506#12540#12472#30058#21495
    end
    object Label12: TLabel
      Left = 8
      Top = 72
      Width = 145
      Height = 12
      Caption = '&&PT:'#12506#12540#12472#30058#21495'/'#32207#12506#12540#12472#25968
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 204
    Width = 297
    Height = 89
    Caption = #20313#30333
    TabOrder = 4
    object Label13: TLabel
      Left = 92
      Top = 20
      Width = 12
      Height = 12
      Caption = #19978
    end
    object Label14: TLabel
      Left = 24
      Top = 44
      Width = 12
      Height = 12
      Caption = #24038
    end
    object Label15: TLabel
      Left = 244
      Top = 44
      Width = 12
      Height = 12
      Caption = #21491
    end
    object Label16: TLabel
      Left = 92
      Top = 68
      Width = 12
      Height = 12
      Caption = #19979
    end
    object edtSpaceTop: TEdit
      Left = 108
      Top = 16
      Width = 65
      Height = 20
      TabOrder = 0
    end
    object edtSpaceLeft: TEdit
      Left = 40
      Top = 40
      Width = 65
      Height = 20
      TabOrder = 1
    end
    object edtSpaceRight: TEdit
      Left = 176
      Top = 40
      Width = 65
      Height = 20
      TabOrder = 2
    end
    object edtSpaceBottom: TEdit
      Left = 108
      Top = 64
      Width = 65
      Height = 20
      TabOrder = 3
    end
  end
  object Button1: TButton
    Left = 320
    Top = 268
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 404
    Top = 268
    Width = 75
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 6
    OnClick = Button2Click
  end
end
