object BookmarkForm: TBookmarkForm
  Left = 577
  Top = 148
  BorderStyle = bsDialog
  Caption = #12502#12483#12463#12510#12540#12463#12395#36861#21152
  ClientHeight = 304
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 252
    Width = 48
    Height = 12
    Caption = #33258#21205#26356#26032
  end
  object Button1: TButton
    Left = 128
    Top = 276
    Width = 73
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 276
    Width = 75
    Height = 21
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 1
    OnClick = Button2Click
  end
  object LabeledEditTitle: TLabeledEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 20
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #21517#21069
    TabOrder = 2
    OnChange = LabeledEditTitleChange
  end
  object LabeledEditURI: TLabeledEdit
    Left = 8
    Top = 64
    Width = 273
    Height = 20
    EditLabel.Width = 22
    EditLabel.Height = 12
    EditLabel.Caption = 'URL'
    TabOrder = 3
    OnChange = LabeledEditURIChange
  end
  object GroupBox11: TGroupBox
    Left = 8
    Top = 113
    Width = 273
    Height = 129
    Caption = #12475#12461#12517#12522#12486#12451
    TabOrder = 4
    object chkAllowFrames: TCheckBox
      Left = 12
      Top = 100
      Width = 133
      Height = 17
      Caption = #12501#12524#12540#12512#12434#35501#12415#36796#12416
      TabOrder = 0
    end
    object chkAllowImg: TCheckBox
      Left = 12
      Top = 80
      Width = 105
      Height = 17
      Caption = #30011#20687#12434#35501#12415#36796#12416
      TabOrder = 1
    end
    object chkAllowPlugins: TCheckBox
      Left = 12
      Top = 60
      Width = 109
      Height = 17
      Caption = #12503#12521#12464#12452#12531#12434#35377#21487
      TabOrder = 2
    end
    object chkAllowMeta: TCheckBox
      Left = 12
      Top = 40
      Width = 197
      Height = 17
      Caption = 'Meta'#35201#32032#12395#12424#12427#12522#12480#12452#12524#12463#12488#12434#35377#21487
      TabOrder = 3
    end
    object chkAllowJs: TCheckBox
      Left = 12
      Top = 20
      Width = 145
      Height = 17
      Caption = 'JavaScript'#12434#26377#21177#12395#12377#12427
      TabOrder = 4
    end
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 248
    Width = 145
    Height = 20
    Style = csDropDownList
    Enabled = False
    ItemHeight = 12
    ItemIndex = 0
    TabOrder = 5
    Text = #12394#12375
    Items.Strings = (
      #12394#12375
      '5'#31186#12362#12365
      '10'#31186#12362#12365
      '30'#31186#12362#12365
      '1'#20998#12362#12365
      '5'#20998#12362#12365
      '10'#20998#12362#12365
      '30'#20998#12362#12365
      '1'#26178#38291#12362#12365
      #12518#12540#12470#12540#35373#23450)
  end
  object chkUseExProperty: TCheckBox
    Left = 8
    Top = 92
    Width = 157
    Height = 17
    Caption = #25313#24373#12503#12525#12497#12486#12451#12434#20351#29992#12377#12427
    TabOrder = 6
  end
end
