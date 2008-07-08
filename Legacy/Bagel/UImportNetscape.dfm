object frmImportNetscape: TfrmImportNetscape
  Left = 208
  Top = 332
  BorderStyle = bsDialog
  Caption = 'Mozilla'#12398#12502#12483#12463#12510#12540#12463#12398#12452#12531#12509#12540#12488
  ClientHeight = 213
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Label2: TLabel
    Left = 224
    Top = 168
    Width = 209
    Height = 36
    Caption = 'TBE'#12398#24773#22577#12399'Bagel'#12398#12502#12483#12463#12510#12540#12463#12398#12458#12503#12471#12519#12531#12391#30456#24403#12377#12427#12392#24605#12431#12428#12427#12418#12398#12398#12415#24341#12365#32153#12364#12428#12414#12377#12290
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 126
    Height = 24
    Caption = #12452#12531#12509#12540#12488#12377#12427#12501#12457#12523#12480#12434#36984#25246#12375#12390#12367#12384#12373#12356
    WordWrap = True
  end
  object Label3: TLabel
    Left = 48
    Top = 96
    Width = 122
    Height = 12
    Caption = #12371#12398#31354#38291#12399#27671#12395#12377#12427#12394#12290
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 8
    Width = 241
    Height = 65
    Caption = #12458#12503#12471#12519#12531
    TabOrder = 3
    object chkAddToRootFolder: TCheckBox
      Left = 8
      Top = 16
      Width = 225
      Height = 17
      Caption = #12523#12540#12488#12501#12457#12523#12480#12395#36861#21152#12377#12427
      TabOrder = 0
    end
    object chkDetectWebPanel: TCheckBox
      Left = 8
      Top = 40
      Width = 225
      Height = 17
      Caption = 'Fx'#12398'WebPanel'#12458#12503#12471#12519#12531#12418#12452#12531#12509#12540#12488#12377#12427
      Enabled = False
      TabOrder = 1
    end
  end
  object btnImport: TButton
    Left = 8
    Top = 184
    Width = 97
    Height = 21
    Caption = #12452#12531#12509#12540#12488#38283#22987
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 112
    Top = 184
    Width = 97
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object RadioGroup1: TRadioGroup
    Left = 216
    Top = 80
    Width = 241
    Height = 81
    Caption = 'TBE'#12458#12503#12471#12519#12531#65288#29694#27573#38542#12391#12399#28961#21177#65289
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'URL'#24773#22577#20197#22806#24341#12365#32153#12364#12394#12356)
    TabOrder = 4
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 40
    Width = 201
    Height = 137
    HideSelection = False
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 213
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object Label4: TLabel
      Left = 208
      Top = 116
      Width = 42
      Height = 12
      Caption = #35299#26512#20013'...'
    end
    object ProgressBar1: TProgressBar
      Left = 44
      Top = 88
      Width = 381
      Height = 17
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Netscape'#12502#12483#12463#12510#12540#12463'(bookmarks.html)|bookmarks.html|HTML(*.html)|*.htm' +
      'l'
    Title = #12502#12483#12463#12510#12540#12463#12398#12501#12449#12452#12523#12434#36984#25246#12375#12390#12367#12384#12373#12356
    Left = 176
    Top = 8
  end
end
