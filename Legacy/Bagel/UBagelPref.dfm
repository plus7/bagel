object BagelSettingForm: TBagelSettingForm
  Left = 217
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Bagel'#35373#23450
  ClientHeight = 406
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object TreeView1: TTreeView
    Left = 8
    Top = 8
    Width = 157
    Height = 345
    AutoExpand = True
    HotTrack = True
    Images = ImageList1
    Indent = 19
    ReadOnly = True
    ShowButtons = False
    ShowLines = False
    TabOrder = 0
    OnChange = TreeView1Change
    OnClick = TreeView1Click
    OnEditing = TreeView1Editing
    OnKeyDown = TreeView1KeyDown
    Items.NodeData = {
      010D0000001D0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000268512C82250000000100000001000000FFFFFFFFFFFFFFFF000000000000
      000006BB30AD30E530EA30C630A3301D000000FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000000000000002BF30D630270000000300000003000000FFFFFFFF
      FFFFFFFF000000000000000007B330F330C630F330C4303652A15F2100000004
      00000004000000FFFFFFFFFFFFFFFF000000000000000004D630E930A630B630
      23000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000005B530A4
      30C930D030FC30250000000600000006000000FFFFFFFFFFFFFFFF0000000000
      00000006D730E930A430D030B730FC30230000000700000007000000FFFFFFFF
      FFFFFFFF000000000000000005C430FC30EB30D030FC30210000000800000008
      000000FFFFFFFFFFFFFFFF000000000000000004E130CB30E530FC3023000000
      0900000009000000FFFFFFFFFFFFFFFF000000000000000005AD30FC30DC30FC
      30C9301F0000000A0000000A000000FFFFFFFFFFFFFFFF000000000000000003
      DE30A630B9301D0000000B0000000B000000FFFFFFFFFFFFFFFF000000000000
      0000021C69227D210000000C0000000C000000FFFFFFFFFFFFFFFF0000000000
      00000004E162355F5F6AFD80}
  end
  object Button1: TButton
    Left = 472
    Top = 380
    Width = 89
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 380
    Width = 89
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = Button2Click
  end
  object PageControl1: TPageControl
    Tag = 1
    Left = 172
    Top = 4
    Width = 489
    Height = 361
    ActivePage = TabSheet2
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    Style = tsFlatButtons
    TabOrder = 3
    TabStop = False
    object GeneralSheet: TTabSheet
      Caption = #20840#33324
      ImageIndex = 1
      TabVisible = False
      object Label15: TLabel
        Left = 8
        Top = 59
        Width = 35
        Height = 12
        Caption = #12507#12540#12512
      end
      object Label27: TLabel
        Left = 16
        Top = 288
        Width = 60
        Height = 12
        Caption = #26368#22823#34920#31034#25968
      end
      object Label45: TLabel
        Left = 144
        Top = 288
        Width = 48
        Height = 12
        Caption = #34920#31034#24418#24335
      end
      object Label25: TLabel
        Left = 16
        Top = 332
        Width = 60
        Height = 12
        Caption = #26368#22823#34920#31034#25968
      end
      object Label46: TLabel
        Left = 8
        Top = 216
        Width = 120
        Height = 12
        Caption = #33258#21205#26356#26032#12398#12518#12540#12470#35373#23450
      end
      object Label47: TLabel
        Left = 184
        Top = 216
        Width = 12
        Height = 12
        Caption = #31186
      end
      object Label26: TLabel
        Left = 308
        Top = 112
        Width = 99
        Height = 12
        Caption = #8251#26032#35215#12479#12502#12424#12426#26377#21177
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #20840#33324
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 32
        Width = 417
        Height = 17
        Caption = #35079#25968#36215#21205#12434#35377#21487#12375#12394#12356'(Bagel'#12391#12399#35079#25968#36215#21205#12391#12365#12427#12424#12358#12395#12377#12427#20104#23450#12399#12354#12426#12414#12379#12435')'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 1
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 84
        Width = 273
        Height = 101
        Caption = #20840#30011#38754#34920#31034
        TabOrder = 2
        object chkKioskAddr: TCheckBox
          Left = 8
          Top = 16
          Width = 105
          Height = 17
          Caption = #12450#12489#12524#12473#12496#12540#34920#31034
          TabOrder = 0
        end
        object chkKioskTabbar: TCheckBox
          Left = 8
          Top = 36
          Width = 97
          Height = 17
          Caption = #12479#12502#12496#12540#34920#31034
          TabOrder = 1
        end
        object chkKioskSearchbar: TCheckBox
          Left = 8
          Top = 56
          Width = 97
          Height = 17
          Caption = #26908#32034#12496#12540#34920#31034
          TabOrder = 2
        end
        object chkKioskStatusBar: TCheckBox
          Left = 136
          Top = 16
          Width = 129
          Height = 17
          Caption = #12473#12486#12540#12479#12473#12496#12540#34920#31034
          TabOrder = 3
        end
        object chkKioskLinkbar: TCheckBox
          Left = 136
          Top = 36
          Width = 97
          Height = 17
          Caption = #12522#12531#12463#12496#12540#34920#31034
          TabOrder = 4
        end
        object chkKioskMainbar: TCheckBox
          Left = 136
          Top = 56
          Width = 113
          Height = 17
          Caption = #27161#28310#12398#12508#12479#12531#34920#31034
          TabOrder = 5
        end
        object chkKioskMenubar: TCheckBox
          Left = 8
          Top = 76
          Width = 113
          Height = 17
          Caption = #12513#12491#12517#12540#12496#12540#34920#31034
          TabOrder = 6
        end
      end
      object edtHome: TEdit
        Left = 48
        Top = 56
        Width = 281
        Height = 20
        TabOrder = 3
      end
      object chkDontShowAppname: TCheckBox
        Left = 8
        Top = 192
        Width = 253
        Height = 17
        Caption = #12479#12452#12488#12523#12496#12540#12395#12450#12503#12522#12465#12540#12471#12519#12531#21517#12434#34920#31034#12375#12394#12356
        TabOrder = 4
      end
      object edtRecentCMax: TEdit
        Left = 84
        Top = 284
        Width = 45
        Height = 20
        TabOrder = 5
      end
      object StaticText1: TStaticText
        Left = 12
        Top = 264
        Width = 101
        Height = 16
        BevelInner = bvSpace
        BevelKind = bkSoft
        Caption = #26368#36817#38281#12376#12383#12501#12449#12452#12523
        TabOrder = 6
      end
      object StaticText2: TStaticText
        Left = 12
        Top = 308
        Width = 103
        Height = 16
        BevelInner = bvSpace
        BevelKind = bkSoft
        Caption = #26368#36817#38283#12356#12383#12501#12449#12452#12523
        TabOrder = 7
      end
      object edtRecentOMax: TEdit
        Left = 84
        Top = 328
        Width = 45
        Height = 20
        TabOrder = 8
      end
      object cboRecentClosedMenuStyle: TComboBox
        Left = 196
        Top = 284
        Width = 97
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 9
        Items.Strings = (
          'URL'
          #12479#12452#12488#12523
          #12479#12452#12488#12523' - URL')
      end
      object edtUsrAutoReload: TEdit
        Left = 132
        Top = 212
        Width = 45
        Height = 20
        TabOrder = 10
      end
      object chkConsiderTarget: TCheckBox
        Left = 288
        Top = 92
        Width = 141
        Height = 17
        Caption = #12479#12540#12466#12483#12488#21517#12434#32771#24942#12377#12427
        TabOrder = 11
      end
      object chkAutoSaveTablist: TCheckBox
        Left = 8
        Top = 236
        Width = 217
        Height = 17
        Caption = #29366#24907#12434'Default.bbg'#12395#23450#26399#30340#12395#20445#23384#12377#12427
        TabOrder = 12
      end
    end
    object BagelFontSheet: TTabSheet
      Caption = #12501#12457#12531#12488
      ImageIndex = 46
      TabVisible = False
      object Label74: TLabel
        Left = 8
        Top = 32
        Width = 278
        Height = 12
        Caption = #27425#12398#12501#12457#12531#12488#12434#12487#12501#12457#12523#12488#12395#19978#26360#12365#12375#12390#29992#12356#12427'('#35201#20877#36215#21205')'
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Bagel'#12398#12501#12457#12531#12488
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkOverrideToolFont: TCheckBox
        Left = 16
        Top = 76
        Width = 89
        Height = 17
        Caption = #12484#12540#12523#12496#12540
        TabOrder = 1
      end
      object chkOverrideSideFont: TCheckBox
        Left = 16
        Top = 100
        Width = 85
        Height = 17
        Caption = #12469#12452#12489#12496#12540
        TabOrder = 2
      end
      object chkOverrideMenuFont: TCheckBox
        Left = 16
        Top = 52
        Width = 93
        Height = 17
        Caption = #12513#12491#12517#12540#12496#12540
        TabOrder = 3
      end
      object cboMenubarFont: TComboBox
        Left = 108
        Top = 52
        Width = 145
        Height = 20
        ItemHeight = 12
        TabOrder = 4
        Text = 'cboMenubarFont'
      end
      object cboToolbarFont: TComboBox
        Left = 108
        Top = 76
        Width = 145
        Height = 20
        ItemHeight = 12
        TabOrder = 5
        Text = 'cboToolbarFont'
      end
      object cboSidebarFont: TComboBox
        Left = 108
        Top = 100
        Width = 145
        Height = 20
        ItemHeight = 12
        TabOrder = 6
        Text = 'cboSidebarFont'
      end
    end
    object AutoExecSheet: TTabSheet
      Caption = #38283#22987#26178#20966#29702
      ImageIndex = 14
      TabVisible = False
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #38283#22987#26178#20966#29702
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkExecScriptOnStart: TCheckBox
        Left = 8
        Top = 164
        Width = 161
        Height = 17
        Caption = #27425#12398#12473#12463#12522#12503#12488#31561#12434#23455#34892
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 1
      end
      object rgStartupTabBehavior: TRadioGroup
        Left = 4
        Top = 32
        Width = 233
        Height = 125
        Caption = #12479#12502
        Items.Strings = (
          #20309#12418#38283#12363#12394#12356
          #31354#30333#12506#12540#12472
          #12507#12540#12512#12506#12540#12472
          #21069#22238#38283#12356#12390#12356#12383#12479#12502
          #12479#12502#12464#12523#12540#12503)
        TabOrder = 2
      end
      object edtStartupGroupFilename: TEdit
        Left = 100
        Top = 132
        Width = 85
        Height = 20
        ReadOnly = True
        TabOrder = 3
      end
      object chkRestoreSH: TCheckBox
        Left = 136
        Top = 112
        Width = 69
        Height = 17
        Caption = #25147#12427#23653#27508
        TabOrder = 4
      end
      object GroupBox17: TGroupBox
        Left = 244
        Top = 32
        Width = 233
        Height = 125
        Caption = #12496#12483#12463#12450#12483#12503
        TabOrder = 5
        object Label75: TLabel
          Left = 40
          Top = 20
          Width = 108
          Height = 12
          Caption = #19990#20195#12496#12483#12463#12450#12483#12503#12377#12427
        end
        object chkBUGeckoPrefOnStart: TCheckBox
          Left = 8
          Top = 92
          Width = 189
          Height = 17
          Caption = 'Gecko'#12398#35373#23450#12434#12496#12483#12463#12450#12483#12503#12377#12427
          TabOrder = 0
        end
        object chkBUPrefOnStart: TCheckBox
          Left = 8
          Top = 68
          Width = 209
          Height = 17
          Caption = #35373#23450#12501#12449#12452#12523#12434#19968#24335#12496#12483#12463#12450#12483#12503#12377#12427
          TabOrder = 1
        end
        object chkBUBookmarkOnStart: TCheckBox
          Left = 8
          Top = 44
          Width = 181
          Height = 17
          Caption = #12502#12483#12463#12510#12540#12463#12434#12496#12483#12463#12450#12483#12503#12377#12427
          TabOrder = 2
        end
        object edtBUGeneration: TEdit
          Left = 8
          Top = 16
          Width = 29
          Height = 20
          TabOrder = 3
        end
      end
      object lstStartupScript: TListBox
        Left = 4
        Top = 212
        Width = 157
        Height = 93
        ItemHeight = 12
        TabOrder = 6
      end
      object btnStartupFileSelector: TButton
        Left = 188
        Top = 132
        Width = 21
        Height = 17
        Caption = '...'
        TabOrder = 7
        OnClick = btnStartupFileSelectorClick
      end
      object btnAddStupScr: TButton
        Left = 4
        Top = 184
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 8
        OnClick = btnAddStupScrClick
      end
      object btnDelStupScr: TButton
        Left = 84
        Top = 184
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 9
        OnClick = btnDelStupScrClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #32066#20102#26178#20966#29702
      ImageIndex = 24
      TabVisible = False
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #32066#20102#26178#20966#29702
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkDelRecClosed: TCheckBox
        Left = 8
        Top = 36
        Width = 145
        Height = 17
        Caption = #26368#36817#38281#12376#12383#12506#12540#12472#12434#21066#38500
        TabOrder = 1
      end
      object chkDelRecOpened: TCheckBox
        Left = 8
        Top = 56
        Width = 145
        Height = 17
        Caption = #26368#36817#38283#12356#12383#12506#12540#12472#12434#21066#38500
        TabOrder = 2
      end
      object chkDelAddress: TCheckBox
        Left = 8
        Top = 76
        Width = 145
        Height = 17
        Caption = #12450#12489#12524#12473#12496#12540#23653#27508#12398#21066#38500
        TabOrder = 3
      end
      object chkDelSearch: TCheckBox
        Left = 8
        Top = 96
        Width = 129
        Height = 17
        Caption = #26908#32034#12496#12540#23653#27508#12398#21066#38500
        TabOrder = 4
      end
      object chkExecScriptOnShutdown: TCheckBox
        Left = 8
        Top = 120
        Width = 145
        Height = 17
        Caption = #27425#12398#12473#12463#12522#12503#12488#31561#12434#23455#34892
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 5
      end
      object chkDelCookie: TCheckBox
        Left = 176
        Top = 36
        Width = 97
        Height = 17
        Caption = 'Cookie'#12434#21066#38500
        TabOrder = 6
      end
      object chkDelHistory: TCheckBox
        Left = 176
        Top = 56
        Width = 97
        Height = 17
        Caption = #23653#27508#12434#21066#38500
        TabOrder = 7
      end
      object chkDelCache: TCheckBox
        Left = 176
        Top = 76
        Width = 113
        Height = 17
        Caption = #12461#12515#12483#12471#12517#12434#21066#38500
        TabOrder = 8
      end
      object lstShutdownScript: TListBox
        Left = 4
        Top = 172
        Width = 157
        Height = 89
        ItemHeight = 12
        TabOrder = 9
      end
      object btnDelStdwnScr: TButton
        Left = 84
        Top = 144
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 10
        OnClick = btnDelStdwnScrClick
      end
      object btnAddStdwnScr: TButton
        Left = 4
        Top = 144
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 11
        OnClick = btnAddStdwnScrClick
      end
    end
    object ConfirmSheet: TTabSheet
      Caption = #30906#35469
      ImageIndex = 15
      TabVisible = False
      object Panel16: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #30906#35469
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkCnfAppQuit: TCheckBox
        Left = 4
        Top = 32
        Width = 129
        Height = 17
        Caption = 'Bagel'#12434#32066#20102#12377#12427#12392#12365
        TabOrder = 1
      end
      object chkCnfCloseAll: TCheckBox
        Left = 4
        Top = 52
        Width = 105
        Height = 17
        Caption = #12300#20840#12390#38281#12376#12427#12301#12392#12365
        TabOrder = 2
      end
      object chkCnfCloseOther: TCheckBox
        Left = 4
        Top = 72
        Width = 145
        Height = 17
        Caption = #12300#12371#12428#20197#22806#12434#38281#12376#12427#12301#12392#12365
        TabOrder = 3
      end
      object chkBkmkDel: TCheckBox
        Left = 4
        Top = 92
        Width = 137
        Height = 17
        Caption = #12502#12483#12463#12510#12540#12463#12434#28040#12377#12392#12365
        TabOrder = 4
      end
      object chkOpeningManyItems: TCheckBox
        Left = 4
        Top = 112
        Width = 313
        Height = 17
        Caption = #12300#12371#12428#12425#20840#12390#12434#38283#12367#12301#12391#38283#12367#25968#12364#12288#12288#12288#12288#12288#12288#20197#19978#12398#12392#12365
        TabOrder = 5
      end
      object edtWarnItemCount: TEdit
        Left = 180
        Top = 112
        Width = 33
        Height = 20
        TabOrder = 6
        Text = '30'
      end
    end
    object AccSheet: TTabSheet
      Caption = #38306#36899#20184#12369
      ImageIndex = 18
      TabVisible = False
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #38306#36899#20184#12369
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chlAccFiletype: TCheckListBox
        Left = 8
        Top = 64
        Width = 465
        Height = 105
        OnClickCheck = chlAccFiletypeClickCheck
        ItemHeight = 12
        Items.Strings = (
          'html'
          'xhtml'
          'xml'
          'xul'
          'png'
          'jpeg'
          'gif'
          'xbm')
        TabOrder = 1
      end
      object chlAccProtocol: TCheckListBox
        Left = 8
        Top = 208
        Width = 465
        Height = 105
        OnClickCheck = chlAccProtocolClickCheck
        ItemHeight = 12
        Items.Strings = (
          'http'
          'https'
          'ftp')
        TabOrder = 2
      end
      object StaticText12: TStaticText
        Left = 8
        Top = 40
        Width = 45
        Height = 16
        BevelInner = bvNone
        BevelKind = bkSoft
        Caption = #12501#12449#12452#12523
        TabOrder = 3
      end
      object StaticText13: TStaticText
        Left = 8
        Top = 184
        Width = 55
        Height = 16
        BevelInner = bvNone
        BevelKind = bkSoft
        Caption = #12503#12525#12488#12467#12523
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Tag = 1
      Caption = #20840#33324
      ImageIndex = 25
      TabVisible = False
      object Panel31: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12475#12461#12517#12522#12486#12451#20840#33324
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkShowImage: TCheckBox
        Left = 8
        Top = 36
        Width = 97
        Height = 17
        Caption = #30011#20687#12434#34920#31034#12377#12427
        TabOrder = 1
        OnClick = chkShowImageClick
      end
      object chkOnlyOrigServer: TCheckBox
        Left = 20
        Top = 56
        Width = 209
        Height = 17
        Caption = #21516#12376#12469#12452#12488#12363#12425#12398#30011#20687#12398#12415#35501#12415#36796#12416
        TabOrder = 2
      end
      object chkEnableJava: TCheckBox
        Left = 8
        Top = 76
        Width = 105
        Height = 17
        Caption = 'Java'#12434#20351#29992#12377#12427
        TabOrder = 3
      end
      object chkEnableJS: TCheckBox
        Left = 8
        Top = 96
        Width = 133
        Height = 17
        Caption = 'JavaScript'#12434#20351#29992#12377#12427
        TabOrder = 4
      end
      object chkDomPopupDuringLoad: TCheckBox
        Left = 8
        Top = 116
        Width = 209
        Height = 17
        Caption = #12509#12483#12503#12450#12483#12503#12454#12451#12531#12489#12454#12434#12502#12525#12483#12463#12377#12427
        TabOrder = 5
      end
    end
    object TabSheet4: TTabSheet
      Tag = 1
      Caption = 'JavaScript'
      ImageIndex = 26
      TabVisible = False
      object Label17: TLabel
        Left = 12
        Top = 132
        Width = 192
        Height = 12
        Caption = #12473#12463#12522#12503#12488#12398#24375#21046#32066#20102#26178#38291#65288#31186#12391#25351#23450#65289
      end
      object Label31: TLabel
        Left = 12
        Top = 176
        Width = 230
        Height = 12
        Caption = #12509#12483#12503#12450#12483#12503#12364#28961#21177#12395#12394#12427#26399#38291#65288#12511#12522#31186#12391#25351#23450#65289
      end
      object Label32: TLabel
        Left = 12
        Top = 220
        Width = 164
        Height = 12
        Caption = #19968#24230#12395#38283#12367#12509#12483#12503#12450#12483#12503#12398#26368#22823#25968
      end
      object Panel30: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'JavaScript'
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtScriptMaxRunTime: TEdit
        Left = 12
        Top = 148
        Width = 57
        Height = 20
        TabOrder = 1
      end
      object edtPopupDisableDelay: TEdit
        Left = 12
        Top = 192
        Width = 57
        Height = 20
        TabOrder = 2
      end
      object edtPopupmax: TEdit
        Left = 12
        Top = 236
        Width = 57
        Height = 20
        TabOrder = 3
      end
      object GroupBox8: TGroupBox
        Left = 4
        Top = 32
        Width = 465
        Height = 89
        Caption = #35377#21487#12377#12427#21205#20316
        TabOrder = 4
        object chkDomAllowClose: TCheckBox
          Left = 12
          Top = 20
          Width = 113
          Height = 17
          Caption = #12454#12451#12531#12489#12454#12434#38281#12376#12427
          TabOrder = 0
        end
        object chkDomAllowFlip: TCheckBox
          Left = 12
          Top = 40
          Width = 201
          Height = 17
          Caption = #12454#12451#12531#12489#12454#12398#12501#12457#12540#12459#12473#12434#20999#12426#26367#12360#12427
          TabOrder = 1
        end
        object chkDomContextmenu: TCheckBox
          Left = 12
          Top = 60
          Width = 177
          Height = 17
          Caption = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540#12398#28961#21177#21270
          TabOrder = 2
        end
        object chkDomChangeStatustext: TCheckBox
          Left = 232
          Top = 20
          Width = 189
          Height = 17
          Caption = #12473#12486#12540#12479#12473#12496#12540#12398#12486#12461#12473#12488#12398#22793#26356
          TabOrder = 3
        end
        object chkDomHideScrollbar: TCheckBox
          Left = 232
          Top = 40
          Width = 133
          Height = 17
          Caption = #12473#12463#12525#12540#12523#12496#12540#12434#38560#12377
          TabOrder = 4
        end
        object chkDomChangeImgSrc: TCheckBox
          Left = 232
          Top = 60
          Width = 169
          Height = 17
          Caption = #30011#20687#12434#21029#12398#12418#12398#12395#32622#12365#25563#12360#12427
          TabOrder = 5
        end
      end
    end
    object TabSheet5: TTabSheet
      Tag = 1
      Caption = #12503#12525#12488#12467#12523#21046#24481
      ImageIndex = 27
      TabVisible = False
      object GroupBox6: TGroupBox
        Left = 8
        Top = 32
        Width = 161
        Height = 113
        Caption = #25233#27490#12377#12427#12503#12525#12488#12467#12523
        TabOrder = 0
        object clSuppressProtocol: TCheckListBox
          Left = 8
          Top = 16
          Width = 145
          Height = 89
          ItemHeight = 12
          Items.Strings = (
            'mailto:'
            'telnet:'
            'rlogin:'
            'tn3270:'
            'news:'
            'pnm:'
            'mms:')
          TabOrder = 0
        end
      end
      object Panel26: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #20840#33324
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet: TTabSheet
      Tag = 2
      Caption = #12479#12502#12496#12540
      ImageIndex = 11
      TabVisible = False
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12479#12502
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 168
        Width = 241
        Height = 177
        Caption = #35501#12415#12371#12415#20301#32622#35373#23450
        TabOrder = 1
        object lbOpenMode: TListBox
          Left = 16
          Top = 24
          Width = 89
          Height = 137
          ItemHeight = 12
          Items.Strings = (
            #12509#12483#12503#12450#12483#12503
            #12502#12483#12463#12510#12540#12463
            #23653#27508
            #12450#12489#12524#12473#12496#12540
            #26908#32034#12496#12540
            #12477#12540#12473#34920#31034
            #20013#12463#12522#12483#12463
            #12463#12522#12483#12503#12508#12540#12489)
          TabOrder = 0
          OnClick = lbOpenModeClick
        end
        object chkNewTab: TCheckBox
          Left = 120
          Top = 24
          Width = 97
          Height = 17
          Caption = #26032#35215#12479#12502
          TabOrder = 1
          OnClick = TabOpenModeChange
        end
        object rgTabAddPos: TRadioGroup
          Left = 120
          Top = 64
          Width = 105
          Height = 97
          Caption = #12479#12502#36861#21152#20301#32622
          Items.Strings = (
            #21491#31471
            #24038#31471
            #21491#38563
            #24038#38563)
          TabOrder = 2
          OnClick = TabOpenModeChange
        end
        object chkBgTab: TCheckBox
          Left = 120
          Top = 40
          Width = 97
          Height = 17
          Caption = #32972#26223#12479#12502
          TabOrder = 3
          OnClick = TabOpenModeChange
        end
      end
      object GroupBox13: TGroupBox
        Left = 248
        Top = 32
        Width = 225
        Height = 141
        Caption = #34920#31034
        TabOrder = 2
        object Label10: TLabel
          Left = 16
          Top = 21
          Width = 141
          Height = 12
          Caption = #12479#12502#25968#21046#38480#65288'0'#12398#12392#12365#28961#21046#38480#65289
        end
        object Label19: TLabel
          Left = 64
          Top = 45
          Width = 92
          Height = 12
          Caption = #12479#12502#12398#26368#22823#25991#23383#25968
        end
        object Label24: TLabel
          Left = 16
          Top = 120
          Width = 102
          Height = 12
          Caption = #12479#12502#24133'(0'#12399#25351#23450#12394#12375')'
        end
        object chkTabMultiline: TCheckBox
          Left = 16
          Top = 64
          Width = 97
          Height = 17
          Caption = #35079#25968#34892#34920#31034
          TabOrder = 0
        end
        object edtMaxTab: TEdit
          Left = 160
          Top = 17
          Width = 41
          Height = 20
          TabOrder = 1
        end
        object chkViewIsRead: TCheckBox
          Left = 16
          Top = 80
          Width = 161
          Height = 17
          Caption = #26410#34920#31034#12539#34920#31034#28168#12415#12434#33394#20998#12369
          TabOrder = 2
        end
        object edtTabMaxStr: TEdit
          Left = 160
          Top = 40
          Width = 41
          Height = 20
          TabOrder = 3
        end
        object edtTabWidth: TEdit
          Left = 120
          Top = 116
          Width = 41
          Height = 20
          TabOrder = 4
        end
        object chkIsFlatButtonTab: TCheckBox
          Left = 16
          Top = 96
          Width = 169
          Height = 17
          Caption = #12501#12521#12483#12488#12508#12479#12531#12473#12479#12452#12523#12395#12377#12427
          TabOrder = 5
        end
      end
      object GroupBox14: TGroupBox
        Left = 0
        Top = 32
        Width = 241
        Height = 129
        Caption = #12510#12454#12473#25805#20316
        TabOrder = 3
        object Label20: TLabel
          Left = 30
          Top = 24
          Width = 50
          Height = 12
          Caption = #21491#12463#12522#12483#12463
        end
        object Label21: TLabel
          Left = 8
          Top = 48
          Width = 72
          Height = 12
          Caption = #12480#12502#12523#12463#12522#12483#12463
        end
        object Label22: TLabel
          Left = 29
          Top = 72
          Width = 50
          Height = 12
          Caption = #20013#12463#12522#12483#12463
        end
        object chkEnableWheelTabChange: TCheckBox
          Left = 8
          Top = 96
          Width = 153
          Height = 17
          Caption = #12510#12454#12473#12507#12452#12540#12523#12391#20999#12426#26367#12360
          TabOrder = 0
        end
        object stTabRightClick: TStaticText
          Left = 88
          Top = 20
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stTabRightClick'
          TabOrder = 1
        end
        object Button14: TButton
          Left = 212
          Top = 20
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = Button14Click
        end
        object stTabDblClick: TStaticText
          Left = 88
          Top = 44
          Width = 125
          Height = 16
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stTabDblClick'
          TabOrder = 3
        end
        object stTabMdlClick: TStaticText
          Left = 88
          Top = 68
          Width = 125
          Height = 16
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stTabMdlClick'
          TabOrder = 4
        end
        object Button15: TButton
          Left = 212
          Top = 44
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 212
          Top = 68
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = Button16Click
        end
      end
      object GroupBox15: TGroupBox
        Left = 248
        Top = 180
        Width = 225
        Height = 73
        Caption = #12479#12502#38281#12376#35373#23450
        TabOrder = 4
        object Label16: TLabel
          Left = 16
          Top = 24
          Width = 132
          Height = 12
          Caption = #12450#12463#12486#12451#12502#12479#12502#12434#38281#12376#12383#12392#12365
        end
        object Label23: TLabel
          Left = 136
          Top = 40
          Width = 57
          Height = 12
          Caption = #12395#31227#21205#12377#12427
        end
        object cboWhenCloseChoose: TComboBox
          Left = 16
          Top = 36
          Width = 113
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = #12450#12463#12486#12451#12502#12398#21491
          Items.Strings = (
            #12450#12463#12486#12451#12502#12398#21491
            #12450#12463#12486#12451#12502#12398#24038
            'MDI'#27161#28310)
        end
      end
    end
    object NewTabSheet: TTabSheet
      Tag = 2
      Caption = #26032#35215#20316#25104
      ImageIndex = 17
      TabVisible = False
      object Panel18: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #26032#35215
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object NewTabGroup: TRadioGroup
        Left = 0
        Top = 32
        Width = 233
        Height = 85
        Caption = #26032#35215#12479#12502#12434#38283#12356#12383#12392#12365#12399
        Items.Strings = (
          'about:blank('#31354#30333')'
          #29694#22312#12398#12479#12502
          #12507#12540#12512)
        TabOrder = 1
        OnClick = NewTabGroupClick
      end
      object chkTakeOverSession: TCheckBox
        Left = 104
        Top = 72
        Width = 105
        Height = 17
        Caption = #23653#27508#12418#24341#12365#32153#12368
        TabOrder = 2
      end
      object GroupBox11: TGroupBox
        Left = 0
        Top = 128
        Width = 233
        Height = 129
        Caption = #12475#12461#12517#12522#12486#12451#12398#21021#26399#35373#23450
        TabOrder = 3
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
        object chkAllowMetaRedirect: TCheckBox
          Left = 12
          Top = 40
          Width = 201
          Height = 17
          Caption = 'Meta'#35201#32032#12395#12424#12427#12522#12480#12452#12524#12463#12488#12434#35377#21487
          TabOrder = 3
        end
        object chkAllowJS: TCheckBox
          Left = 12
          Top = 20
          Width = 145
          Height = 17
          Caption = 'JavaScript'#12434#26377#21177#12395#12377#12427
          TabOrder = 4
        end
      end
    end
    object TabSheet7: TTabSheet
      Tag = 2
      Caption = #32153#25215
      ImageIndex = 29
      TabVisible = False
      object Panel28: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #32153#25215
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkInheritDocShell: TCheckBox
        Left = 8
        Top = 36
        Width = 145
        Height = 17
        Caption = #12475#12461#12517#12522#12486#12451#12434#32153#25215#12377#12427
        TabOrder = 1
      end
      object chkInheritAutoHighlight: TCheckBox
        Left = 8
        Top = 56
        Width = 165
        Height = 17
        Caption = #33258#21205#12495#12452#12521#12452#12488#12434#32153#25215#12377#12427
        TabOrder = 2
      end
    end
    object ImageSheet: TTabSheet
      Tag = 3
      Caption = #30011#20687#21046#24481
      ImageIndex = 9
      TabVisible = False
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #30011#20687
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DenyImgList: TListBox
        Left = 0
        Top = 60
        Width = 473
        Height = 277
        ItemHeight = 12
        TabOrder = 1
      end
      object DenyImgEdit: TEdit
        Left = 0
        Top = 32
        Width = 305
        Height = 20
        TabOrder = 2
      end
      object AddDenyImg: TButton
        Left = 312
        Top = 32
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 3
        OnClick = AddDenyImgClick
      end
      object DelDenyImg: TButton
        Left = 392
        Top = 32
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 4
        OnClick = DelDenyImgClick
      end
    end
    object PopupSheet: TTabSheet
      Tag = 3
      Caption = #12509#12483#12503#12450#12483#12503#21046#24481
      ImageIndex = 8
      TabVisible = False
      object Label12: TLabel
        Left = 8
        Top = 32
        Width = 79
        Height = 12
        Caption = #12507#12527#12452#12488#12522#12473#12488#12395
      end
      object Label13: TLabel
        Left = 400
        Top = 32
        Width = 10
        Height = 12
        Caption = #12434
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12509#12483#12503#12450#12483#12503#21046#24481
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object AllowPopupList: TListBox
        Left = 0
        Top = 84
        Width = 473
        Height = 253
        ItemHeight = 12
        TabOrder = 1
      end
      object AllowPopupEdit: TEdit
        Left = 96
        Top = 32
        Width = 297
        Height = 20
        TabOrder = 2
      end
      object AddAllowPopup: TButton
        Left = 312
        Top = 56
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 3
        OnClick = AddAllowPopupClick
      end
      object DelAllowPopup: TButton
        Left = 392
        Top = 56
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 4
        OnClick = DelAllowPopupClick
      end
    end
    object AdblockSheet: TTabSheet
      Tag = 3
      Caption = #24195#21578#12502#12525#12483#12463
      ImageIndex = 30
      TabVisible = False
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #24195#21578#12502#12525#12483#12463
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object btnAdblockDel: TButton
        Left = 316
        Top = 64
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 1
        OnClick = btnAdblockDelClick
      end
      object btnAdblockAdd: TButton
        Left = 148
        Top = 64
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 2
        OnClick = btnAdblockAddClick
      end
      object edtAdblockPattern: TEdit
        Left = 12
        Top = 36
        Width = 349
        Height = 20
        TabOrder = 3
      end
      object lvAdblock: TListView
        Left = 12
        Top = 96
        Width = 465
        Height = 253
        Columns = <
          item
            Caption = #25991#23383#21015
            Width = 300
          end
          item
            Caption = #26465#20214
            Width = 75
          end>
        HideSelection = False
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
        OnEditing = lvAdblockEditing
        OnSelectItem = lvAdblockSelectItem
      end
      object Button18: TButton
        Left = 400
        Top = 64
        Width = 75
        Height = 21
        Caption = #12452#12531#12509#12540#12488
        Enabled = False
        TabOrder = 5
      end
      object cboAdblockCondition: TComboBox
        Left = 368
        Top = 36
        Width = 109
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 6
        Items.Strings = (
          #37096#20998#19968#33268
          #23436#20840#19968#33268
          #21069#26041#19968#33268
          #24460#26041#19968#33268
          #27491#35215#34920#29694)
      end
      object btnAdblockOverride: TButton
        Left = 232
        Top = 64
        Width = 75
        Height = 21
        Caption = #19978#26360#12365
        TabOrder = 7
        OnClick = btnAdblockOverrideClick
      end
    end
    object UserCSSSheet: TTabSheet
      Tag = 3
      Caption = #12518#12540#12470#12540'CSS'
      ImageIndex = 13
      TabVisible = False
      object Label6: TLabel
        Left = 8
        Top = 32
        Width = 236
        Height = 12
        Caption = #12518#12540#12470#12540'CSS(UserContent.css)'#12434#32232#38598#12375#12414#12377#12290
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12518#12540#12470#12540'CSS'
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object UserCssMemo: TMemo
        Left = 8
        Top = 48
        Width = 465
        Height = 261
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object btnSaveUserContent: TButton
        Left = 8
        Top = 316
        Width = 75
        Height = 21
        Caption = #20445#23384
        TabOrder = 2
        OnClick = btnSaveUserContentClick
      end
    end
    object TabSheet9: TTabSheet
      Tag = 3
      Caption = 'URL'#12450#12463#12471#12519#12531#12539#25233#27490
      ImageIndex = 31
      TabVisible = False
      object Label37: TLabel
        Left = 8
        Top = 224
        Width = 24
        Height = 12
        Caption = #25233#27490
      end
      object Label7: TLabel
        Left = 4
        Top = 60
        Width = 24
        Height = 12
        Caption = #31278#39006
      end
      object Label8: TLabel
        Left = 4
        Top = 36
        Width = 24
        Height = 12
        Caption = #26465#20214
      end
      object Label53: TLabel
        Left = 144
        Top = 60
        Width = 52
        Height = 12
        Caption = #12497#12521#12513#12540#12479
      end
      object RejURL: TEdit
        Left = 8
        Top = 240
        Width = 305
        Height = 20
        TabOrder = 0
      end
      object AddRejURL: TButton
        Left = 324
        Top = 240
        Width = 73
        Height = 21
        Caption = #36861#21152
        TabOrder = 1
        OnClick = AddRejURLClick
      end
      object DelRejURL: TButton
        Left = 404
        Top = 240
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 2
        OnClick = DelRejURLClick
      end
      object RejURLList: TListBox
        Left = 8
        Top = 268
        Width = 473
        Height = 77
        ItemHeight = 12
        TabOrder = 3
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'URI'#12450#12463#12471#12519#12531#12539#25233#27490
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object btnURIActionDel: TButton
        Left = 404
        Top = 80
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 5
        OnClick = btnURIActionDelClick
      end
      object lvURIAction: TListView
        Left = 8
        Top = 108
        Width = 469
        Height = 109
        Columns = <
          item
            Caption = #26465#20214
            Width = 300
          end
          item
            Caption = #31278#39006
            Width = 75
          end>
        HideSelection = False
        RowSelect = True
        TabOrder = 6
        ViewStyle = vsReport
        OnEditing = lvURIActionEditing
        OnSelectItem = lvURIActionSelectItem
      end
      object btnURIActionAdd: TButton
        Left = 236
        Top = 80
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 7
        OnClick = btnURIActionAddClick
      end
      object cboURIActionCondition: TComboBox
        Left = 320
        Top = 32
        Width = 157
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 8
        Items.Strings = (
          #12434#21547#12416
          #12392#23436#20840#19968#33268#12377#12427
          #12434#20808#38957#12395#21547#12416
          #12434#26411#23614#12395#21547#12416
          #12392#12356#12358#27491#35215#34920#29694#12364#12510#12483#12481#12377#12427)
      end
      object edtURIActionPattern: TEdit
        Left = 32
        Top = 32
        Width = 281
        Height = 20
        TabOrder = 9
      end
      object cboURIActionType: TComboBox
        Left = 32
        Top = 56
        Width = 101
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 10
        OnChange = cboURIActionTypeChange
        Items.Strings = (
          #12450#12503#12522#36215#21205
          #12475#12461#12517#12522#12486#12451#20999#12426#26367#12360)
      end
      object edtURIActionParam: TEdit
        Left = 200
        Top = 56
        Width = 277
        Height = 20
        TabOrder = 11
      end
      object btnURIActionOverride: TButton
        Left = 320
        Top = 80
        Width = 75
        Height = 21
        Caption = #19978#26360#12365
        TabOrder = 12
        OnClick = btnURIActionOverrideClick
      end
      object Panel22: TPanel
        Left = 200
        Top = 57
        Width = 277
        Height = 18
        BevelOuter = bvNone
        TabOrder = 13
        Visible = False
        object chkActJS: TCheckBox
          Left = 0
          Top = 0
          Width = 37
          Height = 17
          Caption = 'JS'
          TabOrder = 0
        end
        object chkActImg: TCheckBox
          Left = 36
          Top = 0
          Width = 41
          Height = 17
          Caption = #30011#20687
          TabOrder = 1
        end
        object chkActFrames: TCheckBox
          Left = 158
          Top = 0
          Width = 65
          Height = 17
          Caption = #12501#12524#12540#12512
          TabOrder = 2
        end
        object chkActPlugins: TCheckBox
          Left = 84
          Top = 0
          Width = 73
          Height = 17
          Caption = #12503#12521#12464#12452#12531
          TabOrder = 3
        end
        object chkActMeta: TCheckBox
          Left = 224
          Top = 0
          Width = 45
          Height = 17
          Caption = 'Meta'
          TabOrder = 4
        end
      end
    end
    object TabSheet10: TTabSheet
      Tag = 3
      Caption = #12479#12452#12488#12523#25233#27490
      ImageIndex = 32
      TabVisible = False
      object RejTitleList: TListBox
        Left = 0
        Top = 84
        Width = 473
        Height = 261
        ItemHeight = 12
        TabOrder = 0
      end
      object RejTitle: TEdit
        Left = 0
        Top = 56
        Width = 305
        Height = 20
        TabOrder = 1
      end
      object AddRejTitle: TButton
        Left = 316
        Top = 56
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 2
        OnClick = AddRejTitleClick
      end
      object DelRejTitle: TButton
        Left = 396
        Top = 56
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 3
        OnClick = DelRejTitleClick
      end
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12479#12452#12488#12523#25233#27490
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object chkEnableDenyTitle: TCheckBox
        Left = 4
        Top = 32
        Width = 153
        Height = 17
        Caption = #12479#12452#12488#12523#25233#27490#12434#26377#21177#12395#12377#12427
        TabOrder = 5
      end
    end
    object FontColorSheet: TTabSheet
      Tag = 4
      Caption = #12501#12457#12531#12488#12392#33394
      ImageIndex = 13
      TabVisible = False
      object Label5: TLabel
        Left = 288
        Top = 160
        Width = 45
        Height = 12
        Caption = #24120#12395#12371#12398
      end
      object Label14: TLabel
        Left = 40
        Top = 312
        Width = 392
        Height = 12
        Caption = #12501#12457#12540#12459#12473#33394#12399#12487#12501#12457#12523#12488#12391#12399#28145#32209#33394#12391#12377#12364#12289#28611#12356#27700#33394#12364#20693#12398#12362#12377#12377#12417#12391#12377#12290
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12502#12521#12454#12470#12398#12501#12457#12531#12488#12392#33394
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 32
        Width = 417
        Height = 121
        Caption = #26085#26412#35486#12501#12457#12531#12488#35373#23450
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 86
          Height = 12
          Caption = #12503#12525#12509#12540#12471#12519#12490#12523
        end
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 53
          Height = 12
          Caption = #12468#12471#12483#12463#20307
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 36
          Height = 12
          Caption = #26126#26397#20307
        end
        object Label4: TLabel
          Left = 8
          Top = 88
          Width = 24
          Height = 12
          Caption = #31561#24133
        end
        object ComboPropotional: TComboBox
          Left = 120
          Top = 16
          Width = 225
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 0
          Text = #26126#26397#20307
          Items.Strings = (
            #26126#26397#20307
            #12468#12471#12483#12463#20307)
        end
        object ComboSansSerif: TComboBox
          Left = 120
          Top = 40
          Width = 225
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Text = 'ComboSansSerif'
        end
        object ComboSerif: TComboBox
          Left = 120
          Top = 64
          Width = 225
          Height = 20
          ItemHeight = 12
          TabOrder = 2
          Text = 'ComboSerif'
        end
        object ComboMonospace: TComboBox
          Left = 120
          Top = 88
          Width = 225
          Height = 20
          ItemHeight = 12
          TabOrder = 3
          Text = 'ComboMonospace'
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 160
        Width = 273
        Height = 137
        Caption = #25991#23383#12398#33394#12392#32972#26223#33394
        TabOrder = 2
        object lblTextColor: TLabel
          Left = 24
          Top = 16
          Width = 36
          Height = 12
          Cursor = crHandPoint
          Caption = #25991#23383#33394
          Color = clBtnFace
          ParentColor = False
          OnClick = lblClick
        end
        object lblBGColor: TLabel
          Left = 24
          Top = 40
          Width = 36
          Height = 12
          Cursor = crHandPoint
          Caption = #32972#26223#33394
          OnClick = lblClick
        end
        object lblAnchorColor: TLabel
          Left = 88
          Top = 16
          Width = 53
          Height = 12
          Cursor = crHandPoint
          Caption = #26410#35501#12522#12531#12463
          OnClick = lblClick
        end
        object lblVisitedColor: TLabel
          Left = 88
          Top = 40
          Width = 53
          Height = 12
          Cursor = crHandPoint
          Caption = #26082#35501#12522#12531#12463
          OnClick = lblClick
        end
        object lblFocusColor: TLabel
          Left = 168
          Top = 16
          Width = 65
          Height = 12
          Cursor = crHandPoint
          Caption = #12501#12457#12540#12459#12473#33394
          OnClick = lblClick
        end
        object lblFocusBgColor: TLabel
          Left = 168
          Top = 40
          Width = 89
          Height = 12
          Cursor = crHandPoint
          Caption = #12501#12457#12540#12459#12473#32972#26223#33394
          OnClick = lblClick
        end
        object chkUseSysColor: TCheckBox
          Left = 16
          Top = 64
          Width = 249
          Height = 17
          Caption = #25991#23383#12539#32972#26223#33394#12395#12471#12473#12486#12512#12459#12521#12540#12434#29992#12356#12427
          TabOrder = 0
        end
        object chkUseFocusColors: TCheckBox
          Left = 16
          Top = 80
          Width = 249
          Height = 17
          Caption = #12501#12457#12540#12459#12473#12398#24403#12383#12387#12383#35201#32032#12395#33394#12434#12388#12369#12427
          TabOrder = 1
          OnClick = chkUseFocusColorsClick
        end
        object chkFocusOnAnything: TCheckBox
          Left = 16
          Top = 96
          Width = 249
          Height = 17
          Caption = #12501#12457#12540#12459#12473#12398#24403#12383#12387#12383#35201#32032#12398#21608#12426#12395#32218#12434#24341#12367
          TabOrder = 2
          OnClick = chkFocusOnAnythingClick
        end
        object chkUnderlineA: TCheckBox
          Left = 16
          Top = 112
          Width = 249
          Height = 17
          Caption = #12522#12531#12463#12395#19979#32218#12434#24341#12367
          TabOrder = 3
          OnClick = chkUnderlineAClick
        end
      end
      object chkAlwaysUseFont: TCheckBox
        Left = 288
        Top = 176
        Width = 129
        Height = 17
        Caption = #12501#12457#12531#12488#35373#23450#12434#29992#12356#12427
        TabOrder = 3
      end
      object chkAlwaysUseColor: TCheckBox
        Left = 288
        Top = 192
        Width = 105
        Height = 17
        Caption = #33394#35373#23450#12434#29992#12356#12427
        TabOrder = 4
      end
    end
    object NetworkSheet: TTabSheet
      Tag = 4
      Caption = #12493#12483#12488#12527#12540#12463
      ImageIndex = 14
      TabVisible = False
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12493#12483#12488#12527#12540#12463
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox3: TGroupBox
        Left = 272
        Top = 32
        Width = 201
        Height = 305
        Caption = #12503#12525#12463#12471#12522#12473#12488'(HTTP)'
        TabOrder = 2
        object Label51: TLabel
          Left = 48
          Top = 280
          Width = 12
          Height = 12
          Caption = #20998
        end
        object Label52: TLabel
          Left = 104
          Top = 280
          Width = 32
          Height = 12
          Caption = #31186#12372#12392
        end
        object MemoProxy: TMemo
          Left = 8
          Top = 16
          Width = 185
          Height = 61
          Hint = 
            'www.cybersyndrome.net'#12394#12393#12363#12425#12467#12500#12506#12375#12424#12358#12392#12377#12427#12392#39192#35336#12394#12300'# '#12301#12364#12388#12365#12414#12377#12364#12289#12381#12398#12414#12414#12300#36861#21152#12301#12434#25276#12375#12390#12375#12390#12375 +
            #12414#12387#12390'OK'#12391#12377#12290
          ParentShowHint = False
          ScrollBars = ssBoth
          ShowHint = True
          TabOrder = 0
        end
        object AddProxyList: TButton
          Left = 8
          Top = 84
          Width = 75
          Height = 21
          Caption = #36861#21152
          TabOrder = 1
          OnClick = AddProxyListClick
        end
        object DelProxyList: TButton
          Left = 96
          Top = 84
          Width = 75
          Height = 21
          Caption = #21066#38500
          TabOrder = 2
          OnClick = DelProxyListClick
        end
        object ProxyList: TListBox
          Left = 8
          Top = 112
          Width = 185
          Height = 141
          ItemHeight = 12
          MultiSelect = True
          TabOrder = 3
        end
        object chkRandomProxy: TCheckBox
          Left = 8
          Top = 256
          Width = 89
          Height = 17
          Caption = #12521#12531#12480#12512#20999#26367
          TabOrder = 4
        end
        object edtRandomProxyIntvMin: TEdit
          Left = 12
          Top = 276
          Width = 33
          Height = 20
          TabOrder = 5
        end
        object edtRandomProxyIntvSec: TEdit
          Left = 64
          Top = 276
          Width = 37
          Height = 20
          TabOrder = 6
        end
      end
      object GroupBox12: TGroupBox
        Left = 4
        Top = 32
        Width = 261
        Height = 305
        Caption = #12503#12525#12463#12471
        TabOrder = 1
        object Label18: TLabel
          Left = 24
          Top = 272
          Width = 22
          Height = 12
          Caption = 'URL'
        end
        object Label40: TLabel
          Left = 8
          Top = 76
          Width = 29
          Height = 12
          Caption = 'HTTP'
        end
        object Label41: TLabel
          Left = 8
          Top = 100
          Width = 20
          Height = 12
          Caption = 'SSL'
        end
        object Label42: TLabel
          Left = 8
          Top = 124
          Width = 21
          Height = 12
          Caption = 'FTP'
        end
        object Label43: TLabel
          Left = 8
          Top = 148
          Width = 36
          Height = 12
          Caption = 'Gopher'
        end
        object Label44: TLabel
          Left = 8
          Top = 172
          Width = 37
          Height = 12
          Caption = 'SOCKS'
        end
        object edtAutoConnectByScr: TEdit
          Left = 52
          Top = 269
          Width = 201
          Height = 20
          TabOrder = 17
        end
        object radAutoConnectByScr: TRadioButton
          Left = 8
          Top = 248
          Width = 181
          Height = 17
          Caption = #27425#12398#33258#21205#12503#12525#12463#12471#35373#23450#12434#29992#12356#12427
          TabOrder = 16
          OnClick = radAutoConnectByScrClick
        end
        object edtNoProxy: TEdit
          Left = 96
          Top = 224
          Width = 153
          Height = 20
          TabOrder = 15
          OnChange = edtNoProxyChange
        end
        object StaticText7: TStaticText
          Left = 8
          Top = 228
          Width = 82
          Height = 16
          Caption = #12503#12525#12463#12471#19981#20351#29992
          TabOrder = 0
        end
        object cboSOCKSVersion: TComboBox
          Left = 160
          Top = 192
          Width = 89
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 14
          Items.Strings = (
            'SOCKS v4'
            'SOCKS v5')
        end
        object socksPort: TEdit
          Left = 208
          Top = 168
          Width = 41
          Height = 20
          Enabled = False
          TabOrder = 13
        end
        object gopherPort: TEdit
          Left = 208
          Top = 144
          Width = 41
          Height = 20
          Enabled = False
          TabOrder = 11
        end
        object ftpPort: TEdit
          Left = 208
          Top = 120
          Width = 41
          Height = 20
          Enabled = False
          TabOrder = 9
        end
        object sslPort: TEdit
          Left = 208
          Top = 96
          Width = 41
          Height = 20
          Enabled = False
          TabOrder = 7
        end
        object httpPort: TEdit
          Left = 208
          Top = 72
          Width = 41
          Height = 20
          Enabled = False
          TabOrder = 5
        end
        object edtHttpProxy: TEdit
          Left = 48
          Top = 72
          Width = 153
          Height = 20
          Enabled = False
          TabOrder = 4
        end
        object edtSslProxy: TEdit
          Left = 48
          Top = 96
          Width = 153
          Height = 20
          Enabled = False
          TabOrder = 6
        end
        object edtFtpProxy: TEdit
          Left = 48
          Top = 120
          Width = 153
          Height = 20
          Enabled = False
          TabOrder = 8
        end
        object edtGopherProxy: TEdit
          Left = 48
          Top = 144
          Width = 153
          Height = 20
          Enabled = False
          TabOrder = 10
        end
        object edtSocksProxy: TEdit
          Left = 48
          Top = 168
          Width = 153
          Height = 20
          Enabled = False
          TabOrder = 12
        end
        object radManualConnect: TRadioButton
          Left = 12
          Top = 48
          Width = 169
          Height = 17
          Caption = #25163#21205#12391#12503#12525#12463#12471#12434#35373#23450#12377#12427
          TabOrder = 3
          OnClick = radManualConnectClick
        end
        object radDirectConnect: TRadioButton
          Left = 12
          Top = 16
          Width = 169
          Height = 17
          Caption = #37239#12356#12452#12531#12479#12540#12493#12483#12488#12395#30452#12395#25509#32154
          TabOrder = 1
          OnClick = radDirectConnectClick
        end
        object radProxyAutoDetect: TRadioButton
          Left = 12
          Top = 32
          Width = 73
          Height = 17
          Caption = #33258#21205#26908#20986
          TabOrder = 2
          OnClick = radProxyAutoDetectClick
        end
      end
    end
    object UASheet: TTabSheet
      Tag = 4
      Caption = #12518#12540#12470#12540#12456#12540#12472#12455#12531#12488
      ImageIndex = 33
      TabVisible = False
      object Label29: TLabel
        Left = 8
        Top = 32
        Width = 173
        Height = 12
        Caption = #12518#12540#12470#12540#12456#12540#12472#12455#12531#12488#12522#12473#12488#12398#32232#38598
      end
      object Label35: TLabel
        Left = 8
        Top = 56
        Width = 36
        Height = 12
        Caption = #34920#31034#21517
      end
      object Label36: TLabel
        Left = 180
        Top = 56
        Width = 36
        Height = 12
        Caption = #25991#23383#21015
      end
      object Panel27: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12518#12540#12470#12540#12456#12540#12472#12455#12531#12488
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object lvUserAgent: TListView
        Left = 8
        Top = 108
        Width = 465
        Height = 233
        Columns = <
          item
            Caption = #34920#31034#21517
            Width = 100
          end
          item
            Caption = #12518#12540#12470#12540#12456#12540#12472#12455#12531#12488#25991#23383#21015
            Width = 300
          end>
        RowSelect = True
        TabOrder = 5
        ViewStyle = vsReport
        OnSelectItem = lvUserAgentSelectItem
      end
      object edtUAViewName: TEdit
        Left = 52
        Top = 52
        Width = 121
        Height = 20
        TabOrder = 1
      end
      object edtUAString: TEdit
        Left = 224
        Top = 52
        Width = 249
        Height = 20
        TabOrder = 2
      end
      object btnAddUA: TButton
        Left = 8
        Top = 80
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 3
        OnClick = btnAddUAClick
      end
      object btnDelUA: TButton
        Left = 92
        Top = 80
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 4
        OnClick = btnDelUAClick
      end
    end
    object TabSheet12: TTabSheet
      Tag = 4
      Caption = #12450#12463#12475#12471#12499#12522#12486#12451
      ImageIndex = 34
      TabVisible = False
      object Panel33: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12450#12463#12475#12471#12499#12522#12486#12451
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkUseCaretMode: TCheckBox
        Left = 12
        Top = 36
        Width = 161
        Height = 17
        Caption = #12461#12515#12524#12483#12488#12514#12540#12489#12434#20351#29992#12377#12427
        TabOrder = 1
      end
      object CheckBox51: TCheckBox
        Left = 12
        Top = 56
        Width = 237
        Height = 17
        Caption = 'CrossFire(SpatialNavigation)'#12434#26377#21177#12395#12377#12427
        Enabled = False
        TabOrder = 2
      end
    end
    object TabSheet13: TTabSheet
      Tag = 4
      Caption = #12502#12521#12454#12472#12531#12464
      ImageIndex = 35
      TabVisible = False
      object Panel34: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12502#12521#12454#12472#12531#12464
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkImgAutoResize: TCheckBox
        Left = 8
        Top = 36
        Width = 289
        Height = 17
        Caption = #22823#12365#12394#30011#20687#12399#12454#12451#12531#12489#12454#12395#21512#12431#12379#12390#12469#12452#12474#12434#35519#25972#12377#12427
        TabOrder = 1
      end
      object chkUseSmoothScroll: TCheckBox
        Left = 8
        Top = 56
        Width = 181
        Height = 17
        Caption = #12473#12512#12540#12474#12473#12463#12525#12540#12523#12434#20351#29992#12377#12427
        TabOrder = 2
      end
    end
    object TabSheet14: TTabSheet
      Tag = 5
      Caption = #12459#12473#12479#12510#12452#12474
      ImageIndex = 36
      TabVisible = False
      object Label50: TLabel
        Left = 8
        Top = 192
        Width = 115
        Height = 12
        Caption = #12518#12540#12470#12540#23450#32681#12501#12457#12523#12480
      end
      object Panel53: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12469#12452#12489#12496#12540#12398#12459#12473#12479#12510#12452#12474
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox5: TGroupBox
        Left = 4
        Top = 64
        Width = 265
        Height = 117
        Caption = #34920#31034#12377#12427#12450#12452#12467#12531#12398#12459#12473#12479#12510#12452#12474
        TabOrder = 1
        object lstSidebarHeaderHiddenItem: TListBox
          Left = 8
          Top = 16
          Width = 89
          Height = 93
          ItemHeight = 12
          TabOrder = 0
        end
        object lstSidebarHeaderVisibleItem: TListBox
          Left = 136
          Top = 16
          Width = 89
          Height = 93
          ItemHeight = 12
          TabOrder = 1
        end
        object btnAddSHI: TButton
          Left = 104
          Top = 32
          Width = 25
          Height = 25
          Caption = '>'
          TabOrder = 2
          OnClick = btnAddSHIClick
        end
        object btnDelSHI: TButton
          Left = 104
          Top = 64
          Width = 25
          Height = 25
          Caption = '<'
          TabOrder = 3
          OnClick = btnDelSHIClick
        end
        object Button9: TButton
          Left = 232
          Top = 64
          Width = 25
          Height = 25
          Caption = #8595
          TabOrder = 4
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 232
          Top = 32
          Width = 25
          Height = 25
          Caption = #8593
          TabOrder = 5
          OnClick = Button10Click
        end
      end
      object edtUserDefinedFolder: TEdit
        Left = 132
        Top = 188
        Width = 257
        Height = 20
        ReadOnly = True
        TabOrder = 2
      end
      object btnUserDefinedFolder: TButton
        Left = 392
        Top = 188
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btnUserDefinedFolderClick
      end
      object chkShowSidebarTabs: TCheckBox
        Left = 8
        Top = 36
        Width = 213
        Height = 17
        Caption = #12469#12452#12489#12496#12540#19978#37096#12395#12450#12452#12467#12531#12434#34920#31034#12377#12427
        TabOrder = 4
      end
    end
    object TabSheet15: TTabSheet
      Tag = 5
      Caption = #33258#21205#34920#31034
      ImageIndex = 37
      TabVisible = False
      object Label38: TLabel
        Left = 8
        Top = 56
        Width = 243
        Height = 12
        Caption = #12510#12454#12473#12364#20055#12387#12390#33258#21205#34920#31034#12377#12427#12414#12391#12398#26178#38291'('#12511#12522#31186')'
      end
      object Label39: TLabel
        Left = 8
        Top = 100
        Width = 256
        Height = 12
        Caption = #12510#12454#12473#12364#38626#12428#12390#33258#21205#30340#12395#38560#12428#12427#12414#12391#12398#26178#38291'('#12511#12522#31186')'
      end
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #33258#21205#34920#31034
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkUseSidebarAutohide: TCheckBox
        Left = 8
        Top = 32
        Width = 197
        Height = 17
        Caption = #12469#12452#12489#12496#12540#12398#33258#21205#34920#31034#20999#26367#12434#20351#12358
        TabOrder = 1
      end
      object edtSidebarAutoOpenDelay: TEdit
        Left = 8
        Top = 72
        Width = 121
        Height = 20
        TabOrder = 2
      end
      object edtSidebarAutoHideDelay: TEdit
        Left = 8
        Top = 116
        Width = 121
        Height = 20
        TabOrder = 3
      end
      object chkSidebarOverlap: TCheckBox
        Left = 8
        Top = 144
        Width = 385
        Height = 17
        Caption = #38283#12356#12383#12392#12365#35206#12356#12363#12406#12373#12427#12424#12358#12395#12377#12427#65288#12506#12540#12472#34920#31034#38936#22495#12398#12522#12469#12452#12474#12434#12375#12394#12356#65289
        TabOrder = 4
      end
    end
    object CookieSheet: TTabSheet
      Tag = 6
      Caption = 'Cookie'
      ImageIndex = 10
      TabVisible = False
      object Label9: TLabel
        Left = 4
        Top = 28
        Width = 181
        Height = 12
        Caption = #12463#12483#12461#12540#12399#12487#12522#12471#12515#12473#12394#12487#12522#12459#12471#12540#12290
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Cookie'
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox20: TGroupBox
        Left = 4
        Top = 44
        Width = 233
        Height = 161
        Caption = 'Cookie'#21463#12369#20837#12428#12509#12522#12471#12540
        TabOrder = 1
        object rbDenyAllCookie: TRadioButton
          Left = 8
          Top = 16
          Width = 141
          Height = 17
          Caption = #12377#12409#12390#12398'Cookie'#12434#25298#21542
          TabOrder = 0
        end
        object rbDenyOtherSiteCookie: TRadioButton
          Left = 8
          Top = 36
          Width = 201
          Height = 17
          Caption = #21516#12376#12469#12452#12488#20197#22806#12363#12425#12398'Cookie'#12434#25298#21542
          TabOrder = 1
        end
        object rbCookieP3PHigh: TRadioButton
          Left = 8
          Top = 56
          Width = 37
          Height = 17
          Caption = #39640
          TabOrder = 2
        end
        object rbCookieP3PMedium: TRadioButton
          Left = 8
          Top = 76
          Width = 37
          Height = 17
          Caption = #20013
          TabOrder = 3
        end
        object rbCookieP3PLow: TRadioButton
          Left = 8
          Top = 96
          Width = 37
          Height = 17
          Caption = #20302
          TabOrder = 4
        end
        object rbCookieP3PCustom: TRadioButton
          Left = 8
          Top = 116
          Width = 69
          Height = 17
          Caption = #12459#12473#12479#12512
          TabOrder = 5
        end
        object rbAllowAllCookie: TRadioButton
          Left = 8
          Top = 136
          Width = 141
          Height = 17
          Caption = #12377#12409#12390#12398'Cookie'#12434#35377#21487
          TabOrder = 6
        end
      end
      object GroupBox21: TGroupBox
        Left = 244
        Top = 44
        Width = 233
        Height = 81
        Caption = 'Cookie'#20445#23384#12509#12522#12471#12540
        TabOrder = 2
        object rbCookieLifetimeNormal: TRadioButton
          Left = 8
          Top = 16
          Width = 153
          Height = 17
          Caption = #12469#12452#12488#12391#25351#23450#12375#12383#26399#38480#12414#12391
          TabOrder = 0
        end
        object rbCookieLifetimeSession: TRadioButton
          Tag = 2
          Left = 8
          Top = 36
          Width = 133
          Height = 17
          Caption = 'Bagel'#12434#32066#20102#12377#12427#12414#12391
          TabOrder = 1
        end
        object rbCookieLifetimeAskEach: TRadioButton
          Tag = 1
          Left = 8
          Top = 56
          Width = 97
          Height = 17
          Caption = #27598#22238#30906#35469#12377#12427
          TabOrder = 2
        end
        object CheckBox6: TCheckBox
          Left = 32
          Top = 96
          Width = 137
          Height = 17
          Caption = #12475#12483#12471#12519#12531'Cookie'#12434#38500#12367
          Enabled = False
          TabOrder = 3
          Visible = False
        end
        object RadioButton11: TRadioButton
          Left = 8
          Top = 56
          Width = 113
          Height = 17
          Caption = #65311#65311#26085#38291#20445#23384#12377#12427
          Enabled = False
          TabOrder = 4
          Visible = False
        end
      end
      object Button4: TButton
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        Action = BagelMainForm.actShowCookieMan
        TabOrder = 3
      end
      object btnRemoveCookie: TButton
        Left = 124
        Top = 216
        Width = 113
        Height = 21
        Action = BagelMainForm.actClearCookie
        TabOrder = 4
      end
    end
    object PasswordSheet: TTabSheet
      Tag = 6
      Caption = #12497#12473#12527#12540#12489
      ImageIndex = 39
      TabVisible = False
      object Panel36: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12497#12473#12527#12540#12489
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkUsePassMan: TCheckBox
        Left = 4
        Top = 32
        Width = 161
        Height = 17
        Caption = #12497#12473#12527#12540#12489#12510#12493#12540#12472#12515#12434#20351#12358
        TabOrder = 1
      end
      object Button13: TButton
        Left = 4
        Top = 52
        Width = 129
        Height = 21
        Action = BagelMainForm.actShowPassMan
        TabOrder = 2
      end
    end
    object CacheHistorySheet: TTabSheet
      Tag = 6
      Caption = #12461#12515#12483#12471#12517#12539#23653#27508
      ImageIndex = 40
      TabVisible = False
      object Panel37: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12461#12515#12483#12471#12517#12539#23653#27508
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox18: TGroupBox
        Left = 8
        Top = 92
        Width = 469
        Height = 229
        Caption = #12461#12515#12483#12471#12517
        TabOrder = 1
        object Label54: TLabel
          Left = 8
          Top = 16
          Width = 110
          Height = 12
          Caption = #12506#12540#12472#12461#12515#12483#12471#12517#12398#37327
        end
        object Label55: TLabel
          Left = 24
          Top = 40
          Width = 95
          Height = 12
          Caption = #12461#12515#12483#12471#12517#12501#12457#12523#12480
        end
        object Label58: TLabel
          Left = 164
          Top = 16
          Width = 17
          Height = 12
          Caption = 'MB'
        end
        object edtCacheCapacity: TEdit
          Left = 124
          Top = 12
          Width = 37
          Height = 20
          TabOrder = 0
        end
        object edtCacheDirParent: TEdit
          Left = 124
          Top = 36
          Width = 213
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
        object chkPrefetchNext: TCheckBox
          Left = 16
          Top = 60
          Width = 101
          Height = 17
          Caption = #12522#12531#12463#12398#20808#35501#12415
          TabOrder = 2
        end
        object btnSelectCacheFolder: TButton
          Left = 348
          Top = 36
          Width = 109
          Height = 21
          Caption = #12501#12457#12523#12480#12434#36984#25246'...'
          TabOrder = 3
          OnClick = btnSelectCacheFolderClick
        end
        object Button12: TButton
          Left = 12
          Top = 192
          Width = 117
          Height = 21
          Action = BagelMainForm.actClearCache
          TabOrder = 4
        end
        object rgCheckFrequency: TRadioGroup
          Left = 8
          Top = 84
          Width = 445
          Height = 97
          Caption = #20445#23384#12375#12390#12356#12427#12506#12540#12472#12398#26032#12375#12356#12496#12540#12472#12519#12531#12398#30906#35469
          Items.Strings = (
            #12475#12483#12471#12519#12531#20013#12395'1'#22238
            #12506#12540#12472#12434#34920#31034#12377#12427#12383#12403
            #30906#35469#12375#12394#12356
            #12461#12515#12483#12471#12517#12398#26377#21177#26399#38480#12364#21476#12367#12394#12387#12383#12392#12365)
          TabOrder = 5
        end
      end
      object GroupBox19: TGroupBox
        Left = 8
        Top = 32
        Width = 469
        Height = 49
        Caption = #23653#27508
        TabOrder = 2
        object Label56: TLabel
          Left = 12
          Top = 20
          Width = 34
          Height = 12
          Caption = #23653#27508#12434
        end
        object Label57: TLabel
          Left = 92
          Top = 20
          Width = 70
          Height = 12
          Caption = #26085#38291#35352#25014#12377#12427
        end
        object edtHistoryExpireDays: TEdit
          Left = 48
          Top = 16
          Width = 41
          Height = 20
          TabOrder = 0
        end
        object Button3: TButton
          Left = 180
          Top = 16
          Width = 85
          Height = 21
          Action = BagelMainForm.actClearHistory
          TabOrder = 1
        end
      end
    end
    object TabSheet16: TTabSheet
      Tag = 7
      Caption = #12484#12540#12523#12496#12540#20840#33324
      ImageIndex = 52
      TabVisible = False
      object Panel38: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12484#12540#12523#12496#12540#20840#33324
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkFixToolbar: TCheckBox
        Left = 8
        Top = 32
        Width = 141
        Height = 17
        Caption = #12484#12540#12523#12496#12540#12434#22266#23450#12377#12427
        TabOrder = 1
      end
    end
    object TabSheet19: TTabSheet
      Tag = 7
      Caption = #12513#12452#12531#12484#12540#12523#12496#12540
      ImageIndex = 41
      TabVisible = False
      object Panel39: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12513#12452#12531#12484#12540#12523#12496#12540
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet20: TTabSheet
      Tag = 7
      Caption = #12450#12489#12524#12473#12496#12540
      ImageIndex = 42
      TabVisible = False
      object Panel40: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12450#12489#12524#12473#12496#12540
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 32
        Width = 465
        Height = 85
        Caption = #12450#12489#12524#12473#12496#12540
        TabOrder = 1
        object chkAddrAutoComplete: TCheckBox
          Left = 8
          Top = 16
          Width = 145
          Height = 17
          Caption = #12458#12540#12488#12467#12531#12503#12522#12540#12488#26377#21177
          TabOrder = 0
        end
        object chkAddrShowGo: TCheckBox
          Left = 8
          Top = 36
          Width = 113
          Height = 17
          Caption = #31227#21205#12508#12479#12531#12434#34920#31034
          TabOrder = 1
        end
        object chkAddrShowGoCaption: TCheckBox
          Left = 8
          Top = 56
          Width = 173
          Height = 17
          Caption = #31227#21205#12508#12479#12531#12395#25991#23383#12434#34920#31034#12377#12427
          TabOrder = 2
        end
      end
    end
    object TabSheet21: TTabSheet
      Tag = 7
      Caption = #12522#12531#12463#12496#12540
      ImageIndex = 43
      TabVisible = False
      object Panel41: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12522#12531#12463#12496#12540
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object CheckBox23: TCheckBox
        Left = 8
        Top = 32
        Width = 105
        Height = 17
        Caption = #12522#12531#12463#12496#12540#12434#20351#12358
        Enabled = False
        TabOrder = 1
      end
    end
    object AddrSearchSheet: TTabSheet
      Tag = 7
      Caption = #26908#32034#12496#12540
      ImageIndex = 16
      TabVisible = False
      object TLabel
        Left = 44
        Top = 140
        Width = 239
        Height = 12
        Caption = #20214#23653#27508#12434#20445#23384#12377#12427#65288'0'#25351#23450#12391#20445#23384#12375#12394#12367#12394#12426#12414#12377#65289
      end
      object Label76: TLabel
        Left = 8
        Top = 164
        Width = 103
        Height = 12
        Caption = #12489#12525#12483#12503#12480#12454#12531#12398#39640#12373
      end
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #26908#32034#12496#12540
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object chkReplaceZenkakuSpace: TCheckBox
        Left = 8
        Top = 184
        Width = 161
        Height = 17
        Caption = #20840#35282#31354#30333#12434#21322#35282#31354#30333#12395#12377#12427
        TabOrder = 1
      end
      object edtSearchbarDropdownCount: TEdit
        Left = 120
        Top = 160
        Width = 53
        Height = 20
        TabOrder = 2
      end
      object chkRemenberSearchEngine: TCheckBox
        Left = 8
        Top = 116
        Width = 121
        Height = 17
        Caption = #12456#12531#12472#12531#12434#35352#25014#12377#12427
        TabOrder = 3
      end
      object chkScrollToCenterOnFind: TCheckBox
        Left = 8
        Top = 96
        Width = 97
        Height = 17
        Caption = #20013#22830#12395#34920#31034
        TabOrder = 4
      end
      object chkSearchOnDrop: TCheckBox
        Left = 8
        Top = 76
        Width = 105
        Height = 17
        Caption = #12489#12525#12483#12503#26178#21363#26908#32034
        TabOrder = 5
      end
      object chkSearchOnEngineChange: TCheckBox
        Left = 8
        Top = 56
        Width = 145
        Height = 17
        Caption = #12456#12531#12472#12531#22793#26356#26178#21363#26908#32034
        TabOrder = 6
      end
      object chkSearchOnKeywordChange: TCheckBox
        Left = 8
        Top = 36
        Width = 145
        Height = 17
        Caption = #12461#12540#12527#12540#12489#22793#26356#26178#21363#26908#32034
        TabOrder = 7
      end
      object chkDoAutoHighlightOnSearch: TCheckBox
        Left = 8
        Top = 204
        Width = 157
        Height = 17
        Caption = #26908#32034#24460#33258#21205#12495#12452#12521#12452#12488#12377#12427
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object chkDoAutoLockOnSearch: TCheckBox
        Left = 8
        Top = 224
        Width = 193
        Height = 17
        Caption = #26908#32034#24460#33258#21205#30340#12395#12479#12502#12434#12525#12483#12463#12377#12427
        TabOrder = 9
      end
      object edtSearchBarSaveCount: TEdit
        Left = 8
        Top = 136
        Width = 33
        Height = 20
        TabOrder = 10
      end
    end
    object MenuCustSheet: TTabSheet
      Tag = 8
      Caption = #20840#33324
      ImageIndex = 5
      TabVisible = False
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12513#12491#12517#12540#20840#33324
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox10: TGroupBox
        Left = 4
        Top = 52
        Width = 217
        Height = 117
        Caption = #12502#12483#12463#12510#12540#12463
        TabOrder = 1
        object Label48: TLabel
          Left = 8
          Top = 80
          Width = 114
          Height = 12
          Caption = #12513#12491#12517#12540#12398#26368#22823#25991#23383#25968
        end
        object Label49: TLabel
          Left = 52
          Top = 96
          Width = 69
          Height = 12
          Caption = '(0'#12398#12392#12365#28961#21177')'
        end
        object chkAddBkmkHere: TCheckBox
          Left = 8
          Top = 36
          Width = 177
          Height = 17
          Caption = #12300#12371#12371#12395#36861#21152#12301#12392#12356#12358#38917#30446#12434#36861#21152
          TabOrder = 0
        end
        object chkOpenAllBkmk: TCheckBox
          Left = 8
          Top = 16
          Width = 205
          Height = 17
          Caption = #12300#12371#12428#12425#12434#20840#12390#38283#12367#12301#12392#12356#12358#38917#30446#12434#36861#21152
          TabOrder = 1
        end
        object edtBkmkMenuMaxLength: TEdit
          Left = 128
          Top = 84
          Width = 81
          Height = 20
          TabOrder = 2
        end
        object CheckBox4: TCheckBox
          Left = 8
          Top = 56
          Width = 97
          Height = 17
          Caption = #38291#38548#12434#12388#12417#12427
          TabOrder = 3
        end
      end
      object chkShowMenuIcon: TCheckBox
        Left = 4
        Top = 32
        Width = 177
        Height = 17
        Caption = #12513#12491#12517#12540#12395#12450#12452#12467#12531#12434#34920#31034#12377#12427
        TabOrder = 2
      end
      object Button20: TButton
        Left = 8
        Top = 176
        Width = 145
        Height = 21
        TabOrder = 3
      end
      object Button21: TButton
        Left = 8
        Top = 204
        Width = 145
        Height = 21
        TabOrder = 4
      end
      object Button22: TButton
        Left = 8
        Top = 232
        Width = 145
        Height = 21
        TabOrder = 5
      end
    end
    object KbdSheet: TTabSheet
      Tag = 9
      Caption = #12461#12540#21106#12426#24403#12390
      ImageIndex = 2
      TabVisible = False
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12461#12540#12508#12540#12489
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object btnAdaptKbd: TButton
        Left = 312
        Top = 32
        Width = 75
        Height = 21
        Caption = #36969#29992
        TabOrder = 1
        OnClick = btnAdaptKbdClick
      end
      object btnDelKbd: TButton
        Left = 400
        Top = 32
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 2
        OnClick = btnDelKbdClick
      end
      object ShortcutListEditor: TListView
        Left = 0
        Top = 64
        Width = 473
        Height = 281
        Columns = <
          item
            Caption = #12461#12540#12508#12540#12489#12471#12519#12540#12488#12459#12483#12488
            MinWidth = 100
            Width = 200
          end
          item
            Caption = #12467#12510#12531#12489
            MinWidth = 100
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 3
        ViewStyle = vsReport
        OnSelectItem = ShortcutListEditorSelectItem
      end
      object edtKbdShortcut: TMemo
        Left = 0
        Top = 32
        Width = 121
        Height = 20
        ReadOnly = True
        TabOrder = 4
        WantTabs = True
        OnKeyDown = edtKbdShortcutKeyDown
      end
      object stKeyAction: TStaticText
        Left = 128
        Top = 32
        Width = 157
        Height = 17
        AutoSize = False
        BevelInner = bvSpace
        BevelKind = bkSoft
        TabOrder = 5
      end
      object Button19: TButton
        Left = 284
        Top = 32
        Width = 21
        Height = 17
        Caption = '>>'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Button19Click
      end
    end
    object OperaKeySheet: TTabSheet
      Tag = 9
      Caption = 'Opera'#39080#12461#12540
      ImageIndex = 45
      TabVisible = False
      object Panel24: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Opera'#39080#12461#12540
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object lvOperaKeyList: TListView
        Left = 4
        Top = 84
        Width = 473
        Height = 261
        Columns = <
          item
            Caption = #12461#12540#12508#12540#12489#12471#12519#12540#12488#12459#12483#12488
            MinWidth = 100
            Width = 200
          end
          item
            Caption = #12467#12510#12531#12489
            MinWidth = 100
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnSelectItem = lvOperaKeyListSelectItem
      end
      object edtOperakeyKey: TMemo
        Left = 0
        Top = 56
        Width = 49
        Height = 20
        ReadOnly = True
        TabOrder = 2
        WantTabs = True
        OnKeyDown = edtOperakeyKeyKeyDown
      end
      object stOperaKeyAction: TStaticText
        Left = 56
        Top = 56
        Width = 157
        Height = 17
        AutoSize = False
        BevelInner = bvSpace
        BevelKind = bkSoft
        TabOrder = 3
      end
      object Button5: TButton
        Left = 216
        Top = 56
        Width = 21
        Height = 17
        Caption = '>>'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 244
        Top = 56
        Width = 75
        Height = 21
        Caption = #36969#29992
        TabOrder = 5
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 328
        Top = 56
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 6
        OnClick = Button7Click
      end
      object chkUseOperaKey: TCheckBox
        Left = 8
        Top = 32
        Width = 421
        Height = 17
        Caption = 'Opera'#39080#12461#12540#12434#20351#29992#12377#12427#65288'Migemo'#12398#12300#12479#12452#12503#12375#12390#12377#12368#26908#32034#12301#12398#35373#23450#12395#20778#36234#12375#12414#12377#65289
        TabOrder = 7
      end
    end
    object GestureSheet: TTabSheet
      Tag = 10
      Caption = #12510#12454#12473#12472#12455#12473#12481#12515
      ImageIndex = 3
      TabVisible = False
      object Label11: TLabel
        Left = 40
        Top = 336
        Width = 383
        Height = 12
        Caption = #12510#12454#12473#12472#12455#12473#12481#12515#12398#12420#12426#12377#12366#12399#25163#39318#12434#30171#12417#12414#12377#12290#12510#12454#12473#12497#12483#12489#36984#12403#12399#24910#37325#12395#12290
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12510#12454#12473#12472#12455#12473#12481#12515
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ButtonUp: TButton
        Left = 48
        Top = 32
        Width = 25
        Height = 25
        Caption = #8593
        TabOrder = 1
        OnClick = ButtonUpClick
      end
      object ButtonClear: TButton
        Left = 48
        Top = 64
        Width = 25
        Height = 25
        Caption = 'C'
        TabOrder = 2
        OnClick = ButtonClearClick
      end
      object ButtonLeft: TButton
        Left = 16
        Top = 64
        Width = 25
        Height = 25
        Caption = #8592
        TabOrder = 3
        OnClick = ButtonLeftClick
      end
      object ButtonRight: TButton
        Left = 80
        Top = 64
        Width = 25
        Height = 25
        Caption = #8594
        TabOrder = 4
        OnClick = ButtonRightClick
      end
      object ButtonDown: TButton
        Left = 48
        Top = 96
        Width = 25
        Height = 25
        Caption = #8595
        TabOrder = 5
        OnClick = ButtonDownClick
      end
      object edtMGest: TEdit
        Left = 120
        Top = 64
        Width = 289
        Height = 20
        ReadOnly = True
        TabOrder = 6
      end
      object btnAdaptGest: TButton
        Left = 120
        Top = 96
        Width = 73
        Height = 21
        Caption = #36969#29992
        TabOrder = 7
        OnClick = btnAdaptGestClick
      end
      object btnDelGest: TButton
        Left = 200
        Top = 96
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 8
        OnClick = btnDelGestClick
      end
      object GestListEditor: TListView
        Left = 0
        Top = 128
        Width = 481
        Height = 201
        Columns = <
          item
            Caption = #12472#12455#12473#12481#12515
            MinWidth = 100
            Width = 200
          end
          item
            Caption = #12467#12510#12531#12489
            MinWidth = 100
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 9
        ViewStyle = vsReport
        OnSelectItem = GestListEditorSelectItem
      end
      object stMouseAction: TStaticText
        Left = 120
        Top = 44
        Width = 269
        Height = 17
        AutoSize = False
        BevelInner = bvSpace
        BevelKind = bkSoft
        TabOrder = 10
      end
      object Button17: TButton
        Left = 388
        Top = 44
        Width = 21
        Height = 17
        Caption = '>>'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = Button17Click
      end
    end
    object TabSheet25: TTabSheet
      Tag = 10
      Caption = #12510#12454#12473#25805#20316
      ImageIndex = 47
      TabVisible = False
      object Panel45: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12510#12454#12473#25805#20316
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox23: TGroupBox
        Left = 12
        Top = 40
        Width = 281
        Height = 169
        Caption = #21491#12463#12522#12483#12463#65291
        TabOrder = 1
        object Label60: TLabel
          Left = 36
          Top = 24
          Width = 83
          Height = 12
          Caption = #12507#12452#12540#12523#12463#12522#12483#12463
        end
        object Label61: TLabel
          Left = 68
          Top = 48
          Width = 50
          Height = 12
          Caption = #24038#12463#12522#12483#12463
        end
        object Label62: TLabel
          Left = 44
          Top = 72
          Width = 76
          Height = 12
          Caption = #12507#12452#12540#12523#12450#12483#12503
        end
        object Label63: TLabel
          Left = 40
          Top = 96
          Width = 77
          Height = 12
          Caption = #12507#12452#12540#12523#12480#12454#12531
        end
        object Label64: TLabel
          Left = 12
          Top = 120
          Width = 104
          Height = 12
          Caption = #12469#12452#12489#12508#12479#12531'1'#12463#12522#12483#12463
        end
        object Label65: TLabel
          Left = 12
          Top = 144
          Width = 104
          Height = 12
          Caption = #12469#12452#12489#12508#12479#12531'2'#12463#12522#12483#12463
        end
        object stRWheelClick: TStaticText
          Left = 124
          Top = 20
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRWheelClick'
          TabOrder = 0
        end
        object btnRWheelClick: TButton
          Left = 248
          Top = 20
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ActionSelectorClick
        end
        object btnRLeftClick: TButton
          Left = 248
          Top = 44
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = ActionSelectorClick
        end
        object stRLeftClick: TStaticText
          Left = 124
          Top = 44
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRLeftClick'
          TabOrder = 3
        end
        object stRWheelUp: TStaticText
          Left = 124
          Top = 68
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRWheelUp'
          TabOrder = 4
        end
        object btnRWheelUp: TButton
          Left = 248
          Top = 68
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = ActionSelectorClick
        end
        object btnRWheelDown: TButton
          Left = 248
          Top = 92
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = ActionSelectorClick
        end
        object stRWheelDown: TStaticText
          Left = 124
          Top = 92
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRWheelDown'
          TabOrder = 7
        end
        object stRSide1Click: TStaticText
          Left = 124
          Top = 116
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRSide1Click'
          TabOrder = 8
        end
        object btnRSide1Click: TButton
          Left = 248
          Top = 116
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = ActionSelectorClick
        end
        object btnRSide2Click: TButton
          Left = 248
          Top = 140
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = ActionSelectorClick
        end
        object stRSide2Click: TStaticText
          Left = 124
          Top = 140
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stRSide2Click'
          TabOrder = 11
        end
      end
      object GroupBox24: TGroupBox
        Left = 12
        Top = 216
        Width = 281
        Height = 69
        Caption = #12381#12398#20182
        TabOrder = 2
        object Label66: TLabel
          Left = 12
          Top = 21
          Width = 104
          Height = 12
          Caption = #12469#12452#12489#12508#12479#12531'1'#12463#12522#12483#12463
        end
        object Label67: TLabel
          Left = 12
          Top = 45
          Width = 104
          Height = 12
          Caption = #12469#12452#12489#12508#12479#12531'2'#12463#12522#12483#12463
        end
        object stSide2Click: TStaticText
          Left = 124
          Top = 40
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stSide2Click'
          TabOrder = 0
        end
        object btnSide2Click: TButton
          Left = 248
          Top = 40
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = ActionSelectorClick
        end
        object btnSide1Click: TButton
          Left = 248
          Top = 16
          Width = 21
          Height = 17
          Caption = '>>'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = ActionSelectorClick
        end
        object stSide1Click: TStaticText
          Left = 124
          Top = 16
          Width = 125
          Height = 17
          AutoSize = False
          BevelInner = bvSpace
          BevelKind = bkSoft
          Caption = 'stSide1Click'
          TabOrder = 3
        end
      end
    end
    object SuperDragSheet: TTabSheet
      Tag = 10
      Caption = #12473#12540#12497#12540#12489#12521#12483#12464
      ImageIndex = 48
      TabVisible = False
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12473#12540#12497#12540#12489#12521#12483#12464
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object PageControl2: TPageControl
        Left = 4
        Top = 32
        Width = 473
        Height = 317
        ActivePage = TabSheet8
        TabOrder = 1
        object TabSheet8: TTabSheet
          Caption = #30011#20687
          object Label70: TLabel
            Left = 8
            Top = 76
            Width = 42
            Height = 12
            Caption = #27770#12417#12358#12385
          end
          object Label71: TLabel
            Left = 8
            Top = 100
            Width = 160
            Height = 12
            Caption = #25391#12426#20998#12369#26465#20214#65288#12414#12384#20351#12360#12414#12379#12435#65289
            Enabled = False
          end
          object rbSDImgSave: TRadioButton
            Left = 8
            Top = 44
            Width = 73
            Height = 17
            Caption = #20445#23384#12377#12427
            TabOrder = 0
          end
          object rbSDImgNewTab: TRadioButton
            Left = 8
            Top = 24
            Width = 113
            Height = 17
            Caption = #26032#12375#12356#12479#12502#12391#38283#12367
            TabOrder = 1
          end
          object rbSDImgNoAction: TRadioButton
            Left = 8
            Top = 4
            Width = 81
            Height = 17
            Caption = #20309#12418#12375#12394#12356
            TabOrder = 2
          end
          object chkSDImgBGTab: TCheckBox
            Left = 120
            Top = 24
            Width = 69
            Height = 17
            Caption = #32972#26223#12479#12502
            TabOrder = 3
          end
          object cbSDImgSaveType: TComboBox
            Left = 88
            Top = 44
            Width = 169
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            ItemIndex = 0
            TabOrder = 4
            Text = #20445#23384#22580#25152#12434#27598#22238#23563#12397#12427
            Items.Strings = (
              #20445#23384#22580#25152#12434#27598#22238#23563#12397#12427
              #12402#12392#12388#12398#12501#12457#12523#12480#12395#20445#23384#12377#12427
              #26465#20214#12395#24467#12356#25391#12426#20998#12369#12427)
          end
          object edtSDImgSavePath: TEdit
            Left = 56
            Top = 72
            Width = 273
            Height = 20
            TabOrder = 5
          end
          object ListView1: TListView
            Left = 8
            Top = 121
            Width = 445
            Height = 160
            Columns = <
              item
                Caption = #26465#20214
                Width = 200
              end
              item
                Caption = #20445#23384#22580#25152
                Width = 200
              end>
            Enabled = False
            TabOrder = 6
            ViewStyle = vsReport
          end
          object btnImgSavePAthSelector: TButton
            Left = 328
            Top = 72
            Width = 25
            Height = 21
            Caption = '...'
            TabOrder = 7
            OnClick = btnImgSavePAthSelectorClick
          end
        end
        object TabSheet17: TTabSheet
          Caption = #12522#12531#12463
          ImageIndex = 1
          object rbSDLinkNoAction: TRadioButton
            Left = 8
            Top = 4
            Width = 81
            Height = 17
            Caption = #20309#12418#12375#12394#12356
            TabOrder = 0
          end
          object rbSDLinkNewTab: TRadioButton
            Left = 8
            Top = 24
            Width = 113
            Height = 17
            Caption = #26032#12375#12356#12479#12502#12391#38283#12367
            TabOrder = 1
          end
          object chkSDLinkBGTab: TCheckBox
            Left = 120
            Top = 24
            Width = 69
            Height = 17
            Caption = #32972#26223#12479#12502
            TabOrder = 2
          end
          object cbSDLinkSaveType: TComboBox
            Left = 88
            Top = 44
            Width = 169
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            ItemIndex = 0
            TabOrder = 3
            Text = #20445#23384#22580#25152#12434#27598#22238#23563#12397#12427
            Items.Strings = (
              #20445#23384#22580#25152#12434#27598#22238#23563#12397#12427
              #12402#12392#12388#12398#12501#12457#12523#12480#12395#20445#23384#12377#12427
              #26465#20214#12395#24467#12356#25391#12426#20998#12369#12427)
          end
          object rbSDLinkSave: TRadioButton
            Left = 8
            Top = 44
            Width = 73
            Height = 17
            Caption = #20445#23384#12377#12427
            TabOrder = 4
          end
        end
        object TabSheet18: TTabSheet
          Caption = #36984#25246#31684#22258
          ImageIndex = 2
          object rbSDSelectionNoAction: TRadioButton
            Left = 8
            Top = 4
            Width = 81
            Height = 17
            Caption = #20309#12418#12375#12394#12356
            TabOrder = 0
          end
          object rbSDSelectionNewTab: TRadioButton
            Left = 8
            Top = 24
            Width = 113
            Height = 17
            Caption = #26032#12375#12356#12479#12502#12391#38283#12367
            TabOrder = 1
          end
          object chkSDSelectionBGTab: TCheckBox
            Left = 120
            Top = 24
            Width = 69
            Height = 17
            Caption = #32972#26223#12479#12502
            TabOrder = 2
          end
          object GroupBox25: TGroupBox
            Left = 12
            Top = 48
            Width = 273
            Height = 109
            Caption = #25369#21205
            TabOrder = 3
            object rbSDSelSearch: TRadioButton
              Left = 12
              Top = 16
              Width = 157
              Height = 17
              Caption = #24120#12395#26908#32034#12377#12427
              TabOrder = 0
            end
            object rbSDSelOpenURI: TRadioButton
              Left = 12
              Top = 36
              Width = 113
              Height = 17
              Caption = #24120#12395'URI'#12392#12375#12390#38283#12367
              TabOrder = 1
            end
            object rbSDSelMixed: TRadioButton
              Left = 12
              Top = 56
              Width = 249
              Height = 17
              Caption = #27491#35215#34920#29694#12395#12510#12483#12481#12377#12427#12392#12365#12398#12415'URI'#12392#12375#12390#38283#12367
              TabOrder = 2
            end
            object edtSDSelectionURIRE: TEdit
              Left = 12
              Top = 76
              Width = 249
              Height = 20
              TabOrder = 3
            end
          end
        end
      end
    end
    object TabSheet26: TTabSheet
      Tag = 11
      Caption = #12495#12452#12521#12452#12488
      ImageIndex = 48
      TabVisible = False
      object Label68: TLabel
        Left = 172
        Top = 76
        Width = 36
        Height = 12
        Caption = #32972#26223#33394
      end
      object Label69: TLabel
        Left = 172
        Top = 48
        Width = 36
        Height = 12
        Caption = #21069#26223#33394
      end
      object Panel46: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12495#12452#12521#12452#12488
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object lbHighlightStyle: TListBox
        Left = 8
        Top = 32
        Width = 113
        Height = 129
        Style = lbOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnClick = lbHighlightStyleClick
        OnDrawItem = lbHighlightStyleDrawItem
      end
      object chkHighlightBold: TCheckBox
        Left = 176
        Top = 104
        Width = 53
        Height = 17
        Caption = #22826#23383
        TabOrder = 2
        OnClick = chkHighlightBoldClick
      end
      object chkHighlightUnderline: TCheckBox
        Left = 176
        Top = 144
        Width = 49
        Height = 17
        Caption = #19979#32218
        TabOrder = 3
        OnClick = chkHighlightUnderlineClick
      end
      object chkHighlightItalic: TCheckBox
        Left = 176
        Top = 124
        Width = 73
        Height = 17
        Caption = #12452#12479#12522#12483#12463
        TabOrder = 4
        OnClick = chkHighlightItalicClick
      end
      object Button30: TButton
        Left = 8
        Top = 172
        Width = 75
        Height = 21
        Caption = #36861#21152
        TabOrder = 5
        OnClick = Button30Click
      end
      object Button31: TButton
        Left = 92
        Top = 172
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 6
        OnClick = Button31Click
      end
      object Button32: TButton
        Left = 128
        Top = 64
        Width = 25
        Height = 25
        Caption = #8593
        Enabled = False
        TabOrder = 7
      end
      object Button33: TButton
        Left = 128
        Top = 100
        Width = 25
        Height = 25
        Caption = #8595
        Enabled = False
        TabOrder = 8
      end
      object stHighlightFGColor: TStaticText
        Left = 216
        Top = 44
        Width = 53
        Height = 21
        Cursor = crHandPoint
        AutoSize = False
        BevelKind = bkSoft
        BevelOuter = bvRaised
        Color = clBtnFace
        ParentColor = False
        TabOrder = 9
        OnClick = stHighlightFGColorClick
      end
      object stHighlightBGColor: TStaticText
        Left = 216
        Top = 72
        Width = 53
        Height = 21
        Cursor = crHandPoint
        AutoSize = False
        BevelKind = bkSoft
        BevelOuter = bvRaised
        Color = clBtnFace
        ParentColor = False
        TabOrder = 10
        OnClick = stHighlightBGColorClick
      end
    end
    object TabSheet27: TTabSheet
      Tag = 11
      Caption = #26908#32034#12456#12531#12472#12531#12522#12473#12488
      ImageIndex = 49
      TabVisible = False
      object Panel47: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #26908#32034#12456#12531#12472#12531#12522#12473#12488
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ListView2: TListView
        Left = 4
        Top = 60
        Width = 473
        Height = 281
        Columns = <
          item
            Caption = #34920#31034#21517
            Width = 100
          end
          item
            AutoSize = True
            Caption = #21069#26041'URI'
          end
          item
            AutoSize = True
            Caption = #24460#26041'URI'
          end
          item
            Caption = #25991#23383#12467#12540#12489
          end
          item
            Caption = #12471#12519#12540#12488#12459#12483#12488
          end>
        DragMode = dmAutomatic
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = ListView2DblClick
        OnDragDrop = ListView2DragDrop
        OnDragOver = ListView2DragOver
      end
      object btnAddSearchEngine: TButton
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        Caption = #26908#32034#12456#12531#12472#12531#12434#36861#21152
        TabOrder = 2
        OnClick = btnAddSearchEngineClick
      end
      object btnAddSearchGroup: TButton
        Left = 136
        Top = 32
        Width = 125
        Height = 21
        Caption = #26908#32034#12464#12523#12540#12503#12434#36861#21152
        TabOrder = 3
        OnClick = btnAddSearchGroupClick
      end
      object btnDelSearchItem: TButton
        Left = 268
        Top = 32
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 4
        OnClick = btnDelSearchItemClick
      end
    end
    object TabSheet28: TTabSheet
      Tag = 11
      Caption = #12452#12531#12463#12522#12513#12531#12479#12523#26908#32034
      ImageIndex = 50
      TabVisible = False
      object Label28: TLabel
        Left = 16
        Top = 252
        Width = 110
        Height = 12
        Caption = 'Migemo.dll'#12414#12391#12398#12497#12473
      end
      object LabelNuma: TLabel
        Left = 4
        Top = 280
        Width = 122
        Height = 12
        Caption = #36766#26360#12501#12449#12452#12523#12414#12391#12398#12497#12473
      end
      object Label34: TLabel
        Left = 12
        Top = 148
        Width = 119
        Height = 12
        Caption = #12479#12452#12512#12450#12454#12488#12414#12391#12398#26178#38291
      end
      object Panel48: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12452#12531#12463#12522#12513#12531#12479#12523#26908#32034
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtPathToMigemoDLL: TEdit
        Left = 132
        Top = 248
        Width = 257
        Height = 20
        TabOrder = 1
      end
      object edtpathToMigemoDic: TEdit
        Left = 132
        Top = 276
        Width = 257
        Height = 20
        TabOrder = 2
      end
      object chkIncSearchAutoStart: TCheckBox
        Left = 8
        Top = 84
        Width = 77
        Height = 17
        Caption = #33258#21205#23455#34892
        TabOrder = 3
      end
      object chkIncSearchLinksOnly: TCheckBox
        Left = 8
        Top = 104
        Width = 97
        Height = 17
        Caption = #12522#12531#12463#12398#12415
        TabOrder = 4
      end
      object chkIncSearchEnableTimeout: TCheckBox
        Left = 8
        Top = 124
        Width = 249
        Height = 17
        Caption = #20837#21147#12364#12375#12400#12425#12367#12394#12363#12387#12383#22580#21512#12479#12452#12512#12450#12454#12488#12377#12427
        TabOrder = 5
      end
      object edtIncSearchTimeout: TEdit
        Left = 136
        Top = 144
        Width = 121
        Height = 20
        TabOrder = 6
      end
      object chkEnableLazyHighlight: TCheckBox
        Left = 8
        Top = 204
        Width = 157
        Height = 17
        Caption = 'Lazy-Hilight'#12434#26377#21177#12395#12377#12427
        Enabled = False
        TabOrder = 7
      end
      object chkAutoOpenGrep: TCheckBox
        Left = 8
        Top = 224
        Width = 181
        Height = 17
        Caption = #33258#21205#30340#12395'Grep'#12469#12452#12489#12496#12540#12434#38283#12367
        Enabled = False
        TabOrder = 8
      end
      object chkEnableFAYT: TCheckBox
        Left = 8
        Top = 36
        Width = 113
        Height = 17
        Caption = 'Find As You Type'
        TabOrder = 9
      end
      object chkEnableMigemo: TCheckBox
        Left = 8
        Top = 56
        Width = 65
        Height = 17
        Caption = 'Migemo'
        TabOrder = 10
      end
      object StaticText3: TStaticText
        Left = 4
        Top = 184
        Width = 67
        Height = 16
        BorderStyle = sbsSunken
        Caption = 'Migemo'#12398#12415
        TabOrder = 11
      end
    end
    object TabSheet30: TTabSheet
      Tag = 12
      Caption = #25313#24373#19968#35239
      ImageIndex = 52
      TabVisible = False
      object Label30: TLabel
        Left = 8
        Top = 32
        Width = 164
        Height = 12
        Caption = #12452#12531#12473#12488#12540#12523#12373#12428#12390#12356#12427#25313#24373#27231#33021
      end
      object Panel50: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #25313#24373#19968#35239
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox16: TGroupBox
        Left = 184
        Top = 32
        Width = 289
        Height = 309
        Caption = #35443#32048
        TabOrder = 1
        object PageControl3: TPageControl
          Left = 12
          Top = 20
          Width = 265
          Height = 277
          ActivePage = TabSheet23
          TabOrder = 0
          object TabSheet22: TTabSheet
            Caption = 'TabSheet22'
            object Label33: TLabel
              Left = 4
              Top = 4
              Width = 30
              Height = 12
              Caption = #20316#32773#65306
            end
            object Label72: TLabel
              Left = 4
              Top = 24
              Width = 28
              Height = 12
              Caption = 'URL'#65306
            end
            object Label73: TLabel
              Left = 4
              Top = 44
              Width = 30
              Height = 12
              Caption = #35500#26126#65306
            end
            object GroupBox22: TGroupBox
              Left = 8
              Top = 64
              Width = 249
              Height = 181
              Caption = #35373#23450
              TabOrder = 0
            end
            object Edit1: TEdit
              Left = 36
              Top = 4
              Width = 213
              Height = 13
              BorderStyle = bsNone
              TabOrder = 1
            end
            object Edit2: TEdit
              Left = 36
              Top = 24
              Width = 213
              Height = 13
              BorderStyle = bsNone
              TabOrder = 2
            end
            object Edit3: TEdit
              Left = 36
              Top = 44
              Width = 213
              Height = 13
              BorderStyle = bsNone
              TabOrder = 3
            end
          end
          object TabSheet23: TTabSheet
            Caption = 'TabSheet23'
            ImageIndex = 1
            object lvAutoExec: TListView
              Left = 4
              Top = 5
              Width = 245
              Height = 153
              Columns = <>
              TabOrder = 0
            end
            object Button23: TButton
              Left = 8
              Top = 168
              Width = 75
              Height = 21
              Caption = #36861#21152
              TabOrder = 1
            end
            object Button24: TButton
              Left = 92
              Top = 168
              Width = 75
              Height = 21
              Caption = #32232#38598'...'
              TabOrder = 2
            end
            object Button25: TButton
              Left = 176
              Top = 168
              Width = 75
              Height = 21
              Caption = #21066#38500
              TabOrder = 3
            end
          end
        end
      end
      object tvExtensions: TTreeView
        Left = 8
        Top = 48
        Width = 161
        Height = 289
        Indent = 19
        TabOrder = 2
      end
    end
    object TabSheet31: TTabSheet
      Tag = 12
      Caption = #12473#12463#12522#12503#12488
      ImageIndex = 53
      TabVisible = False
      object Label59: TLabel
        Left = 80
        Top = 64
        Width = 299
        Height = 12
        Caption = #22810#20998#12513#12477#12483#12489#12372#12392#12395#23455#34892#12398#21487#21542#12434#35373#23450#12391#12365#12427#12424#12358#12395#12377#12427#12399#12378#12290
      end
      object Panel51: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #12473#12463#12522#12503#12488
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet32: TTabSheet
      Tag = 12
      Caption = #35373#23450#22793#26356#12467#12510#12531#12489
      ImageIndex = 54
      TabVisible = False
      object Panel52: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #35373#23450#22793#26356#12467#12510#12531#12489
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Tag = 12
      Caption = #22806#37096#12450#12503#12522#12465#12540#12471#12519#12531
      ImageIndex = 47
      TabVisible = False
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #22806#37096#12450#12503#12522#12465#12540#12471#12519#12531
        Color = clAppWorkSpace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    Left = 176
    Top = 376
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 208
    Top = 380
  end
  object ActionList1: TActionList
    Left = 24
    Top = 376
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object ImageList1: TImageList
    Left = 104
    Top = 372
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4CECBFFC0B8
      B4FFBFB7B3FFBFB7B3FFBFB7B3FFBFB7B3FFBFB7B3FFBFB7B3FFBFB7B3FFBFB7
      B3FFC0B8B4FFD3CECBFFFAFAF9FF000000000000000000000000006600FF7274
      5EFFA6A198FFCECCC6FFE8E8E5FFF6F6F5FFFCFCFCFFFEFEFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBA79BFFD8A4
      99FFD6A398FFD3A097FFD19D96FFD19D96FFD19D96FFD09C96FFD09C96FFD09C
      96FFD09C95FF7E6F66FFF1EEEDFF000000000000000000000000006600FF0066
      00FF385E2AFF868373FFC5C2BCFFE0E0DCFFF2F2F0FFFAFAFAFFFEFEFEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9ECDBFFFFE9
      D3FFFFE6CDFFFFE3C7FFFFE1C3FFFFDEBDFFFFDBB7FFFFD8B1FFFFD6ACFFFFD3
      A7FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF0D90
      1AFF026F04FF155D0DFF5F664AFFADABA1FFD6D5CFFFECECE9FFF8F8F7FFFDFD
      FDFFFEFEFEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9EDE0FFFFEB
      D8FFFFE9D3FFFFE6CDFFFFE3C7FFFFE1C3FFFFDEBDFFF9C897FFFFD8B1FFFFD6
      ACFFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF14A0
      27FF16AB2BFF07840FFF046302FF42582FFF908F80FFCAC8C2FFE4E3E0FFF4F4
      F2FFFBFBFBFFFEFEFEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAF1E6FFFFEE
      DEFFFFEBD8FFFFE9D3FFFFE6CDFFCE9B6EFF07488FFFBE8551FFA58775FFF9C6
      93FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF19A5
      32FF1CB536FF17B02DFF0C9517FF016A02FF1A5B10FF6C6D57FFB6B4ACFFD9D8
      D3FFEEEEEBFFF8F8F8FFFDFDFDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAF4EBFFFFF1
      E3FFFFEEDEFFFFEBD8FF95AFB8FF3299D0FF3BB7EAFF0E6EACFF17A3D7FFF2B5
      79FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF1FAB
      3DFF22BB44FF1CB536FF17B02DFF0FA51EFF037906FF086004FF4A5C37FF9998
      8BFFCDCCC6FFE8E8E4FFF6F6F5FFFDFDFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBF7F1FFFFF4
      E8FFFFF1E3FFFFEEDEFF0C60A0FF4BBFF2FF52B9E4FF249ED3FF149ED3FF004E
      91FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF23B0
      46FF29C252FF22BB44FF1CB536FF17B02DFF0FA91FFF05880BFF016A01FF2759
      1AFF7C7A69FFC7C4BEFFE5E5E2FFF7F7F6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFAF7FFFFF7
      EEFFFFF4E8FFFFF1E3FF4EBAD7FF49BEF1FFCCCCCCFF286482FF129FD3FF189B
      C8FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF26B3
      4DFF30C960FF29C252FF22BB44FF1CB536FF17B02DFF0FA91FFF089B10FF0271
      03FF10600AFF6C745AFFC7C7BFFFF0F1EEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFDFDFFFFFA
      F4FF007F00FF75872FFF31CA4AFF48BDF0FFCCCCCCFF30748EFF13A3D6FFFFE3
      C7FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF27B3
      4DFF33CC66FF30C960FF29C252FF22BB44FF1CB536FF17B02DFF0EA41DFF037D
      06FF056303FF6A6F57FFC5C6BEFFEFF0EDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFFFFFFB0CD
      A7FF4CE473FF42DB63FF30CA49FF1EB82EFF638B40FFE3B98FFFFFE9D3FFFFE6
      CDFFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF2DB9
      53FF35CE68FF33CC66FF30C960FF29C252FF22BB44FF15A128FF036F05FF155D
      0DFF6A6A54FFBBB9B1FFE3E2DFFFF6F6F5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFFFFFF58F0
      84FF52EB7BFFA8E4B5FF6A6A6AFF008B00FF0AA410FFFCD4ACFFFFEBD8FFFFE9
      D3FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF32BE
      58FF3CD56FFF35CE68FF33CC66FF30C960FF149428FF046302FF335823FF8583
      72FFC7C4BEFFE3E2DFFFF5F5F4FFFCFCFCFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFFFFFFFFFF
      FFFF44DB66FFD1EAD6FF6A6A6AFF1AB327FFCBAD63FFFFF1E3FFFFEEDEFFFFEB
      D8FFFDD2BFFF736158FFEFEDECFF000000000000000000000000006600FF36C2
      5CFF43DC76FF3CD56FFF2BBB55FF0A7913FF0E5E08FF556241FFA3A296FFD1D1
      CBFFE9E9E5FFF7F7F6FFFDFDFDFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFFFFFFFFFF
      FFFFFFFFFFFFE0CAB3FF515151FFFFFAF4FFFFF7EEFFFFF4E8FFFFF0E1FFFFED
      DBFFFDD2BFFF7C6C63FFF0EEECFF000000000000000000000000006600FF3DC9
      63FF49E27CFF25A842FF046D07FF2C581DFF7F7C6CFFC2C0B9FFDEDED9FFEFEF
      EDFFF9F9F9FFFDFDFDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFDFBFFFFFAF6FFFFF7F0FFFFF5EBFFE5B691FFE795
      38FFD58235FFBAAFA9FFF9F8F8FF000000000000000000000000006600FF3CC5
      5FFF158721FF086004FF4A5C37FF9A998CFFCECDC7FFE8E8E4FFF6F6F5FFFCFC
      FCFFFEFEFEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFFFFFAF6FFFFF7F0FFEBC7A8FFFEB5
      54FFB9AAA1FFF4F1F0FFFEFEFEFF000000000000000000000000006600FF0066
      00FF235D18FF6C6F58FFB7B4ABFFDAD9D4FFEEEEEBFFF9F9F9FFFDFDFDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFDFF
      FFFFFCFFFFFFFBFFFFFFFAFEFFFFF8FCFFFFF7F9FBFFF5F6F6FFEED1B0FFA898
      8EFFF3F2F0FFFEFEFEFF00000000000000000000000000000000006600FF536C
      44FF898878FFC1C0B8FFE2E2DDFFF2F3F1FFFBFBFBFFFEFEFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFEFFF7F6
      F5FFF0EEECFFEFEDECFFEFEDECFFEFEDECFFEFEDECFFEFEDECFFEFEDECFFEFED
      ECFFEFEDECFFEFEDECFFF0EEECFFF7F6F5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F0FFC4C4C4FF9E9E9EFF959595FFA8A8A8FFD1D1
      D1FFF2F2F2FF000000000000000000000000F7F7F7FFDFDFDFFFDEDEDEFFFBFB
      FBFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAF8F8FFBEB4
      ADFF7A695FFF736158FF736158FF736158FF736158FF736158FF736158FF7361
      58FF736158FF736158FF7A695FFFBEB4ADFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFEFFCBCBCBFF8D8D8DFFC0C0C0FFCCCCCCFFC8C8C8FFAEAEAEFF7E7E
      7EFF656565FFC1C1C1FFFCFCFCFF00000000898989FF676768FF7B6767FFA9A9
      A9FFFBFBFBFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFEFEFFF8FAFAFFF5F3F3FFA351
      27FFD8EAEFFFD8EAEFFFD8EAEFFFD8EAEFFFD8EAEFFFD8EAEFFFD8EAEFFFD8EA
      EFFFD8EAEFFFD8EAEFFFCDCBC7FFA1958BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D1D1D1FFC6C6C6FFE9E9E9FFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF3F3
      F3FFC3C3C3FF5D5D5DFFC0C0C0FF00000000667986FF4573C3FF8B7FA3FF7865
      65FFA9A9A9FFFBFBFBFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8EAECFFB0B3B3FFB7B3B1FFA351
      27FFBAE5F1FFB4E5F1FFD8EAEFFFD8EAEFFFDEDCC7FFDDDECDFFD8EAEFFFBAD0
      F1FFB4CBF1FFD8EAEFFFCDCBC7FFA19389FF0000000000000000E3E3E3FF9F9F
      9FFF797979FF595959FF585858FF585858FF777777FFA1A1A1FFE3E3E3FFFEFE
      FEFF00000000000000000000000000000000000000000000000000000000FAFA
      FAFFBEBEBEFFDFDFDFFFE9E9E9FFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC5C5C5FF666666FFF3F3F3FF55B4FEFF49AFFFFF4474C4FF8B7F
      A3FF786565FFA9A9A9FFFBFBFBFF000000000000000000000000000000000000
      0000000000000000000000000000000000007FBBCFFF1FA8D9FF18718DFFA351
      27FF24D1FCFFC6A438FFD8EAEFFFD8EAEFFF60E84FFFF8A627FFD8EAEFFF4058
      D8FF5A498DFFD8EAEFFFCDCBC7FFA19389FF00000000979393FFAB8888FFF0D1
      D1FFFFF9F9FFFFF7F7FFFFFFFFFFFFF3F3FFFED4D4FFBD7A7AFF664D4DFF6D6D
      6DFFEFEFEFFF000000000000000000000000000000000000000000000000D0D0
      D0FFE4E4E4FFE1E1E1FFE1E1E1FFE0E0E0FFDEDEDEFFE0E0E0FFECECECFFFFFF
      FFFFFFFFFFFFECECECFF757575FFE2E2E2FF0000000055B4FEFF49AFFFFF4475
      C6FF8B7FA3FF786565FFA9A9A9FFFBFBFBFF0000000000000000000000000000
      00000000000000000000000000000000000063B1CBFF83DCFFFF71D7FFFFA351
      27FF24D1FCFF23CCF0FFD8EAEFFFD8EAEFFFF8A627FFE2CA9CFFD8EAEFFF426A
      FAFF395DF1FFD8EAEFFFCDCBC7FFA19389FF7A7474FFF5D1D1FFF5D9D9FFAC7C
      7CFFC49B9BFFF9E9E9FFFFFFFFFFFFD8D8FFFFACACFFFFB3B3FFFFFFFFFFA667
      67FF5B5B5BFFCFCFCFFFEDEDEDFFF3F3F3FF000000000000000000000000B0B0
      B0FFFAFAFAFFE4E4E4FFE7E7E7FFE6E6E6FFE5E5E5FFE3E3E3FFE0E0E0FFDCDC
      DCFFFFFFFFFFFEFEFEFF939393FFDEDEDEFF000000000000000055B4FEFF49AF
      FFFF4475C6FF8B7FA3FF816E6EFFE8E8E8FFF5F5F5FFDCDCDCFFD5D5D5FFD7D7
      D7FFEFEFEFFFFEFEFEFF000000000000000060ADC7FF9EE7FFFF7AE0FFFFA351
      27FFC8CACEFFC6C5C9FFD6E6EAFFD8EAEFFFC0B7BAFFCED5D9FFD8EAEFFFC8CA
      CEFFC6C5C9FFD6E6EAFFCDCBC7FFA19389FFDAA6A6FFE9C4C4FFC19C9CFFD2B4
      B4FFAD7D7DFFA67171FFFFF9F9FFDFC7C7FFB28484FFB67171FFDA8A8AFFFFB1
      B1FFF7A2A2FFAD6A6AFF825656FF4D4D4DFF000000000000000000000000B3B3
      B3FFFEFEFEFFF7F7F7FFECECECFFEBEBEBFFEAEAEAFFE7E7E7FFE4E4E4FFE0E0
      E0FFFAFAFAFFFFFFFFFF8A8A8AFFE9E9E9FF00000000000000000000000055B4
      FEFF49AFFFFF4475C6FF6C6C6CFF777777FF8D6D6DFF9A6767FFC69393FFA47E
      7EFF615E5EFFA7A7A7FFF9F9F9FF0000000030A2C9FFA7EDFFFF83E9FFFFA351
      27FF24A627FF00AB8FFFD8EAEFFFD8EAEFFFAB6676FF4F83FCFFD8EAEFFFD5D2
      D5FF9E8C96FFD8EAEFFFCDCBC7FFA19389FF898888FFE2CCCCFF826E9EFF536C
      E2FFA2695BFFC4712EFF975B5BFFF0E1E1FFC7A5A5FF9D6666FFB58B8BFFEBA1
      A1FFFFB2B2FFFFC5C5FFFFB3B3FFB3B3B3FF000000000000000000000000C2C2
      C2FFFFFFFFFFFFFFFFFFF1F1F1FFF0F0F0FFEEEEEEFFEBEBEBFFE7E7E7FFE3E3
      E3FFF0F0F0FFF2F2F2FF818181FFFAFAFAFF0000000000000000000000000000
      000052B1FEFFBDBDBDFF857B7BFFD8AA91FFFFEBBCFFFFFDD2FFFFFFD6FFFFFF
      DAFFF2E8C9FF856666FF999999FFFBFBFBFF57B2D3FFC1F2FFFF8BF1FFFFA351
      27FF24A638FF23A018FFD8EAEFFFD8EAEFFF5264D0FFB1B0C4FFD8EAEFFFDFDC
      DFFF8888B3FFD8EAEFFFCDCBC7FFA19389FFF5F5F5FFBCBCBCFF838080FF8982
      82FFD1C6C6FFF9E1E1FFD3A9A9FFB68080FF9E6666FF03FC03FFCC8F8FFFB07E
      7EFF9E6262FFF6ABABFFC8BEBEFF00000000000000000000000000000000C9C9
      C9FFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFF1F1F1FFEEEEEEFFEAEAEAFFE5E5
      E5FFEDEDEDFFCFCFCFFFC3C3C3FF000000000000000000000000000000000000
      000000000000D5D5D5FFE3B194FFFFFCD0FFFFF1BEFFFFFFD4FFFFFFE3FFFFFF
      ECFFFFFFFFFFFAF7E7FF655555FFD5D5D5FF2BACD9FFBBF0FCFF94FAFFFFC25F
      06FFF3A127FFF3A127FFF3A127FFF3A127FFF3A127FFF3A127FFF3A127FFF3A1
      27FFF3A127FFF3A127FFDBA763FFAA9D94FF938383FF897474FF908080FF8F7F
      7FFF8E7D7DFF887575FF8D7D7DFF8D7878FF8A7575FF948181FFB7A6A6FFB29E
      9EFFAA9191FFFCFCFCFF0000000000000000000000000000000000000000A1A1
      A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FFF0F0F0FFEBEBEBFFE6E6
      E6FFE6E6E6FF8A8A8AFFF5F5F5FF000000000000000000000000000000000000
      000000000000C79D9DFFFFE8BCFFFFE2AFFFFFF6C3FFFFFFD9FFFFFFEBFFFFFF
      FAFFFFFFFCFFFFFFDDFFB79085FF909090FF5DC1E6FFABE0F2FF9EFFFFFFA953
      22FFE29344FFE29344FFE29344FFE29344FFE29344FFE29344FFE29344FFE293
      44FFE29344FFE29344FFA03C07FFD9D3CEFF9C8E8EFF8D8D8DFF707070FF9090
      90FF7E7E7EFF797979FFCACACAFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C3FFC4C4C4FFE4E4E4FFFFFFFFFFFFFFFFFFF3F5F5FFF1F1F1FFEDEDEDFFEAEA
      EAFFCBCBCBFFCDCDCDFF00000000000000000000000000000000000000000000
      0000FEFEFEFFD6A99CFFFFFACAFFFFDEABFFFFF3C0FFFFFFD6FFFFFFE5FFFFFF
      EEFFFFFFEBFFFFFFDCFFEDE3BAFF6E6E6EFF64C3E6FF75C9E6FFD1FCFFFFC5FE
      FFFFBAFFFFFFBAFFFFFFBAFFFFFFBAFFFFFFBAFFFFFFBAFFFFFF90E6FFFF36B3
      D9FFA29E9AFFEEECEAFFF5F3F3FFFCFCFBFF0000000000000000FDFDFDFFF6F5
      F5FFDFDFDFFFA59D9DFF858585FFEBEBEBFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B2
      B2FFFFFFFFFFFFFFFFFFDADADAFF896060FF9E6666FFBDBDBDFFBCBCBCFFBDBD
      BDFF989898FFFBFBFBFF00000000000000000000000000000000000000000000
      000000000000E4BFA5FFFFF9C6FFFFD7A4FFFFEAB7FFFFFECCFFFFFFD9FFFFFF
      DFFFFFFFDDFFFFFFD2FFFFF3C0FF7D7D7DFFA0DBF2FF8FF5FFFF7EEAF9FF48C8
      E6FF1CABD6FFEDFCFFFFD3FFFFFFD3FFFFFFD3FFFFFFD3FFFFFF9DE6FFFF75CC
      E6FF8D8F8DFFF5F6F7FF0000000000000000000000000000000000000000A394
      94FFA49797FF968484FFE4E4E4FF000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFCFFD1D1D1FFADADADFFB4B4
      B4FFFFFFFFFFFFFFFFFFFFFFFFFFAF5959FF8C8585FFF5F5F5FFEFEFEFFF9696
      96FFF4F4F4FF0000000000000000000000000000000000000000000000000000
      000000000000CEA099FFFFFDD1FFFFE3B9FFFFDBABFFFFF2BFFFFFFAC7FFFFFF
      CDFFFFFDCAFFFFFBC9FFDAB797FFB0B0B0FFAADEF2FF99FFFFFF99FFFFFF99FF
      FFFF99FFFFFF39BFDFFF3FB2D9FF7DCCE6FFBCE5F2FFF8FEFFFFC0ECFFFFBBE5
      F2FF939695FFF3F5F5FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBFFFC1C1C1FFBCBCBCFF5D5D
      5DFFAEAEAEFFBEBEBEFFE8E8E8FFCDCECEFFFCFCFCFFE5E5E5FFA1A1A1FFF5F5
      F5FF000000000000000000000000000000000000000000000000000000000000
      000000000000E7D3D3FFFFF1C2FFFFFFFFFFFFF9EDFFFFDAA8FFFFE2AFFFFFE5
      B2FFFFE7B4FFFFE8B9FF986B6BFFEFEFEFFF61B9D5FFA4FFFFFF99FFFFFF99FF
      FFFFD7FCFFFF5BA8C3FF79CAE6FFB5E2F2FFDCFCFFFFC6FDFFFF54C5E2FF529F
      B7FFDEE2E4FFFCFDFDFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAEFF777777FFC4C4C4FFD5D5
      D5FF5F5F5FFF7F7F7FFFFFFFFFFFA5A5A5FFE7E7E7FFFEFEFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BF8F8FFFFFFFFFFFFFFCEDFFFFF8D4FFFFDDAAFFFFF5
      C2FFFFE6BAFFC08D81FFD8D8D8FF00000000FAFBFBFF65BBD8FF70C6E2FF9FD9
      ECFF4BACCCFFD9DCDCFFFCFCFCFFFAFBFBFFF3F5F5FFF0F1F0FFF0EEEEFFF8F8
      F8FFFEFEFEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCCFF9F9F9FFFA7A7A7FFBEBE
      BEFFE0E0E0FFEBEBEBFFA8A8A8FFEFEFEFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C5A2A2FFD8B89CFFFFE8B5FFFFE2AFFFEDC6
      A3FFB78787FFEAEAEAFF00000000000000005A4A390018080000181008000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8E8
      E8FFABABABFF7A7A7AFF717171FF909090FFCDCDCDFFFAFAFAFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFEFFFBFBFBFF00000000000000000000000000000000FEFE
      FEFF00000000000000000000000000000000F7C69C00B58C6B00947352002921
      18002973CE002963BD002963BD002152BD002152BD00214ABD002142BD001839
      B5001831B10018217B00101010000000000000000000FCFCFCFFB1B1B1FF5FE4
      8AFF63FC94FF60F990FF5FF88FFF5EF78CFF39734AFF787878FFEBEBEBFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F6FF4E4E4EFF747474FFFCFCFCFFFBFBFBFFE7E7E7FFDEDEDEFF6A60
      60FF828282FFE7E7E7FF0000000000000000BD9C8400A5846300FFFFFF00B594
      6B002921180043C6F30045C8FF00181818003139E70031399C004545840095B6
      FF002863FF001F46E400101010000000000000000000A0BDA9FF5BF488FF59F2
      86FF57F082FF84E49FFF74E895FF51EA7AFF50E978FF4AD96FFF626262FFF2F2
      F2FFD6D6D6FFF1F1F1FF00000000000000000000000000000000000000000000
      000000000000000000000000000000CCCC0099FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007A746DFFE08D3AFF3F3F3FFFF3F3F3FF1118A2FF10168FFFAD8585FFB6AC
      ACFF8F7373FF4F4343FF828282FFEFEFEFFF8C736300CEA57B008C735200FFFF
      FF00B5946B00292118004BE2FF00181818003142C6003139E70031399C003939
      7B00313131002255E8001010100000000000E8E8E8FF51EA79FF4FE876FFC0C9
      C2FFFEFEFEFF00000000000000000000000064E07EFF42DB63FF3EB257FF99A3
      9BFF3BB652FF6E6E6EFFF1F1F1FF000000000000000000000000000000000000
      0000FF00000099660000FF0000000000000000CCCC0099FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000928679FFD98026FF3C3C3CFF776464FF0F50FFFF2270FFFFDCC0C0FFB396
      96FFAFA1A1FFAFA1A1FF876363FF959595FF7B6B5A00D6B58400A58463007B5A
      4200FFFFFF00B5946B0029211800181863003139E7003963FF003139E7003131
      E70039397B0018181800101010000000000054D972FF45DE66FF8E9890FFFEFE
      FEFF000000000000000000000000000000000000000041D05BFF919A92FF32CB
      4BFF31CA4AFF2AA63EFF707070FFF5F5F5FF00000000FF000000FF000000FF00
      000000000000FF00000000000000000000000033330000CCCC0099FFFF000000
      0000000000000000000000666600000000000000000000000000000000000000
      0000736353FFD37515FFA19595FFE8DEDEFF1761FFFF3285FFFFD1A5A5FFBB9D
      9DFF9C6C6CFFA47D7DFFA07F7FFF939393FF7B63520021215A0029299C002121
      8C00B9ADA100FFFFFF00DECAB5003142C60042428C003139E7002931DE003131
      B500181818001818180010101000000000003BD458FF3AD356FFD0D0D0FF0000
      000000000000DCDCDCFFC6C6C6FFC6C6C6FFC6C6C6FFA1ABA3FF28C13DFF27C0
      3AFF24BD36FF23BC35FF3E9E48FFF5F5F5FF00000000FF0000000000000066CC
      FF003399CC0000000000000080000066FF00000000000000000000FFFF0099FF
      FF0000FFFF0033CCCC0033999900006666000000000000000000000000000000
      0000987E64FFD37313FFB7ABABFFCC9999FF2174FFFF429AFFFFDCC0C0FFBF9A
      9AFFC28F8FFFAD8282FF986969FF939393FFBDB1A900C6C6CE00181852002929
      9C003139E7003939C6003152EF003131B50031318C003152EF003942EF003131
      B5001818180097C0F40088888800000000002FC848FF2B943CFFD7D7D7FF0000
      00000000000026BF3AFF24BD36FF22BB34FF20B931FF1EB72EFF1DB62CFF68A2
      6DFFFAFAFAFF3FBB47FFF2F2F2FF00000000000000000000000066CCFF003399
      CC003399CC008080800090A9AD0080808000000000000000000000FFFF0000FF
      FF000033330066FFFF0000FFFF0000666600B1B1B1FF9F9F9FFF9F9F9FFF9F9F
      9FFFA38363FFD37013FFBDBABAFFE8DEDEFF2985FFFF52AFFFFFDCC0C0FFC294
      94FFBF8C8CFFCC9999FF9D6A6AFF939393FF18186B003131BD0029298400CECE
      D6001818520029299C00313131004263FF002121D600393984003139E7002931
      DE002121210021212100101010000000000023BC35FF1F922CFFBBBBBBFF0000
      0000000000001AB327FF18B125FF16AF21FF15AE20FF13AC1CFF7CB780FFFAFA
      FAFF0000000000000000000000000000000000000000000000003399CC003399
      CC003399CC0066CCFF000000000000000000000000000000000066FFFF000033
      6600000000000000000066FFFF00006666002AA5D8FF4DB5E8FF4DB6E9FF4DB7
      EAFFC6996DFFD36D15FFBDBABAFFE8DEDEFF2B83ECFF3A81DAFFDCC0C0FFC58E
      8EFFB38080FFB38080FF9F6666FF939393FF18186B002929AD003152E7003939
      C60021296B0021296B00393942003152E7004263FF003142CE003139E7002931
      DE003131B50021212100181818000000000018B125FF16AF21FF5D5D5DFFF4F4
      F4FF000000000FA817FF216E24FFE2E2E2FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000066CC
      FF0066CCFF003399CC000000000090A9AD0090A9AD00000000003399990066FF
      FF000080800033CCCC00003333000000000048A9D8FF6FD5FFFF6FD5FFFF6FD5
      FFFFC49668FFB86524FFECE8E8FFE8DEDEFFA6A6A6FF909091FFDCC0C0FFC888
      88FFC69393FFCC9999FFA16262FF939393FF18186B003194F7003173FF00638C
      FF003152E7003131B5004A4A5A00314AEF003152E700393984004263FF002121
      D60018181800181818008888880000000000A0DAA2FF0AA310FF0E7610FF7878
      78FFE6E6E6FF039C04FF1B671BFFE2E2E2FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000066CCFF0066CC
      FF0066CCFF0066CCFF0066CCFF000000000090A9AD0000000000000000000066
      6600006666000066660000000000000000003EA4CCFF78DEFFFF82B5C6FF5A93
      A6FF62828CFF6F6F6FFFECE8E8FFA2A0A0FFD4D4D4FFB6B7B8FF968A8AFFCC82
      82FFC87070FFBF6D6DFFA65F5FFF939393FF7B635200EBDAC20031319C003194
      F7003163F700212129003152E7003152EF0042429C003152EF004263FF001818
      180018181800212121001818180000000000000000000F9E0FFF009800FF0487
      04FF363F36FF009500FF125C12FF656565FF707070FFCACACAFF000000000000
      0000000000000000000000000000000000000000000000000000000000003399
      CC0066CCFF000000000066CCFF0090A9AD00C0C0C00090A9AD00000000000000
      00000000000000000000000000000000000050BCE2FF6F8F96FFDEDEDEFFA89E
      9EFF686767FFC3C3C3FF909090FFEEEEEEFF939393FFD2D1D1FFECECEDFFF3E6
      E6FFF3E6E6FFE3B5B5FFB25A5AFF9F9F9FFF7B635200D6B58400BD9C7700CFC2
      B000312942004A4A5A001842DE003163F7003152EF002121D6003152EF002121
      AD0000105A0018181800101010000000000000000000000000002DA12DFF008E
      00FF008D00FF008B00FF008B00FF008900FF008800FFAFAFAFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003399CC0066CCFF000033330090A9AD00C0C0C00000000000000000000000
      0000000000000000000000000000000000006AD0F6FF7D9093FFB9B9B9FFF9F9
      F9FF7C7C7CFFA7A7A7FFBDBDBDFFC9C9C9FF7E7676FF8E8383FF868485FFA779
      79FF8D6161FFAD9393FFDCD2D2FF000000007B635200D6B58C00BD9C7700B594
      6B00CFC2B000312942003131E7003131B5003139E7003139E7002929AD002129
      940018181800B5946B0021181000000000000000000000000000000000000000
      000074B774FF1C7E1CFF137513FF2A8B2AFF359535FFF0F0F0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003399CC0066CCFF0090A9AD0090A9AD0000336600000000000000
      00000000000000000000000000000000000081DBFFFFC9F6FEFF96FCFFFF96FC
      FFFF96FCFFFF7ECBCCFF96FCFFFF96FCFFFF84D7D9FF86D9D9FFD1D9DDFFF0F0
      F0FF000000000000000000000000000000007B6B5200D6C69400BD9C7700B998
      7100B9987100DCCCB800DCCCB800DCCCB80042428C0045458400186BAD009C7B
      5A0084634A00FFFFFF0094735200000000000000000000000000000000000000
      00003A8E3AFF007B00FF007A00FF5C5C5CFFFBFBFBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090A9AD0000000000000000000000
      00000000000000000000000000000000000092E8FFFF76DCFFFF72D8FFFF72D8
      FFFF72D8FFFF72D8FFFF72D8FFFF72D8FFFF72D8FFFF3E616EFFF9F9F9FF0000
      000000000000000000000000000000000000947B5A00FFEFD600D6AD8400C69C
      7300C69C7300C69C7300C69C7300C69C7300C69C7300BD9C7300BD9C7300BD94
      7300AD846300846B4A00D6B594003F2E21000000000000000000000000000000
      0000007500FF007300FF007200FF4C684CFFFBFBFBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000003333000033330000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6F7FFFF8BF1FFFF8BF1FFFF8BF1
      FFFFAFDEEEFF80CAE3FF80CAE3FF80CAE3FF80CAE3FFBDD8E2FF000000000000
      000000000000000000000000000000000000E7E7BD007B634A0073634A007B6B
      5200846B5A00846B5A00846B5A00846B5A00846B5A00846B5A00846B5A00846B
      5A009C846500C6A58C007B634A00524A42000000000000000000000000000000
      00006DA96DFF006A00FF006900FFDFDFDFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007FCBE5FF80CCE6FF80CCE6FF70C6
      E2FFF3F3F3FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3F3FFBABABAFF9595
      95FF9B9B9BFFD2D2D2FFFCFCFCFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000585858FF4040
      40FF404040FF404040FF404040FF404040FF404040FF404040FF404040FF4040
      40FF404040FF404040FFE7E7E7FF00000000EFEFEFFFEBEBEBFFEBEBEBFFEBEB
      EBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEB
      EBFFEBEBEBFFEBEBEBFFEBEBEBFFF0F0F0FF000000000000000000000000E7E7
      E7FF939393FF858585FF919191FFB8B8B8FFDADADAFFF5F5F5FF000000000000
      000000000000000000000000000000000000E0DEDEFFB09999FFD4C5C5FFD2BD
      BDFFC5A2A2FF826464FF727272FFFBFBFBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEDECFFF5ED
      E7FFFCF3ECFF888584FFFFF6EEFFFFF2E9FFF9EEE5FFF7EBE1FFF5EADEFFF4E8
      DDFFF6E8DCFFA18F8AFFE7E7E7FF000000007D310BFF7D310AFF7D310AFF7D31
      0AFF7D310AFF7D300AFF7D310AFF7D310AFF7D310AFF7E310AFF7D310AFF7D31
      0AFF7E300AFF7D300AFF8E4019FF959595FF0000000000000000EBEBEBFF0B98
      C8FFB2E8FFFF6BD1FFFF64CDFCFF36B6E6FF217693FF686868FFA5A5A5FFE9E9
      E9FF00000000000000000000000000000000DBD6D6FFECECECFFE2E3E3FFD6C6
      C6FFD0BDBDFFC19F9FFF926E6EFFEBEBEBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEFECFFF8F1
      E7FFCDC9C0FF9B9C9BFFEDEEF0FFD7D9DAFF757678FF4E4C49FF948D80FFFCEC
      D5FFF6E5CEFF9F8E90FFE7E7E7FF00000000E6FFFFFFE1FFFFFFE1FFFFFFE0FF
      FFFFE0FFFFFFE0FFFFFFE1FFFFFFE3FFFFFFE0FFFFFFE1FFFFFFE1FFFFFFE0FF
      FFFFE0FFFFFFE0FFFFFFDEBDA3FF969696FF000000000000000040B3D9FF1DA8
      DBFFA0EDFFFF75DBFFFF75DBFFFF73D9FFFF71D7FFFF75DBFFFF31ADD5FF5F5F
      5FFFC5C5C5FF000000000000000000000000DCCCCCFFF5EFEFFFEAEEEEFFD1B2
      B2FFCC8787FFC18787FFA18F8FFFEEEEEEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F1EFFFF9F4
      ECFFD2B580FF534A3BFFF2DBB4FFF8EBD1FF67655DFFC6C5BDFFBDBEBFFFEFF0
      F2FFDCD0BCFFA39094FFE7E7E7FF00000000E0FEFFFFDAEAEFFFDAEBEFFFDAEB
      F1FFEAF7F1FFE9D3B4FF6179CBFF5A5899FFE2EFEDFFEFDCBEFFDDE6E2FFD9EA
      F1FFDAEBEFFFDBEBF1FFDCB89CFF969696FF000000000000000040B3D9FF33B3
      E6FF91F2FFFF80E5FFFF80E5FFFF7EE4FFFF43ABDEFF80E5FFFF80E5FFFF60D2
      F2FF707070FF00000000000000000000000000000000D29276FFECB88EFFC87D
      83FFC55C5CFFB27777FFA38181FF665555FF949494FFFEFEFEFF000000000000
      0000000000000000000000000000000000000000000000000000F1F3F1FFFEFA
      F5FFDE9F24FF5F4615FFE6AF37FFF0BD56FFF1C266FFEDC888FFAD9977FFF7E2
      BCFFF6E7D5FFA59395FFE7E7E7FF00000000E1FEFFFFDCEBEFFFDBEBF0FFE6F6
      F6FF002AA0FF7B6B93FF49B0E0FF4BB2DDFF896779FF002BB1FFFDE2B7FFDBED
      F3FFDBEBF0FFDAECF0FFE1BA99FF969696FF000000000000000040B3D9FF49BD
      F0FFB5F2FDFF89EFFFFF89EFFFFF65BBD0FF3D92BBFF8AF0FFFF89EFFFFF67DA
      F2FF707070FF000000000000000000000000FCFCFCFFE39D50FFFFB232FFFFB2
      2CFFF7B659FFCE8B86FFD0B4B7FFBF9695FF59514AFF8F8F8FFF848484FFA8A8
      A8FFE8E8E8FF0000000000000000000000000000000000000000F3F4F4FFFFFF
      FCFFA17E48FFB1730FFFAF7E49FF9E838EFF967657FFE1A52DFF3D2D0CFFCC9A
      2FFFF5E9D8FFA99598FFE7E7E7FF00000000E3FEFFFFDDECF0FFDDECF2FFFFF7
      CCFF83F1FFFF50AFDEFF61CEF2FF57CBF1FF359BD3FF26D1FFFFFFCE7BFFE2E4
      DBFFDCECEFFFDEEDF0FFE5BE98FF969696FF000000000000000040B3D9FF5BC7
      FAFFC4F7FDFF93F9FFFF93F9FFFF92F8FFFF40809FFF92F8FFFF93F9FFFF6EE1
      F2FF707070FF000000000000000000000000E6DDDEFFFAB84AFFFFC354FFFFC6
      59FFFFC556FFFFBE49FFDD855AFFBD7B7DFFCD663DFFCC684FFFCF694EFFBA58
      34FF584238FF9F9F9FFF00000000000000000000000000000000F5F7F6FFF0EC
      E7FF5F5D5CFF464C4EFF5C484BFF604B4EFF846C72FF826757FF744A05FFCDB0
      80FFF7EADAFFAC979AFFE7E7E7FF00000000E1FEFFFFDDECF0FFE6F4F3FF0036
      A1FF4C9ED6FF6ED3F6FF5CCEF6FF51BCE6FF4DCBEFFF3AADDEFF003DADFFFDF2
      D8FFDEECF1FFDFEDF1FFE7BE97FF969696FF000000000000000040B3D9FF6DD3
      FFFFD3FBFEFF99FFFFFF99FFFFFF90F6FFFF688C9CFF99FFFFFF99FFFFFF73E6
      F2FF707070FF000000000000000000000000CBBBBEFFFECA5FFFFFD376FFFFD7
      7DFFFFD579FFFFCE68FFCC796DFFAA5352FF8F3C07FF963C08FF9E3808FFAF49
      22FFCC664CFF723A1EFFA8A8A8FF000000000000000000000000F6F8F8FFFFFF
      FBFFA3A19EFF9B9D9AFFEDDBD8FFE7CDCBFF705A5CFFAC9091FF565A5CFFFEF4
      E6FFF6EBDBFFAF9A9CFFE7E7E7FF00000000E3FFFFFFDFEDF0FFE3EEF0FF84E4
      FFFF7CDAFAFF59CDF4FFF0DDD8FF4C3528FF2191E1FF25B8E4FF0FBEEDFFF6EF
      E8FFDEECF0FFDFEDF1FFEBC096FF969696FF000000000000000040B3D9FF60D2
      F2FF83C7E0FF97D7EBFFDFF5FBFFE9FBFDFFD3FCFEFFBFFFFFFFBDFFFFFF8EE6
      F2FF707070FF000000000000000000000000D3C5C5FFFFDB7BFFFFE395FFFFE8
      9FFFFFE598FFFFDE83FFDD9762FFFFBF42FFDB9056FF006B00FFB44900FFA741
      00FF9D3401FFA46B5AFF574943FFF2F2F2FF0000000000000000FEFFFEFF5871
      B2FFC5D4F4FF5686F3FFCAA09EFFEAD3D1FF776164FFA58E8DFFFBF2E7FFF7EC
      E0FFF6EDDDFFB29C9FFFE7E7E7FF00000000E2FEFFFFDFECF2FFE0ECF1FFE5F0
      F2FF517AC7FF55CDF5FFE7DDDBFF46332FFF4FE5FFFF2C9CD4FFF1ECDFFFE0EE
      F2FFDFEDF0FFE0EEF2FFECC095FF969696FF00000000000000003CAED4FF8AEB
      F0FF0099CCFF2E87B3FF5EC8FBFF42BAECFF20A9DCFF6BC5E3FFF0FCFEFFA5E5
      F2FF707070FF000000000000000000000000BFB5AFFFDBC18BFFFEEFADFFFFFE
      C4FFFFF7B6FFFFEB97FFE6B378FFFFD373FFD99E62FF007E00FF3C7400FFC65C
      00FFB44800FF576830FF954C20FFC2C2C2FF0000000000000000FFFFFFFF6796
      F9FFF5F9FFFF9DBFFAFFB5CEFAFFB9BAB6FFD9D0CAFFB4AAA5FFF8F1E7FFF7EE
      E3FFF7EDE1FFB59EA2FFE7E7E7FF00000000E4FEFFFFE1EDF0FFE0EDF0FFE3EE
      F2FF9BE1F6FF67D1F4FFC9BFB9FF282124FF7AE4FEFF54CCEEFFE4EEF2FFE0ED
      F1FFE0EDF1FFE1EEF1FFF1C393FF969696FF00000000000000000000000066C2
      DFFF2BAFE1FF71E4F2FF7EE4FFFF68CEFFFF3990BEFF0DA0D3FF1A86B4FF8FD2
      E9FFAEAEAEFF000000000000000000000000F4F4F4FFD4D0D0FFC8B9BAFFB99C
      9FFFB18C8CFFCCA58AFFF5DDA1FFFFE599FFD8AA76FF748E00FFEA7F00FF5D7A
      00FF007400FF14660AFF76612AFFACACACFF0000000000000000FFFFFFFFFFFF
      FBFFCDE1FFFFFFFFFFFFA3C4FDFFE9E4DEFFC0A0A0FFFFFFF6FFF0EAE2FFF7F0
      E6FFF8F0E4FFB99FA2FFE7E7E7FF00000000E5FFFFFFE3EEF2FFE2EFF2FFE3EE
      F1FFE4EFF1FFE8F1F4FFD3CCBEFF5E6162FFEFFAFFFFE6EFF2FFE3EEF2FFE3EF
      F2FFE3EFF2FFE2F0F4FFF4C590FF949494FF0000000000000000000000000000
      00004DBFF2FF2381A1FF43C6E2FF79E5F9FF72D8FFFF33B3E5FF42BAECFF229B
      C5FFF5F5F5FF000000000000000000000000000000000000000000000000D3D1
      D3FFDDBC78FFE7D3A6FFFEFCC9FFFFF4B3FFE0B383FFFFA919FFFE9802FFF484
      00FF008000FF356700FF556418FFB9B9B9FF0000000000000000FEFFFFFFCBCB
      CDFFCED2D6FFE7F2FFFF9FA7B5FFFFFFFAFFD4B9BAFFFFFDF7FF574244FFFAF5
      EBFFF8F2E8FFBA9D9FFFE7E7E7FF00000000DCDFD1FFD9D4BCFFDAD4BCFFDAD4
      BCFFDAD4BCFFDAD4BDFFDAD4BCFFDAD5BDFFDAD4BCFFDAD4BCFFD9D4BCFFD9D3
      BBFFD9D3BBFFDAD4BBFFF1BA72FF959595FF0000000000000000000000000000
      000051C4F2FF2B6E84FFCFCFCFFF00000000000000005BC6F9FF707070FF0000
      000000000000000000000000000000000000000000000000000000000000F2F2
      F2FFF2F2F0FFDE9A60FF76B37EFF97AB90FFA09F8DFFA6D470FFFFBF4CFFFF96
      02FF078B00FF007800FF656703FFECECECFF0000000000000000FDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFFFFC5AEAFFFB6817FFF8A6E6DFFF9F6
      F0FFF8F3E9FFBC9A9EFFE7E7E7FF00000000B95F00FFB55B00FFB45C00FFB45B
      00FFB45D00FFB55C00FFB45B00FFB45B00FFB55B00FFB55E00FFB35C00FFC172
      1AFFCA7C29FF795F5FFFDF8114FFACACACFF0000000000000000000000000000
      00004CB9DBFF65D8F2FF6B6B6BFFDCDCDCFFE8E8E8FF7ADFFFFF767676FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000079BF54FF2BC558FF65DC85FFB5ECA6FFF3FDD7FFB7CE6BFFC0A2
      12FFC68000FF037B00FFAB8A65FF000000000000000000000000FEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFEFEFFFDFBF8FF6A5556FF8E6C6CFFFFFFFFFFE4AB
      2BFFD18F17FFA87B58FF0000000000000000D8811BFFE0871EFFE0851AFFE084
      19FFDF8012FFE0851AFFE0861DFFE0851DFFE0841AFFDF8214FFDE7E0EFFDD7B
      0BFFDC7906FFE78208FFDB8E32FFFEFEFEFF0000000000000000000000000000
      0000000000007CECF5FF4DCCE6FF3E6471FF27A4C6FF96FCFFFFB9B9B9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFF9FF80B540FF7BE495FFDAF2B3FFDDECA3FF2ECC66FFA3A1
      14FFE27A00FFCA8E13FFFAFAFAFF000000000000000000000000FEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0EDFFFFFFFDFFFFFEFBFFEFD7
      ADFFC19F88FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000048C4E0FF99FFFFFF86F2F9FF75AEC1FFFBFBFBFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFAFFB6E393FF7DDC86FF57D87EFF24C353FF74A3
      21FFE6BB74FFFEFEFEFF00000000000000000000000000000000FFFFFFFFFEFF
      FFFFFEFFFFFFFDFEFFFFFBFDFFFFFAFDFEFFF9FAFDFFF6F9F9FFF7FCFBFFBDA3
      9FFF00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001C03F00000000C001C01F00000000
      C001C00700000000C001C00300000000C001C00100000000C001C00000000000
      C001C00000000000C001C00000000000C001C00000000000C001C00000000000
      C001C00000000000C001C00000000000C001C00300000000C001C00700000000
      C001C01F00000000C003C03F00000000C000FFFFFC070FFFC000FFFFF00107FF
      0000FFFFF00103FF0000C00FE00001FF00008007E00080FF00000000E000C003
      00000000E000E00100000000E000F00000000001E001F80000000003E001F800
      000001FFE003F0000000C0FFE003F8000003E1FF0007F8000003FFFF000FF800
      0003FFFF003FFC010007FFFF00FFFE031FFFE03FFFFFF9EF0001801FFE7FF003
      00018003FE3FF00000010701801FF00000010F800001F000000118000000F000
      0001180180C000000001180F80C40000000108FF00410000000100FF00630000
      0001803F003F00000001C03F003F00010001F03F003F000F0000F07F003F001F
      0000F07FC03F003F0000F0FFF07F07FFFFFFFFFF81FFC0010000E03F00FFC001
      0000C00F00FFC0010000C00700FFC0010000C007803FC0010000C0070007C001
      0000C0070003C0010000C0070001C0010000C0070000C0010000C0070000C001
      0000E0070000C0010000F007E000C0010000F19FE000C0010000F01FF801C003
      0000F81FF801C007FFFFFC1FFC03C00F00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Left = 348
    Top = 372
  end
  object PopupActionSelector: TPopupMenu
    Left = 248
    Top = 376
    object pasItemNoAction: TMenuItem
      OnClick = ActionClick
    end
    object pasItemEmbeddedAction: TMenuItem
      Caption = #32068#12415#36796#12415#12513#12491#12517#12540
      object URL1: TMenuItem
        Caption = #26368#36817#38281#12376#12383'URL'
      end
      object URL2: TMenuItem
        Caption = #26368#36817#38283#12356#12383'URL'
      end
      object N2: TMenuItem
        Caption = #25991#23383#12467#12540#12489
      end
      object N3: TMenuItem
        Caption = #12469#12452#12489#12496#12540
      end
      object N9: TMenuItem
        Caption = #12502#12483#12463#12510#12540#12463
      end
      object N7: TMenuItem
        Caption = #33258#21205#20877#35501#12415#36796#12415
      end
      object N8: TMenuItem
        Caption = #12475#12461#12517#12522#12486#12451
      end
      object N4: TMenuItem
        Caption = #12463#12452#12483#12463#35373#23450
      end
      object N5: TMenuItem
        Caption = #12467#12510#12531#12489#22411#25313#24373
      end
      object N1: TMenuItem
        Caption = #12503#12525#12461#12471#12473#12452#12483#12481
      end
      object UA1: TMenuItem
        Caption = 'UA'#12473#12452#12483#12481
      end
      object N6: TMenuItem
        Caption = #12473#12479#12452#12523#12471#12540#12488#12473#12452#12483#12481
      end
      object Cookie1: TMenuItem
        Caption = 'Cookie'#12510#12493#12540#12472#12515
      end
    end
  end
end
