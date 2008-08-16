object BagelMainForm: TBagelMainForm
  Left = 293
  Top = 0
  Caption = 'Bagel'
  ClientHeight = 494
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BasePanel: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 494
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 0
    object Panel12: TPanel
      Left = 0
      Top = 22
      Width = 671
      Height = 26
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      Visible = False
      object ToolBar5: TToolBar
        Left = 2
        Top = 2
        Width = 667
        Height = 22
        Align = alClient
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 19
        Caption = 'ToolBar5'
        EdgeInner = esNone
        GradientEndColor = 14077651
        ShowCaptions = True
        TabOrder = 0
        object btnPrint: TButton
          Left = 0
          Top = 0
          Width = 75
          Height = 21
          Action = actPrint
          TabOrder = 2
        end
        object btnPageSetup: TButton
          Left = 75
          Top = 0
          Width = 75
          Height = 21
          TabOrder = 4
          OnClick = btnPageSetupClick
        end
        object ToolButton4: TToolButton
          Left = 150
          Top = 0
          Width = 14
          Caption = 'ToolButton4'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 164
          Top = 0
          Caption = '|<'
          Enabled = False
          ImageIndex = 2
        end
        object ToolButton7: TToolButton
          Left = 183
          Top = 0
          Caption = '<'
          Enabled = False
          ImageIndex = 3
        end
        object Edit1: TEdit
          Left = 202
          Top = 0
          Width = 50
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object Label6: TLabel
          Left = 252
          Top = 0
          Width = 24
          Height = 21
          AutoSize = False
          Caption = ' /1'
          Layout = tlCenter
        end
        object ToolButton8: TToolButton
          Left = 276
          Top = 0
          Caption = '>'
          Enabled = False
          ImageIndex = 4
        end
        object ToolButton9: TToolButton
          Left = 295
          Top = 0
          Caption = '>|'
          Enabled = False
          ImageIndex = 5
        end
        object ToolButton11: TToolButton
          Left = 314
          Top = 0
          Width = 14
          Caption = 'ToolButton11'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 328
          Top = 0
          Caption = '+'
          Enabled = False
          ImageIndex = 6
        end
        object ToolButton10: TToolButton
          Left = 347
          Top = 0
          Caption = '-'
          Enabled = False
          ImageIndex = 7
        end
        object ComboBox2: TComboBox
          Left = 366
          Top = 0
          Width = 75
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
        end
        object ToolButton17: TToolButton
          Left = 441
          Top = 0
          Width = 14
          Caption = 'ToolButton17'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object ToolButton12: TToolButton
          Left = 455
          Top = 0
          Caption = #32294
          Enabled = False
          ImageIndex = 8
        end
        object ToolButton13: TToolButton
          Left = 474
          Top = 0
          Caption = #27178
          Enabled = False
          ImageIndex = 9
        end
        object ToolButton18: TToolButton
          Left = 493
          Top = 0
          Width = 14
          Caption = 'ToolButton18'
          ImageIndex = 10
          Style = tbsSeparator
        end
        object btnPPClose: TButton
          Left = 507
          Top = 0
          Width = 75
          Height = 21
          Caption = #38281#12376#12427
          TabOrder = 1
          OnClick = btnPPCloseClick
        end
      end
    end
    object SidebarTogglePanel: TPanel
      Left = 0
      Top = 70
      Width = 5
      Height = 424
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      OnClick = SidebarTogglePanelClick
    end
    object SideBasePanel: TPanel
      Left = 5
      Top = 70
      Width = 200
      Height = 424
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'SideBasePanel'
      TabOrder = 2
      object SideSplitter: TPanel
        Left = 196
        Top = 0
        Width = 4
        Height = 424
        Cursor = crHSplit
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        OnMouseDown = SideSplitterMouseDown
        OnMouseMove = SideSplitterMouseMove
        OnMouseUp = SideSplitterMouseUp
      end
      object SidePanel: TPanel
        Left = 0
        Top = 0
        Width = 196
        Height = 424
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'SidePanel'
        TabOrder = 1
        OnResize = SidePanelResize
        object SidebarHeaderPanel: TPanel
          Left = 2
          Top = 2
          Width = 192
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel1: TBevel
            Left = 0
            Top = 23
            Width = 192
            Height = 2
            Align = alBottom
            Shape = bsBottomLine
            ExplicitTop = 20
          end
          object SidebarHeaderButtonbar: TToolBar
            Left = 1
            Top = 1
            Width = 41
            Height = 19
            Align = alNone
            AutoSize = True
            ButtonHeight = 19
            ButtonWidth = 42
            Caption = 'SidebarHeaderButtonbar'
            EdgeInner = esNone
            EdgeOuter = esNone
            GradientEndColor = 14077651
            List = True
            ShowCaptions = True
            TabOrder = 0
            OnResize = SidebarHeaderButtonbarResize
            object SidebarSelector: TToolButton
              Left = 0
              Top = 0
              AutoSize = True
              Caption = #12497#12493#12523
              DropdownMenu = SidebarPopup
              Grouped = True
            end
          end
          object Panel9: TPanel
            Left = 167
            Top = 0
            Width = 25
            Height = 23
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object SidebarCloseButton: TSpeedButton
              Left = 7
              Top = 1
              Width = 18
              Height = 18
              Flat = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Glyph.Data = {
                E6010000424DE60100000000000036000000280000000C0000000C0000000100
                180000000000B001000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FF0000
                00000000FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000
                000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF000000000000FF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF}
              Layout = blGlyphBottom
              ParentFont = False
              Spacing = 0
              OnClick = SidebarCloseButtonClick
            end
          end
        end
        object SidebarHeaderToolbar: TToolBar
          Left = 2
          Top = 27
          Width = 192
          Height = 22
          AutoSize = True
          Caption = 'SidebarHeaderToolbar'
          Color = clBtnFace
          GradientEndColor = 14077651
          Images = ImageList1
          ParentColor = False
          TabOrder = 1
          Transparent = True
          Visible = False
        end
        object Panel1: TPanel
          Left = 2
          Top = 49
          Width = 192
          Height = 373
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 2
          OnResize = Panel1Resize
          object PageControl1: TPageControl
            Left = -8
            Top = 0
            Width = 200
            Height = 213
            ActivePage = MemoSheet
            HotTrack = True
            RaggedRight = True
            Style = tsButtons
            TabOrder = 0
            object BookmarkSheet: TTabSheet
              Caption = #12502#12483#12463#12510#12540#12463
              ImageIndex = 6
              TabVisible = False
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 192
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                OnResize = Panel5Resize
                object bkmkSearchEdit: TEdit
                  Left = 0
                  Top = 1
                  Width = 217
                  Height = 21
                  TabOrder = 0
                  OnChange = bkmkSearchEditChange
                  OnKeyDown = bkmkSearchEditKeyDown
                end
              end
            end
            object HistorySheet: TTabSheet
              Caption = #23653#27508
              ImageIndex = 1
              TabVisible = False
              object Panel7: TPanel
                Left = 0
                Top = 21
                Width = 192
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                Visible = False
                OnResize = Panel7Resize
                object edtHistorySearch: TEdit
                  Left = 4
                  Top = 0
                  Width = 209
                  Height = 21
                  TabOrder = 0
                end
              end
              object HistoryToolBar: TToolBar
                Left = 0
                Top = 0
                Width = 192
                Height = 21
                AutoSize = True
                ButtonHeight = 21
                ButtonWidth = 31
                Caption = 'HistoryToolBar'
                GradientEndColor = 14077651
                ShowCaptions = True
                TabOrder = 1
                Transparent = True
                object tbHistoryShowType: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #34920#31034
                  DropdownMenu = HistoryOrderPopup
                  ImageIndex = 0
                end
                object tbHistorySearch: TToolButton
                  Left = 35
                  Top = 0
                  AutoSize = True
                  Caption = #26908#32034
                  ImageIndex = 1
                  Style = tbsCheck
                end
              end
            end
            object LinkSheet: TTabSheet
              Caption = #12522#12531#12463
              ImageIndex = 2
              TabVisible = False
              object Panel4: TPanel
                Left = 0
                Top = 20
                Width = 192
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object cboExtractPattern: TComboBox
                  Left = 72
                  Top = 4
                  Width = 161
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnKeyPress = cboExtractPatternKeyPress
                  Items.Strings = (
                    '*.html;*.htm'
                    '*.png;*.jpg;*.jpeg;*.gif'
                    '*.avi;*.mpg;*.mpeg;*.wmv;*.rm;*.ram;*.mov'
                    '*.wav;*.mp3;*.wma'
                    '%cur%*'
                    '*/')
                end
                object cboExtractDetType: TComboBox
                  Left = 0
                  Top = 4
                  Width = 69
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 1
                  Text = 'URL'
                  Items.Strings = (
                    'URL'
                    #12486#12461#12473#12488)
                end
              end
              object LinkListView: TListView
                Left = 0
                Top = 65
                Width = 192
                Height = 138
                Align = alClient
                Checkboxes = True
                Columns = <
                  item
                    AutoSize = True
                    Caption = #12486#12461#12473#12488
                  end
                  item
                    Caption = 'URL'
                  end>
                HideSelection = False
                ReadOnly = True
                RowSelect = True
                TabOrder = 1
                ViewStyle = vsReport
                OnDblClick = LinkListViewDblClick
              end
              object ToolBar2: TToolBar
                Left = 0
                Top = 0
                Width = 192
                Height = 20
                AutoSize = True
                ButtonHeight = 19
                ButtonWidth = 47
                Caption = 'ToolBar2'
                EdgeBorders = [ebBottom]
                EdgeOuter = esNone
                GradientEndColor = 14077651
                List = True
                ShowCaptions = True
                TabOrder = 2
                Wrapable = False
                object tbDoExtract: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #25277#20986
                  ImageIndex = 0
                  Style = tbsTextButton
                  OnClick = tbDoExtractClick
                end
                object tbDoSelection: TToolButton
                  Left = 40
                  Top = 0
                  AutoSize = True
                  Caption = #32094#36796#12415
                  ImageIndex = 5
                  Style = tbsTextButton
                  OnClick = tbDoSelectionClick
                end
                object tbDoExclude: TToolButton
                  Left = 91
                  Top = 0
                  AutoSize = True
                  Caption = #38500#22806
                  ImageIndex = 5
                  Style = tbsTextButton
                  OnClick = tbDoExcludeClick
                end
                object ToolButton22: TToolButton
                  Left = 131
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton22'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object tbFixExtract: TToolButton
                  Left = 139
                  Top = 0
                  AutoSize = True
                  Caption = #22266#23450
                  ImageIndex = 3
                  Style = tbsTextButton
                  OnClick = tbFixExtractClick
                end
                object tbExtractSetting: TToolButton
                  Left = 179
                  Top = 0
                  AutoSize = True
                  Caption = #35373#23450
                  ImageIndex = 4
                  Style = tbsTextButton
                end
              end
              object ToolBar4: TToolBar
                Left = 0
                Top = 46
                Width = 192
                Height = 19
                AutoSize = True
                ButtonHeight = 19
                ButtonWidth = 48
                Caption = 'ToolBar2'
                EdgeOuter = esNone
                GradientEndColor = 14077651
                List = True
                ShowCaptions = True
                TabOrder = 3
                Wrapable = False
                object tbCopyExtract: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #12467#12500#12540
                  ImageIndex = 5
                  Style = tbsTextButton
                  OnClick = tbCopyExtractClick
                end
                object tbSaveExtract: TToolButton
                  Left = 43
                  Top = 0
                  AutoSize = True
                  Caption = #20445#23384
                  ImageIndex = 6
                  Style = tbsTextButton
                end
                object tbOpenExtract: TToolButton
                  Left = 83
                  Top = 0
                  AutoSize = True
                  Caption = #38283#12367
                  ImageIndex = 7
                  Style = tbsTextButton
                  OnClick = tbOpenExtractClick
                end
                object tbExtractSelectAll: TToolButton
                  Left = 117
                  Top = 0
                  AutoSize = True
                  Caption = #20840#36984#25246
                  ImageIndex = 9
                  Style = tbsTextButton
                  OnClick = tbExtractSelectAllClick
                end
                object tbExtractReverse: TToolButton
                  Left = 169
                  Top = 0
                  AutoSize = True
                  Caption = #21453#36578
                  ImageIndex = 10
                  Style = tbsTextButton
                  OnClick = tbExtractReverseClick
                end
              end
            end
            object GrepSheet: TTabSheet
              Caption = 'Grep'
              ImageIndex = 5
              TabVisible = False
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 192
                Height = 73
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                OnResize = Panel6Resize
                object cmbGrepKeyword: TComboBox
                  Left = 0
                  Top = 0
                  Width = 201
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnKeyPress = cmbGrepKeywordKeyPress
                end
                object cmbGrepKind: TComboBox
                  Left = 0
                  Top = 24
                  Width = 201
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 1
                  Text = #26222#36890#12398#26908#32034
                  Items.Strings = (
                    #26222#36890#12398#26908#32034
                    #27491#35215#34920#29694
                    'Migemo')
                end
                object cboGrepTarget: TComboBox
                  Left = 0
                  Top = 48
                  Width = 201
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = #29694#22312#12398#12479#12502
                  Items.Strings = (
                    #29694#22312#12398#12479#12502
                    #24038#12398#12479#12502
                    #21491#12398#12479#12502
                    #12377#12409#12390#12398#12479#12502)
                end
              end
              object GrepList: TListView
                Left = 0
                Top = 73
                Width = 192
                Height = 130
                Align = alClient
                Columns = <
                  item
                    Caption = #12498#12483#12488#12375#12383#25991#23383#21015
                    Width = 200
                  end>
                HideSelection = False
                TabOrder = 1
                ViewStyle = vsReport
                OnClick = GrepListClick
              end
            end
            object WebPanelSheet: TTabSheet
              Caption = 'Web'#12497#12493#12523
              ImageIndex = 4
              TabVisible = False
              object XPToolBar1: TToolBar
                Left = 0
                Top = 0
                Width = 192
                Height = 20
                AutoSize = True
                ButtonHeight = 19
                ButtonWidth = 70
                Caption = 'XPToolBar1'
                EdgeBorders = [ebBottom]
                EdgeOuter = esNone
                GradientEndColor = 14077651
                List = True
                ShowCaptions = True
                TabOrder = 0
                object ToolButton2: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #12497#12493#12523
                end
                object ToolButton3: TToolButton
                  Left = 41
                  Top = 0
                  AutoSize = True
                  Caption = #20877#35501#12415#36796#12415
                  ImageIndex = 1
                end
              end
            end
            object ScriptSheet: TTabSheet
              Caption = #12473#12463#12522#12503#12488
              ImageIndex = 5
              TabVisible = False
              object ScriptList: TListBox
                Left = 0
                Top = 0
                Width = 192
                Height = 203
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
              end
            end
            object ClipSheet: TTabSheet
              Caption = #12463#12522#12483#12503#12508#12540#12489
              ImageIndex = 6
              TabVisible = False
              object ObserveClipList: TListBox
                Left = 0
                Top = 37
                Width = 192
                Height = 166
                Align = alClient
                ItemHeight = 13
                TabOrder = 0
                OnClick = ObserveClipListClick
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 192
                Height = 37
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object chkObserveClipboard: TCheckBox
                  Left = 8
                  Top = 0
                  Width = 145
                  Height = 17
                  Caption = #30435#35222#12377#12427
                  TabOrder = 0
                  OnClick = chkObserveClipboardClick
                end
                object chkObsNotLoaded: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 193
                  Height = 17
                  Caption = #12479#12502#12395#28961#12356'URL'#12398#12415#38283#12367
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
              end
            end
            object MemoSheet: TTabSheet
              Caption = #12513#12514
              ImageIndex = 7
              TabVisible = False
              OnShow = MemoSheetShow
              object Splitter3: TSplitter
                Left = 0
                Top = 133
                Width = 192
                Height = 5
                Cursor = crVSplit
                Align = alTop
                AutoSnap = False
                ExplicitWidth = 239
              end
              object memoMemo: TMemo
                Left = 0
                Top = 159
                Width = 192
                Height = 44
                Align = alClient
                HideSelection = False
                ScrollBars = ssVertical
                TabOrder = 0
                OnChange = memoMemoChange
              end
              object lvMemo: TListView
                Left = 0
                Top = 42
                Width = 192
                Height = 91
                Align = alTop
                Columns = <
                  item
                    AutoSize = True
                  end>
                HideSelection = False
                OwnerDraw = True
                ReadOnly = True
                RowSelect = True
                ShowColumnHeaders = False
                TabOrder = 1
                ViewStyle = vsReport
                OnDblClick = lvMemoDblClick
                OnDrawItem = lvMemoDrawItem
                OnEditing = lvMemoEditing
                OnSelectItem = lvMemoSelectItem
              end
              object TabControl2: TTabControl
                Left = 0
                Top = 21
                Width = 192
                Height = 21
                Align = alTop
                MultiLine = True
                TabOrder = 2
                OnChange = TabControl2Change
                OnMouseDown = TabControl2MouseDown
                OnResize = TabControl2Resize
              end
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 192
                Height = 21
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #26908#32034
                TabOrder = 3
                object edtMemoSearch: TEdit
                  Left = 28
                  Top = 0
                  Width = 205
                  Height = 21
                  TabOrder = 0
                  OnChange = edtMemoSearchChange
                  OnKeyPress = edtMemoSearchKeyPress
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 138
                Width = 192
                Height = 21
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #12479#12452#12488#12523
                TabOrder = 4
                object edtMemoTitle: TEdit
                  Left = 44
                  Top = 0
                  Width = 193
                  Height = 21
                  TabOrder = 0
                end
              end
            end
            object DLSheet: TTabSheet
              Caption = #12480#12454#12531#12525#12540#12480
              ImageIndex = 8
              TabVisible = False
              object ToolBar3: TToolBar
                Left = 0
                Top = 0
                Width = 192
                Height = 19
                AutoSize = True
                ButtonHeight = 19
                ButtonWidth = 71
                Caption = 'ToolBar3'
                GradientEndColor = 14077651
                List = True
                ShowCaptions = True
                TabOrder = 0
                Wrapable = False
                object ToolButton14: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #20445#23384#12501#12457#12523#12480
                  ImageIndex = 0
                end
                object ToolButton15: TToolButton
                  Left = 75
                  Top = 0
                  AutoSize = True
                  Caption = #23653#27508#12398#28040#21435
                  ImageIndex = 1
                end
                object ToolButton16: TToolButton
                  Left = 149
                  Top = 0
                  AutoSize = True
                  Caption = #12484#12540#12523
                  ImageIndex = 2
                  Style = tbsDropDown
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 133
                Width = 192
                Height = 70
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 1
                object Label2: TLabel
                  Left = 4
                  Top = 4
                  Width = 18
                  Height = 13
                  Caption = 'URI'
                end
                object Label3: TLabel
                  Left = 4
                  Top = 20
                  Width = 34
                  Height = 13
                  Caption = #12501#12449#12452#12523
                end
                object Label4: TLabel
                  Left = 4
                  Top = 36
                  Width = 29
                  Height = 13
                  Caption = #12469#12452#12474
                end
                object Label5: TLabel
                  Left = 4
                  Top = 52
                  Width = 47
                  Height = 13
                  Caption = #36578#36865#28168#12415
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'OutPut'
              ImageIndex = 9
              TabVisible = False
              object lstOutPut: TListBox
                Left = 0
                Top = 0
                Width = 192
                Height = 203
                Align = alClient
                ItemHeight = 13
                Items.Strings = (
                  '('#65439#1044#65439')'#65308#12487#12496#12483#12464#29992)
                TabOrder = 0
              end
            end
            object UsrTabSheet: TTabSheet
              Caption = #12518#12540#12470#12540#23450#32681
              ImageIndex = 10
              TabVisible = False
              OnShow = UsrTabSheetShow
              object ToolBar1: TToolBar
                Left = 0
                Top = 0
                Width = 192
                Height = 20
                AutoSize = True
                ButtonHeight = 19
                ButtonWidth = 36
                Caption = 'ToolBar1'
                EdgeBorders = [ebBottom]
                EdgeOuter = esNone
                GradientEndColor = 14077651
                List = True
                ShowCaptions = True
                TabOrder = 0
                object tbUsrDefSetting: TToolButton
                  Left = 0
                  Top = 0
                  AutoSize = True
                  Caption = #35373#23450
                  ImageIndex = 0
                  OnClick = tbUsrDefSettingClick
                end
              end
            end
          end
        end
      end
    end
    object ViewPanel: TPanel
      Left = 205
      Top = 70
      Width = 466
      Height = 424
      Align = alClient
      AutoSize = True
      BevelOuter = bvNone
      Color = clAppWorkSpace
      TabOrder = 3
      OnResize = ViewPanelResize
      object MenuTrackerToolbar: TToolBar
        Left = 6
        Top = 233
        Width = 47
        Height = 29
        Align = alNone
        Caption = 'MenuTrackerToolbar'
        GradientEndColor = 14077651
        TabOrder = 0
        Visible = False
        object tbMenuTracker: TToolButton
          Left = 0
          Top = 0
          ImageIndex = 0
        end
      end
      object Panel10: TPanel
        Left = 56
        Top = 236
        Width = 28
        Height = 28
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'Panel10'
        TabOrder = 1
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 28
          Height = 28
          AutoSize = True
          Picture.Data = {
            07544269746D617066090000424D660900000000000036000000280000001C00
            00001C0000000100180000000000300900000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080808080808080FFFFFFFFFFFF
            FFFFFFFFFFFF808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
            8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
            808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080
            80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
            00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
            00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFF
            FFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF00000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
            FF808080FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
            000000FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFF0000
            00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFF
            FFFFFF808080808080FFFFFFFFFFFF000000000000000000000000000000FFFF
            FFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFF000000000000000000000000000000FFFFFFFFFFFF808080808080FFFFFF
            FFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
            0000000000FFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFF000000000000
            000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFF80
            8080FFFFFF808080FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFF
            FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFF
            FFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
            FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
            0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000000000000000000000000000000000000000000000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
            00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFF808080808080
            808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
      end
      object NotificationPanel: TPanel
        Left = 0
        Top = 0
        Width = 466
        Height = 25
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'LoginPrompt'
        Color = clInfoBk
        TabOrder = 2
        Visible = False
      end
    end
    object LocationBar: TToolBar
      Left = 0
      Top = 48
      Width = 671
      Height = 22
      AutoSize = True
      ButtonWidth = 51
      GradientEndColor = 14077651
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 4
      Transparent = True
      OnResize = LocationBarResize
      object LocationBox: TComboBoxEx
        Left = 0
        Top = 0
        Width = 397
        Height = 22
        AutoCompleteOptions = [acoAutoSuggest, acoAutoAppend, acoUpDownKeyDropsList]
        ItemsEx = <>
        ItemHeight = 16
        TabOrder = 0
        OnKeyDown = LocationBoxKeyDown
      end
      object GoButton: TToolButton
        Left = 397
        Top = 0
        AutoSize = True
        Caption = #31227#21205
        DropdownMenu = GoButtonPopup
        ImageIndex = 5
        Style = tbsDropDown
      end
    end
    object SearchBar: TToolBar
      Left = 0
      Top = 0
      Width = 671
      Height = 22
      AutoSize = True
      ButtonWidth = 43
      Caption = #26908#32034#12496#12540
      GradientEndColor = 14077651
      Images = ImageList1
      List = True
      AllowTextButtons = True
      TabOrder = 5
      Wrapable = False
      object SearchBox: TComboBoxEx
        Left = 0
        Top = 0
        Width = 145
        Height = 22
        ItemsEx = <>
        ItemHeight = 16
        TabOrder = 1
        OnChange = SearchBoxChange
        OnKeyPress = SearchBoxKeyPress
        OnSelect = SearchBoxSelect
      end
      object Splitter2: TSplitter
        Left = 145
        Top = 0
        Width = 6
        Height = 22
      end
      object EngineBox: TComboBoxEx
        Left = 151
        Top = 0
        Width = 144
        Height = 22
        ItemsEx = <>
        Style = csExDropDownList
        StyleEx = [csExNoSizeLimit]
        ItemHeight = 16
        TabOrder = 0
        OnSelect = EngineBoxSelect
        DropDownCount = 20
      end
      object ToolButton6: TToolButton
        Left = 295
        Top = 0
        AutoSize = True
        ImageIndex = 5
      end
      object HighLightButton: TToolButton
        Left = 319
        Top = 0
        AutoSize = True
        ImageIndex = 26
        Style = tbsCheck
        OnClick = HighLightButtonClick
      end
      object tbGrepSearchBarText: TToolButton
        Left = 343
        Top = 0
        AutoSize = True
        ImageIndex = 46
        OnClick = tbGrepSearchBarTextClick
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 432
    Top = 128
    object actAboutBagel: TAction
      Category = #12504#12523#12503
      Caption = 'Bagel'#12395#12388#12356#12390
      OnExecute = actAboutBagelExecute
    end
    object actSelectAll: TEditSelectAll
      Category = #32232#38598
      Caption = #12377#12409#12390#36984#25246'(&A)'
      Hint = #12377#12409#12390#12434#36984#25246'|'#12489#12461#12517#12513#12531#12488#20840#20307#12434#36984#25246#12377#12427
      ShortCut = 16449
      OnExecute = actSelectAllExecute
    end
    object actPaste: TEditPaste
      Category = #32232#38598
      Caption = #36028#12426#20184#12369'(&P)'
      Hint = #36028#12426#20184#12369'|'#12463#12522#12483#12503#12508#12540#12489#12398#20869#23481#12434#36028#12426#20184#12369#12427
      ShortCut = 16470
      OnExecute = actPasteExecute
    end
    object actCopy: TEditCopy
      Category = #32232#38598
      Caption = #12467#12500#12540'(&C)'
      Hint = #12467#12500#12540'|'#36984#25246#31684#22258#12434#12463#12522#12483#12503#12508#12540#12489#12395#12467#12500#12540
      ShortCut = 16451
      OnExecute = actCopyExecute
    end
    object actGoBack: TControlAction
      Category = #31227#21205
      Caption = #25147#12427
      DropdownMenu = BackHistoryPopup
      ImageIndex = 0
      OnExecute = actGoBackExecute
    end
    object actCut: TEditCut
      Category = #32232#38598
      Caption = #20999#12426#21462#12426'(&T)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12426#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ShortCut = 16472
      OnExecute = actCutExecute
    end
    object actGoForward: TControlAction
      Category = #31227#21205
      Caption = #36914#12416
      DropdownMenu = ForwardHistoryPopup
      ImageIndex = 1
      OnExecute = actGoForwardExecute
    end
    object actToggleStatusbarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12473#12486#12540#12479#12473#12496#12540
      OnExecute = actToggleStatusbarVisibleExecute
    end
    object actRewind: TControlAction
      Category = #31227#21205
      Caption = #24059#12365#25147#12375
      ImageIndex = 25
      OnExecute = actRewindExecute
    end
    object actFastForward: TControlAction
      Category = #31227#21205
      Caption = #26089#36865#12426
      ImageIndex = 24
      OnExecute = actFastForwardExecute
    end
    object actAllowJS: TAction
      Category = #12475#12461#12517#12522#12486#12451
      AutoCheck = True
      Caption = 'JavaScript'#12434#35377#21487
      ImageIndex = 41
      OnExecute = actAllowJSExecute
    end
    object actPageUp: TAction
      Category = #34920#31034
      Caption = 'actPageUp'
      OnExecute = actPageUpExecute
    end
    object actAllowImg: TAction
      Category = #12475#12461#12517#12522#12486#12451
      AutoCheck = True
      Caption = #30011#20687#35501#12415#36796#12415#12434#35377#21487
      ImageIndex = 42
      OnExecute = actAllowImgExecute
    end
    object actAllowFrames: TAction
      Category = #12475#12461#12517#12522#12486#12451
      AutoCheck = True
      Caption = #12501#12524#12540#12512#12434#35377#21487
      ImageIndex = 44
      OnExecute = actAllowFramesExecute
    end
    object actAllowPlugins: TAction
      Category = #12475#12461#12517#12522#12486#12451
      AutoCheck = True
      Caption = #12503#12521#12464#12452#12531#23455#34892#12434#35377#21487
      ImageIndex = 43
      OnExecute = actAllowPluginsExecute
    end
    object actAllowRedirect: TAction
      Category = #12475#12461#12517#12522#12486#12451
      AutoCheck = True
      Caption = 'Meta'#35201#32032#12395#12424#12427#12522#12480#12452#12524#12463#12488#12434#35377#21487
      ImageIndex = 45
      OnExecute = actAllowRedirectExecute
    end
    object actCloseTab: TAction
      Category = #12479#12502
      Caption = #12479#12502#12434#38281#12376#12427
      ImageIndex = 11
      OnExecute = actCloseTabExecute
    end
    object actStop: TAction
      Category = #34920#31034
      Caption = #20572#27490
      ImageIndex = 4
      OnExecute = actStopExecute
    end
    object actReload: TAction
      Category = #34920#31034
      Caption = #20877#35501#12415#36796#12415
      ImageIndex = 3
      OnExecute = actReloadExecute
    end
    object actGoUp: TControlAction
      Category = #31227#21205
      Caption = #19968#12388#19978#12398#38542#23652#12408
      DropdownMenu = GoUpPopup
      ImageIndex = 12
      PopupMenu = GoUpPopup
      OnExecute = actGoUpExecute
    end
    object actGo: TControlAction
      Category = #31227#21205
      Caption = #31227#21205
      DropdownMenu = GoButtonPopup
      ImageIndex = 5
      OnExecute = actGoExecute
    end
    object actCloseAll: TAction
      Category = #12479#12502
      Caption = #12479#12502#12434#20840#12390#38281#12376#12427
      OnExecute = actCloseAllExecute
    end
    object actCloseLeft: TAction
      Category = #12479#12502
      Caption = #24038#12398#12479#12502#12434#20840#12390#38281#12376#12427
      OnExecute = actCloseLeftExecute
    end
    object actCloseRight: TAction
      Category = #12479#12502
      Caption = #21491#12398#12479#12502#12434#20840#12390#38281#12376#12427
      OnExecute = actCloseRightExecute
    end
    object actCloseWithout: TAction
      Category = #12479#12502
      Caption = #12371#12428#20197#22806#12434#38281#12376#12427
      OnExecute = actCloseWithoutExecute
    end
    object actReloadAll: TAction
      Category = #34920#31034
      Caption = #12377#12409#12390#20877#35501#12415#36796#12415
      OnExecute = actReloadAllExecute
    end
    object actAddTab: TControlAction
      Category = #12479#12502
      Caption = #12479#12502#12434#36861#21152
      DropdownMenu = NewTabPopup
      ImageIndex = 10
      OnExecute = actAddTabExecute
    end
    object actAddTabBlank: TAction
      Category = #12479#12502
      Caption = #31354#30333#12506#12540#12472
      OnExecute = actAddTabBlankExecute
    end
    object actAddTabCurr: TAction
      Category = #12479#12502
      Caption = #12479#12502#12434#36861#21152#65288#20170#12398#12479#12502#65289
      OnExecute = actAddTabCurrExecute
    end
    object actAddTabHome: TAction
      Category = #12479#12502
      Caption = #12479#12502#12434#36861#21152#65288#12507#12540#12512#65289
      OnExecute = actAddTabHomeExecute
    end
    object actAddTabClip: TAction
      Category = #12479#12502
      Caption = #12479#12502#12434#36861#21152#65288#12463#12522#12483#12503#12508#12540#12489#65289
      OnExecute = actAddTabClipExecute
    end
    object actBagelHelp: TAction
      Category = #12504#12523#12503
      Caption = 'Bagel'#12398#12504#12523#12503
      OnExecute = actBagelHelpExecute
    end
    object actBagelSite: TAction
      Category = #12504#12523#12503
      Caption = 'Bagel'#12398'Web'#12469#12452#12488
      OnExecute = actBagelSiteExecute
    end
    object actClearCache: TAction
      Category = #12503#12521#12452#12496#12471#12540
      Caption = #12461#12515#12483#12471#12517#12434#21066#38500
      OnExecute = actClearCacheExecute
    end
    object actClearCookie: TAction
      Category = #12503#12521#12452#12496#12471#12540
      Caption = 'Cookie'#12434#21066#38500
      OnExecute = actClearCookieExecute
    end
    object actClearHistory: TAction
      Category = #12503#12521#12452#12496#12471#12540
      Caption = #23653#27508#12434#21066#38500
      OnExecute = actClearHistoryExecute
    end
    object actNextTab: TAction
      Category = #12479#12502
      Caption = #27425#12398#12479#12502
      OnExecute = actNextTabExecute
    end
    object actPrevTab: TAction
      Category = #12479#12502
      Caption = #21069#12398#12479#12502
      OnExecute = actPrevTabExecute
    end
    object actToggleSidebarVisible: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12469#12452#12489#12496#12540#34920#31034#20999#26367
      ImageIndex = 30
      OnExecute = actToggleSidebarVisibleExecute
      OnUpdate = actToggleSidebarVisibleUpdate
    end
    object actGoHome: TAction
      Category = #31227#21205
      Caption = #12507#12540#12512
      ImageIndex = 2
      OnExecute = actGoHomeExecute
    end
    object actStopAll: TAction
      Category = #34920#31034
      Caption = #12377#12409#12390#20572#27490
      OnExecute = actStopAllExecute
    end
    object actZoomIn: TAction
      Category = #34920#31034
      Caption = #25313#22823
      OnExecute = actZoomInExecute
    end
    object actZoomOut: TAction
      Category = #34920#31034
      Caption = #25991#23383#32302#23567
      OnExecute = actZoomOutExecute
    end
    object actZoomNormal: TAction
      Category = #34920#31034
      Caption = #25991#23383#12434#27161#28310#12469#12452#12474#12395#25147#12377
      OnExecute = actZoomNormalExecute
    end
    object actPageEnd: TAction
      Category = #34920#31034
      Caption = #12506#12540#12472#12398#26368#24460#12408
      OnExecute = actPageEndExecute
    end
    object actPageHome: TAction
      Category = #34920#31034
      Caption = #12506#12540#12472#12398#20808#38957#12408
      OnExecute = actPageHomeExecute
    end
    object actOpenFile: TAction
      Category = #12501#12449#12452#12523
      Caption = #38283#12367'(&O)...'
      OnExecute = actOpenFileExecute
    end
    object actSaveAs: TAction
      Category = #12501#12449#12452#12523
      Caption = #21517#21069#12434#12388#12369#12390#20445#23384'(&S)...'
      OnExecute = actSaveAsExecute
    end
    object actStartAutoScroll: TAction
      Category = #34920#31034
      Caption = 'actStartAutoScroll'
      OnExecute = actStartAutoScrollExecute
    end
    object actShowPageSetup: TAction
      Category = #12501#12449#12452#12523
      Caption = #12506#12540#12472#35373#23450'...'
      OnExecute = actShowPageSetupExecute
    end
    object actPrintPreview: TAction
      Category = #12501#12449#12452#12523
      AutoCheck = True
      Caption = #21360#21047#12503#12524#12499#12517#12540
      OnExecute = actPrintPreviewExecute
    end
    object actPrint: TAction
      Category = #12501#12449#12452#12523
      Caption = #21360#21047
      OnExecute = actPrintExecute
    end
    object actOpenSelection: TAction
      Category = #32232#38598
      Caption = #36984#25246#31684#22258#12434#38283#12367
      OnExecute = actOpenSelectionExecute
    end
    object actQuit: TAction
      Category = #12501#12449#12452#12523
      Caption = 'Bagel'#12434#32066#20102
      OnExecute = actQuitExecute
    end
    object actAddDenyTitle: TAction
      Category = #12479#12502
      Caption = #12479#12452#12488#12523#25233#27490#12395#36861#21152
      OnExecute = actAddDenyTitleExecute
    end
    object actAddDenyURI: TAction
      Category = #12479#12502
      Caption = 'URI'#25233#27490#12395#36861#21152
      OnExecute = actAddDenyURIExecute
    end
    object actBookmarkSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12502#12483#12463#12510#12540#12463
      GroupIndex = 1
      ImageIndex = 36
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actHistorySidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #23653#27508
      GroupIndex = 1
      ImageIndex = 37
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actLinkSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12522#12531#12463
      GroupIndex = 1
      ImageIndex = 49
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actGrepSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = 'Grep'
      GroupIndex = 1
      ImageIndex = 48
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actWebPanel: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = 'Web'#12497#12493#12523
      GroupIndex = 1
      ImageIndex = 51
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actScriptSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12473#12463#12522#12503#12488
      GroupIndex = 1
      ImageIndex = 53
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actClipboardSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12463#12522#12483#12503#12508#12540#12489
      GroupIndex = 1
      ImageIndex = 38
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actMemoSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12513#12514
      GroupIndex = 1
      ImageIndex = 50
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actTransferSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12480#12454#12531#12525#12540#12480
      GroupIndex = 1
      ImageIndex = 52
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actUserDefinedSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = #12518#12540#12470#12540#23450#32681
      GroupIndex = 1
      ImageIndex = 47
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actOutputSidebar: TAction
      Category = #12469#12452#12489#12496#12540
      AutoCheck = True
      Caption = 'Output'
      GroupIndex = 1
      OnExecute = actSomeSidebarExecute
      OnUpdate = actSomeSidebarUpdate
    end
    object actShowPageInfo: TAction
      Category = #12501#12449#12452#12523
      Caption = #12506#12540#12472#24773#22577
      OnExecute = actShowPageInfoExecute
      OnUpdate = actShowPageInfoUpdate
    end
    object actForDonutUsers: TAction
      Category = #12504#12523#12503
      Caption = 'Donut'#12518#12540#12470#12398#12383#12417#12395
      OnExecute = actForDonutUsersExecute
    end
    object actViewSource: TAction
      Category = #34920#31034
      Caption = #12477#12540#12473#12434#34920#31034
      OnExecute = actViewSourceExecute
    end
    object actCtxProperty: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #12503#12525#12497#12486#12451
      OnExecute = actCtxPropertyExecute
    end
    object actShowCookieMan: TAction
      Category = #12484#12540#12523
      Caption = 'Cookie'#31649#29702
      OnExecute = actShowCookieManExecute
    end
    object actShowPassMan: TAction
      Category = #12484#12540#12523
      Caption = #12497#12473#12527#12540#12489#12510#12493#12540#12472#12515
      OnExecute = actShowPassManExecute
    end
    object actToggleMainbarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12513#12452#12531#12484#12540#12523#12496#12540
      OnExecute = actToggleMainbarVisibleExecute
    end
    object actToggleMenubarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12513#12491#12517#12540#12496#12540
      OnExecute = actToggleMenubarVisibleExecute
    end
    object actToggleLinkbarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12522#12531#12463#12496#12540
      OnExecute = actToggleLinkbarVisibleExecute
    end
    object actToggleSearchBarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #26908#32034#12496#12540
      OnExecute = actToggleSearchBarVisibleExecute
    end
    object actToggleSearchBtnVisible: TAction
      Category = #12484#12540#12523#12496#12540
      AutoCheck = True
      Caption = #26908#32034#12496#12540#12398#12508#12479#12531
      OnExecute = actToggleSearchBtnVisibleExecute
    end
    object actToggleTabbarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12479#12502#12496#12540
      OnExecute = actToggleTabbarVisibleExecute
    end
    object actToggleURIbarVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12450#12489#12524#12473#12496#12540
      OnExecute = actToggleURIbarVisibleExecute
    end
    object actToggleGoButtonVisible: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #31227#21205#12508#12479#12531
      OnExecute = actToggleGoButtonVisibleExecute
    end
    object actWorkOffline: TAction
      Category = #12501#12449#12452#12523
      AutoCheck = True
      Caption = #12458#12501#12521#12452#12531#20316#26989
      OnExecute = actWorkOfflineExecute
      OnUpdate = actWorkOfflineUpdate
    end
    object actOpenAboutConfig: TAction
      Category = #12484#12540#12523
      Caption = #12510#12491#12450#12483#12463#35373#23450'(about:config)...'
      OnExecute = actOpenAboutConfigExecute
    end
    object actDefaultTabs: TAction
      Category = #12479#12502
      Caption = 'Default.bbg'
      OnExecute = actDefaultTabsExecute
    end
    object actShowCookieP3PCustomSetting: TAction
      Category = #12484#12540#12523
      Caption = 'P3P'#12459#12473#12479#12512#35373#23450'...'
      OnExecute = actShowCookieP3PCustomSettingExecute
    end
    object actShowWebPanelEditor: TAction
      Category = #12469#12452#12489#12496#12540
      Caption = 'actShowWebPanelEditor'
      OnExecute = actShowWebPanelEditorExecute
    end
    object actShowSidebarIcons: TAction
      Category = #12469#12452#12489#12496#12540
      AutoCheck = True
      Caption = #12450#12452#12467#12531#12434#34920#31034
      OnExecute = actShowSidebarIconsExecute
    end
    object actFindDialog: TAction
      Category = #26908#32034
      Caption = #12506#12540#12472#20869#26908#32034
      OnExecute = actFindDialogExecute
    end
    object actShowExtGoEditor: TAction
      Category = #12484#12540#12523
      Caption = #12450#12489#12524#12473#12496#12540#25313#24373#12398#32232#38598
      OnExecute = actShowExtGoEditorExecute
    end
    object actTaskTray: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12479#12473#12463#12488#12524#12452#12395#26684#32013
      OnExecute = actTaskTrayExecute
    end
    object actToggleNoGripper: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #12484#12540#12523#12496#12540#12434#22266#23450#12377#12427#65288#21839#38988#22810#12375#65289
      OnExecute = actToggleNoGripperExecute
    end
    object actAddBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #12502#12483#12463#12510#12540#12463#12395#36861#21152
      OnExecute = actAddBookmarkExecute
    end
    object actAddPanel: TAction
      Category = #12479#12502
      Caption = 'Web'#12497#12493#12523#12395#36861#21152
      OnExecute = actAddPanelExecute
    end
    object actSearchSelection: TAction
      Category = #26908#32034
      Caption = #36984#25246#12375#12383#25991#23383#21015#12391#26908#32034
      OnExecute = actSearchSelectionExecute
    end
    object actFocusSearch: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = #26908#32034#12496#12540#12395#12501#12457#12540#12459#12473
      OnExecute = actFocusSearchExecute
    end
    object actFocusSearchEngine: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = #26908#32034#12456#12531#12472#12531#12395#12501#12457#12540#12459#12473
      OnExecute = actFocusSearchEngineExecute
    end
    object actDropdownAddressbar: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = #12450#12489#12524#12473#12496#12540#12434#38283#12367
      OnExecute = actDropdownAddressbarExecute
    end
    object actDoSearch: TAction
      Category = #26908#32034
      Caption = 'actDoSearch'
      OnExecute = actDoSearchExecute
    end
    object actFocusLocationBox: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = 'URL'#12395#12501#12457#12540#12459#12473
      OnExecute = actFocusLocationBoxExecute
    end
    object actCopyURI: TAction
      Category = #32232#38598
      Caption = 'URI'#12434#12467#12500#12540
      OnExecute = actCopyURIExecute
    end
    object actCopyTitleAndURI: TAction
      Category = #32232#38598
      Caption = #12479#12452#12488#12523#12392'URI'#12434#12467#12500#12540
      OnExecute = actCopyTitleAndURIExecute
    end
    object actCopyTitle: TAction
      Category = #32232#38598
      Caption = #12479#12452#12488#12523#12434#12467#12500#12540
      OnExecute = actCopyTitleExecute
    end
    object actCopyCtxURI: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = 'URI'#12434#12467#12500#12540
      OnExecute = actCopyCtxURIExecute
    end
    object actOpenCtxLink: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #38283#12367
      OnExecute = actOpenCtxLinkExecute
    end
    object actOpenCtxLinkNewTab: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #26032#12375#12356#12479#12502#12391#38283#12367
      OnExecute = actOpenCtxLinkNewTabExecute
    end
    object actShowCtxImage: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #30011#20687#12434#34920#31034
      OnExecute = actShowCtxImageExecute
    end
    object actShowCtxBgImage: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #32972#26223#30011#20687#12434#34920#31034
      OnExecute = actShowCtxBgImageExecute
    end
    object actFullScreen: TAction
      Category = #34920#31034
      AutoCheck = True
      Caption = #20840#30011#38754#34920#31034
      OnExecute = actFullScreenExecute
    end
    object actIEView: TAction
      Category = #34920#31034
      Caption = 'IE'#12391#34920#31034
      OnExecute = actIEViewExecute
    end
    object actBlockCtxImage: TAction
      Category = #12467#12531#12486#12461#12473#12488#12513#12491#12517#12540
      Caption = #30011#20687#12434#12502#12525#12483#12463
      OnExecute = actBlockCtxImageExecute
    end
    object actToggleMultilineTab: TAction
      Category = #12479#12502
      AutoCheck = True
      Caption = #22810#27573#12479#12502
      OnExecute = actToggleMultilineTabExecute
      OnUpdate = actToggleMultilineTabUpdate
    end
    object actFocusTab: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = #29694#22312#12398#12479#12502#12395#12501#12457#12540#12459#12473
      OnExecute = actFocusTabExecute
    end
    object actReOpenMostRecent: TAction
      Category = #12479#12502
      Caption = 'actReOpenMostRecent'
      OnExecute = actReOpenMostRecentExecute
    end
    object actSelectNone: TAction
      Category = #32232#38598
      Caption = #36984#25246#35299#38500
      OnExecute = actSelectNoneExecute
    end
    object actFocusSidebar: TAction
      Category = #12501#12457#12540#12459#12473
      Caption = #12469#12452#12489#12496#12540#12395#12501#12457#12540#12459#12473
      OnExecute = actFocusSidebarExecute
    end
    object actBookmarkEditor: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #12502#12483#12463#12510#12540#12463#12434#32232#38598
      OnExecute = actBookmarkEditorExecute
    end
    object actBookmarkProperty: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #12503#12525#12497#12486#12451
      OnExecute = actBookmarkPropertyExecute
      OnUpdate = actBookmarkPropertyUpdate
    end
    object actDeleteBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #21066#38500
      OnExecute = actDeleteBookmarkExecute
      OnUpdate = actDeleteBookmarkUpdate
    end
    object actCopyBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #12467#12500#12540
      OnExecute = actCopyBookmarkExecute
      OnUpdate = actCopyBookmarkUpdate
    end
    object actCutBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #20999#12426#21462#12426
      OnExecute = actCutBookmarkExecute
      OnUpdate = actCutBookmarkUpdate
    end
    object actOpenBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #38283#12367
      OnExecute = actOpenBookmarkExecute
      OnUpdate = actOpenBookmarkUpdate
    end
    object actPasteBookmark: TAction
      Category = #12502#12483#12463#12510#12540#12463
      Caption = #36028#12426#20184#12369
      OnExecute = actPasteBookmarkExecute
      OnUpdate = actPasteBookmarkUpdate
    end
    object actSettings: TAction
      Category = #12484#12540#12523
      Caption = #35443#32048#35373#23450'...'
      OnExecute = actSettingsExecute
    end
    object actShowImgMan: TAction
      Category = #12484#12540#12523
      Caption = #30011#20687#12510#12493#12540#12472#12515
      OnExecute = actShowImgManExecute
    end
    object actShowPopupMan: TAction
      Category = #12484#12540#12523
      Caption = #12509#12483#12503#12450#12483#12503#12510#12493#12540#12472#12515
      OnExecute = actShowPopupManExecute
    end
    object actShowUAMan: TAction
      Category = #12484#12540#12523
      Caption = 'UA'#12473#12452#12483#12481#12398#32232#38598
      OnExecute = actShowUAManExecute
    end
    object actShowAdblockMan: TAction
      Category = #12484#12540#12523
      Caption = #24195#21578#12502#12525#12483#12463#31649#29702
      OnExecute = actShowAdblockManExecute
    end
    object Action1: TAction
      Category = #12486#12473#12488
      Caption = 'Action1'
    end
    object actShowBkmkImportForm: TAction
      Category = #12501#12449#12452#12523
      Caption = 'Netscape'#24418#24335#12398#12502#12483#12463#12510#12540#12463#12434#12452#12531#12509#12540#12488
      OnExecute = actShowBkmkImportFormExecute
    end
    object actShowIEImportForm: TAction
      Category = #12501#12449#12452#12523
      Caption = 'Internet Explorer'#12398#12362#27671#12395#20837#12426#12434#12452#12531#12509#12540#12488
      OnExecute = actShowIEImportFormExecute
    end
    object actToggleLockTab: TAction
      Category = #12479#12502
      AutoCheck = True
      Caption = #12490#12499#12466#12540#12488#12525#12483#12463
      OnExecute = actToggleLockTabExecute
      OnUpdate = actToggleLockTabUpdate
    end
    object actPopupUASelector: TAction
      Category = #12484#12540#12523
      Caption = 'actPopupUASelector'
    end
    object actPopupProxySelector: TAction
      Category = #12484#12540#12523
      Caption = 'actPopupProxySelector'
    end
    object actEditMainMenu: TAction
      Category = #12484#12540#12523
      Caption = #12513#12452#12531#12513#12491#12517#12540#12398#32232#38598
      OnExecute = actEditMainMenuExecute
    end
    object actEditCtxMenu: TAction
      Category = #12484#12540#12523
      Caption = #12506#12540#12472#12513#12491#12517#12540#12398#32232#38598
      OnExecute = actEditCtxMenuExecute
    end
    object actEditTabMenu: TAction
      Category = #12484#12540#12523
      Caption = #12479#12502#12513#12491#12517#12540#12398#32232#38598
      OnExecute = actEditTabMenuExecute
    end
    object actEditToolbar: TAction
      Category = #12484#12540#12523
      Caption = #12484#12540#12523#12496#12540#12398#32232#38598
      OnExecute = actEditToolbarExecute
    end
    object actFind: TAction
      Category = #26908#32034
      Caption = 'actFind'
      OnExecute = actFindExecute
    end
    object actIncrementalSearch: TAction
      Category = #26908#32034
      Caption = #12452#12531#12463#12522#12513#12531#12479#12523#26908#32034
    end
    object actPageDown: TAction
      Category = #34920#31034
      Caption = 'actPageDown'
      OnExecute = actPageDownExecute
    end
  end
  object ImageList1: TImageList
    Left = 400
    Top = 128
    Bitmap = {
      494C01013B004000040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000000001000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000735A
      9D00B47FB1008D6A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004449B5007075
      DB000C3AC700B486B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005696
      FF005B7BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000203CC100617EFC00324E
      F0004A48C7009685CA000000000000000000000000000000000000000000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000000000000000
      0000000000000000000000000000000000000000000000000000000000000B8B
      FF000B8BFF007484FF0087A6FF00887DDC008479D400696AC2002967D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000203CC1005C7CFE000739FE000527
      DF006672DB00000000000000000000000000000000000000000000000000CC66
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC660000000000000000
      000000000000000000000000000000000000000000000000000000000000837F
      AA005B82FF000B8BFF005B82FF007787ED00715FA9007E70C7008275CF004051
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000203CC1005C7CFE000739FE000126E1004865
      E6008B91B400000000000000000000000000000000000000000000000000CC66
      0000FFFFFF00FFFFFF00FFCC9900FF660000FFFFFF00CC660000000000000000
      0000000000000000000000000000000000000000000000000000716787006048
      5F0060485F005B7BFF000B8BFF005B82FF00696AC200696AC2008295F6007787
      ED002967D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002043BF005879FE000739FE000126E1004462E800989D
      C000F6F1EF00A8A6A6000000000000000000000000000000000000000000CC66
      0000FFFFFF00FFCC9900CC996600FFCC9900FF660000CC66000000000000CC99
      33000000000000000000000000000000000000000000837FAA00644E5F006D5A
      5F0077685F0061845F0000C5E3005696FF0089B9FF00A5E2FF00A6EBFF00A6EB
      FF008DC4FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000206EBF00598FFF000739FE000126E1004865E600777D9600ABA8
      A600ECE4E200DDD8D700ECE4E20000000000000000000000000000000000CC66
      0000FFFFFF00FF660000FFCC9900FFFFFF00FFCC9900FF660000FF660000CC99
      6600FF66000000000000000000000000000000000000837FAA0076665F008276
      5F00847A5F00088D5F0000905F0074A0FF00A6E6FF00A6E6FF00A6EBFF00A6EA
      FF00A6EBFF0074A0FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000929292009898
      98007C828E004E93EC000739FE00012DE200486CE70000000000000000000000
      0000A2A2A200F2EAE800BAB9B90000000000000000000000000000000000CC66
      0000FFFFFF00FFFFFF00FF660000FFCC9900FFFFFF00FFCC9900CC993300FFFF
      FF00FF66000000000000000000000000000000000000837FAA0082765F00708F
      6E004092650000A2800021A7950099D3FF00A6D5FF00A6E6FF00A6EBFF00A6EB
      FF00A6EBFF0099D3FF003B80F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F8F8F00A2A2A200BAB9
      B900BAB9B900858AA4000F41D700428EE7000000000000000000000000000000
      000000000000D4CBC900E3DBD900A2A09F00000000000000000000000000CC66
      0000CC660000CC660000CC660000FF660000FFCC9900FFFFFF00FFFFFF00FFFF
      FF00FF66000000000000000000000000000000000000898C9D00878A650000A2
      800000B0AB0000B0AB0095A6920099D3FF00A6D9FF00A5E2FF00A6EBFF00A6EB
      FF009FE9FF0096C9FF005696FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F8F8F0098989800B0B0B000BAB9
      B900BAB9B900B0B0B00077809400997898000000000000000000000000000000
      000000000000D4C8C500D4C8C500989898000000000000000000000000000000
      0000000000000000000000000000FF660000CC993300FFFFFF00FFFFFF00FFFF
      FF00FF660000000000000000000000000000000000008E98B300708F6E0000B5
      B70000C1D90009C4E30040BFDA0096C9FF00A6EAFF00A6DBFF00A6DEFF00A6DA
      FF00A6E4FF0087A6FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200BAB9B90000000000A7A7
      A700BAB9B900C0C0C000A5969600E8989800B185850000000000000000000000
      0000A5969600F9CBCA00C0B6B300000000000000000000000000000000000000
      00000000000000000000CC993300CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF660000000000000000000000000000000000008E98B30000B0AB0000C1
      D90029CFFD004BDAFF003AD5FF0095BDFF009AD8FF00A6EBFF009FE0FF00A5E2
      FF0099C1FF007484FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009898980000000000000000000000
      0000B0B0B000C0C0C000A09A9A00AF828200E8989800C5868600AC8B8B00BC8B
      8B00FBB0B000D0A1A100D7B4B300000000000000000000000000000000000000
      0000000000000000000000000000FF660000FF660000FF660000FF660000FF66
      0000FF660000000000000000000000000000000000000000000009C4E3000FCB
      F2004BDAFF006BE2FF006BE2FF0040D2FF0022BFD5007E9FD9008FB2E7005898
      F00074A0FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A200C0C0C000CECECE00A2A2A20000000000DD999900CD8A8A00F6999900DF8E
      8E00FCA5A500AC90900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000040D2
      FF004BDAFF006BE2FF006CDCFF001DCEFA0000BDCD00708F6E00908971008EA5
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092929200D8D8
      D800B0B0B0000000000000000000000000009A88880000000000E8989800A596
      9600A38E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000058D0FE002BD2FF0022BFD50000BDCD00889EB900000000000000
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
      0000AA9FAA00553F2A00553F2A00553F2A00553F5500553F2A00555F2A00553F
      2A00553F2A00553F2A00555F2A00553F2A000000000070707000707070007070
      7000707070007070700070707000747474005953530059535300595353005953
      53007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E008E8E8E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000747474007474
      7400747474007474740000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AA9F7F00FFFFFF00A4A0A000AA9F7F00AA9F7F00AA9F7F00A4A0A000A4A0
      A000A4A0A000AA9F7F00AA9FAA00553F2A00B3766900B3766900B3766900B376
      6900B3766900B3766900B37669006D6B6B00848080009D8C8C008C8484009A84
      8400595353006565650000000000000000000000000000000000000000000000
      0000000000008E8E8E0053535300313131000000000000000000000000000000
      0000000000000000000000000000000000000000000050BBE20050BBE20031AC
      D4001386AB0055656B00676767006C6C6C007474740074747400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A0A000FFFFFF00FFFFFF00F0FBFF00FFFFFF00F0FBFF00FFDFD400FFDF
      D400FFCCCC00FFCCCC00A4A0A000553F2A00B17E7100CF9C9C00E1AEAE00E1AE
      AE00E1AEAE00C6AA8B008F8F8F00A59D8A00DCCFAD008FA3E400DED7D100AEA4
      9100B79B98006359530065656500000000000000000000000000000000000000
      0000D4D4D400DADADA00C1C1C1003D3D3D000000000000000000000000000000
      00003B484F005D5D5D0000000000000000000000000050BBE200C2F1FC0070D6
      FF0050BBE20050BBE20031ACD4001386AB0025728B0042697500646464006C6C
      6C007474740000000000000000000000000000000000557F7F00555F7F00005F
      5500555F5500005F5500005F5500555F7F00005F7F00F0FBFF00FFDFD400FFDF
      D400C0DCC000C0DCC000AA9F7F00553F2A00B17E7100FDFDFD00FFE8D200FFE6
      CE00EFCBA600AEAEAE00CAB69B00FFECC300FFE4BB00D8CBC600FFE4BB00FFF4
      E900DED7D100C2A4A1004F4C4C00000000000000000000000000000000000000
      0000CCCCCC00CBCBCB00B4B4B4004645450000000000000000000000000071B0
      CD005CA6BB005050500000000000000000000000000050BBE2009DD9EC009AEE
      FF0080E5FF0080E5FF0080E5FF0080E5FF0080E5FF0050BBE20031ACD4001386
      AB0062626200747474000000000000000000555F7F00AADFD400AADFD400AADF
      FF00AADFFF00AADFFF00AADFFF00557F7F00559FD400557F7F00F0FBFF00FFDF
      D400FFDFD400FFDFD400AA9FAA00553F2A00BA877500FDFDFD00F4E1CE00F4E1
      CE00CAB69B00AEAEAE00FFF4C100FFF4C100FFEDBB00FFE6B400FFDCAB00FFDC
      AB00FFF6EE00AEA4910083727200848080000000000000000000000000000000
      0000C7C7C700C7C7C700A2A2A2004E4E4E0000000000000000009BC2D9007EC4
      EB005CAED5007373730000000000000000000000000050BBE20050BBE200CDF6
      F90089EFFF0089EFFF0089EFFF0089EFFF0089EFFF0089EFFF0080E6FF0050BB
      E20038647300747474000000000000000000559FAA00557FAA00557FAA00557F
      7F00557FAA00557FAA00557F7F00557FAA00559FD400557F7F00FFFFFF00F0FB
      FF00FFDFD400FFDFD400AA9F7F00553F2A00BA877500FDFDFD00FFD5AA00FFD2
      A400AEA39B00DCCFAD00E6F2D900FFFFD500FFFFCE00AFA78B00D9BC9300FFD9
      A600FFE6CC00BDBCB800AF989800848080000000000000000000000000000000
      0000BBBBBB00BFBFBF008E8E8E006262620000000000000000006DACCC0073CA
      FD00347B9F007373730000000000000000000000000050BBE20050BBE200C2F1
      FC0097FDFF0097FDFF0097FDFF0097FDFF0097FDFF0097FDFF0089EFFF00B3FF
      FF0050BBE2005E5E5E0074747400000000000000000000000000559FAA00AADF
      FF0055BFFF0055BFD40055BFFF0055BFD400557FAA00557FAA00FFFFFF00F0FB
      FF00FFDFD400FFDFD400A4A0A000553F2A00C28F7A00FDFDFD00FFF2E500FFF2
      E500AEA39B00C2C2C30066B3FF00FFFFF500FFFFDB0089898900393939006359
      5300FFE4BB005D71C100A5949400848080000000000000000000000000000000
      0000A6A6A600A6A4A2007F7976005959590000000000A8C2D40070C5E9004CB2
      EE00315C73000000000000000000000000000000000050BBE20073D9FF0050BB
      E200DBFFFF00CBFEFF00C3FFFF00B3FFFF00ADFFFF00ADFFFF009AEEFF00D3FF
      FF0050BBE2003864730074747400000000000000000000000000557F7F00AADF
      FF0055BFD40055BFD40055BFFF00557F7F00559FAA00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00FFDFD400AA9FAA00555F2A00C28F7A00FDFDFD00FFD6AE00FFD6
      AE00AEA39B00D8CBC600FFFCF900FFFFFF00FFFFE900FFFFDB0080806E00806E
      5B00FFECC300BEB7990084808000848080000000000000000000545454004D4D
      4D00BCBAB800899095005C7F9600303134005A6D7A0055A7D30046A8E90040A2
      D600717F88000000000000000000000000000000000050BBE2007CE2FF007CE2
      FF0050BBE20050BBE20050BBE20050BBE200DBFFFF00CBFEFF00B2F2FF00EDFB
      FE00EDFBFE0050BBE200747474000000000000000000559FAA00559FAA00AADF
      FF00AADFFF0055DFFF0055BFD400557FAA00F0FBFF00F0FBFF00FFFFFF00FFFF
      FF00FFFFFF00FFDFD400AA9F7F00553F2A00CA977E00FDFDFD00FFF2E500FFF2
      E500D4C9BC00AEA39B00E9D9C900FFFFFF00FFFFFF00FFFFF900FFFFD500807E
      6B00C6AA8B00898989007F7F7F000000000000000000B7B7B700BBBBBB00AAA9
      A900B2AFB00066B3DE0053C2FF003C87B700408AB0005DC2FD002A91DB003978
      9D00000000000000000000000000000000000000000050BBE20093F9FF0093F9
      FF0093F9FF004790500050A9BC008AE4FE0050BBE20050BBE20050BBE20047B9
      DF0050BBE20050BBE200000000000000000000000000557FAA00AAFFFF00AADF
      FF00AAFFFF00AADFFF00557F7F00559FD400557F7F00555F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AA9FAA00553F2A00CF9B8000FDFDFD00FFE1C200FFE1
      C200FFE1C200AEA39B00D4C9BC00E9D9C900FFF8F20066B3FF00E6F0ED00F4E2
      B300A19C9200848080000000000000000000DFDFDF00CCCCCC00B1B1B100E2DC
      DA009FCDE80061CCFF0043ACFF008CF5FF0080E9FF00339AE3002B80BE00545B
      6200000000000000000000000000000000000000000050BBE200A5FFFF0099FF
      FF0014AD290014AD29004790500057F08A00A5FFFF0099FFFF0050BBE2007474
      74000000000000000000000000000000000000000000557F7F00AAFFFF00AAFF
      FF00AADFFF00AADFFF00005F7F00559FAA0055BFD400003F5500FFFFFF00FFFF
      FF00FFFFFF00AA9FAA00AA9F7F00553F2A00D3A08200FDFDFD00FFF2E500FFF2
      E500FFF2E500FFF2E500AEA39B00AEA39B00DED7D100D4C9BC00AEA39B00AEAE
      AE0084808000000000000000000000000000D6D6D600D8D8D8009B9997008990
      960072D8F60049B7FF00378CDB0069A5B00089E2F50049AFFF003185C7002D3A
      440089898900000000000000000000000000000000000000000050BBE20025BA
      490025BA490025BA490014AD29004790500047B9DF0050BBE20050BBE2000000
      0000000000000000000000000000000000000000000000000000559FD400559F
      AA00559FAA00559FAA00557FAA00555F7F00005F7F00FFFFFF00FFFFFF00FFFF
      FF00AA9F7F00553F2A00555F5500553F2A00D8A48500FDFDFD00FFE6CC00FFE6
      CC00FFE3C700FFE3C700FFE0C100D4C9BC00AEA39B00AEA39B00AEA39B007070
      700000000000000000000000000000000000D2D2D200E9E9EA00A09B970076A0
      BF00B1F5FF004DABFF003B87CC009B858300778A920067B1E60054BAFF00316C
      9400898989000000000000000000000000000000000000000000000000000000
      000035CB660035CB660047905000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0CAA600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A4A0A000F0CAA600553F2A0000000000DCA98700FDFDFD00FFFFFF00FFFF
      FF00FFFDFC00FFFAF400FFF8F200FFF4E900FFEEDC00F2CFA200F4BB83008989
      890000000000000000000000000000000000C6C5C500E0E0E000E1DFDE00BCCB
      D900BADAFB00C6EBFF0072CAFF0077C1D400A0837E003680BF0047B1FF004662
      7800000000000000000000000000000000000000000000000000000000000000
      00000000000035CB660047905000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0DCC000F0FBFF00FFFFFF00F0FBFF00F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00AA9FAA00553F2A000000000000000000E0AD8A00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFDFC00FFFAF400FFF8F200FFEBD400DD8B2C00DD8B2C000000
      000000000000000000000000000000000000C1BBB500AE9C8800595B5C00B0AD
      AA00BCC0C200A8C9E400B7F1FE009BE1E600AB8B86004B93D400328BD5008989
      8900000000000000000000000000000000000000000000000000000000000000
      00000000000035CB660035CB6600479050000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0CAA600F0CAA600C0DCC000F0CAA600F0CAA600C0DCC000F0CAA600AABF
      AA00F0CAA600000000000000000000000000DCA98700EDEDED00EDEDED00EBEB
      EB00E9E9E900E6E6E600E6E6E600E1E2E200E1E2E200DD8B2C00000000000000
      000000000000000000000000000000000000D2D0CF00CAB09500969492004F4F
      4F003E3E3E00504E4E0072849200ABA0A200A3A9A50051B5F9005788B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000035CB660035CB66004790500000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C49E9100C49E9100C49E9100C49E
      9100C49E9100C49E9100C49E9100C49E9100C49E910000000000000000000000
      00000000000000000000000000000000000000000000C9C7C500B6ABA100AFAA
      A400B5B4B300AEA9A900B1A4A200BCBABE00A7D6F50093D1FC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA496009E82
      76007B5D4E006D4F400080695700A990810000000000BDA496009E8276007B5D
      4E006D4F400080695700A9908100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2ACA000B4958600D0B0
      A000E0D0C000E0C8B000B09080007B5D4E00A3887C00B4958600D0B0A000E0D0
      C000E0C8B000B09080007B5D4E00A99081000000000080A8C000507080004070
      8000407080003070900030709000306880003068800030688000306080003060
      8000306070003058700030587000000000000000000000000000AE7B6E00D9AD
      9D00D6A89A00D3A69800D2A49700CCA19900C99E9700C69C9600C4999500C196
      9300B6918B00B88E8B006666660000000000A9846F00A0786000906040009058
      40009058400084472800000000000000000000000000B283650098725C00A070
      50009058400090503000753819000000000000000000BA9D9000E0D0C000AC8F
      81009C7E6200B6988900502810004028100040281000402810006D5640009C7E
      6200B6988900C4A79900B098800078614E000000000080A8C00070D0FF0070D8
      FF0070D0FF0040B8E00020A0E00020A8D0000090D00020A0D00040B0E00050B8
      F00050C0F00050C0F00040587000000000000000000000000000B5827200FCE1
      CB00FBE0C800FBDEC400FBDCC200FADABE00FAD8BB00FBD7B800FAD4B400F9D2
      B100FAD0AE00EEBDA5006666660000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000E0C8
      C000D0A89000B0785000804820000000000000000000B29A8300FFFFFF005F3A
      2400BCA59C00D0B2A400FFFFFF00FFF8F000FFE8E000F0D8D000F0D0C000886D
      5800C5AEA200B49C8600E0D0C000664737000000000080A8C00070D8FF0060D0
      F00030B0E0001098D0000098E0000098E00030B0E00070D8FF0070D0FF0070D8
      FF0070D8FF0070D8FF0040607000000000000000000000000000BB887500FCE4
      CF00FCE2CC00FBE0C900FBDEC600333333003333330033333300FAD6B800FAD5
      B500FAD3B100EFBFA8006666660000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C0887000804830000000000000000000BAA39000F0E0D0009887
      78005738280060483000B0988000D0B0A000C0A89000D0B8B000C1A992006750
      3B00755D4800AC9B8D00C0B0A0008E7164000000000080A8C00070D0F00030B0
      E00010A8D00030D0FF0030C8FF0020A0D00070D8FF0070D8FF0070D8FF0070D8
      FF0070D8FF0070D8FF0040607000000000000000000000000000C28F7900FCE7
      D400FCE4D10033333300A94517008D532A00AA482100BB563500AE512F003333
      3300FBD5B600F0C1AB006666660000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C0887000804830000000000000000000B8A69A00C0A8A000E0D8
      D000FFF8F000FFF0F000D0C0B000A080700080685000C0A89000E0D8D000FFF8
      F000FFF0F000D0C0B000A6877800B89F96000000000080A8C00050C8F00000A0
      D00030D0F00030C8F0000098D00040C0E00080E0FF0080E0FF0080E0FF0080E0
      FF0080E0FF0080E0FF0040607000000000000000000000000000C8957C00FCE8
      D800FCE6D500AA430000B954000001690000B14B0000AA430000944716008D53
      2A00FAD8BB00F0C3AF006666660000000000C0988000FFFFFF00F0E8E000E0C8
      C000D0A0800080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C088700080483000000000000000000000000000D0886000C090
      7000A0988000A090700090786000308820007068300090685000A6877800B49C
      8600B4958600B29B8A00BDA79B00000000000000000080A8C00040B0E00040C0
      E00040B8E00030B0E00010A0D00060D0F00080E0FF0080E0FF0080E0FF0080E0
      FF0080E0FF0080E0FF0050687000000000000000000000000000CF9C8000FCEB
      DD00C4671800D16A0000D974000023870000D9740000AF6B0300276403006566
      330033333300F1C5B1006666660000000000C1A19200B0887000A06850009050
      300080483000804820008038100089482400B0887000A0685000905830009048
      30008040200070381000905830000000000000000000C0907000FF986000E090
      60006078500050A0300050A0300080902000D078400070684000605840009F89
      7B00000000000000000000000000000000000000000080A8C00050C0E00080E0
      F00080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8
      FF0080E8FF0080E8FF0050687000000000000000000000000000D5A28300FDEE
      E000CA640000D974000075950700CE880100F1890000916F0300007700004264
      1C0033333300F2C8B5006666660000000000C8AEA200B0887000FFFFFF00E0D0
      C000D0A09000A070500080401000C0A69200B0907000E0D8D000F0D8D000D0A0
      9000B078500080382000C0A692000000000000000000F0987000F09870006070
      50006098400060B0400090A04000E0886000D08050005068400040783000836C
      5900000000000000000000000000000000000000000080B0C00070D0F00080E8
      FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8FF0080E8
      FF0080E8FF0080E8FF0050687000000000000000000000000000DCA98700FEF0
      E500E588140024AD290014C25100CECF6E00FDA31500FC950100018400001665
      060033333300F2C9B700666666000000000000000000C0908000F0F0F000FFF8
      F000F0D8C000B0806000804820008F502E00B0907000FFFFFF00FFF8F000F0D0
      C000B078500080482000000000000000000000000000FFA070008080600040A0
      400050B0400090906000E0987000E0906000E088500060A02000409820006656
      4600000000000000000000000000000000000000000080B0C00090E0F00080F0
      FF0080F0FF0080F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0FF0090F0
      FF0090F0FF0090F0FF0050687000000000000000000000000000DCA98700FDF3
      EA00FDF1E6002BC55800CEE39700D0F7C600CBC35400C1A21200778803008669
      3400FCE1CB00F3CCBA00666666000000000000000000CFBAB200C0988000B080
      6000A0685000905030009058400098644000B0786000B0887000A07050008048
      300080482000CFB9B000000000000000000000000000E09070006098500040C8
      600040C8700070A07000B0A07000D0986000E0906000A090300040A020007556
      4600000000000000000000000000000000000000000080B0C000A0E8F00090F8
      FF0090F8FF0090F8FF0090F8FF0090F8FF0090F8FF0090F8FF0090F8FF0090F8
      FF0090F8FF0090F8FF0050687000000000000000000000000000DCA98700FDF5
      ED00FEF3EA00D2EEAE00B0DB860089E3960014C2510050A21900E3972F003333
      3300FCE4D000F3CDBD0066666600000000000000000000000000C0988000FFF8
      FF00E0C0B000C09070008048200000000000C0988000FFF8FF00E0C8B000D0A0
      80008048200000000000000000000000000000000000A090600050B8600060D8
      800090E0A00080E0A000A0D09000B0A06000F0986000E0885000509830000000
      0000000000000000000000000000000000000000000080B8C000B0F0FF00A0FF
      FF00A0FFFF00A0FFFF00A0FFFF00A0FFFF00A0FFFF00A0FFFF00A0FFFF00A0FF
      FF00A0FFFF00A0FFFF0050688000000000000000000000000000DCA98700FEF8
      F200FEF5EE00FDF4EC00FDF2E800EAC37A00EAC37A00EAC37A00FDEADA00FCE8
      D800FCE6D400F4C9BA0066666600000000000000000000000000C4A79900B090
      8000A068500090503000844E370000000000C0A89000B0908000A06850009050
      3000844E3700000000000000000000000000000000000000000030C8600070E0
      9000C0F0B000D0F0D000F0F8D000B0E8A00080986000D0984000808840000000
      0000000000000000000000000000000000000000000090C8D000C0F8FF00B0FF
      FF00B0FFFF00B0FFFF00B0FFFF00B0FFFF00B0FFFF00B0FFFF00B0FFFF00B0FF
      FF00B0FFFF00B0FFFF0050708000000000000000000000000000DCA98700FFFA
      F700FEF8F300FEF6F000FEF4EC00FEF2E900FDF1E600FDEFE200FFD5CC00FFD5
      CC00F5B3AA00B3887E006666660000000000000000000000000000000000A477
      6400FFF8F0007B412400000000000000000000000000A4776400FFF8F0007B41
      240000000000000000000000000000000000000000000000000090B8800080D8
      8000C0F0B000E0F8D00080A8700070D8900040B0600090804000000000000000
      0000000000000000000000000000000000000000000090C8D000E0F8FF00D0FF
      FF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF
      FF00C0FFFF00C0FFFF0050708000000000000000000000000000DCA98700FFFD
      FB00FFFBF700FEF9F400FEF7F100FEF5ED00FDF3EB00FDF1E700F7A64300F7A6
      4300E0924100666666000000000000000000000000000000000000000000C2A3
      9400B28B740098644000000000000000000000000000C4A79900B28B74009864
      400000000000000000000000000000000000000000000000000000000000B0B8
      9000B0D09000A0D8900080E0900050C070009090600000000000000000000000
      0000000000000000000000000000000000000000000090C8D00090C8D00090C8
      D00090C8D00090C8D00090C8D00090C0D00090C0D00090C0D00090B8D00080B0
      C00080A8C00080A8C00080A8C000000000000000000000000000DCA98700FFFF
      FF00FFFEFB00FFFBF800FEFAF500FEF8F100FEF6EE00FDF3EC00DCA98700EAB3
      7700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCA98700DCA9
      8700DCA98700DCA98700DCA98700DCA98700DEAB8800D6A38400DCA987006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF927400896954008969
      54008969540079605200796052006B5549006B5549005C4B43005C4B43005545
      3E0055453E00433129007960520000000000000000000000000066635F006663
      5F0066635F0066635F0066635F0066635F0066635F0066635F0066635F006663
      5F0066635F0066635F0000000000000000000000000000000000000000007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000000000000000000000000000000000000000000025A9
      D80025A9D80025A9D80025A9D8004ABCEA000000000000000000000000000000
      000000000000000000000000000000000000000000009E795A00DDD6D100F5F1
      ED00F5EEE700F5EEE700F3EBE400F3EBE400F3EBE400EFE8E000EFE8E000EFE8
      E000F5F1ED00DDD6D10043312900000000000000000000000000B0817E00FDE2
      C400FDE2C400FDE2C400FCDDB300FCDDB300FCDDB300FADBB000FADBB000FADB
      B000FADBB00066635F0000000000000000000000000000000000BC897700BE8B
      7900BE8B7900BA877600B7847500B17E7200AE7B7100AB786F00AB786F00A16E
      6B009E6B680070707000000000000000000000000000000000000000000025A9
      D8008CCADF006FD2F5004ABCEA0025A9D80025A9D80025A9D8004ABCEA000000
      00000000000000000000000000000000000000000000AF927400FEF9F300FEF9
      F300FEF5EB00CEA27800CEA27800CEA27800CEA27800CEA27800CEA27800CEA2
      7800CEA27800F5F1ED0055453E00000000000000000000000000B0817E00FCE6
      D500F4DFCA00F4DFCA00F4DFCA00F4DFCA00F4DFCA00F4DFCA00FFFFFF00147D
      FF00147DFF00147DFF00147DFF000000000000000000857DA400C18E7A00DCBB
      A600E6C6B400E6C6B400E6C6B400E6C6B400E6C6B400DCBBA600DCBBA600DCBB
      A600A16E6B007070700000000000000000000000000025A9D80025A9D80025A9
      D80048AFE700B1F2FF0088DFFF0088DFFF0088DFFF0088DFFF004ABCEA0025A9
      D80025A9D8004ABCEA00000000000000000000000000AF927400F5EEE700FEF9
      F300FEF5EB00CEA27800FFE0C700FFD9BC00FFE0C700FFE0C700FFE0C700FFE0
      C700CEA27800EFE8E00055453E00000000000000000000000000B78D8C00F8EA
      D900FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FFFF
      FF00147DFF00147DFF00147DFF0000000000000000005693DC00857DA400D2AD
      AC00FDE6D500FFE5CC00FFE3C700FFDFBF00FFDBB800FFD8B200FFD3A800FFD2
      A500A3706B007070700000000000000000000000000025A9D800A6E6F20025A9
      D8004ABCEA00C6EBF70086F2FF0086F2FF0086F2FF0086F2FF0086F2FF0086F2
      FF006FD2F50025A9D80025A9D8000000000000000000C0A47E00F5EEE700FEF9
      F300FEF5EB00CEA27800FFFFFF00FFD9BC00FFFFFF00FFFFFF00FFE0C700FFFF
      FF00CEA27800EFE8E0005C4B4300000000000000000000000000B78D8C00FAEC
      DD00FAECDD00F8EAD900FCE6D500FCE6D500FDE4CD00FDE4CD00FFFFFF00147D
      FF00147DFF00147DFF00147DFF0000000000000000003B87E3005693DC00857D
      A400DCC1B000FFE9D400FFE5CC00FFE1C400FFDFBF00FFDBB800FFD8B200FFD3
      A800A5726C007070700000000000000000000000000025A9D800A6E6F20025A9
      D8006FD2F5008CCADF009EF4FF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0088DFFF0057CAF20025A9D8000000000000000000C0A47E00F5EEE700FEF9
      F300FEF9F300CEA27800FFE0C700FFD9BC00FFE0C700FFE0C700FFE0C700FFE0
      C700CEA27800F3EBE4005C4B4300000000000000000000000000CF9F8F00F9ED
      E100FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FFFFFF00147DFF00147D
      FF00147DFF00FFFFFF00147DFF00000000000000000000000000EEC294003B87
      E300857DA400E6C6B400D0B0A200D5AC9800DCBBA600EED7AD00FFD6BA00FFD8
      B200AB786F007070700000000000000000000000000025A9D80066CCFF0025A9
      D80088DFFF0036ACDC00C6EBF700CCFFFF00CCFFFF00C1FCFF00C1FCFF00C1FC
      FF0088DFFF0088DFFF0036ACDC000099CC0000000000C0A47E00F5EEE700CEA2
      7800CEA27800CEA27800FFFFFF00FFD9BC00FFFFFF00FFFFFF00FFE0C700FFFF
      FF00CEA27800F3EBE4006B554900000000000000000000000000CF9F8F00FBF2
      E700FBF2E700F9EDE100FAECDD00FAECDD00FFFFFF00147DFF00147DFF00147D
      FF00FFFFFF0066635F0000000000000000000000000000000000EEC29400B9BE
      C400B9BEC400C6A09200F1E4BE00FFFFD900F0DDD200DCBBA600EED7AD00FFD9
      B400AE7B71007070700000000000000000000000000025A9D80066CCFF0025A9
      D80088DFFF0071E2FF0057CAF2004ABCEA004ABCEA00A6E6F200F7F7F700CCFF
      FF009EF4FF00B1F2FF0087DFF30036ACDC0000000000CCB38C00FAEFEA00CEA2
      7800FFE0C700CE9D5100CE863300CE863300CE863300CE782E00CE782E00CE78
      2E00CE7F4400F3EBE4006B554900000000000000000000000000CF9F8F00FBF2
      E700FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FFFFFF00147DFF00FFFF
      FF00FADBB00066635F0000000000000000000000000000000000EEC29400EFD9
      CD00DCBBA600F4E2B600FFFAC900FFFFEB00FFFFFA00EFD9CD00DCBBA600FFDF
      BF00B17E72007070700000000000000000000000000025A9D80066CCFF0025A9
      D8009EF4FF0099FFFF0099FFFF0099FFFF0099FFFF006FD2F50070C6E20070C6
      E20070C6E2008CCADF00A6E6F20025A9D80000000000D3BC9600FAEFEA00CEA2
      7800FFFFFF00FFE0C700FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA27800FDF2
      E500FDF2E500F3EBE40079605200000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FBF2E700F9EFE500F9EDE100FAECDD00FFFFFF00F4DF
      CA00F7D9C90066635F0000000000000000000000000000000000EEC29400F0DD
      D200DCBBA600FFE5B300FFF5C400FFFFE700FFFFEB00FFFCCF00CDA69300FFE1
      C400B78475007070700000000000000000000000000025A9D80071E2FF0025A9
      D800C1FCFF0099FFFF0099FFFF00C1FCFF00C1FCFF00CCFFFF00B1F2FF00B1F2
      FF0030C0E6000099CC0025A9D80025A9D80000000000D8C49F00F5EEE700CEA2
      7800FFE0C700FFE0C700FFE0C700FFE0C700FFE0C700FFE0C700CEA27800FEF5
      EB00FEF5EB00F3EBE40079605200000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FDF4EE00F9EFE500F9EDE100F8EAD900F4DFCA00F5E5
      CE00F5E5CE0066635F0000000000000000000000000000000000EEC29400F0DD
      D200DCC1B000F1E4BE00FFF1BE00FFFAC900FFFED100F4E2B600D0B0A200FFE5
      CC00BA8776007070700000000000000000000000000025A9D80099FFFF0036AC
      DC00A6E6F200A6E6F200CCFFFF00A6E6F20025A9D80025A9D80025A9D80025A9
      D80025A9D8000099CC00000000000000000000000000DECBA800F5F1ED00CEA2
      7800FFFFFF00FFE0C700FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA27800FEF9
      F300FEF9F300F5EEE70089695400000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700F9EFE500FAECDD00FCE6D500F5E5
      CE00F5E5CE0066635F0000000000000000000000000000000000EEC29400F2E1
      DD00E2C9C300EFD9CD00F0DDD200FFE9B600F4E2B600D5AC9800F7D8C000FADC
      C200BC8977007070700000000000000000000000000025A9D80099FFFF0099FF
      FF0025A9D80025A9D80025A9D80025A9D80099FFFF0099FFFF000099CC000000
      00000000000000000000000000000000000000000000E4D2AF00FEF5EB00CE9D
      5100CE863300CE863300CE863300CE782E00CE782E00CE782E00CE7F4400FEF9
      F300FEF9F300F5F1ED0089695400000000000000000000000000CF9F8F00FBF2
      E700FBF2E700F9EFE500FBF2E700FBF2E700FBF2E700FBF2E700DC865300DC86
      5300DC86530066635F0000000000000000000000000000000000EEC29400FCE8
      D800FCFCFC00E2C9C300DCBBA600DCB29800DCB29800E2C9C300F7D8C000FF9E
      9E00BE8B79007070700000000000000000000000000025A9D800CCFFFF00CCFF
      FF00CCFFFF0025A9D80025A9D80025A9D80025A9D80025A9D80025A9D8000000
      00000000000000000000000000000000000000000000E4D2AF00F4E9DB00FDF2
      E500F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9
      DB00F5EEE700DDD6D10089695400000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700CF9F8F00E0B8
      960066635F000000000000000000000000000000000000000000EEC29400FBEF
      E700FFFFFF00FFFFFF00FFFFFF00FFFEFD00FFFAF300FFF6ED009B6A69009B6A
      69009B6A6900707070000000000000000000000000000099CC0025A9D80025A9
      D80025A9D8000099CC0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4E9DB00E4D2AF00E4D2
      AF00DECBA800D8C49F00D3BC9600CCB38C00C0A47E00C0A47E00C0A47E00AF92
      7400AF9274009E795A00AF927400000000000000000000000000CF9F8F00CF9F
      8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F006663
      5F00000000000000000000000000000000000000000000000000EEC29400FFF2
      E500FFFFFE00FFFFFE00FFFEFD00FFFEFD00FFFCF900FFF8F2009B6A6900DAA7
      8600C6A092000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEC29400F0BD
      9200E4BA9800DCB29800DCB29800D5AC9800CDA69300CDA693009B6A6900C79E
      9E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E06D2600E2702B00E2702B00E2702B00966D5C00847B7700939393009393
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000066635F006663
      5F0066635F0066635F0066635F0066635F0066635F0066635F0066635F006663
      5F0066635F0066635F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F24BB002F24BB002F24BB002F24
      BB0000000000000000000000000000000000000000000000000000000000E78C
      6000E06D2600FCDCD500FFB89500FFB89500E2702B00E2702B00C4865F00C486
      5F00847B7700000000000000000000000000000000000000000000000000D7A2
      8F007E7D7C0048433D0048433D0048433D0048433D0048433D005E5C5B006663
      5F00B0AFAE000000000000000000000000000000000000000000B0817E00F7D9
      C900FCE6D500FCE9C900FCE9C900FCE9C900FCDDB300FCDDB300FCDDB300FDD7
      A500FDD7A50066635F0000000000000000000000000000000000000000000000
      00000000000000000000000000006158CB00D6D4F800D5D3F900796DEB00796D
      EB002F24BB002F24BB000000000000000000000000000000000000000000E78C
      6000E9834500FFC1BF00FFB89C00FFB99F00F6A47C00FAAF8F00E16D2600E16D
      2600EA956B009393930000000000000000000000000000000000D0A79C00F8CF
      C000FDE8E700FDE8E700FDDFDE00FDDFDE006B6A6700928E8C00BEBCBC00BCB9
      B90066635F00B0AFAE0000000000000000000000000000000000B0817E00F7D9
      C900FCE6D500FDD7A500FDD7A500FDD7A500FDD4A900E0B89600E0B89600E0B8
      9600FDD7A50066635F0000000000000000000000000000000000000000000000
      000000000000000000006059CF00BBB7F300B3B5FF00D6D3F9006F69DF009289
      FE009289FE00746CEA002F24BB0000000000000000000000000000000000E78C
      6000EE8E5700FECDC500FFB7A600FFB7A600CB8E6900EFAE9B00FFB7A600FFB7
      A600DB5D00009393930000000000000000000000000000000000D7A28F00FFFF
      FF00FBF7F700FDF4EE00FDE8E700E5D8D50048433D00BCB9B900EDD1B600EDD1
      B600B0AFAE0066635F0000000000000000000000000000000000B78D8C00F9ED
      E100B78D8C00AC838200AC838200AC8382007E9AAB0084ACE6007CC4DF00AC83
      8200FECAC90066635F00000000000000000000000000000000000000000033AC
      700033AC700033AC70006059CF00D9D7F900938EF000EEECFD006E66DC00746C
      EA00746CEA009289FE00473ECD0000000000000000000000000000000000E78C
      6000F6A57400FCDCD500FFB7B000FFB7B000D8987D00EBAA8E00FFB7B300FFB7
      B300DB5D00009393930000000000000000000000000000000000DC988000FDDF
      DE00FDF4EE00FFFFFF00FFFFFF00E5D8D5006B6A6700BCB9B9007B736F00EDD1
      B600EDD1B60048433D0000000000000000000000000000000000B78D8C00F9ED
      E100B78D8C00B0817E00AE705B008A8292007CC4DF007EE4F30079DCF3008AA4
      B400FECAC90066635F000000000000000000000000000000000064C09300D5FA
      E700D4FBE70079DEAF006059CF00DAD8F900EEEEFF00C8C5FF005C53D200796D
      EB00796DEB007E76F4004B41D10000000000000000000000000000000000E78C
      6000FFB89400FEEDE900FFCAC900FFC7C300EBB19B00F6B2A600FFBAB600FFBA
      B600DB5D0000939393000000000000000000000000000000000000000000D7A2
      8F00DC988000DC988000DC988000DC9880009A9A9A007A797900FDDFDE00FFFF
      FF00BCB9B90066635F0000000000000000000000000000000000CF9F8F00F9ED
      E1008AA4B4006F8CC000454545006F8CC000719DC3007CC4DF007CC4DF006F8C
      C000FECAC90066635F0000000000000000000000000065C3930072CA9E0070D0
      9D00D4FBE70075D3A300B4902B00B4902B00B4902B00B4902B007670E500B7B2
      FF00B7B2FF007E76F4004C42D50000000000000000000000000000000000E78C
      6000ED9D7500D2A69800F0C1AD00FAD4C000FAE6DF00FFE7E400FCE0DB00FCE0
      DB00D8600A009393930000000000000000000000000000000000000000000000
      000000000000E8B09700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5
      A50048433D000000000000000000000000000000000000000000CF9F8F00F9ED
      E10069A7CA005374C00023324E006390D3006390D30079DCF30079DCF3006390
      D300FECAC90066635F0000000000000000000000000065C39300D3FBE40074CF
      A200C0EED700C6AB5E00F6EDD600F7EDD500E5CA7300E5CA7300B4902B00B490
      2B00B7B2FF00B7B2FF003E38B500000000000000000000000000000000000000
      0000E2723A00CB8E6900C4865F00E16E2800E2702B00F29B6700F1C5B500F1C5
      B500DB5D00009393930000000000000000000000000000000000000000000000
      0000D7A28F00FFFFFF00DC988000DC988000DC988000DC988000A5A5A5004843
      3D00000000000000000000000000000000000000000000000000CF9F8F00FEF5
      E3006390D3003B5E7C001A46A7004094F3002D7CFA005BC2FB002D7CFA004094
      F300FECAC90066635F0000000000000000000000000065C39300D9FBEA00EFFE
      F500CAAC5F00F0E1BA00FFE3B300F7EED500DABB6F00F9DD8F00F9DD8F00E4C5
      7200B4902B006059CF0000000000000000000000000000000000000000000000
      000000000000E2723A00E2702B00FAB38F00FAB38F00C4865F00B7896B00B789
      6B00DC610A00000000000000000000000000000000000000000000000000D0A7
      9C00FDE4CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBCBC0048433D000000
      0000000000000000000000000000000000000000000000000000CF9F8F00FBF2
      E7001A46A70023324E001A46A7001640C4001544D9000C49E0000C49E0001544
      D900FECAC90066635F0000000000000000000000000065C39300FFFFFF00B9F8
      D800CAAC5F00F7EED800ECD29300FCF8ED00D7BB6C00E4C57200E4C57200F9DD
      8F00C6A345000000000000000000000000000000000000000000000000000000
      000000000000E2723A008B8887000000000000000000E79F7E00E2845200C590
      790000000000000000000000000000000000000000000000000000000000DC98
      8000FFFFFF00DC988000DC988000DC988000DC9880006B6A67007B736F007B73
      6F007B736F007B736F0000000000000000000000000000000000CF9F8F00FBF2
      E7004094F3001A46A7002673F7004094F30050B5F90079DCF3007CC4DF0050B5
      F900FECAC90066635F0000000000000000000000000065C39300B9F8D800A2ED
      C800CAAC5F00F7EFDA00FFF9EE00FDEDC700CCAD5900E5CA7300E5CA7300EECF
      7C00CAA748000000000000000000000000000000000000000000000000000000
      000000000000E2723A008B8887000000000000000000E79F7E00C5907900E272
      3A0000000000000000000000000000000000000000000000000000000000D7A2
      8F00FDDFDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECDCB006B6A6700B0AF
      AE00B0AFAE005E5C5B0000000000000000000000000000000000CF9F8F00FBF2
      E7006C9EF3002673F7002673F7004094F30050B5F9005BC2FB00FEF5E300FCE6
      D500FCE6D50066635F000000000000000000000000000000000065C393006DC8
      9A00CAAC5F00FFFFFF00FCE8B500FCE8B500E0C27600FCE8B500FCE8B500EECF
      7C00CEAA49000000000000000000000000000000000000000000000000000000
      000000000000E2723A00F6A28E008B8887008B888700F1987900C59079000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DC988000FFFFFF00DC988000DC988000DC988000DC988000BCB9B9006B6A
      6700B0AFAE005E5C5B0000000000000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700DC865300DC86
      5300DC86530066635F0000000000000000000000000000000000000000000000
      0000CAAC5F00FCE8B500F2DB9D00F4DEA300DFC27200F2DB9D00FCE8B500FCE8
      B500AF8F3E000000000000000000000000000000000000000000000000000000
      00000000000000000000E2723A00F2998400F8A89D00F2998400E2723A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DC988000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBC
      BC005E5C5B000000000000000000000000000000000000000000CF9F8F00FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700CF9F8F00E0B8
      960066635F000000000000000000000000000000000000000000000000000000
      000000000000CAAC5F00CCAF6300F4DEA300E3C57800FCE8B500CAAC5F00CAAC
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E2723A00E2723A00E2723A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DC988000DC988000DC988000DC988000DC988000DC98
      8000000000000000000000000000000000000000000000000000CF9F8F00CF9F
      8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F006663
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAC5F00CAAC5F00CAAC5F00000000000000
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
      0000000000000000000000000000B6B3B300B6B3B300B6B3B300000000000000
      0000000000000000000000000000000000000000000048B9DB0048B9DB0048B9
      DB0048B9DB0048B9DB0048B9DB0048B9DB0048B9DB0048B9DB0048B9DB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A60000000000000000000000000000000000000000000000000070C1DB0070C1
      DB0070C1DB00000000000000000000000000000000000000000070C1DB0070C1
      DB0070C1DB000000000000000000000000000000000000000000000000000000
      000000000000B6B3B300B6B3B300BCB1B100C2B4B400C4B4B400B6B3B300B6B3
      B3000000000000000000000000000000000048B9DB009CF6FF007DD8FF007DD8
      FF007DD8FF007DD8FF007DD8FF007DD8FF007DD8FF007DD8FF009CF6FF0048B9
      DB00000000000000000000000000000000000000000000000000000000000000
      0000B1B1B100848484006A6A6A00686868007A747400A19C9C00737373007A7A
      7A0095959500A6A6A6000000000000000000000000000000000070C1DB00AAEE
      FD0000B4EB0070C1DB0000000000000000000000000070C1DB009EEFFF0006CA
      FF0070C1DB00000000000000000000000000000000000000000000000000B6B3
      B300B6B3B300AFAAA700CEC6B600DDDADB0094A6EB00EDE7D000C2BAB400CABA
      B800B6B3B30000000000000000000000000048B9DB00A0F6FF0082DDFF0082DD
      FF00E1B49500E1B49500E1B49500E1B49500E1B49500E1B49500E1B49500E1B4
      9500E1B49500E1B49500E1B49500E1B495000000000000000000000000008888
      8800BFBFBF00F5F5F500C8C8C800B9AAAA00BFA6A600CBC9C900EDEDED00CACA
      CA007C7C7C00757575009B9B9B000000000000000000000000000000000070C1
      DB000DCDFF0019D1FF0070C1DB000000000070C1DB007FE7FF0006CAFF0070C1
      DB00000000000000000000000000000000000000000000000000B6B3B30087A9
      8600AFB6A000FAEDCE00FFF6E100C6D2F900668BFC00FFF9EF00FEFCF400E9E5
      D500CDBDBA00B6B3B300000000000000000048B9DB00A3F6FF0086E1FF0086E1
      FF00E1B49500FFFDFB00FFFCF900FFFAF600FFF9F400FFFAF600FFF9F400FFF7
      F000FFF6EE00FFF4EA00FFF4E900E1B495000000000000000000B6B6B600F3F3
      F300F5F5F500EFEFEF00C4C4C400B0B0B0008484840090909000AAAAAA00D0D0
      D000F0F0F000C7C7C700949494000000000000000000000000000000000070C1
      DB0066E2FF000ACCFF003DDCFB0070C1DB00A1FCFF003AE0FF000AB6E80070C1
      DB00000000000000000000000000000000000000000000000000249B2E00249B
      2E00FFEFCC00FFEFCC00FFEECD00FFEAC600FFE7C300FFE9C900FFF2DF00FFFC
      F600E9E5D500C8B9B700B6B3B3000000000048B9DB00A3F6FF0086E1FF0086E1
      FF00E1B49500FFFDFB00E2E2E200E0E0E000DFDFDF00DDDDDD00DCDCDC00DBDB
      DB00DADADA00DADADA00FFF4E900E1B4950000000000CACACA00FBFBFB00F6F6
      F600E4E4E400B2B2B2009F9F9F00B3B3B300C8C8C800BFBFBF00B1B1B100ACAC
      AC00A8A8A800888888009B9B9B00000000000000000000000000000000000000
      000070C1DB0000C6FF0024D6FF006BF1FF008AFCFF0052E8FF0070C1DB000000
      00000000000000000000000000000000000000000000249B2E005BD5840071EB
      9E00249B2E00FFF4D000FFF4D000FFF1CD00FFEDC900FFE9C400FFE7C200FFF2
      E000FEFCF200C3BAB400B6B3B3000000000048B9DB00A8F6FF008BE5FF008BE5
      FF00E1B49500FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400FFF7F000E1B4950000000000CACACA00E4E4E400BABA
      BA00B6B6B600D9D9D900C3C3C300ABABAB00A1A1A100A3A3A300BABABA00D2D2
      D2009BC2A9007D7D7D009D9D9D000000000000000000000000000000000070C1
      DB000DBEF0000DCDFF000DCDFF0043E2FF007EF6FF006EF2FF0070C1DB000000
      000000000000000000000000000000000000249B2E0043C7680058DB8A0068E6
      980078F0A500249B2E00FFF4D000FFF4D000FFF2CE00FFEECA00FFE9C400FFE9
      CA00FFFAF100EAE5CF00C1B3B300B6B3B30048B9DB00ADF8FF008FE8FF008FE8
      FF00E1B49500FFFFFF00EBEBEB00EBEBEB00E8E8E800E5E5E500E4E4E400E2E2
      E200E1E1E100E1E1E100FFF9F200E1B495000000000098989800BFBFBF00E4E4
      E400E4E4E400E4E4E400E4E4E400E9E9E900DDDDDD00D1D1D100B8B8B800A8A8
      A8008BA494007C7C7C00A2A2A20000000000000000000000000070C1DB0034D8
      F80034DDFF0019D2FF0000C7FF002EDBFF0066F0FF008AFCFF0047E2FF0070C1
      DB0070C1DB00000000000000000000000000249B2E00249B2E004ACF75005ADA
      8900249B2E00249B2E009DCA8E007F7F7C008E8E8E00736C66008B7F73008B7F
      7300F4EEE7006688F600C2B5B500B6B3B30048BADB00B3F8FF0094EDFF0094ED
      FF00E1B49500FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400FFFAF400E1B4950000000000B9B9B900EAEAEA00E4E4
      E400E0E0E000D9D9D900E2E2E200DDDDDD00D4D4D400D3D3D300DBDBDB00E1E1
      E100DBDBDB0094949400A6A6A600000000000000000070C1DB0037DEFF0087FB
      FF005CEBFF002DDAFF0000C8FF0017D1FF004CE6FF0087FBFF0061EEFF0028D8
      FF0000B4EB0070C1DB00000000000000000000000000249B2E003AC459004DD5
      7A00249B2E00FFFFE700FFFFE7008B8B8900ADADAD0058585800AA9B8700B5AE
      9A00F4EEE4007690F000BBB0B000B6B3B30048BADB00B9F8FF0097F1FF0097F1
      FF00E1B49500FFFFFF00E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300EBEBEB00FFD4CA00D0A6910000000000CACACA00E2E2E200D4D4
      D400C2C2C200BEBEBE00DDDDDD00F4F4F400F2F2F200F0F0F000E4E4E400D2D2
      D200D1D1D100A7A7A700000000000000000070C1DB007CE2EE00A7DAEB00A7DA
      EB00A7DAEB00B9E2EE0039D8FF0006CAFF003BD3F10043DDF800C1DCE800A7DA
      EB00ACE6F4007CE2EE0070C1DB000000000000000000249B2E0033B6450041CD
      6500249B2E00FFFFEB00FFFFEB00FFFFE900EEEED30066666300C4B19800FFEA
      C700FFF6DF00E4DAC100B2AAAA00B6B3B30048BADB00BDF8FF009AF3FF009AF3
      FF00E1B49500FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D0A69100D0A69100D0A691000000000000000000CACACA00D9D9
      D900F2F2F200C8C8C800CECECE00C5C5C500CBCBCB00D0D0D000D0D0D000C9C9
      C900A6A6A6000000000000000000000000000000000070C1DB0070C1DB0070C1
      DB0070C1DB0070C1DB0077D2EB0000C6FF0000C4FA0070C1DB0070C1DB0070C1
      DB0070C1DB0070C1DB00000000000000000000000000B6B3B300249B2E002EC1
      480039C35800249B2E00FFFFF600FFFFF000FFFFE400F2F2D30066666300CDB9
      A100FCECCD00B8B2AA00B6B3B3000000000048BADB00C5F9FF00A1F9FF00A1F9
      FF00E1B49500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D0A69100DEAD8500DBC3B600000000000000000000000000D5CF
      CF00FFE1D600FFE0D800FCE3DD00F4E7E200EDEAE900EEEEEE00A5A5A500A6A6
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000070C1DB00A7DAEB000DCDFF0000C4FA0070C1DB00000000000000
      0000000000000000000000000000000000000000000000000000B6B3B300249B
      2E0033C54F00249B2E00FFFFF200FFFFF200FFFFF200F2F7D800E7EBC6006666
      6300D7CAB400B3AFAD00B6B3B3000000000048BADB00CBFAFF00A5FDFF00A5FD
      FF00E1B49500E1B49500E1B49500E1B49500E1B49500E1B49500E1B49500E1B4
      9500E1B49500D0A69100DEC7B80000000000000000000000000000000000E2D2
      CD00FFE7CD00FFE7CD00FFE7CD00FFE2C900FFE1C6009B878500A6A6A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070C1DB001FD4FF0070C1DB0000000000000000000000
      0000000000000000000000000000000000000000000000000000B6B3B300249B
      2E0029B33E0033BA4C00249B2E00249B2E00249B2E00249B2E00CEDAAA00DCD0
      BA00BCB7B300B6B3B300000000000000000048BADB00E9FCFF00A8E9F300A8E9
      F300A8E9F300A8E9F300A8E9F300A8E9F300A8E9F300A8E9F300E9FCFF0000A6
      D30000000000000000000000000000000000000000000000000000000000DBC3
      BB00FFEDDB00FFEDDB00FFEDDB00FFEDDB00FAE7D500958B8B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070C1DB002EC8EB0070C1DB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6B3
      B300249B2E00249B2E0046A04D00459D4A0061A25B00B6BB9A00BAB5AD00BBB7
      B600B6B3B3000000000000000000000000004ABADB00EFFCFF00BAAAA100BAAA
      A100BAAAA100BAAAA100BAAAA100BAAAA100BAAAA10096DEEE00EFFCFF0000A6
      D30000000000000000000000000000000000000000000000000000000000E9D5
      CC00FFF2E700FFF2E700FFF2E700FFF2E700E6D3CA00AFAFAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070C1DB002EC8EB0070C1DB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6B3B300B6B3B300B7B3B300C2BFBF00C0BDBD00B5B1B100B6B3B300B6B3
      B300000000000000000000000000000000000000000082CDE300BAAAA100BEAF
      A700D2CAC500EFEBE900EFEBE900CDC3BD00BAAAA10050BDDE0058BFDD000000
      0000000000000000000000000000000000000000000000000000DDCECD00FFF9
      F300FFF9F300FFF9F300FFF9F300FFF9F300C7BBB80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000070C1DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B6B3B300B6B3B300B6B3B300B6B3B300000000000000
      000000000000000000000000000000000000000000000000000000000000B6A6
      9D00BCACA300BCACA300BCACA300BAAAA100D5D3D00000000000000000000000
      0000000000000000000000000000000000000000000000000000EEE4E300EEE4
      E300EEE4E300EEE4E300EEE4E300EEE4E300EEE4E30000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
      0000000000000000000072727200727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600F0F0F0000000000000000000000000000000
      000000000000008A0000008A0000727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072727200008A0000008A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8
      C800D3D3D300C8C8C800A6A6A600F0F0F0000000000000000000000000000000
      0000008A00004FCA7400008A0000727272007272720072727200727272007272
      7200727272000000000000000000000000000000000000000000000000007272
      72007272720072727200727272007272720072727200008A00004FCA7400008A
      0000000000000000000000000000000000000000000000000000B1B1B100A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F000000000000000000000000000008A
      00004BD4780057DB8A00008A0000008A0000008A0000008A0000008A0000008A
      0000727272000000000000000000000000000000000000000000000000007272
      7200008A0000008A0000008A0000008A0000008A0000008A000057DB8A004BD4
      7800008A000000000000000000000000000000000000CEA18600B17E5D00AA76
      5600AA765600AA765600AA765600AA765600AA765600AA765600AA765600A874
      5400AC765700957564009E9E9E000000000000000000000000000F0F0F00A6A6
      A600D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F0000000000000000000008A000000B0
      00004BD4780057DB8A0057DB8A0065E495007EF6AA0081F8AD008AFFB500008A
      0000727272000000000000000000000000000000000000000000000000007272
      7200008A00008AFFB50081F8AD007EF6AA0065E4950057DB8A0057DB8A004BD4
      780000B00000008A0000000000000000000000000000E3C8B600FBF8F600FAF8
      F600FAF8F600F9F8F600FAF8F600FAF8F600FAF8F600FAF8F600FAF8F600FBF8
      F600FAF8F600A5836C009E9E9E000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F000000000000000000000000000008A
      00004BD4780057DB8A00008A0000008A0000008A0000008A0000008A0000008A
      0000000000000000000000000000000000000000000000000000000000000000
      0000008A0000008A0000008A0000008A0000008A0000008A000057DB8A004BD4
      7800008A000000000000000000000000000000000000E6CDBD00FFFFFF00FDFF
      FF008A9FF5002361FD008C9EF200FBFFFF00C1C1E7004873F9006382F400FDFF
      FF00FEFFFF00A5836C009E9E9E000000000000000000000000000F0F0F00A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600F0F0F0000000000000000000000000000000
      0000008A00004FCA7400008A0000727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072727200008A00004FCA7400008A
      00000000000000000000000000000000000000000000E7CDBA00FFFFFF00FBFF
      FF004875FC000658FF002463FD006987F6004B75FA000658FF003469FB00FCFF
      FF00FDFFFE00A7846A009E9E9E000000000000000000000000000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F00F0F0F0000000000000000000000000000000
      000000000000008A0000008A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008A0000008A00000000
      00000000000000000000000000000000000000000000E9CFB800FFFFFF00FBFF
      FF00C4CAF2005C82FA00125BFF000658FF000658FF003A6CFB00A7AFEC00FCFF
      FF00FDFFFE00A9866A009E9E9E0000000000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000000000000000000000000000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F0000000000000000000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F0000000000000000000EBD0B700FFFFFF00FBFF
      FF00FBFFFF009EAFF600145CFE000658FF000658FF00577DF800FBFFFF00FCFF
      FF00FCFFFE00AB876A009E9E9E00000000000F0F0F00A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F0000000000000000000EED2B400FFFFFF00FBFF
      FF00C3CBF600507AFC000658FF000658FF000658FF002463FD008C9EF200FCFF
      FF00FEFFFD00AF8B69009E9E9E00000000000F0F0F00A6A6A600DBDBDB00DBDB
      DB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3D300C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3
      D300C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3
      D300C8C8C800A6A6A600F0F0F0000000000000000000F2D5B700FFFFFF00FFFF
      FF004876FD000658FF003A6DFC008EA3F7006688FA000F5BFF002361FD00FFFF
      FF00FFFFFF00B28A65009E9E9E00000000000F0F0F00A6A6A600DBDBDB00D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F0000000000000000000E9CAA400EDE9E300ECE7
      DD008AA3FC00346BFE00A7B6F700F0ECF000D8D8F1006184FA006687F800EEE6
      D900F2E5D000B69B7F009E9E9E00000000000F0F0F00A6A6A600D3D3D300DBDB
      DB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F0000000000000000000D08B2400D0882800D087
      2300D0882300D0882300D0882400D0872300D0872100D89A4A00DA953F00C992
      5B009D7C7700C5B19A009E9E9E00000000000F0F0F00A6A6A600DBDBDB00D3D3
      D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F0000000000000000000E9B66E00EDB15A00EEAF
      5300EEAE5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE4C00EBAF
      5800DDA66300EBAF580000000000000000000F0F0F00A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F00F0F0F0000000000000000000000000000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F00F0F0F00000000000000000000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F00F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0915500B6602E00B25D2E000000000000000000000000000000
      0000D0A48D00BA581900CB651900BE6C49000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCCC000000000000FFECCC00CCCC0000CCCC000000000000000000000000
      00000000000000000000000000000000000000000000D8A25900D49A4B00D6A4
      6500D8BE9F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000D0915500B15321000000000000000000000000000000
      000000000000CE6A1900C868280000000000E9ECE800E9EBE700E9EBE700E9EB
      E700E9EBE700E9EBE700E9EBE700E9EBE700E9EBE700E9EBE700E9EBE700E9EB
      E700E9EBE700E9EBE700E8EBE7000000000000000000CCCC000000000000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC00000000
      000000000000000000000000000000000000E1B06700BF9D7500FF00FF00FF00
      FF00C6986000A3764A007550310068472A0066472C005D443000634C38008A78
      5C00FF00FF00FF00FF00FF00FF00FF00FF0019A0190019A6190019A2190019A0
      1900000000000000000000000000C2713D00A1401C00A4411900A94419009B3E
      1900B5541900D36C1900D091550000000000E0A14F00EAC08F00EABA8100EABA
      8100EABA8100EABA8100EABA8000EAB87D00EAB67A00EAB67700EAB47400EAB3
      7100EAB26E00EAB16B00E3A04600E7E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      000000000000000000000000000000000000EEB04700CCB69D00FF00FF00AA91
      78008A582B00C37E3400DE943C00EAA84700F0B45400DFB36400A98751006349
      2E00614B3800FF00FF00FF00FF00FF00FF005CC162002999190040B544000000
      0000000000000000000000000000CF957300B95D240095762A00677B1900BB6E
      3A00CF681900C2621A000000000000000000E7B67C00F1D5B700ECC19100ECC1
      9000ECC08E00ECBF8D00ECBE8B00EBBB8400FFECD800FFEAD400FFE7CF00FFE4
      CA00FFE2C400FFE0BF00EEBB7F00E7E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC00000000000000000000ECB34D00AA7A43006B492D00B675
      2900E7983700F09B3900EF973700EF9A3700F2A73D00F7BD5200FAD47700EACA
      8A00785D3A00604A3800FF00FF00FF00FF000000000019A01900299919000000
      000000000000000000000000000000000000B85B1D006B943D001BBB3900B974
      2E00D2681900C98F66000000000000000000E7B67C00EEC9A100FEFCFA00FFFA
      F500FFF4E900FFEEDD00FFE7CF00EDB97B00FFEEDD00FFECD800FFEAD300FFE7
      CE00FFE4C900FFE2C400EEBD8300E7E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000E0AF6100DD992E00BB7D2B00F2A6
      3700EB9B3200E7932F00E7903000B36D2700BA732B00E6953100F4B14200FBD4
      6C00F4D8940071553A008D765C00FF00FF00000000005CC16200299919001985
      1900198C1900197F1900198C19001A8C1900D0915500BD7C4800BEA28700DC77
      1900CB691900000000000000000000000000E7B67C00EECBA600FEFCFB00FFFD
      FB00FFF7EF00FDF1E300B1D59500B5B35800F8EEDC00FFEFDE00FFECD800FFEA
      D300FFE7CE00FFE4CA00EEBE8600E7E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000E7D2B500F6B53D00F3AC3400EAA0
      2F00E5962B00DA8A290085582D00FF00FF00FF00FF00FF00FF00D4863200F4A8
      3C00FCD16E00D7B77E00866C4F00FF00FF00000000000000000019A019002999
      190019A019001B93190019A0190019A01900D0915500BA5E2000CE671900F287
      1900E5B99500000000000000000000000000E7B67C00EECBA600FEFCFB00FFFF
      FF00FFFCFB00FFF8F000CDE2B9003EBD37008BCF7D00DFE7C700FFEEDD00FBEB
      D500FFEAD400FFE8D000EEC08A00E7E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000FF00FF00E2B76700F4B43600E8A0
      2B00E2952600A46720004F331F006B50370072563F007D5739008D5B30008C5B
      2E0092623100916C420083654A00FF00FF0000000000000000005CC162002999
      190040B5440000000000000000005CC0620019AF2E00C4895900FF991900E084
      1D0000000000000000000000000000000000E7B67C00EECAA400FAEFE000FBF0
      E300FBF0E300FBEFE000F8E8D100ACC474001FB71D0045BD3E00BBDAA300A1D2
      8900FFEBD700FFEAD400EEC18D00E9E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000FF00FF00DED5C400F4BD3F00EDAB
      2E00E59D2700D0802C00D0802C00D0802C00D0802C00D0802C00D0802C00D080
      2C00D0802C00D0802C0065493400FF00FF0000000000000000000000000019A0
      190029991900000000000000000019A0190033C46700D0915500E78F3F00E9BF
      980000000000000000000000000000000000E7B67C00F3D6B600E6990D00E698
      0600E6980600E6980600E6980600E7B46B0084D07F000DB60D0006B5060039BB
      3100FFEEDC00FFECD900EEC29000E9E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000F0EBE400FF00FF00ECD7A800F4C4
      4300ECAC2E00E59F2700DE962800E0952900E0942D00DD953700E7932E00E995
      3200F09A3A00EDA142006E4E3700FF00FF000000000000000000000000005CC1
      620019A0190093D59D005CC0620019AF300036C9730019AA2300D09155000000
      000000000000000000000000000000000000E7B67C00FDFAF800FAF0E400FAF0
      E300FAF0E300FAF0E300FAF0E300FCF6F000E8F3E20053C3510006B5060039BB
      3300FFF0E100FFF0DF00EEC49400E9E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00CCCC0000CCCC0000CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000F5F2ED00CAAF7E00FF00FF00EBD2
      8400F5C64200B88429006C492600FF00FF00FF00FF00B0906B00BF832E00E896
      2E00EE9B3500CF8B370085695000FF00FF000000000000000000000000000000
      0000368C360024AB260019A0190030C466002BBF580024AB2600000000000000
      000000000000000000000000000000000000E7B67C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1F2E000ABDEAA00A6DBA100B0DD
      A700FFF4E800FFF2E400EEC59700E9E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00CCCC0000CCCC0000FFECCC00FFECCC00FFECCC00CCCC0000CCCC0000CCCC
      0000CCCC0000CCCC0000CCCC000000000000FF00FF00D2BD8D00EBCF9100FF00
      FF00F5E5A800E0AF3B00705129005A43300071563800B6792500E6982A00E797
      2D00F1A43900A36D3000C1B0A000FF00FF000000000000000000000000000000
      000019A0190019A0190019AF300036C9730019AA230000000000000000000000
      000000000000000000000000000000000000E7B67C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FFFAF600FFF8
      F200FFF6EC00FFF4E900EEC79A00E9E2D500FFECCC00CCCC0000CCCC0000FFEC
      CC00FFECCC00FFECCC00CCCC0000CCCC0000FFECCC00FFECCC00FFECCC00CCCC
      0000CCCC0000CCCC0000CCCC000000000000FF00FF00FF00FF00E2D4AC00E5CA
      8A00FF00FF00F2DB8F00E1B23B00B6812500CD8F2500E5A02900E49C2800EAA0
      2E00E9A63A00A4866600FF00FF00FF00FF000000000000000000000000000000
      00005CC1620019A4190044C972002DBF5A0019A6190000000000000000000000
      000000000000000000000000000000000000E5A75100F2CB9500F2CB9500F2CB
      9500F2CB9500F2CB9500F2CB9500F2CB9500F2CB9500F2CA9400F2C99000F2C8
      8E00F2C78B00F2C78A00E8AB5A00E9E2D500FFECCC00FFECCC00FFECCC00CCCC
      0000CCCC0000FFECCC00FFECCC00FFECCC00CCCC0000CCCC0000FFECCC00FFEC
      CC00FFECCC00CCCC0000CCCC000000000000FF00FF00FF00FF00E9E2D400EADE
      AD00F6DD9100F5DD9E00E7D46700F6D14700F1B73200EDAC2B00EEAD3000E8A6
      3700B7946900FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000019A0190072D892002AB43B000000000000000000000000000000
      000000000000000000000000000000000000DF9E4700DD8F1400DD8F1400DD8F
      1400DD8F1200DD8F1400DD8F1400DD8F1400DD8F1400DD8F1400DD8F1400DD8F
      1400DD8F1400DD8F1200E0A75C00000000000000000000000000FFECCC00FFEC
      CC00FFECCC00CCCC0000CCCC0000FFECCC00FFECCC00FFECCC00CCCC0000CCCC
      0000FFECCC00FFECCC00FFECCC0000000000FF00FF00FF00FF00FF00FF00EAE4
      D800E0CF9C00F3E19A00FAE98100FBE96B00F4CC4500F8CF4B00DDB35000B497
      6F00DCD1C200FF00FF00E7C98A00E4D8C6000000000000000000000000000000
      0000000000005CC162003DBA470019A019000000000000000000000000000000
      000000000000000000000000000000000000E9E0D000E7CFB100E7D0B000E7D0
      B000E7D0B000E7D0B000E7D0B000E7D0B000E7D0B000E7D0B000E7D0B000E7D0
      B000E7CFB000E7CFB000E9E0D000000000000000000000000000000000000000
      0000FFECCC00FFECCC00FFECCC00CCCC0000CCCC0000FFECCC00FFECCC00FFEC
      CC0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00E9E2D600DED2BD00D1BC9C00CDB59300CEA96600EFD28500E9C5
      7C00D5BF9100E8DABF00E1C28600E7DCCE000000000000000000000000000000
      0000000000000000000040B64400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFECCC00FFECCC00FFECCC0000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00EDE3
      D200EACC8900EACF9C00DFD0BB00FF00FF000000000000000000000000000000
      0000000000006ECA6D0046AF45000F860D000F810D0046A345006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D0046AF45000F860D000F810D0046A345006ECA6D000000
      00000000000000000000000000000000000000000000CC9D8300CC9D8300CC9D
      8300CC9D8300CC9D8300CC9D8300CC9D8300CC9D8300CC9D8300CC9D8300CC9D
      8300CC9D8300CC8C83000000000000000000000000000000000019A6190019A2
      190000000000FF00FF00FF00FF00FF00FF00FF00FF0060966400000000000000
      000019A6190019A219000000000040B544000000000000000000000000006ECA
      6D00069B000000A0000000A00000009E0000009A000000930000008700000676
      00006ECA6D000000000000000000000000000000000000000000000000006ECA
      6D00069B000000A0000000A00000009E0000009A000000930000008700000676
      00006ECA6D0000000000000000000000000000000000F0CCB000FFF9E600FFF9
      E600007E7E00007E7E00007E7E00007E7E00007E7E00FFE6CC00FFE6C200FFE6
      C200FFDDB900CC8C83000000000000000000FF00FF005CC162002999190040B5
      4400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0024AB260019AA
      190019B92C0019A219006AC57100FF00FF00000000000000000068C9670000A9
      000000AE000000B0000000B2000000B0000000AC000000A50000009B0000008F
      0000007D00005AAD5900000000000000000000000000000000006ACA690000A9
      000000AE000000B0000000B2000000B0000000AC000000A50000009B00000090
      0000007D000059AD5800000000000000000000000000F0CCB000FFF9F0000095
      950000FFFF00FFFFFF0000FFFF0027D5FF00009DFF00007E7E00FFF0CC00FFE6
      C200FFDDB900CC8C83000000000000000000FF00FF00FF00FF00000000002999
      1900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000001BBB
      390019AE1F0040B54400FF00FF00FF00FF00000000006ECA6D0000B00000FFFF
      FF00FFFFFF0036BC360030BA300043BF4300FFFFFF00FFFFFF0001AE010000A1
      000000930000007D00006ECA6D0000000000000000006ECA6D0000B0000017B6
      17002DBA2D0036BC3600FFFFFF00FFFFFF0043BF430000B5000001AE0100FFFF
      FF00FFFFFF00007D00006ECA6D000000000000000000F0CCB000FFF9F000FFF9
      F0000095950000FFFF00FFFFFF0000FFFF0027D5FF00009DFF00007E7E00FFF0
      CC00FFDDC200CC8C83000000000000000000FF00FF00FF00FF005CC162002999
      190019851900198C1900197F1900198C1900198C1900198C190019AC3D0022C0
      490019A41900FF00FF00FF00FF00FF00FF000000000006B3000033BB3300FFFF
      FF00FFFFFF00FFFFFF0043BF430043BF4300FFFFFF00FFFFFF00FFFFFF0002B0
      020000A10000008F000006760000000000000000000006B3000033BB33004BC1
      4B004BC14B00FFFFFF00FFFFFF00FFFFFF0043BF430030BA3000FFFFFF00FFFF
      FF00FFFFFF0001900100067600000000000000000000F0CCB000FFF9F900FFFF
      F900FFF9F0000095950000FFFF00FFFFFF0000FFFF0027D5FF00009DFF005555
      670055556700CC8C83000000000000000000FF00FF00FF00FF00FF00FF000000
      000029991900000000001B93190000000000000000000000000026C051001BB5
      370032B13500FF00FF00FF00FF00FF00FF006ECA6D0036BC36005FC75F0062C7
      6200FFFFFF00FFFFFF00FFFFFF0043BF430046C04600FFFFFF00FFFFFF00FFFF
      FF0000AE0000009B0000008700006ECA6D006ECA6D0036BC360060C7600062C7
      6200FFFFFF00FFFFFF00FFFFFF0043BF430046C04600FFFFFF00FFFFFF00FFFF
      FF0000AE0000029C0200008700006ECA6D0000000000F0CCB000FFFFF900FFFF
      F900FFFFF900FFF9F0000095950000FFFF00FFFFFF0000FFFF00676783008383
      8300D5D5D500555567005555670000000000FF00FF00FF00FF00FF00FF005CC1
      62002999190040B54400FF00FF00FF00FF005CC0620019AF2E002FC6640019A5
      1900FF00FF00FF00FF00FF00FF00FF00FF006ECA6D005DC65D007ED07E0068C9
      680043BF4300FFFFFF00FFFFFF00FFFFFF004BC14B0048C14800FFFFFF00FFFF
      FF00FFFFFF0000A500000093000046A345006ECA6D005DC65D007ED07E00FFFF
      FF00FFFFFF00FFFFFF0043BF43004BC14B00FFFFFF00FFFFFF00FFFFFF0030BA
      300000B5000000A500000093000046A3450000000000F0CCB000FFFFFF00FFFF
      FF00FFFFF900FFFFF900FFFFF0000095950000FFFF0067678300D5D5D500D5D5
      D5006767830083838300D5D5D50055556700B6602E00B25D2E00FF00FF00FF00
      FF000000000029991900D0A48D00BA581900CB651900BE6C490025BA4B0024AB
      2600FF00FF00FF00FF00FF00FF00FF00FF0036BB340089D389008ED58E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00009A00000F810D0036BB340089D38900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000AC0000009A00000F810D0000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFF900FFFFF900FFF9F0007E7E7E0095959500FFFFFF006767
      8300D5D5D5009595950083838300D5D5D500D0915500B1532100FF00FF00FF00
      FF005CC162000000000093D59D00CE6A1900C36C210036C9730019AA2300FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF003EBD3D00A5DCA5009CD99C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FCF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000CA20C000F860D003EBD3D00A4DCA400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8FCF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000B00000009E00000F860D0000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF900FFFFF90083838300D5D5D50067678300FFFF
      FF00D5D5D500959595009595950083838300FF00FF00BF523A00B1333200AB3C
      2400A94419009B3E1A00B5541900D36C1900D091550030BE5A0024AB2600FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF007DCF7C00AADEAA00AFE0AF0084D1
      840043BF4300FFFFFF00FFFFFF00FFFFFF004BC14B004BC14B00FFFFFF00FFFF
      FF00FFFFFF0000B2000000A0000046AF45007DCF7C00AADEAA00AFE0AF00FFFF
      FF00FFFFFF00FFFFFF0043BF43004BC14B00FFFFFF00FFFFFF00FFFFFF0041BE
      410030BA300000B2000000A0000046AF450000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF900FFFFF90083838300D5D5D5009595
      9500FFFFFF00D5D5D5009595950095959500FF00FF00CF957300B95D2400D291
      6600E6B29800BB6E3A00CF681900C061190036C9730019AA2300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF006ECA6D0099D89900C3E7C30095D7
      9500FFFFFF00FFFFFF00FFFFFF0043BF430050C25000FFFFFF00FFFFFF00FFFF
      FF0036BC360000B1000000A000006ECA6D006ECA6D0099D89900C3E7C30095D7
      9500FFFFFF00FFFFFF00FFFFFF0043BF430050C25000FFFFFF00FFFFFF00FFFF
      FF0036BC360000B1000000A000006ECA6D0000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF900FFFFF00083838300D5D5
      D50095959500FFFFFF00D5D5D50095959500FF00FF00FF00FF00B85B1D00EED1
      C000FF00FF00BD753200D2681900A8753D002EBF5A0019A61900FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000067C86600C4E7C400FFFF
      FF00FFFFFF00FFFFFF0043BF430043BF4300FFFFFF00FFFFFF00FFFFFF004BC1
      4B002DBA2D0000AE0000069B0000000000000000000067C86600C4E7C400BAE4
      BA0090D59000FFFFFF00FFFFFF00FFFFFF0043BF430059C45900FFFFFF00FFFF
      FF00FFFFFF0000AE0000069B00000000000000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF9F000FFE6D5008383
      8300D5D5D50095959500FFFFFF00D5D5D500FF00FF00FF00FF00D0915500C672
      5300CDA89400DD771A00CB69190072D892002BB43B00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000006ECA6D0097D89700FFFF
      FF00FEFEFE0095D7950084D1840043BF4300FFFFFF00FCFEFC0062C762004BC1
      4B0017B6170000A900006ECA6D0000000000000000006ECA6D0097D89700C7E9
      C700BAE4BA0095D79500FDFEFD00FFFFFF0043BF430068C9680062C76200FBFE
      FB00FFFFFF0000A900006ECA6D000000000000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF9DD00CC957900CC95
      790083838300D5D5D50095959500FFFFFF00FF00FF00FF00FF00F3D3B400BA5E
      2000CE671900F2871900D59B6D003DBA470000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000095D7950097D8
      9700C4E7C400C3E7C300AFE0AF009CD99C008ED58E007ED07E0060C7600033BB
      330000B000006ACA69000000000000000000000000000000000095D7950097D8
      9700C4E7C400C3E7C300AFE0AF009CD99C008ED58E007ED07E0060C7600033BB
      330000B000006ACA6900000000000000000000000000F0CCB000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF9DD00DDA78300F9D5
      C200FAD0A80083838300D5D5D50095959500FF00FF00FF00FF00FF00FF00CB83
      5E00FF991900E17E2700FF00FF0040B64400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000006ECA
      6D0067C8660099D89900AADEAA00A5DCA50089D389005DC65D0036BC360006B3
      00006ECA6D000000000000000000000000000000000000000000000000006ECA
      6D0067C8660099D89900AADEAA00A5DCA50089D389005DC65D0036BC360006B3
      00006ECA6D0000000000000000000000000000000000F0CCB000FFFFFF00FFFF
      FF00FFFFF900FFFFF900FFFFF900FFF9F900FFF9F900F0D5CC00D5A78C00FFDD
      B900CCA7A7000000000083838300D5D5D500FF00FF00FF00FF00FF00FF00D091
      5500E78F3F00D0915500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000006ECA6D007DCF7C003EBD3D0036BB34006ECA6D006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D007DCF7C003EBD3D0036BB34006ECA6D006ECA6D000000
      00000000000000000000000000000000000000000000F9CC9D00F0CCB000F0CC
      B000F0CCB000F0CCB000F0CCB000F0C2B000E6C2B000DDB09500CC9D8300CCA7
      A70000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00D0915500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000518CA8003C627500444C
      4F0055463D005D50480064625D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004099BF0071C7E900299F
      CF000E84B6000F638600204B6000344247004A433E005A4C4400635D58000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1274300B1274300B127
      4300B1274300B1274300B1274300B1274300B1274300B1274300B1274300B127
      4300B127430000000000000000000000000000000000AA595100AA595100AA59
      5100AA595100AA595100AA595100AA595100AA595100AA595100AA595100AA59
      5100AA595100000000000000000000000000000000001080AF00D4F3FF0075DB
      FF0075DBFF006ED7FC0052C8EF0035ABD6001F91BF000B6A91001C5069003745
      4C00635A530000000000000000000000000000000000BA624100BA624100BA62
      4100BA624100BA624100BA624100BA624100BA624100AF5C3D00AF5C3D00AF5C
      3D00AF5C3D00AF5C3D000000000000000000D7A28A00D7A28A00D7A28A00D7A2
      8A00D7A28A00D7A28A00D7A28A00D7A28A00D7A28A00D7A28A00D7A28A00D7A2
      8A00D7A28A00B12743000000000000000000B9726A00C68A8400C68A8400C68A
      8400C68A8400C68A8400C68A8400C68A8400C68A8400C68A8400C68A8400C68A
      8400C68A8400AA5951000000000000000000B1D1DE00399DCC00AFD9E90087E7
      FF0080E6FF0080E6FF0080E6FF0080E6FF0080E6FF0080E6FF0061D4F20029A2
      CC00413F3D00000000000000000000000000C97C5F00C97C5F00C97C5F00C97C
      5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C
      5F00C97C5F00C97C5F00AF5C3D0000000000D7A28A00EFD9CF00EFD9CF00EFD9
      CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFD9CF00EFD9CF00EFD9CF00EFD9
      CF00D7A28A00CC615B00B127430000000000C68A8400FFFFFF00D8FFA2008699
      0000FFFFFF00FFFFFF00E3C5C100E3C5C100AA595100AA595100AA595100EBD7
      D300B9726A00AA5951000000000000000000B1D1DE006FBEE60064AECE00AEF4
      FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF008AF0FF0081E8
      FC00225B74005B4E46000000000000000000C97C5F00E6D8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF8F500FAF8F500F5F1EB00FAF8F500FFFF
      FF00D7A27D00D08C7300C97C5F00AF5C3D00D7A28A00EFD9CF00D7A28A00D7A2
      8A00B1274300B1274300B1274300B1274300D7A28A00D7A28A00D7A28A00EFD9
      CF00D7A28A00CC615B00B127430000000000C68A8400FFFFFF00AA595100AA59
      5100AA595100AA595100C68A8400C68A8400EBD7D3003AE2FA0002EAA500AA59
      5100AA595100AA5951000000000000000000B1D1DE006CC9F100329ACA00D6FD
      FF0094FAFF0094FAFF0094FAFF0094FAFF0094FAFF0094FAFF0094FAFF009AF1
      FF0046ACCC00463C37000000000000000000C97C5F00EBE0D300C97C5F00C97C
      5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C
      5F00D7A27D00D08C7300C97C5F00AF5C3D00D7A28A00EFD9CF00EFD9CF00EFD9
      CF00D7A28A00D7A28A00D7A28A00D7A28A00EFD9CF00EFD9CF00EFD9CF00EFD9
      CF00D7A28A00CC615B00B127430000000000C68A8400FFFFFF00E3C5C100E3C5
      C100E3C5C100B9726A00D1A29C00D9B1AC00F5EBE9003AE2FA0002EAA500CC99
      0000CC990000AA5951000000000000000000B1D1DE0073CCF20046ACDF00C9E9
      F200B4FFFF00A6FFFF00A6FFFF00A6FFFF00A6FFFF00A6FFFF00A6FFFF00A9F2
      FF00B4F2F9001F4F640061565000B4B9B900C97C5F00EBE0D300D7A27D00E4BF
      A700E4BFA700E4BFA700E4BFA700E4BFA700D7A27D00D7A27D00D7A27D00D7A2
      7D00D7A27D00D08C7300C97C5F00BA624100D7A28A00EFD9CF00EFD9CF00EFD9
      CF00EFD9CF00EFD9CF00EFD9CF00EFD9CF00EFD9CF00EFD9CF002D76FF00EFD9
      CF00D7A28A00CC615B00B127430000000000C68A8400FFFFFF00FFFFFF00FFFF
      FF00B9726A00D1A29C00D1A29C00D9B1AC00F0E0DD003AE2FA00A4D90200CC99
      3300FFFFCC00D9B1AC00AA5951000000000084B6CD007ED2F20076DCFF003FA2
      C90080BCD600AFD6E600C1ECF500DFFFFF00C0FFFF00C0FFFF00C0FFFF00BAF2
      FF00D2F2FF0059A2BE004F413B00878C9100C97C5F00E6D8C800E4BFA700E4BF
      A700E4BFA700E4BFA700E4BFA700E4BFA700E4BFA700D7A27D0098FF26008299
      0000D7A27D00D08C7300C97C5F00BA624100D7A28A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1274300B1274300B127
      4300B1274300B1274300B12743000000000000000000C68A8400C68A8400C68A
      8400C68A8400D1A29C00D9B1AC00D1A29C00D1A29C00C68A840098AD0100F0E0
      DD00F0E0DD00FFFFFF00AA5951000000000076AEC700BCEEFF0086ECFF0086EC
      FF0086ECFF0066CCE60056BCD90068B5D200F4FFFF00ECFFFF00D9F2FF00A8CF
      FF003D66FF00B9E2EF002B4560006E6E7C00C97C5F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF8F500FAF8F500F5F1EB00FAF8
      F500FFFFFF00D08C7300C97C5F00BA62410000000000D7A28A00EFD9CF00EFD9
      CF00EFD9CF00EFD9CF00EFD9CF00EFD9CF00CC615B00EFD9CF00CC615B00B127
      4300CC615B00FFFFFF00ECD2C800B1274300000000000000000000000000B972
      6A00F0E0DD00F5EBE900F0E0DD00D9B1AC00C68A8400AA595100C68A8400D9B1
      AC00F5EBE900F0E0DD00EBD7D300AA59510076B4CE00C5F8FF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF007CE2EC004DB9D20050AFCC000A40FF005089
      F9002079FC003059FF00193BA9007374870000000000C97C5F00D7A27D00D7A2
      7D00D7A27D00E7A67E00E9AD8500E8A98000E7A67E00D7A27D00D7A27D00D7A2
      7D00D7A27D00D7A27D00C97C5F00BA6241000000000000000000D7A28A00D7A2
      8A00D7A28A00D7A28A00D7A28A00D7A28A00CC615B00EFD9CF00D7A28A00D7A2
      8A00D7A28A00D7A28A00ECD2C800B1274300000000000000000000000000B972
      6A00D9B1AC00D9B1AC00EBD7D300C68A8400AA595100F1F1F100AA595100C68A
      8400EBD7D300EBD7D300EBD7D300AA59510084B9D000C5EBF50099FFFF0099FF
      FF0099FFFF00C1F6FC00BDEFF900C5FDFF00C0FDFF0073CCFF0056AFFF0000C2
      FF0013D2FF000787E4002F3B7400575B86000000000000000000C97C5F00C97C
      5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C5F00C97C
      5F00C97C5F00C97C5F00C97C5F00000000000000000000000000000000000000
      000000000000000000000000000000000000CC615B00F8EDE900EFD9CF00EFD9
      CF00EFD9CF00ECD2C800ECD2C800B1274300000000000000000000000000B972
      6A00D1A29C00D1A29C0098AD0100CCCC6600C68A8400AA595100C68A8400D1A2
      9C00D9B1AC00EBD7D300EBD7D300AA595100000000004AA0C300ABE5F200DFFF
      FF00DEFFFF0064A7C5005E8A9D005C9AB4005A9DBB002E59E8000059EC0000CC
      FF0030DCFF00039CF300163AD5005B6DBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC615B00CAF0FF00CAF0FF00CAF0
      FF00B3EAFF00B3EAFF00AAE8FF00B12743000000000000000000000000000000
      0000C68A8400CC993300CC996600BFDA0100CCCC6600C68A8400D9B1AC00FFE8
      F900F0E1EC00D9B1AC00AA59510000000000000000000000000086B3C60065A1
      BA0063A8C20096B9C700000000000000000000000000000000002550F7001A74
      EE001089F1000653F7006275C300A2A8BC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC615B00FFFFFF00FFFFFF00FFFF
      FF00CAF0FF00B3EAFF00B3EAFF00B12743000000000000000000000000000000
      0000B9726A00BFDA0100BFDA010098AD0100BFDA010054DEFC00E3C5C100D9B1
      AC00FFE8F900F0E1EC00AA595100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007C97F30098AB
      E4002D54F1007D8CC6008499E100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC615B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B1274300B12743000000000000000000000000000000
      000000000000B9726A0098AD0100BFDA010002EAA50022D5FB00D9B1AC00E3C5
      C100E3C5C100AA59510000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A2B9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC615B00B3EAFF00B3EAFF00B3EA
      FF00B3EAFF00AAE8FF00AAE8FF00B12743000000000000000000000000000000
      00000000000000000000B9726A00B9726A0002EAA50022D5FB00E3C5C100B972
      6A00B9726A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7A28A00D7A28A00D7A2
      8A00D7A28A00D7A28A00D7A28A00000000000000000000000000000000000000
      000000000000000000000000000000000000B9726A00B9726A00B9726A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B1B1
      B100A0A0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009E9E9E00A4A4A4009E9E9E0000000000CEA18600B17E5D00AA76
      5600AA765600AA765600AA765600AA765600AA765600AA765600AA765600A874
      5400AC765700957564009E9E9E0000000000000000009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F00A4A4A4009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E00000000000000000000000000B6413F00E05A
      5A00E05A5A00ADAAA900ADAAA900ADAAA900ADAAA900ADAAA900ADAAA900B641
      3F00B6413F00E05A5A00E05A5A00000000000000000000000000CEA18600B17E
      5D00AA765600AA765600AA765600AA765600AA765600AA765600AA765600AA76
      5600A8745400AC765700957564009E9E9E0000000000E3C8B600FBF8F600FAF8
      F600FAF8F600F9F8F600FAF8F600FAF8F600FAF8F600FAF8F600FAF8F600FBF8
      F600FAF8F600A5836C009E9E9E0000000000CEA18600AA765600AA765600AA76
      5600A8745400AC76570095756400CEA18600AA765600AA765600AA765600A874
      5400AC765700957564009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700E05A5A00A19D9E00CAB3B200F5C4B500FEFDF900EBECF000EFE5E400B641
      3F00B6413F00DE7F7700E05A5A00000000000000000000000000E3C8B600FBF8
      F600FAF8F600FAF8F600F9F8F600FAF8F600FAF8F600FAF8F600FAF8F600FAF8
      F600FBF8F600FAF8F600A5836C009E9E9E0000000000E6CDBD00FFFFFF00FDFF
      FF00FDFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FDFF
      FF00FEFFFF00A5836C009E9E9E0000000000E3C8B600FAF8F600FAF8F600FAF8
      F600FBF8F600FAF8F600A5836C00E3C8B600FAF8F600FAF8F600FAF8F600FBF8
      F600FAF8F600A5836C009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700E05A5A00CAB3B200DE7F7700C89B8300F8D6CE00FEFDF900EBECF000B641
      3F00B6413F00DE7F7700E05A5A00000000000000000000000000E6CDBD00FFFF
      FF00FDFFFF00FDFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFF
      FF00FDFFFF00FEFFFF00A5836C009E9E9E0000000000E7CDBA00FFFFFF00FBFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A7846A009E9E9E0000000000E6CDBD00FCFFFF00FCFFFF00FCFF
      FF00FDFFFF00FEFFFF00A5836C00E6CDBD00FCFFFF00FCFFFF00FCFFFF00FDFF
      FF00FEFFFF00A5836C009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700E05A5A00D3C6C000E05A5A00B3887C00B4B5B500DDD6D000FEFDF900B641
      3F00B6413F00DE7F7700E05A5A000000000000000000B1B1B100E7CDBA00FFFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A7846A009E9E9E0000000000F2D5B700FFFFFF00FFFF
      FF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FFFF
      FF00FFFFFF00B28A65009E9E9E0000000000E7CDBA00FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A7846A00E7CDBA00FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A7846A009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700E05A5A00D3C6C000C39B9400CAB3B200ADAAA900B4B5B500D8CECF00B641
      3F00B6413F00DE7F7700E05A5A0000000000CEA18600B17E5D00E9CFB800FFFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A9866A009E9E9E0000000000E9CAA400EDE9E300ECE7
      DD00EDE7DE00EDE7DE00EDE7DE00ECE7DE00ECE7DE00EBE5DB00EBE5DB00EEE6
      D900F2E5D000B69B7F009E9E9E0000000000E9CFB800FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A9866A00E9CFB800FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A9866A009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700DE7F7700DE7F7700DE7F7700DE7F7700DE7F7700DE7F7700DE7F7700DE7F
      7700DE7F7700DE7F7700E05A5A0000000000E3C8B600FBF8F600EBD0B700FFFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FCFFFE00AB876A009E9E9E0000000000D08B2400D0882800D087
      2300D0882300D0882300D0882400D0872300D0872100D89A4A00DA953F00C992
      5B009D7C7700C5B19A009E9E9E0000000000EBD0B700FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FCFFFE00AB876A00EBD0B700FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FCFFFE00AB876A009E9E9E000000000000000000BF927D00DE7F7700DE7F
      7700CF8D8E00CF8D8E00CF8D8E00CF8D8E00CF8D8E00CF8D8E00CF8D8E00CF8D
      8E00DE7F7700DE7F7700E05A5A0000000000E6CDBD00FFFFFF00EED2B400FFFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FCFFFF00FEFFFD00AF8B69009E9E9E0000000000E9B66E00EDB15A00EEAF
      5300EEAE5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE4C00EBAF
      5800DDA66300EBAF58009E9E9E0000000000EED2B400FBFFFF00FBFFFF00FCFF
      FF00FCFFFF00FEFFFD00AF8B6900EED2B400FBFFFF00FBFFFF00FCFFFF00FCFF
      FF00FEFFFD00AF8B69009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000E7CDBA00FFFFFF00F2D5B700FFFF
      FF00FFFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFF
      FF00FFFFFF00FFFFFF00B28A65009E9E9E0000000000CEA18600B17E5D00AA76
      5600AA765600AA765600AA765600AA765600AA765600AA765600AA765600A874
      5400AC765700957564009E9E9E0000000000E7CDBA00FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A7846A00E7CDBA00FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A7846A009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00C1C2C500C1C2C500C1C2C500C1C2C500C1C2C500C1C2C500FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000E9CFB800FFFFFF00E9CAA400EDE9
      E300ECE7DD00EDE7DE00EDE7DE00EDE7DE00ECE7DE00ECE7DE00EBE5DB00EBE5
      DB00EEE6D900F2E5D000B69B7F009E9E9E0000000000E3C8B600FBF8F600FAF8
      F600FAF8F600F9F8F600FAF8F600FAF8F600FAF8F600FAF8F600FAF8F600FBF8
      F600FAF8F600A5836C009E9E9E0000000000E9CFB800FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FDFFFE00A9866A00E9CFB800FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A9866A009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000EBD0B700FFFFFF00D08B2400D088
      2800D0872300D0882300D0882300D0882400D0872300D0872100D89A4A00DA95
      3F00C9925B009D7C7700C5B19A009E9E9E0000000000E6CDBD00FFFFFF00FDFF
      FF00FDFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FCFFFF00FDFF
      FF00FEFFFF00A5836C009E9E9E0000000000EBD0B700FBFFFF00FBFFFF00FBFF
      FF00FCFFFF00FCFFFE00AB876A00EBD0B700FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FCFFFE00AB876A009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00C0BCBB00C0C0C000C1C2C500C1C2C500C1C2C500C1C2C500FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000EED2B400FFFFFF00E9B66E00EDB1
      5A00EEAF5300EEAE5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE
      4C00EBAF5800DDA66300EBAF58000000000000000000E7CDBA00FFFFFF00FBFF
      FF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FBFFFF00FCFF
      FF00FDFFFE00A7846A009E9E9E0000000000EED2B400FBFFFF00FBFFFF00FCFF
      FF00FCFFFF00FEFFFD00AF8B6900EED2B400FBFFFF00FBFFFF00FCFFFF00FCFF
      FF00FEFFFD00AF8B69009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000F2D5B700FFFFFF00FFFFFF00FEFF
      FF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FFFFFF00FFFF
      FF00B28A65009E9E9E00000000000000000000000000F2D5B700FFFFFF00FFFF
      FF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FEFFFF00FFFF
      FF00FFFFFF00B28A65009E9E9E0000000000F2D5B700FEFFFF00FEFFFF00FEFF
      FF00FFFFFF00FFFFFF00B28A6500F2D5B700FEFFFF00FEFFFF00FEFFFF00FFFF
      FF00FFFFFF00B28A65009E9E9E000000000000000000BF927D00DE7F7700CF8D
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CF8D8E00DE7F7700E05A5A0000000000E9CAA400EDE9E300ECE7DD00EDE7
      DE00EDE7DE00EDE7DE00ECE7DE00ECE7DE00EBE5DB00EBE5DB00EEE6D900F2E5
      D000B69B7F009E9E9E00000000000000000000000000E9CAA400EDE9E300ECE7
      DD00EDE7DE00EDE7DE00EDE7DE00ECE7DE00ECE7DE00EBE5DB00EBE5DB00EEE6
      D900F2E5D000B69B7F009E9E9E0000000000E9CAA400ECE7DE00EBE5DB00EBE5
      DB00EEE6D900F2E5D000B69B7F00E9CAA400ECE7DE00EBE5DB00EBE5DB00EEE6
      D900F2E5D000B69B7F009E9E9E000000000000000000BF927D00B6413F00CF8D
      8E00ADAAA900ADAAA900ADAAA900ADAAA900ADAAA900ADAAA900ADAAA900ADAA
      A900CF8D8E00B6413F000000000000000000D08B2400D0882800D0872300D088
      2300D0882300D0882400D0872300D0872100D89A4A00DA953F00C9925B009D7C
      7700C5B19A009E9E9E00000000000000000000000000D08B2400D0882800D087
      2300D0882300D0882300D0882400D0872300D0872100D89A4A00DA953F00C992
      5B009D7C7700C5B19A009E9E9E0000000000D08B2400D0872100D89A4A00DA95
      3F00C9925B009D7C7700C5B19A00D08B2400D0872100D89A4A00DA953F00C992
      5B009D7C7700C5B19A009E9E9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9B66E00EDB15A00EEAF5300EEAE
      5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE4C00EBAF5800DDA6
      6300EBAF580000000000000000000000000000000000E9B66E00EDB15A00EEAF
      5300EEAE5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE4C00EBAF
      5800DDA66300EBAF58000000000000000000E9B66E00ECAA4500EEAD4D00F0AE
      4C00EBAF5800DDA66300EBAF5800E9B66E00ECAA4500EEAD4D00F0AE4C00EBAF
      5800DDA66300EBAF58000000000000000000000000000D91C7002B9DCE002DA4
      D500239FD30030A6CF0033ABDB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D98CA0066C0DE0088DE
      FF0068D5FC0056C7F10047BCE70030AAD60033ABDB0019A3D4000094CA00179B
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000333333003333330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF8B5300FF8B5300FF8B5300FF8B5300FC883A00FC88
      3A00F9851C00F9851C00F9851C0000000000000000001496CB002EA9D8009BE8
      FD0077E3FF0077E3FF0077E3FF0042A666001B92290060D0F00059CBEC004BBF
      E7000094CA000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000466FC000466FC000466FC000466
      FC000466FC000466FC000466FC000466FC000466FC000462F4000462F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF956200FFFFFF00FFC0A200FF8B5300FF8B5300FF8B
      5300FF9B6A00FFFFFF00FC883A0000000000000000001D9BD0003EB3E4009CE7
      F70086F0FF0081EFFF0081EFFF007AE7ED0048BA5F0041B3540081EFFF0074E0
      FE000094CA000000000000000000000000000000000000000000000000000000
      00000000000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00333333000000
      0000000000000000000000000000000000000486FC000486FC0034A6FC0034A6
      FC0034A6FC0034A6FC002C9EFC002C9EFC002C9EFC002C9EFC002C9EFC000466
      FC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF956200FF8B5300FFFFFF00FFC0A200FF8B5300FF9F
      7100FFFFFF00FF9B6A00FC883A00000000000000000026A1D50053BDEC00A1DE
      F00097FAFF008BFAFF008BFAFF008BFAFF007ED1BA005AFC8E0041B3540077DC
      F40097EEF6000094CA0000000000000000000000000000000000000000000000
      000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300000000000000000000000000000000000486FC0084DEFC000486FC0044AA
      FC0034A6FC0034A6FC0034A6FC0034A6FC0034A6FC002C9EFC002C9EFC002C9E
      FC000466FC0000000000000000000000000000000000915B5B00915B5B00915B
      5B008A5858008A585800FF9F7100FF9F7100FF9F7100FFFFFF00FFC0A200FFFF
      FF00FF9F7100FF8B5300FF8B530000000000000000002EA6D8005BC4F40026AE
      DB00B4F9FC00A8FFFF00A3FFFF009BFFFF0091F8F1004ABF670053F1830033A3
      4500B3F2F7000094CA0000000000000000000000000000000000000000003333
      3300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00333333000000000000000000000000000486FC00CCF6FC0084DEFC000486
      FC0044AAFC0044AAFC0044AAFC0034A6FC0034A6FC0034A6FC0034A6FC0034A6
      FC002C9EFC000466FC00000000000000000000000000E0B57A00FAF5F500FCFA
      FA00FCFAFA00FCFAFA00FF9F7100FF8B5300FF8B5300FFAE8800FFFFFF00FFC0
      A200FF8B5300FF8B5300FF8B5300000000000000000037ACDB0072D6FC0026AE
      DB0026AEDB0026AEDB0026AEDB00B3EEF600A1F8F1004BCF6F004AE5780053BB
      7100D2FAF8000094CA0000000000000000000000000000000000000000000000
      0000333333003333330033333300EEEEEE00EEEEEE0033333300333333003333
      3300000000000000000000000000000000000486FC00CCF6FC0084DEFC0084DE
      FC000486FC0044AAFC0044AAFC0044AAFC0044AAFC0044AAFC0044AAFC0034A6
      FC0034A6FC0034A6FC000466FC000000000000000000E0B57A00FCFAFA00FFFF
      FF00FFFFFF00FFFFFF00FF9F7100FF8B5300FFC0A200FFFFFF00FFAE8800FFFF
      FF00FFC0A200FF8B5300FF8B5300000000000000000041B3DE0084E7FF0075E4
      FC006EDFF8006EDEF80065D8F30026AEDB00C2EDEB0045C968004BE97D0042BF
      5D00ECFAF700B5E2F00033ABDB00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000486FC00CCF6FC00CCF6FC0084DE
      FC0084DEFC000486FC000486FC000486FC000486FC000486FC000486FC000486
      FC000486FC000486FC000486FC000486FC0000000000E0B57A00FAF5F500FCFA
      FA00FCFAFA00FCFAFA00FFAC8400FFC6AA00FFFFFF00FFC0A200FF8B5300FF9F
      7100FFFFFF00FFC0A200FF956200000000000000000047BAE1008EFCFF008EFC
      FF008EFCFF008EFCFF008FFCFF0088F8FC0026AEDB0043C96A0042E074003EBD
      5A009ED6E400BAE0F00033ABDB00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000486FC00CCF6FC00CCF6FC00CCF6
      FC0084DEFC0084DEFC0084DEFC0084DEFC0084DEFC0084DEFC000466FC000000
      00000000000000000000000000000000000000000000E0B57A00FAF5F500FCFA
      FA00FCFAFA00FCFAFA00FFAC8400FFFFFF00FFC6AA00FF8B5300FF8B5300FF8B
      5300FF9F7100FFFFFF00FF956200000000000000000051BBE200A2FDFF008FFF
      FF0090FFFF009FFAFC0089E7F4006FDFF00065D6BD0042C86A003AD86D003BBB
      590033ABDB0033ABDB0033ABDB00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000486FC00CCF6FC00CCF6FC00CCF6
      FC00CCF6FC00CCF6FC00CCF6FC00CCF6FC00CCF6FC0084DEFC000466FC000000
      00000000000000000000000000000000000000000000E0B57A00FCFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFAC8400FFAC8400FFAC8400FF9F7100FF9F7100FF9F
      7100FF9F7100FF9F7100FF9F710000000000000000004DB3DD00B3EEF600C1FD
      FE00B0FBF900068B06002B9A2D0061A862002BA752004FD57E004CD87E003FBB
      5D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000486FC00CCF6FC00CCF6FC00CCF6
      FC000466FC000486FC000486FC000486FC000486FC000486FC000486FC000000
      00000000000000000000000000000000000000000000E0B57A00FAF5F500FCFA
      FA00FCFAFA00FCFAFA00FCFAFA00FCFAFA00FCFAFA00FCFAFA00FFF1E300FFF1
      E300FFE9D200915B5B000000000000000000000000000000000054B7DF0061BD
      E2005BBCDC0052A9570030B542003EBE54003FC6630050D67D0057DB89004BCA
      7500659373006185670000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      000000000000000000000000000000000000000000000486FC000486FC000486
      FC00000000000000000000000000000000000000000000000000000000000000
      00000462F4000462F4000462F4000000000000000000E7C59600FFAE8800FFAE
      8800FF9F7100FF9F7100FF9F7100FF9F7100FF9F7100FF8B5300FF8B5300FF8B
      5300FF8B53009F706B0000000000000000000000000000000000000000000000
      000000000000000000004A9B51002EC146003ACA590046D06D004FD57B0052D4
      81004FBA6D000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000462F4000462F4000000000000000000E7C59600FFC0A200FFAE
      8800FFAE8800FFAE8800FF9F7100FF9F7100FF9F7100FF9F7100FF9F7100FF8B
      5300FFF1E3009F706B0000000000000000000000000000000000000000000000
      00000000000000000000000000002DB33A0030C448003AC85A003EC15D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000333333003333330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000462F40000000000000000000000
      00000462F400000000000462F4000000000000000000E7C59600E7C59600E7C5
      9600E7C59600E0B57A00E0B57A00E0B57A00E0B57A00E0B57A00E0B57A00E0B5
      7A00E0B57A00E0B57A0000000000000000000000000000000000000000000000
      0000000000000000000000000000688D6A001FB6300033AF4100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000462F4000462F4000462
      F400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005B875C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B3009999990099999900999999009999990099999900999999009999
      99009999990099999900999999009999990000000000EDD3BE00EFD7C400F0D7
      C400F0D7C400F0D7C300F0D6C300F0D6C200F0D6C100F0D5C100F0D5C100F0D5
      C100F0D4C000D8ACA20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008758
      5800875858008758580087585800875858008758580087585800875858008758
      58008758580087585800875858009999990000000000EED6C400FAF1E900FFF4
      E800FFF2E500FFF0E100FFEEDE00FFEDDB00FFEBD800FFEAD500FFE9D300FFE9
      D100FFE0CB00DAAEA30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0D89D00C5A26E00D9A5
      7D00FCD7C800D6BAA400D6BAA400EBC4B400FCD7C800FCD7C800FCD7C800FCD7
      C800FCD7C800FDCDAC00875858009999990000000000EED6C400FAF3EC00FFF5
      EB00FFF4E900FFF2E500FFF0E100FFEEDE00FFEDDB00FFEBD800FFEBD700FFE9
      D300FFE1CD00DAAEA40000000000000000000000000000000000B1B1B100A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E000000000000000000000000001476FC001476
      FC001476FC001476FC001476FC001476FC001476FC001476FC000466FC000466
      FC000466FC000462F4000462F40000000000F0CD820096837D0000000000B889
      4A008E5D3200614125006141250061412500876C4900D6BAA400FBCABC00FCD7
      C800FCD7C800FDCDAC00875858009999990000000000EED6C400FAF4EF00FFF6
      EE00FFF5EB00FFF4E900FFF2E500FFF0E100FFEEDE00FFEEDC00FFEDDB00FFEB
      D700FFE2D000DAAEA400000000000000000000000000CEA18600B17E5D00AA76
      5600AA765600AA765600AA765600AA765600AA765600AA765600AA765600A874
      5400AC765700957564009E9E9E000000000000000000000000001476FC00CCF6
      FC0064CAFC0034BAFC0034BAFC0034BAFC0034BAFC0034BAFC0034BAFC0034A6
      FC0034A6FC001476FC000466FC0000000000B8894A00C9AFA000C2B6AB00AF72
      2F00DF9D3D00ED963300F9AA4100E9C36D00E9C36D0061412500C9AFA000FCDB
      BC00F9E2BF00FDCDAC00875858009999990000000000EED7C500FAF6F200FFF8
      F200FFF6EE00FFF5EB00FFF4E900FFF2E500FFF0E100FFEEDF00FFEEDD00FFED
      DB00FFE4D300DAAEA500000000000000000000000000E3C8B600FBF8F600FAF8
      F600FAF8F600F9F8F600FAF8F600FAF8F600FAF8F600FAF8F600FAF8F600FBF8
      F600FAF8F600A5836C009E9E9E0000000000000000001476FC00CCF6FC007CD2
      FC007CD2FC0064CAFC0064CAFC0034BAFC0034BAFC0034BAFC0034BAFC0034BA
      FC0034A6FC001476FC001476FC0000000000B8894A00DF9D3D00AA784200ED96
      3300ED963300AF722F00E3C5A600CB873200CB873200CB873200876C4900FBCA
      BC00F9E2BF00FDCDAC00875858009999990000000000EFD7C500FBF8F500FFFA
      F500FFF8F200FFF6EF00FFF5EB00FFF4E900FFF2E500FFF1E200FFF0E100FFEE
      DE00FFE5D500DAAFA500000000000000000000000000E6CDBD00FFFFFF00FDFF
      FF008A9FF5002361FD008C9EF200FBFFFF00C1C1E7004873F9006382F400FDFF
      FF00FEFFFF00A5836C009E9E9E0000000000000000001476FC00CCF6FC007CD2
      FC007CD2FC007CD2FC007CD2FC0064CAFC0064CAFC0034BAFC0034BAFC0034BA
      FC0034BAFC000492FC001476FC0000000000D6BAA400DBB76E00E3AC3000E49A
      280099601E00E3C5A600FDE4CE00FDE4CE00FDE4CE00FDE4CE00FDE4CE00E3C5
      A600FDE4CE00FDCDAC00875858009999990000000000EFD7C600FCFAF800FFFC
      F800FFFAF500FFF8F200FFF7EF00FFF5EB00FFF4E900FFF3E700FFF2E500FFF0
      E100FFE6D800DAAFA500000000000000000000000000E7CDBA00FFFFFF00FBFF
      FF004875FC000658FF002463FD006987F6004B75FA000658FF003469FB00FCFF
      FF00FDFFFE00A7846A009E9E9E00000000001476FC00CCF6FC0084DEFC0084DE
      FC007CD2FC007CD2FC007CD2FC007CD2FC007CD2FC0064CAFC0034BAFC0034BA
      FC000492FC0054C2FC001476FC000000000000000000C7AE7F00F9C04B00E49A
      280099601E0099601E0099601E0099601E0099601E0099601E0087644000FBCA
      BC00FDE4D700FDCDAC009A6B67009999990000000000EFD8C600FCFCFB00FFFD
      FC00FFFCF800FFFAF600FFF8F200FFF6EF00FFF5EB00FFF4E900FFF4E800FFF2
      E500FFE8DB00DAAFA600000000000000000000000000E9CFB800FFFFFF00FBFF
      FF00C4CAF2005C82FA00125BFF000658FF000658FF003A6CFB00A7AFEC00FCFF
      FF00FDFFFE00A9866A009E9E9E00000000001476FC00CCF6FC0084DEFC0084DE
      FC0084DEFC0084DEFC007CD2FC007CD2FC007CD2FC007CD2FC0064CAFC0064CA
      FC000492FC0064D2FC001476FC0000000000BC95590000000000C7AE7F00E3B1
      3900CB873200E3A64E00E3A64E00D6903300ED963300F9AA4100AA784200FBCA
      BC00FDEDDF00FBCABC009A6B67009999990000000000EFD8C700FCFCFC00FFFF
      FE00FFFDFC00FFFCF800FFFAF600FFF8F200FFF6EE00FFF6EC00FFF5EB00FFF4
      E800FFE8DD00DAAFA600000000000000000000000000EBD0B700FFFFFF00FBFF
      FF00FBFFFF009EAFF600145CFE000658FF000658FF00577DF800FBFFFF00FCFF
      FF00FCFFFE00AB876A009E9E9E00000000000492FC000492FC000492FC000492
      FC000492FC000492FC000492FC000492FC000492FC000492FC000492FC000492
      FC0054C2FC0064D2FC001476FC0000000000D6BAA400BC95590000000000C7AE
      7F009E791F00E3C5A600FFFFFF00AF852200F9AA4100D6903300B3937400FCE9
      DC00FCF2E700FBCABC009A6B67009999990000000000EFD8C700FCFCFC00FFFF
      FF00FFFFFE00FFFDFC00FFFCF800FFFAF500FFF8F200FFF7EF00FFF6EE00FFF5
      EB00FFE6DB00DAAEA600000000000000000000000000EED2B400FFFFFF00FBFF
      FF00C3CBF600507AFC000658FF000658FF000658FF002463FD008C9EF200FCFF
      FF00FEFFFD00AF8B69009E9E9E0000000000000000000492FC00CCF6FC008CE2
      FC008CE2FC008CE2FC008CE2FC0084DEFC0084DEFC0084DEFC0084DEFC0084DE
      FC0084DEFC0084DEFC001476FC000000000000000000D6BAA400BC955900F6E9
      CB00DCAA2B00BD8C2400BD8C2400E49A2800EBA22F00AD814B00FFFFFF00FEF5
      E800FEF5E800FBCABC008D7B77009999990000000000EFD8C700FDFDFD00FFFF
      FF00FFFFFF00FFFEFE00FFFCFA00FFFBF800FFFAF400FFF8F100FFF6ED00FEE7
      DF00FED3CD00DAABA300000000000000000000000000F2D5B700FFFFFF00FFFF
      FF004876FD000658FF003A6DFC008EA3F7006688FA000F5BFF002361FD00FFFF
      FF00FFFFFF00B28A65009E9E9E0000000000000000000492FC00DCFEFC00CCF6
      FC008CE2FC008CE2FC008CE2FC008CE2FC008CE2FC008CE2FC00E4FAFC00E4FA
      FC00CCF6FC00CCF6FC001476FC00000000000000000000000000D6BAA400BC95
      5900F2DDAC00FFF26B00FECB3D00E6B54000BC955900FFFFFF00E9C36D00FDED
      DF00FCF9F400FBCABC00AC8078009999990000000000EFD8C700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFEFE00FFFCFA00FFFBF800FCF4EE00F1DBD200EBC2
      B800EBB6AF00D5A79E00000000000000000000000000E9CAA400EDE9E300ECE7
      DD008AA3FC00346BFE00A7B6F700F1E1F100D8D8F1006184FA006687F800EEE6
      D900F2E5D000B69B7F009E9E9E0000000000000000000492FC00ECF6F400DCFE
      FC00DCFEFC00CCF6FC00CCF6FC008CE2FC00E4FAFC001476FC000492FC000492
      FC000492FC000492FC000492FC0000000000000000000000000000000000DAA9
      8700BC955900BC955900BC955900BC955900BC955900FFFFFF00E6B540009A6B
      67009A6B67009A6B6700AC8078000000000000000000EFD8C700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFCFA00F0E3DE00D6B2A000DEB2
      8F00D9AB8B00D3AC9B00000000000000000000000000D08B2400D0882800D087
      2300D0882300D0882300D0882400D0872300D0872100D89A4A00DA953F00C992
      5B009D7C7700C5B19A009E9E9E000000000000000000000000000492FC00ECF6
      F400F4F6F400F4F6F400DCFEFC00E4FAFC001476FC0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DAA9
      8700FFFFFF00FFFFFF00FCF2E700EBD5BD00D0B48200D0B48200EBD5BD00AC80
      7800FBCABC00DF9D3D00B3B3B3000000000000000000EFD8C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00EFE3DF00E0BDA400F3CA
      9500E8BE9400E5D0C200000000000000000000000000E9B66E00EDB15A00EEAF
      5300EEAE5000EEAF4D00EEAD4F00EEAF5200ECAA4500EEAD4D00F0AE4C00EBAF
      5800DDA66300EBAF580000000000000000000000000000000000000000000492
      FC000492FC000492FC000492FC001476FC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DAA9
      8700FFFEFD00FFFEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AC80
      7800C5A26E00B3B3B300000000000000000000000000EFD8C600FEFAF800FCFA
      F700FCF9F600FAF8F500FAF7F400F9F6F300F8F4F100EADCD600DDBCA800EACD
      B200E9D8CA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DAA9
      8700DAA98700DAA98700DAA98700DAA98700DAA98700DAA98700D9A57D00AC80
      7800B3B3B30000000000000000000000000000000000F2D3B800F0D8C700EFD8
      C600EED6C500EED5C400ECD4C300EBD3C200EAD2C100E0C4B300DAB7A600EBDA
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000706CF6004844DD00170DB700170DB0004844CE00706CF6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000706C
      F6001B00D6000000D8000000D8000000D6000000D0000000C7000000B6001C00
      A900706CF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300333333003333330033333300333333003333
      3300333333003333330000000000000000000000000099999900999999008686
      8600868686008686860086868600868686008686860086868600868686008686
      86008686860086868600838383000000000000000000000000006C68F6000000
      E4000000EB000000EE000000F0000000EE000000E9000000E0000000D2000000
      C2000000A9005C58D5000000000000000000000000000000000000000000AFAA
      AA00B48FC1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00333333000000000000000000000000001D81B3001D81B300187D
      AF00187DAF001277A9001277A9000C72A4000C72A400066C9E00066C9E00066C
      9E000267990002679900868686008686860000000000706CF6000000EE001717
      F4002D2DF4003636F4003030F4002929F4001F1FF4000000F4000000EB000000
      DA000000C7000000A900706CF60000000000000000000000000000000000649F
      E200649FE200CD98C000E0BAA800E1917D00DD8D7500C27E6300827B78000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333333003333330033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000002085B70067CBFE002085B70099FF
      FE006FD3FF006FD3FF006FD3FF006FD3FF006FD3FF006FD3FF006FD3FF006FD3
      FF003AA0D20099FFFE000267990086868600000000001800F3003333F4004B4B
      F500FFFFFF00FFFFFF004141F5003E3EF5003939F5003030F400FFFFFF00FFFF
      FF000000DA000000C2001C00A90000000000000000000000000000000000DC93
      4B00B496C300649FE200B496C300D09B8E00CA734A00D7846800DB8970009965
      4200000000000000000000000000000000000000000000000000000000000000
      000033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000002389BC0067CBFE00298DBF0099FF
      FE007CE0FE006FD3FF007CE0FE006FD3FF007CE0FE006FD3FF007CE0FE007CE0
      FE0044A8DB0099FFFE000267990086868600706CF6003636F4006060F6006262
      F600FFFFFF00FFFFFF00FFFFFF004848F5004646F500FFFFFF00FFFFFF00FFFF
      FF000000EB000000D2000000B600706CF6000000000000000000CA7B2800B95C
      0000B95C0000B48FC100649FE200B496C300C27E6300C27E6300DBA99700D09B
      8E00827B78000000000000000000000000000000000000000000333333003333
      330033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00333333000000000000000000298DBF0067CBFE002D91C40099FF
      FE0086EBFE0086EBFE0086EBFE0086EBFE0086EBFE0086EBFE0086EBFE0086EB
      FE004EB2E50099FFFE00066C9E0086868600706CF6005D5DF6007E7EF7006868
      F6005959F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003030
      F4000000F4000000E0000000C7004844CE0000000000DC934B00BD620000C66E
      0000D07C0000BA98000053D98400AFAAAA00E2CDBE00FEF6D000FFFFDF00FFFF
      E500E6D8C100000000000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00333333000000000000000000298DBF0067CBFE003398CA0099FF
      FE0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7FF0091F7
      FF0057BBEE0099FFFE00066C9E00868686003B33F4008989F8008E8EF8006E6E
      F6005B5BF6005050F600FFFFFF00FFFFFF00FFFFFF00FFFFFF004646F5003939
      F5001F1FF4000000E9000000D000170DB00000000000DC934B00CF7A0000DB8A
      0000DD8E000061A1000000A40000CDB4AA00FFFAD700FFFAD700FFFFED00FFFE
      FC00FFFFFC00CDB4AA000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000002D91C4006FD3FF003398CA0099FF
      FE0099FFFE0091F7FF0099FFFE0091F7FF0099FFFE0091F7FF0099FFFE0099FF
      FE0060C4F70099FFFE00066C9E0086868600403CF500A5A5F9009C9CF8007676
      F7006060F6005252F600FFFFFF00FFFFFF00FFFFFF00FFFFFF004848F5003E3E
      F5002929F4000000EE000000D600170DB70000000000DC934B00DB8A0000C9A3
      0F0099A6060048B621007ABB3600F2E7D000FFE9C400FFFAD700FFFFEA00FFFF
      F600FFFFEA00F2E7D0009494940000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000003094C7007CE0FE002D91C400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0081E6FE00FFFFFF000C72A400999999007F7BF600AAAAF900AFAFFA008484
      F8006868F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004141
      F5003030F4000000F0000000D8004844DD0000000000E2A03E00E09E060048B6
      21004CC44C004CC44C00EEBA3300F2E7D000FFEDCD00FEF6D000FFFFDF00FFFF
      E500F8FDDD00EFDDC300AFAAAA0000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300333333003333330033333300333333003333
      3300333333003333330000000000000000003094C70086EBFE0081E6FE002D91
      C4002D91C4002D91C4002D91C4002D91C4002D91C400298DBF002389BC002085
      B7001D81B3001D81B3001D81B30000000000706CF6009999F800C3C3FA009595
      F800FFFFFF00FFFFFF00FFFFFF005252F6005050F600FFFFFF00FFFFFF00FFFF
      FF003636F4000000EF000000D800706CF60000000000E7AC5400C9A30F0037C9
      580050D57A0062D8840099D37B00EFDDC300FFFEFC00FFEFD200FFF2CF00FFEE
      CA00FFF8D400E0BAA8000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300000000000000000000000000000000003398CA0091F7FF008EF3FE008EF3
      FE008EF3FE008EF3FE008EF3FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00187DAF00868686000000000000000000000000006965F600C4C4FA00BABA
      FA00FFFFFF00FFFFFF006868F6006060F6005B5BF6005959F600FFFFFF00FFFF
      FF002D2DF4000000EB001B00D6000000000000000000E7AC54004CC44C0050D5
      7A0082E39E00A4EEB50093E9AC00EED1A600F3ECD500FFFFF200F8F4DD00FEF6
      D000F2D5B800CD98C0000000000000000000000000000000000033333300EEEE
      EE00333333003333330033333300333333003333330033333300333333003333
      3300000000000000000000000000000000003398CA00FFFFFF0099FFFE0091F7
      FF0091F7FF0099FFFE00FFFFFF002389BC002085B7002085B7001D81B3001D81
      B300187DAF0000000000000000000000000000000000706CF6009797F800C7C7
      FA00BABAFA009595F8008484F8007676F7006E6EF6006868F6006262F6004B4B
      F5001717F4000000E400706CF60000000000000000000000000062D8840068DF
      9300A4EEB500C4F6CA00C4F6CA0099E6A5007BD37600D7B37A00E8C68800B1AC
      9100CDB4AA00000000000000000000000000000000000000000033333300EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE0033333300000000000000
      000000000000000000000000000000000000000000003398CA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00298DBF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009595F8009797
      F800C4C4FA00C3C3FA00AFAFFA009C9CF8008E8EF8007E7EF7006060F6003333
      F4000000EE006C68F600000000000000000000000000000000000000000099E6
      A500A4EEB500C4F6CA00C5F0BA0076E29B0046D16E00C9A30F00E99D1200E7B9
      6A00000000000000000000000000000000000000000000000000333333003333
      3300333333003333330033333300333333003333330033333300000000000000
      00000000000000000000000000000000000000000000000000003398CA003398
      CA003094C7003094C70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000706C
      F6006965F6009999F800AAAAF900A5A5F9008989F8005D5DF6003636F4001800
      F300706CF6000000000000000000000000000000000000000000000000000000
      000000000000B1E49F0084E6A4007BD3760046D16E00E1B25A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000706CF6007F7BF600403CF5003B33F400706CF600706CF6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D0046AF45000F860D000F810D0046A345006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D0046AF45000F860D000F810D0046A345006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E2E200DBC5BD00D5C2BE00D7CAC9000000000000000000000000000000
      00000000000000000000000000000000000000000000EDD3BE00EFD7C400F0D7
      C400F0D7C400F0D7C300F0D6C300F0D6C200F0D6C100F0D5C100F0D5C100F0D5
      C100F0D4C000D8ACA20000000000000000000000000000000000000000006ECA
      6D00069B000000A0000000A00000009E0000009A000000930000008700000676
      00006ECA6D000000000000000000000000000000000000000000000000006ECA
      6D00069B000000A0000000A00000009E0000009A000000930000008700000676
      00006ECA6D00000000000000000000000000000000000000000000000000E5E2
      E000E3C1AB00F1D1B200F4EBDE00F0E3D500E9D6C900D7B9B500D9BEC100E0D1
      D100E0DBDB0000000000000000000000000000000000EED6C400FAF1E900FFF4
      E800FFF2E500FFF0E100FFEEDE00FFEDDB00FFEBD800FFEAD500FFE9D300FFE9
      D100FFE0CB00DAAEA300000000000000000000000000000000006ACA690000A9
      000000AE000000B0000000B2000000B0000000AC000000A50000009B0000008F
      0000007D00005AAD5900000000000000000000000000000000006ACA690000A9
      000000AE000000B0000000B2000000B0000000AC000000A50000009B0000008F
      0000007D00005AAD590000000000000000000000000000000000E6DDDB00E9CE
      B700F2D3AE00F4D7B600F6EEE300F4EBDD00F3E9D800CDAEA900C59C9C00D2B0
      A900E4D2BD00DBC7B700D2BFBA000000000000000000EED6C400FAF3EC00FFF5
      EB00FFF4E900FFF2E500FFF0E100FFEEDE00FFEDDB00FFEBD800FFEBD700FFE9
      D300FFE1CD00DAAEA4000000000000000000000000006ECA6D0000B0000017B6
      17002DBA2D0036BC360030BA3000FFFFFF00FFFFFF0000B5000000AE000000A1
      000000930000007D00006ECA6D0000000000000000006ECA6D0000B0000017B6
      17002DBA2D0036BC360030BA3000FFFFFF00FFFFFF0000B5000000AE000000A1
      000000930000007D00006ECA6D000000000000000000E7DDD800EFD6BA00F6DD
      B700F4D8B300F4DBBB00F8F2E900F6EFE400F4EBDD00C7A6A100B68D8D00C9A8
      A100EFE0C700EEDEC100DAC4B3000000000000000000EED6C400FAF4EF00FFF6
      EE00FFF5EB0006B50600B8D89E0079C7650088CA6F00C2D69B00FFEDDB00FFEB
      D700FFE2D000DAAEA40000000000000000000000000006B3000033BB33004BC1
      4B004BC14B0043BF4300FFFFFF00FFFFFF00FFFFFF0030BA30001BB71B0000B0
      000000A10000008F000006760000000000000000000006B3000033BB33004BC1
      4B004BC14B0043BF430041BE4100FFFFFF00FFFFFF00FFFFFF001BB71B0000B0
      000000A10000008F0000067600000000000000000000EDD6C000F8E4C000F6E1
      BB00F6DCB600F6DFC000F9F4EE00F8F1E900F6EEE200C7A7A300B58B8B00C6A6
      9F00F0E3CC00EEE0C600DAC5B6000000000000000000EED7C500FAF6F200FFF8
      F200FFF6EE0006B5060023B8210012B60F0029B9240034BA2B00C2D69B00FFED
      DB00FFE4D300DAAEA50000000000000000006ECA6D0036BC360060C7600062C7
      620054C45400FFFFFF00FFFFFF00FFFFFF0046C0460043BF430036BC36001BB7
      1B0000AE0000009B0000008700006ECA6D006ECA6D0036BC360060C7600062C7
      620054C454004BC14B0048C1480048C14800FFFFFF00FFFFFF00FFFFFF001BB7
      1B0000AE0000009B0000008700006ECA6D0000000000EFD8C000F8E9C400F7E4
      BE00F4D8B200F6DFC100FAF7F300F9F4EE00F7F1E800C7A8A500B58B8B00C7A6
      A100F1E6D200F0E3CC00DBC7B9000000000000000000EFD7C500FBF8F500FFFA
      F500FFF8F20006B5060006B5060061C35400CDDDAF00ABD390006AC35700E6E0
      B900FFE5D500DAAFA50000000000000000006ECA6D005DC65D007ED07E0068C9
      6800FFFFFF00FFFFFF00FFFFFF004BC14B004BC14B0048C1480043BF430030BA
      300000B5000000A500000093000046A345006ECA6D005DC65D007ED07E0068C9
      680059C459004DC14D004BC14B004BC14B004BC14B00FFFFFF00FFFFFF00FFFF
      FF0000B5000000A500000093000046A3450000000000EFDAC100F3E6C500C6CE
      D00080B7E900BDC9D800FAFAF900FBF7F300F9F4ED00E9DCD500DBC5BF00D8C2
      BA00F3E9D700F1E5D200DBC8BC000000000000000000EFD7C600FCFAF800FFFC
      F800FFFAF50006B5060006B5060006B5060006B50600FFF3E700C0D8A100D5DD
      AF00FFE6D800DAAFA500000000000000000036BB340089D389008ED58E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000AC0000009A00000F810D0036BB340089D389008ED58E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000AC0000009A00000F810D0000000000E7D3BE00B2D5E20078C8
      FB0062BBFE0063B5F900C8E0F900F9F8F800FAF6F200F8F4ED00F7F0E700F6EE
      E200F4EBDC00F2E8D700DFCAC0000000000000000000EFD8C600FCFCFB00FFFD
      FC00E2EED500FFFAF600FFF8F200FFF6EF00FFF5EB00FFF4E900FFF4E800FFF2
      E500FFE8DB00DAAFA60000000000000000003EBD3D00A5DCA5009CD99C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000B00000009E00000F860D003EBD3D00A5DCA5009CD99C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000B00000009E00000F860D0000000000A8D0E50089D9FE0082D4
      FF0072C8FF0065BEFF006AB9FA00C7E0FA00FCFAF800FAF6F200F8F3ED00F7F0
      E700F5EDE100E7DCD500D4B1C200E6DFE20000000000EFD8C700FCFCFC00FFFF
      FE00B9E1B200E4EED800FFFAF60006B5060006B5060006B5060006B50600FFF4
      E800FFE8DD00DAAFA60000000000000000007DCF7C00AADEAA00AFE0AF0084D1
      8400FFFFFF00FFFFFF00FFFFFF004BC14B004BC14B004BC14B0048C1480041BE
      410030BA300000B2000000A0000046AF45007DCF7C00AADEAA00AFE0AF0084D1
      840068C9680059C4590050C250004BC14B004BC14B00FFFFFF00FFFFFF00FFFF
      FF0030BA300000B2000000A0000046AF4500B4DDF90074C9FF0080D3FF0088D9
      FF0083D5FF0076CBFF0066BFFF006FBCFC00D6E9FC00FBFAF800FAF6F200F8F3
      EC00E7E2E000B9ABC900D7CEDE000000000000000000EFD8C700FCFCFC00FFFF
      FF00CBE9C70006B50600D8E9CB00F0F1E00052C14C0006B5060006B50600FFF5
      EB00FFE6DB00DAAEA60000000000000000006ECA6D0099D89900C3E7C30095D7
      95007ACE7A00FFFFFF00FFFFFF00FFFFFF0050C250004DC14D004BC14B0043BF
      430036BC360000B1000000A000006ECA6D006ECA6D0099D89900C3E7C30095D7
      95007ACE7A0064C7640059C4590052C35200FFFFFF00FFFFFF00FFFFFF0043BF
      430036BC360000B1000000A000006ECA6D0000000000A6D6FA0073C8FF007CD0
      FF0087D8FF0085D7FF0078CDFF006AC1FF0073C0FD00CEE6FC00FBF9F700E7E8
      ED00A1AED100C6CDE000000000000000000000000000EFD8C700FDFDFD00FFFF
      FF00FFFFFF0085D2840031BB30003DBD390019B7190012B6120006B50600FEE7
      DF00FED3CD00DAABA30000000000000000000000000067C86600C4E7C400BAE4
      BA0090D590007ACE7A00FFFFFF00FFFFFF00FFFFFF0059C4590054C454004BC1
      4B002DBA2D0000AE0000069B0000000000000000000067C86600C4E7C400BAE4
      BA0090D590007ACE7A0068C96800FFFFFF00FFFFFF00FFFFFF0054C454004BC1
      4B002DBA2D0000AE0000069B00000000000000000000000000009BD2FB006FC5
      FF007DD0FF0086D8FF0085D7FF007ACEFF006AC2FF0071C0FF00C2DFFB0099BD
      E900BACDE50000000000000000000000000000000000EFD8C700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF0090D58E0051C24F0056C352009CD5920006B50600EBC2
      B800EBB6AF00D5A79E000000000000000000000000006ECA6D0097D89700C7E9
      C700BAE4BA0095D7950084D18400FFFFFF00FFFFFF0068C9680062C762004BC1
      4B0017B6170000A900006ECA6D0000000000000000006ECA6D0097D89700C7E9
      C700BAE4BA0095D7950084D18400FFFFFF00FFFFFF0068C9680062C762004BC1
      4B0017B6170000A900006ECA6D0000000000000000000000000000000000AFDA
      FA0072C6FF0079CDFF0085D7FF0087D8FF007CD0FF006EC5FF0062B4FA0088B5
      F2000000000000000000000000000000000000000000EFD8C700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFCFA00F0E3DE00D6B2A000DEB2
      8F00D9AB8B00D3AC9B000000000000000000000000000000000095D7950097D8
      9700C4E7C400C3E7C300AFE0AF009CD99C008ED58E007ED07E0060C7600033BB
      330000B000006ACA69000000000000000000000000000000000095D7950097D8
      9700C4E7C400C3E7C300AFE0AF009CD99C008ED58E007ED07E0060C7600033BB
      330000B000006ACA690000000000000000000000000000000000000000000000
      0000A6D6FA006EC4FF0079CDFF008BD8FE00AAE2FB008CB7EB003F6CD90084A4
      ED000000000000000000000000000000000000000000EFD8C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00EFE3DF00E0BDA400F3CA
      9500E8BE9400E5D0C20000000000000000000000000000000000000000006ECA
      6D0067C8660099D89900AADEAA00A5DCA50089D389005DC65D0036BC360006B3
      00006ECA6D000000000000000000000000000000000000000000000000006ECA
      6D0067C8660099D89900AADEAA00A5DCA50089D389005DC65D0036BC360006B3
      00006ECA6D000000000000000000000000000000000000000000000000000000
      000000000000CBE6F800D0E9F8000000000000000000B0B6DE004F5CC70097AD
      E8000000000000000000000000000000000000000000EFD8C600FEFAF800FCFA
      F700FCF9F600FAF8F500FAF7F400F9F6F300F8F4F100EADCD600DDBCA800EACD
      B200E9D8CA000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D007DCF7C003EBD3D0036BB34006ECA6D006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006ECA6D007DCF7C003EBD3D0036BB34006ECA6D006ECA6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1E7EE00CFD5E300E0E6
      EC000000000000000000000000000000000000000000F2D3B800F0D8C700EFD8
      C600EED6C500EED5C400ECD4C300EBD3C200EAD2C100E0C4B300DAB7A600EBDA
      CC0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000000100000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFE3FFFFFFFF0000
      FFC3FFFFE7FF0000FF83E03FE01F0000FF07E03FE00F0000FE07E03FC0070000
      FC03E02F80070000F801E00780030000C071E0078001000080F8E00780010000
      00F8FE07800300002071FC07800300007001FE07C0070000E103FFFFE00F0000
      C747FFFFF83F0000FFFFFFFFFFFF0000FFFFF0008007FCFFC3FFF0000003F8FF
      803FF0000001F0F3800780000001F0E3800300000000F0C3800300000000F0C3
      8001C0000000F0878001C0000000C007800180000001800F800380000003000F
      800F800000070007C01FC000000F0007F1FFF001000F000FF9FFF003001F000F
      F8FFF007003F001FFC7FFFFF007F803FFFFFC081FFFFE001FFFF80008001C001
      038180008001C001038180008001C001038180008001C001038180008001C001
      0381C0018001C0010001800F8001C0010001800F8001C0018003800F8001C001
      8003800F8001C001C107801F8001C001C107C01F8001C001E38FC03F8001C003
      E38FE07F8001C007FFFFFFFFFFFFC00FFFFFFFFFFFFFFFFF8001C003E003E0FF
      8001C003C003E01F8001C001800380038001C001800380018001C00180038001
      8001C001C00380008001C003C00380008001C003C00380008001C003C0038000
      8001C003C00380038001C003C003801F8001C003C003801F8001C007C00383FF
      8001C00FC007FFFFFFFFFFFFC00FFFFFF87FFFFFFFFFFFFFF00FFFFFC003FF0F
      E007E007C003FE03E003C003C003FC01E003C003C003E001E003C003C003C001
      E003E003C0038001E003F807C0038001F003F00FC0038003F807E01FC0038007
      F98FE003C0038007F98FE003C003C007F81FF003C003F007FC1FF807C007F80F
      FE3FFC0FC00FFE3FFFFFFFFFFFFFFFFFFFFFFE3F801FF80FC7C7F80F000FF003
      C387E0070000E001E10FC0030000C001E00FC00100008001F01F800100008001
      E01F000000008001C0070000000080018003800000008003000180000000C007
      800380010000E00FF83FC0010001E01FFC7FC003000FE03FFC7FE007000FE03F
      FC7FF00F801FC07FFEFFFC3FE07FC07FC000FCFFFF3FFFFFC000F8FFFF1FFFFF
      C000F007E00FC001C000E007E0078001C000C007E0038001C000E00FF0078001
      C000F0FFFF0F8001C000F9FFFF9F800100038001800180010003800180018001
      0003800180018001000380018001800100038001800180010003800180018003
      000380018001FFFF000380018001FFFFF8F0FFFFF47F8000FCF90001A01F0000
      0E010000000F00001E030000000300009F030000000100008007000000010000
      C007000000010000C60F000000010000E60F000000010000E01F000000010000
      F03F000000010000F07F000000010000F07F000000010000F8FF0001C0010000
      F8FF0001F00F0000FDFFFFFFFC7F0000F81FF81F8003C832E007E00780030000
      C003C00380032020800180018003000080018001800315C00000000080010000
      0000000080000800000000008000040000000000800000000000000080000000
      000000008000000080018001800000008001800180000080C003C00380000000
      E007E00780040000F81FF81F800F000081FFFFFFFFFFFFFF801FFFFF80078007
      8007800300030003000700010001000300030000000100030003000000010003
      00000000000100010000000000018001000000008000E00000008000C000E000
      0000C001FF00E0008000FFFFFF00F001C3C0FFFFFF00F001FFC1FFFFFF00F803
      FFF7FFFFFF00FC07FFFFFFFFFF81FF1FFFFFE00080018001C001C00080010001
      8001C000800100018001C0008001000180018000800100018001000080010001
      8001000080010001800100008001000180010000800100018001000080010001
      8001000080010001800100018001000180010003800100018001000380010001
      8003000380010001FFFF00078003000381FFFFFFFFFFFFFF800FFE7FFFFFFC01
      8007FC3F001FFC018007F81F000FFC018003F00F000780018003E00700038001
      8003F00F000180018001FC3F000080018001FC3F001F80018001FC3F001F8001
      800FFC3F001F8003C003FC3F8FF18003FC07FC3FFFF98003FE1FFE7FFF758003
      FE3FFFFFFF8FFFFFFF7FFFFFFFFFFFFFFFFFF0008003FFFFFFFFE0008003FFFF
      FFFF80008003C001C001200080038001C0010000800380018001000080038001
      8001000080038001000180008003800100014000800380010001200080038001
      80018000800380018001C000800380018001E00180038001C07FE00180038003
      E0FFE0038007FFFFFFFFE007800FFFFFF81FFFFFFFFFFFFFE007FFFFFC038001
      C003E7FFFC0380008001E01FF00300008001E00FF00300000000C007C0030000
      00008007C003000000008003C003000000008001C003000000008001C0030001
      00008003C00F000380018003C00F00078001C007C03F81FFC003E00FC03FC3FF
      E007F83FFFFFFFFFF81FFFFFFFFFFFFFF81FF81FF0FF8003E007E007E0078003
      C003C003C0018003800180018001800380018001800180030000000080018003
      0000000080018003000000008001800300000000800080030000000000018003
      000000008003800380018001C007800380018001E00F8003C003C003F00F8003
      E007E007F98F8007F81FF81FFF8F800F00000000000000000000000000000000
      000000000000}
  end
  object DisabledImageList: TImageList
    Left = 368
    Top = 128
    Bitmap = {
      494C01012E003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00666666006666
      6600666666005E5E5E005E5E5E0053535300535353004A4A4A004A4A4A004444
      440044444400303030005E5E5E00000000000000000000000000626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      6200626262006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300D5D5D500F0F0
      F000ECECEC00ECECEC00E9E9E900E9E9E900E9E9E900E6E6E600E6E6E600E6E6
      E600F0F0F000D5D5D5003030300000000000000000000000000085858500DBDB
      DB00DBDBDB00DBDBDB00D3D3D300D3D3D300D3D3D300D1D1D100D1D1D100D1D1
      D100D1D1D1006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00F7F7F700F7F7
      F700F2F2F2009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A00F0F0F0004444440000000000000000000000000085858500E3E3
      E300DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00FFFFFF009898
      9800989898009898980098989800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00ECECEC00F7F7
      F700F2F2F2009A9A9A00DBDBDB00D4D4D400DBDBDB00DBDBDB00DBDBDB00DBDB
      DB009A9A9A00E6E6E6004444440000000000000000000000000091919100E6E6
      E600CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FFFF
      FF00989898009898980098989800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B9B9B00ECECEC00F7F7
      F700F2F2F2009A9A9A00FFFFFF00D4D4D400FFFFFF00FFFFFF00DBDBDB00FFFF
      FF009A9A9A00E6E6E6004A4A4A0000000000000000000000000091919100E9E9
      E900E9E9E900E6E6E600E3E3E300E3E3E300DFDFDF00DFDFDF00FFFFFF009898
      9800989898009898980098989800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B9B9B00ECECEC00F7F7
      F700F7F7F7009A9A9A00DBDBDB00D4D4D400DBDBDB00DBDBDB00DBDBDB00DBDB
      DB009A9A9A00E9E9E9004A4A4A000000000000000000000000009F9F9F00EAEA
      EA00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FFFFFF00989898009898
      980098989800FFFFFF0098989800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B9B9B00ECECEC009A9A
      9A009A9A9A009A9A9A00FFFFFF00D4D4D400FFFFFF00FFFFFF00DBDBDB00FFFF
      FF009A9A9A00E9E9E900535353000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EAEAEA00E9E9E900E9E9E900FFFFFF0098989800989898009898
      9800FFFFFF006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAAAAA00EEEEEE009A9A
      9A00DBDBDB008B8B8B007575750075757500757575006B6B6B006B6B6B006B6B
      6B0075757500E9E9E900535353000000000000000000000000009F9F9F00EFEF
      EF00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FFFFFF0098989800FFFF
      FF00D1D1D1006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3B3B300EEEEEE009A9A
      9A00FFFFFF00DBDBDB00FFFFFF00FFFFFF00DBDBDB00FFFFFF009A9A9A00EFEF
      EF00EFEFEF00E9E9E9005E5E5E000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EDEDED00EAEAEA00E9E9E900FFFFFF00DBDB
      DB00D7D7D7006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBBBB00ECECEC009A9A
      9A00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB009A9A9A00F2F2
      F200F2F2F200E9E9E9005E5E5E000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00F3F3F300EDEDED00EAEAEA00E6E6E600DBDBDB00DFDF
      DF00DFDFDF006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200F0F0F0009A9A
      9A00FFFFFF00DBDBDB00FFFFFF00FFFFFF00DBDBDB00FFFFFF009A9A9A00F7F7
      F700F7F7F700ECECEC00666666000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EDEDED00E9E9E900E3E3E300DFDF
      DF00DFDFDF006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9C9C900F2F2F2008B8B
      8B007575750075757500757575006B6B6B006B6B6B006B6B6B0075757500F7F7
      F700F7F7F700F0F0F000666666000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EDEDED00EFEFEF00EFEFEF00EFEFEF00EFEFEF00808080008080
      8000808080006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9C9C900E6E6E600EFEF
      EF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600ECECEC00D5D5D500666666000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009F9F9F00B2B2
      B200626262000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600C9C9C900C9C9
      C900C2C2C200BBBBBB00B3B3B300AAAAAA009B9B9B009B9B9B009B9B9B008C8C
      8C008C8C8C00737373008C8C8C000000000000000000000000009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F006262
      6200000000000000000000000000000000000000000000000000000000000000
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
      0000000000009999990099999900999999009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000646464006767670067676700676767006C6C6C007A7A7A00939393009393
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      6200626262006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520052525200525252005252
      5200000000000000000000000000000000000000000000000000000000008888
      880064646400DDDDDD00B5B5B500B5B5B5006767670067676700818181008181
      81007A7A7A00000000000000000000000000000000000000000000000000A2A2
      A2007C7C7C0041414100414141004141410041414100414141005B5B5B006262
      6200AEAEAE00000000000000000000000000000000000000000085858500D7D7
      D700E3E3E300E1E1E100E1E1E100E1E1E100D3D3D300D3D3D300D3D3D300CCCC
      CC00CCCCCC006262620000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B00DFDFDF00DEDEDE00949494009494
      9400525252005252520000000000000000000000000000000000000000008888
      88007B7B7B00C7C7C700B7B7B700B8B8B800A1A1A100ADADAD00646464006464
      6400919191009393930000000000000000000000000000000000A8A8A800CFCF
      CF00EAEAEA00EAEAEA00E2E2E200E2E2E200696969008D8D8D00BCBCBC00B9B9
      B90062626200AEAEAE000000000000000000000000000000000085858500D7D7
      D700E3E3E300CCCCCC00CCCCCC00CCCCCC00CBCBCB00B2B2B200B2B2B200B2B2
      B200CCCCCC006262620000000000000000000000000000000000000000000000
      000000000000000000007D7D7D00C9C9C900CACACA00DEDEDE008D8D8D00ADAD
      AD00ADADAD009292920052525200000000000000000000000000000000008888
      880088888800CFCFCF00B9B9B900B9B9B90089898900AFAFAF00B9B9B900B9B9
      B9004E4E4E009393930000000000000000000000000000000000A2A2A200FFFF
      FF00F7F7F700F3F3F300EAEAEA00D8D8D80041414100B9B9B900CBCBCB00CBCB
      CB00AEAEAE00626262000000000000000000000000000000000091919100EAEA
      EA00919191008787870087878700878787009C9C9C00B9B9B900C4C4C4008787
      8700CFCFCF006262620000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C007D7D7D00E1E1E100ABABAB00F1F1F1008A8A8A009292
      920092929200ADADAD0069696900000000000000000000000000000000008888
      88009F9F9F00DDDDDD00BCBCBC00BCBCBC0096969600A8A8A800BDBDBD00BDBD
      BD004E4E4E00939393000000000000000000000000000000000098989800E2E2
      E200F3F3F300FFFFFF00FFFFFF00D8D8D80069696900B9B9B90072727200CBCB
      CB00CBCBCB00414141000000000000000000000000000000000091919100EAEA
      EA0091919100858585007070700087878700C4C4C400DDDDDD00D8D8D800A5A5
      A500CFCFCF006262620000000000000000000000000000000000A8A8A800F0F0
      F000F0F0F000C4C4C4007D7D7D00E2E2E200F3F3F300D6D6D6007A7A7A009494
      9400949494009C9C9C006D6D6D00000000000000000000000000000000008888
      8800B5B5B500EDEDED00CFCFCF00CBCBCB00B0B0B000B5B5B500C0C0C000C0C0
      C0004E4E4E00939393000000000000000000000000000000000000000000A2A2
      A200989898009898980098989800989898009A9A9A0079797900E2E2E200FFFF
      FF00B9B9B90062626200000000000000000000000000000000009F9F9F00EAEA
      EA00A5A5A500989898004545450098989800A3A3A300C4C4C400C4C4C4009898
      9800CFCFCF0062626200000000000000000000000000AAAAAA00B3B3B300B6B6
      B600F0F0F000BABABA007575750075757500757575007575750093939300C9C9
      C900C9C9C9009C9C9C006F6F6F00000000000000000000000000000000008888
      880099999900A6A6A600C0C0C000D2D2D200E6E6E600E8E8E800E1E1E100E1E1
      E100535353009393930000000000000000000000000000000000000000000000
      000000000000AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5
      A5004141410000000000000000000000000000000000000000009F9F9F00EAEA
      EA00AAAAAA0087878700383838009F9F9F009F9F9F00D8D8D800D8D8D8009F9F
      9F00CFCFCF0062626200000000000000000000000000AAAAAA00EFEFEF00B7B7
      B700E2E2E20096969600E7E7E700E6E6E600B2B2B200B2B2B200757575007575
      7500C9C9C900C9C9C9005E5E5E00000000000000000000000000000000000000
      00006D6D6D008989890081818100656565006767670094949400C5C5C500C5C5
      C5004E4E4E009393930000000000000000000000000000000000000000000000
      0000A2A2A200FFFFFF0098989800989898009898980098989800A5A5A5004141
      41000000000000000000000000000000000000000000000000009F9F9F00F0F0
      F0009F9F9F00636363005E5E5E00A7A7A70099999900C7C7C70099999900A7A7
      A700CFCFCF0062626200000000000000000000000000AAAAAA00F2F2F200F9F9
      F90098989800D6D6D600D7D7D700E7E7E700A7A7A700C8C8C800C8C8C800AFAF
      AF00757575007D7D7D0000000000000000000000000000000000000000000000
      0000000000006D6D6D0067676700B0B0B000B0B0B00081818100858585008585
      850054545400000000000000000000000000000000000000000000000000A8A8
      A800DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBCBC00414141000000
      00000000000000000000000000000000000000000000000000009F9F9F00EFEF
      EF005E5E5E00383838005E5E5E00626262006B6B6B006F6F6F006F6F6F006B6B
      6B00CFCFCF0062626200000000000000000000000000AAAAAA00FFFFFF00E7E7
      E70098989800E8E8E800C1C1C100F5F5F500A6A6A600AFAFAF00AFAFAF00C8C8
      C8008A8A8A000000000000000000000000000000000000000000000000000000
      0000000000006D6D6D008888880068686800686868009D9D9D007F7F7F008E8E
      8E00000000000000000000000000000000000000000000000000000000009898
      9800FFFFFF009898980098989800989898009898980069696900727272007272
      72007272720072727200000000000000000000000000000000009F9F9F00EFEF
      EF00A7A7A7005E5E5E0092929200A7A7A700BEBEBE00D8D8D800C4C4C400BEBE
      BE00CFCFCF0062626200000000000000000000000000AAAAAA00E7E7E700D9D9
      D90098989800E9E9E900F6F6F600E3E3E30097979700B2B2B200B2B2B200B9B9
      B9008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000006D6D6D008888880068686800686868009D9D9D008E8E8E006D6D
      6D0000000000000000000000000000000000000000000000000000000000A2A2
      A200E2E2E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC0069696900AEAE
      AE00AEAEAE005B5B5B00000000000000000000000000000000009F9F9F00EFEF
      EF00B2B2B2009292920092929200A7A7A700BEBEBE00C7C7C700F0F0F000E3E3
      E300E3E3E3006262620000000000000000000000000000000000AAAAAA00B0B0
      B00098989800FFFFFF00DADADA00DADADA00AEAEAE00DADADA00DADADA00B9B9
      B900909090000000000000000000000000000000000000000000000000000000
      0000000000006D6D6D00A5A5A5008888880088888800989898008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000098989800FFFFFF0098989800989898009898980098989800B9B9B9006969
      6900AEAEAE005B5B5B00000000000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00808080008080
      8000808080006262620000000000000000000000000000000000000000000000
      000098989800DADADA00CACACA00CECECE00ADADAD00CACACA00DADADA00DADA
      DA007A7A7A000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6D009C9C9C00ADADAD009C9C9C006D6D6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000098989800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBC
      BC005B5B5B0000000000000000000000000000000000000000009F9F9F00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009F9F9F00B2B2
      B200626262000000000000000000000000000000000000000000000000000000
      000000000000989898009B9B9B00CECECE00B1B1B100DADADA00989898009898
      9800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098989800989898009898980098989800989898009898
      98000000000000000000000000000000000000000000000000009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F006262
      6200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000989898009898980098989800000000000000
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
      0000000000000000000000000000B3B3B300B3B3B300B3B3B300000000000000
      00000000000000000000000000000000000000000000B6B6B600B6B6B600B6B6
      B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      000000000000B3B3B300B3B3B300B2B2B200B5B5B500B5B5B500B3B3B300B3B3
      B30000000000000000000000000000000000B6B6B600EEEEEE00D9D9D900D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900EEEEEE00B6B6
      B600000000000000000000000000000000000000000000000000000000000000
      0000B1B1B100848484006A6A6A0068686800747474009C9C9C00737373007A7A
      7A0095959500A6A6A60000000000000000000000000000000000BFBFBF00EBEB
      EB00B0B0B000BFBFBF00000000000000000000000000BFBFBF00EAEAEA00C4C4
      C400BFBFBF00000000000000000000000000000000000000000000000000B3B3
      B300B3B3B300A9A9A900C2C2C200DADADA00B8B8B800E0E0E000B9B9B900BBBB
      BB00B3B3B300000000000000000000000000B6B6B600EFEFEF00DDDDDD00DDDD
      DD00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF00AFAFAF00AFAFAF000000000000000000000000008888
      8800BFBFBF00F5F5F500C8C8C800ABABAB00A8A8A800C9C9C900EDEDED00CACA
      CA007C7C7C00757575009B9B9B0000000000000000000000000000000000BFBF
      BF00C6C6C600CACACA00BFBFBF0000000000BFBFBF00E2E2E200C4C4C400BFBF
      BF00000000000000000000000000000000000000000000000000B3B3B3009A9A
      9A00AEAEAE00E5E5E500F0F0F000DCDCDC00A8A8A800F6F6F600F9F9F900E0E0
      E000BDBDBD00B3B3B3000000000000000000B6B6B600EFEFEF00DFDFDF00DFDF
      DF00AFAFAF00FCFCFC00FBFBFB00F9F9F900F8F8F800F9F9F900F8F8F800F5F5
      F500F4F4F400F2F2F200F1F1F100AFAFAF000000000000000000B6B6B600F3F3
      F300F5F5F500EFEFEF00C4C4C400B0B0B0008484840090909000AAAAAA00D0D0
      D000F0F0F000C7C7C7009494940000000000000000000000000000000000BFBF
      BF00DDDDDD00C5C5C500D3D3D300BFBFBF00F2F2F200D7D7D700B2B2B200BFBF
      BF000000000000000000000000000000000000000000000000006D6D6D006D6D
      6D00E6E6E600E6E6E600E5E5E500E1E1E100DEDEDE00E1E1E100EDEDED00FAFA
      FA00E0E0E000BABABA00B3B3B30000000000B6B6B600EFEFEF00DFDFDF00DFDF
      DF00AFAFAF00FCFCFC00E2E2E200E0E0E000DFDFDF00DDDDDD00DCDCDC00DBDB
      DB00DADADA00DADADA00F1F1F100AFAFAF0000000000CACACA00FBFBFB00F6F6
      F600E4E4E400B2B2B2009F9F9F00B3B3B300C8C8C800BFBFBF00B1B1B100ACAC
      AC00A8A8A800888888009B9B9B00000000000000000000000000000000000000
      0000BFBFBF00C1C1C100CECECE00E6E6E600F0F0F000DEDEDE00BFBFBF000000
      000000000000000000000000000000000000000000006D6D6D00AFAFAF00C6C6
      C6006D6D6D00EAEAEA00EAEAEA00E7E7E700E4E4E400E0E0E000DEDEDE00EEEE
      EE00F9F9F900B9B9B900B3B3B30000000000B6B6B600F0F0F000E2E2E200E2E2
      E200AFAFAF00FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400F5F5F500AFAFAF0000000000CACACA00E4E4E400BABA
      BA00B6B6B600D9D9D900C3C3C300ABABAB00A1A1A100A3A3A300BABABA00D2D2
      D200B6B6B6007D7D7D009D9D9D0000000000000000000000000000000000BFBF
      BF00B9B9B900C6C6C600C6C6C600D9D9D900EBEBEB00E7E7E700BFBFBF000000
      0000000000000000000000000000000000006D6D6D009B9B9B00B4B4B400C0C0
      C000CCCCCC006D6D6D00EAEAEA00EAEAEA00E8E8E800E5E5E500E0E0E000E2E2
      E200F7F7F700DEDEDE00B4B4B400B3B3B300B6B6B600F1F1F100E5E5E500E5E5
      E500AFAFAF00FFFFFF00EBEBEB00EBEBEB00E8E8E800E5E5E500E4E4E400E2E2
      E200E1E1E100E1E1E100F7F7F700AFAFAF000000000098989800BFBFBF00E4E4
      E400E4E4E400E4E4E400E4E4E400E9E9E900DDDDDD00D1D1D100B8B8B800A8A8
      A8009C9C9C007C7C7C00A2A2A200000000000000000000000000BFBFBF00CFCF
      CF00D4D4D400CBCBCB00C1C1C100D2D2D200E5E5E500F0F0F000D9D9D900BFBF
      BF00BFBFBF000000000000000000000000006D6D6D006D6D6D00A5A5A500B3B3
      B3006D6D6D006D6D6D00B3B3B3007E7E7E008E8E8E006A6A6A007C7C7C007C7C
      7C00ECECEC00A5A5A500B6B6B600B3B3B300B7B7B700F2F2F200E8E8E800E8E8
      E800AFAFAF00FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400F8F8F800AFAFAF0000000000B9B9B900EAEAEA00E4E4
      E400E0E0E000D9D9D900E2E2E200DDDDDD00D4D4D400D3D3D300DBDBDB00E1E1
      E100DBDBDB0094949400A6A6A6000000000000000000BFBFBF00D5D5D500EFEF
      EF00E1E1E100D2D2D200C2C2C200CACACA00DCDCDC00EFEFEF00E3E3E300D0D0
      D000B0B0B000BFBFBF000000000000000000000000006D6D6D0094949400AAAA
      AA006D6D6D00F7F7F700F7F7F7008A8A8A00ADADAD005858580096969600A8A8
      A800EBEBEB00A9A9A900B1B1B100B3B3B300B7B7B700F3F3F300EBEBEB00EBEB
      EB00AFAFAF00FFFFFF00E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300EBEBEB00D5D5D500A4A4A40000000000CACACA00E2E2E200D4D4
      D400C2C2C200BEBEBE00DDDDDD00F4F4F400F2F2F200F0F0F000E4E4E400D2D2
      D200D1D1D100A7A7A7000000000000000000BFBFBF00DADADA00D9D9D900D9D9
      D900D9D9D900E1E1E100D2D2D200C4C4C400CBCBCB00D4D4D400DCDCDC00D9D9
      D900E3E3E300DADADA00BFBFBF0000000000000000006D6D6D00858585009E9E
      9E006D6D6D00F9F9F900F9F9F900F8F8F800E5E5E50065656500ABABAB00E1E1
      E100F0F0F000D3D3D300AAAAAA00B3B3B300B7B7B700F3F3F300ECECEC00ECEC
      EC00AFAFAF00FFFFFF00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400A4A4A400A4A4A400A4A4A4000000000000000000CACACA00D9D9
      D900F2F2F200C8C8C800CECECE00C5C5C500CBCBCB00D0D0D000D0D0D000C9C9
      C900A6A6A60000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00CFCFCF00C1C1C100BEBEBE00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00000000000000000000000000B3B3B3006D6D6D008C8C
      8C00939393006D6D6D00FCFCFC00FAFAFA00F6F6F600E8E8E80065656500B4B4
      B400E4E4E400B0B0B000B3B3B30000000000B7B7B700F5F5F500F1F1F100F1F1
      F100AFAFAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A4A4A400A6A6A600C1C1C100000000000000000000000000CFCF
      CF00E1E1E100E1E1E100E3E3E300E6E6E600EAEAEA00EEEEEE00A5A5A500A6A6
      A600000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00D9D9D900C6C6C600BEBEBE00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000B3B3B3006D6D
      6D00919191006D6D6D00FBFBFB00FBFBFB00FBFBFB00EDEDED00DFDFDF006565
      6500C4C4C400AEAEAE00B3B3B30000000000B7B7B700F6F6F600F3F3F300F3F3
      F300AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00A4A4A400C5C5C50000000000000000000000000000000000D2D2
      D200E1E1E100E1E1E100E1E1E100DDDDDD00DCDCDC0088888800A6A6A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00CCCCCC00BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B3006D6D
      6D00808080008A8A8A006D6D6D006D6D6D006D6D6D006D6D6D00CACACA00CACA
      CA00B6B6B600B3B3B3000000000000000000B7B7B700FAFAFA00E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400FAFAFA00A1A1
      A10000000000000000000000000000000000000000000000000000000000C3C3
      C300E9E9E900E9E9E900E9E9E900E9E9E900E3E3E3008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00C1C1C100BFBFBF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B3B3
      B3006D6D6D006D6D6D007D7D7D007A7A7A0085858500B0B0B000B3B3B300B7B7
      B700B3B3B300000000000000000000000000B7B7B700FBFBFB00A9A9A900A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900DADADA00FBFBFB00A1A1
      A10000000000000000000000000000000000000000000000000000000000D4D4
      D400F0F0F000F0F0F000F0F0F000F0F0F000D2D2D200AFAFAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00C1C1C100BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B300B3B3B300B3B3B300BFBFBF00BDBDBD00B1B1B100B3B3B300B3B3
      B3000000000000000000000000000000000000000000CBCBCB00A9A9A900AEAE
      AE00C9C9C900EAEAEA00EAEAEA00C2C2C200A9A9A900BABABA00BCBCBC000000
      0000000000000000000000000000000000000000000000000000CFCFCF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700BBBBBB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3B3B300B3B3B300B3B3B300B3B3B300000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A500ABABAB00ABABAB00ABABAB00A9A9A900D2D2D20000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E40000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F0000000000000000000000000000000
      0000000000000000000072727200727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600F0F0F0000000000000000000000000000000
      0000000000005151510051515100727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007272720051515100515151000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8
      C800D3D3D300C8C8C800A6A6A600F0F0F0000000000000000000000000000000
      000051515100A2A2A20051515100727272007272720072727200727272007272
      7200727272000000000000000000000000000000000000000000000000007272
      7200727272007272720072727200727272007272720051515100A2A2A2005151
      5100000000000000000000000000000000000000000000000000B1B1B100A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F0000000000000000000000000005151
      5100A9A9A900B4B4B40051515100515151005151510051515100515151005151
      5100727272000000000000000000000000000000000000000000000000007272
      7200515151005151510051515100515151005151510051515100B4B4B400A9A9
      A90051515100000000000000000000000000000000009D9D9D00797979007272
      7200727272007272720072727200727272007272720072727200727272007070
      700072727200737373009E9E9E000000000000000000000000000F0F0F00A6A6
      A600D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F0000000000000000000515151006767
      6700A9A9A900B4B4B400B4B4B400BEBEBE00D2D2D200D4D4D400DBDBDB005151
      5100727272000000000000000000000000000000000000000000000000007272
      720051515100DBDBDB00D4D4D400D2D2D200BEBEBE00B4B4B400B4B4B400A9A9
      A9006767670051515100000000000000000000000000C5C5C500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7007F7F7F009E9E9E000000000000000000000000000F0F0F00A6A6
      A600DBDBDB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8
      C800C8C8C800C8C8C800A6A6A600F0F0F0000000000000000000000000005151
      5100A9A9A900B4B4B40051515100515151005151510051515100515151005151
      5100000000000000000000000000000000000000000000000000000000000000
      0000515151005151510051515100515151005151510051515100B4B4B400A9A9
      A9005151510000000000000000000000000000000000CACACA00FFFFFF00FEFE
      FE00B6B6B60088888800B5B5B500FEFEFE00CCCCCC0096969600A0A0A000FEFE
      FE00FEFEFE007F7F7F009E9E9E000000000000000000000000000F0F0F00A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600F0F0F0000000000000000000000000000000
      000051515100A2A2A20051515100727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007272720051515100A2A2A2005151
      51000000000000000000000000000000000000000000CACACA00FFFFFF00FEFE
      FE0098989800818181008A8A8A00A5A5A50098989800818181008E8E8E00FEFE
      FE00FEFEFE00808080009E9E9E000000000000000000000000000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F00F0F0F0000000000000000000000000000000
      0000000000005151510051515100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000051515100515151000000
      00000000000000000000000000000000000000000000CACACA00FFFFFF00FEFE
      FE00D5D5D500A1A1A10084848400818181008181810091919100C0C0C000FEFE
      FE00FEFEFE00818181009E9E9E0000000000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000000000000000000000000000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F0000000000000000000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F0000000000000000000CBCBCB00FFFFFF00FEFE
      FE00FEFEFE00C2C2C2008484840081818100818181009D9D9D00FEFEFE00FEFE
      FE00FEFEFE00828282009E9E9E00000000000F0F0F00A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F0000000000000000000CCCCCC00FFFFFF00FEFE
      FE00D7D7D7009C9C9C008181810081818100818181008A8A8A00B5B5B500FEFE
      FE00FEFEFE00848484009E9E9E00000000000F0F0F00A6A6A600DBDBDB00DBDB
      DB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3D300C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3
      D300C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00DBDBDB00D3D3D300DBDBDB00D3D3D300C8C8C800D3D3D300C8C8C800D3D3
      D300C8C8C800A6A6A600F0F0F0000000000000000000CFCFCF00FFFFFF00FFFF
      FF00999999008181810092929200B9B9B900A6A6A6008383830088888800FFFF
      FF00FFFFFF00838383009E9E9E00000000000F0F0F00A6A6A600DBDBDB00D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F0000000000000000000C2C2C200E7E7E700E4E4
      E400BABABA0091919100C7C7C700EDEDED00DFDFDF00A3A3A300A5A5A500E2E2
      E200E0E0E000959595009E9E9E00000000000F0F0F00A6A6A600D3D3D300DBDB
      DB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600D3D3
      D300DBDBDB00D3D3D300D3D3D300D3D3D300D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F000000000000000000073737300737373007171
      7100717171007171710071717100717171007070700088888800828282008787
      87007E7E7E00ACACAC009E9E9E00000000000F0F0F00A6A6A600DBDBDB00D3D3
      D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8C800C8C8
      C800A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600DBDB
      DB00D3D3D300D3D3D300D3D3D300C8C8C800D3D3D300C8C8C800C8C8C800C8C8
      C800C8C8C800A6A6A600F0F0F0000000000000000000A6A6A6009D9D9D009A9A
      9A009898980098989800979797009A9A9A009292920097979700979797009B9B
      9B00979797009B9B9B0000000000000000000F0F0F00A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600F0F0F0000000000000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F00000000000000000000F0F0F00A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6
      A600A6A6A600A6A6A600F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F00F0F0F0000000000000000000000000000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F00F0F0F00000000000000000000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F000F0F0F00F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000858585005A5A5A00585858006868680068686800686868006868
      6800A1A1A1004F4F4F00595959006A6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008E8E8E0068686800E4E4E4008E8E8E008E8E8E0000000000000000000000
      0000000000000000000000000000000000000000000092929200888888009696
      9600B7B7B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000858585004E4E4E006868680068686800686868006868
      6800686868005C5C5C005F5F5F0000000000EAEAEA00E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E90000000000000000008E8E8E0000000000E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E000000
      0000000000000000000000000000000000009F9F9F0094949400686868006868
      68008C8C8C006D6D6D004A4A4A00414141004242420040404000484848007171
      7100FF00FF00FF00FF00FF00FF00FF00FF00000000006C6C6C00696969000000
      00000000000000000000000000006A6A6A003F3F3F003F3F3F00424242003D3D
      3D004C4C4C005E5E5E0085858500000000008F8F8F00B5B5B500AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00ADADAD00ABABAB00A9A9A900A8A8A800A6A6A600A5A5
      A500A3A3A300A2A2A2008C8C8C00DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E000000000000000000000000000000000097979700B0B0B000686868008C8C
      8C00505050006F6F6F0081818100929292009D9D9D00A0A0A0007A7A7A004343
      430047474700FF00FF00FF00FF00FF00FF009999990066666600868686000000
      00000000000000000000000000009191910056565600626262005B5B5B006666
      66005B5B5B00565656000000000000000000A9A9A900CFCFCF00B7B7B700B7B7
      B700B5B5B500B4B4B400B3B3B300AFAFAF00E8E8E800E5E5E500E2E2E200DFDF
      DF00DCDCDC00D9D9D900AEAEAE00DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E0000000000000000009A9A9A006E6E6E00444444006565
      6500838383008686860083838300858585008F8F8F00A3A3A300BCBCBC00BABA
      BA005555550047474700FF00FF00FF00FF000000000000000000666666000000
      0000000000000000000000000000000000005252520075757500828282006666
      66005B5B5B00898989000000000000000000A9A9A900C1C1C100FBFBFB00F9F9
      F900F1F1F100EAEAEA00E2E2E200ACACAC00EAEAEA00E8E8E800E5E5E500E2E2
      E200DEDEDE00DCDCDC00B0B0B000DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E00000000009C9C9C00808080006B6B6B008D8D
      8D00848484007E7E7E007C7C7C005F5F5F00656565007F7F7F0097979700B9B9
      B900C6C6C6004F4F4F0070707000FF00FF000000000099999900666666005858
      58005C5C5C00555555005C5C5C005C5C5C0085858500737373009C9C9C006565
      65005B5B5B00000000000000000000000000A9A9A900C3C3C300FBFBFB00FCFC
      FC00F5F5F500EEEEEE00BDBDBD0097979700E9E9E900EBEBEB00E8E8E800E5E5
      E500E2E2E200DFDFDF00B2B2B200DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000CBCBCB00989898008F8F8F008686
      86007E7E7E007575750050505000686868006868680068686800757575008F8F
      8F00B8B8B800A9A9A90066666600FF00FF000000000000000000000000006666
      66006868680061616100686868006868680085858500555555005A5A5A007171
      7100B3B3B300000000000000000000000000A9A9A900C3C3C300FBFBFB00FFFF
      FF00FCFCFC00F6F6F600D3D3D30086868600AEAEAE00DCDCDC00EAEAEA00E6E6
      E600E5E5E500E3E3E300B4B4B400DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000FF00FF00A3A3A300959595008484
      84007C7C7C0058585800303030004B4B4B005252520052525200535353005252
      5200585858006363630060606000FF00FF000000000000000000999999006666
      66008686860068686800686868009898980077777700818181007D7D7D006F6F
      6F0000000000000000000000000000000000A9A9A900C2C2C200EBEBEB00EDED
      ED00EDEDED00EBEBEB00E2E2E200A9A9A9007878780089898900C6C6C600B6B6
      B600E7E7E700E5E5E500B6B6B600DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000FF00FF00D0D0D0009D9D9D008C8C
      8C00818181006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F
      6F006F6F6F006F6F6F0045454500FF00FF000000000000000000000000000000
      000066666600686868006868680068686800989898008585850080808000B7B7
      B70000000000000000000000000000000000A9A9A900CFCFCF00777777007474
      7400747474007474740074747400A3A3A300AFAFAF00707070006D6D6D008383
      8300EAEAEA00E8E8E800B7B7B700DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000E9E9E90068686800CBCBCB00A2A2
      A2008D8D8D00828282007C7C7C007C7C7C007D7D7D00808080007D7D7D008080
      8000868686008C8C8C004A4A4A00FF00FF000000000000000000000000009999
      990000000000BCBCBC0098989800787878009F9F9F0071717100858585000000
      000000000000000000000000000000000000A9A9A900F9F9F900EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00F4F4F400ECECEC00949494006D6D6D008383
      8300EDEDED00ECECEC00BABABA00DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E4008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000F0F0F000A3A3A30068686800BDBD
      BD00A3A3A3006E6E6E0042424200686868006868680088888800707070007F7F
      7F00858585007979790064646400FF00FF000000000000000000000000000000
      0000000000007474740068686800979797008F8F8F0074747400000000000000
      000000000000000000000000000000000000A9A9A900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00C8C8C800C3C3C300C7C7
      C700F1F1F100EFEFEF00BBBBBB00DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E4008E8E8E008E8E8E00E4E4E400E4E4E400E4E4E4008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000FF00FF00B0B0B000BFBFBF006868
      6800D4D4D40091919100484848003F3F3F004F4F4F00666666007F7F7F008080
      80008C8C8C0060606000ADADAD00FF00FF000000000000000000000000000000
      00000000000000000000787878009F9F9F007171710000000000000000000000
      000000000000000000000000000000000000A9A9A900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F9F9F900F6F6
      F600F3F3F300F1F1F100BDBDBD00DEDEDE00E4E4E4008E8E8E008E8E8E00E4E4
      E400E4E4E400E4E4E4008E8E8E008E8E8E00E4E4E400E4E4E400E4E4E4008E8E
      8E008E8E8E008E8E8E008E8E8E0000000000FF00FF00FF00FF00C9C9C900B9B9
      B90068686800C6C6C600939393006B6B6B007676760083838300818181008585
      85008C8C8C007F7F7F00FF00FF00FF00FF000000000000000000000000000000
      0000999999006B6B6B00A0A0A000909090006C6C6C0000000000000000000000
      00000000000000000000000000000000000094949400BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BEBEBE00BCBCBC00BBBB
      BB00B9B9B900B9B9B90099999900DEDEDE00E4E4E400E4E4E400E4E4E4008E8E
      8E008E8E8E00E4E4E400E4E4E400E4E4E4008E8E8E008E8E8E00E4E4E400E4E4
      E400E4E4E4008E8E8E008E8E8E0000000000FF00FF00FF00FF00DEDEDE00D0D0
      D000C8C8C800CCCCCC00B5B5B500ABABAB00959595008C8C8C008E8E8E008B8B
      8B008A8A8A00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000B7B7B700808080000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B0072727200727272007272
      7200727272007272720072727200727272007272720072727200727272007272
      7200727272007272720096969600000000000000000000000000E4E4E400E4E4
      E400E4E4E4008E8E8E008E8E8E00E4E4E400E4E4E400E4E4E4008E8E8E008E8E
      8E00E4E4E400E4E4E400E4E4E40000000000FF00FF00FF00FF00FF00FF00E1E1
      E100C1C1C10000000000CBCBCB00C5C5C500A7A7A700ABABAB00999999008E8E
      8E0000000000FF00FF00B9B9B900D3D3D3000000000000000000000000000000
      0000000000009999990089898900000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800DCDCDC00000000000000000000000000000000000000
      0000E4E4E400E4E4E400E4E4E4008E8E8E008E8E8E00E4E4E400E4E4E400E4E4
      E40000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00DFDFDF0000000000B4B4B400ADADAD0098989800BEBEBE00B3B3
      B300B3B3B300D3D3D300B3B3B300D9D9D9000000000000000000000000000000
      0000000000000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E4E4E400E4E4E400E4E4E40000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DFDF
      DF00BBBBBB00C2C2C200CBCBCB00686868000000000000000000000000000000
      000000000000A3A3A3008383830054545400515151007C7C7C00A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A3008383830054545400515151007C7C7C00A3A3A3000000
      000000000000000000000000000000000000000000009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A0090909000000000000000000000000000000000006C6C6C006969
      6900000000000000000000000000000000000000000081818100686868006868
      68006C6C6C00696969006868680086868600000000000000000000000000A3A3
      A3005C5C5C005E5E5E005E5E5E005D5D5D005A5A5A00565656004F4F4F004646
      4600A3A3A300000000000000000000000000000000000000000000000000A3A3
      A3005C5C5C005E5E5E005E5E5E005D5D5D005A5A5A00565656004F4F4F004646
      4600A3A3A30000000000000000000000000000000000C7C7C700F3F3F300F3F3
      F3007070700070707000707070007070700070707000E0E0E000DDDDDD00DDDD
      DD00D5D5D5009090900000000000000000000000000099999900666666008686
      8600000000000000000000000000000000000000000000000000747474006E6E
      6E007D7D7D0069696900A1A1A100000000000000000000000000A0A0A0006363
      63006666660067676700696969006767670065656500616161005B5B5B005454
      5400494949008A8A8A0000000000000000000000000000000000A2A2A2006363
      63006666660067676700696969006767670065656500616161005B5B5B005454
      5400494949008A8A8A00000000000000000000000000C7C7C700F6F6F6008484
      8400E2E2E200FFFFFF00E2E2E200CECECE00A9A9A90070707000E6E6E600DDDD
      DD00D5D5D5009090900000000000000000000000000000000000000000006666
      6600000000000000000000000000000000000000000000000000000000008282
      82007272720086868600000000000000000000000000A3A3A30067676700FFFF
      FF00FFFFFF0085858500818181008C8C8C00FFFFFF00FFFFFF00676767005E5E
      5E005656560049494900A3A3A3000000000000000000A3A3A300676767007474
      74008080800085858500FFFFFF00FFFFFF008C8C8C006A6A6A0067676700FFFF
      FF00FFFFFF0049494900A3A3A3000000000000000000C7C7C700F6F6F600F6F6
      F60084848400E2E2E200FFFFFF00E2E2E200CECECE00A9A9A90070707000E6E6
      E600D8D8D8009090900000000000000000000000000000000000999999006666
      6600585858005C5C5C00555555005C5C5C005C5C5C005C5C5C007A7A7A008A8A
      8A006B6B6B00000000000000000000000000000000006A6A6A0083838300FFFF
      FF00FFFFFF00FFFFFF008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF006868
      68005E5E5E00545454004646460000000000000000006A6A6A00838383009090
      900090909000FFFFFF00FFFFFF00FFFFFF008C8C8C0081818100FFFFFF00FFFF
      FF00FFFFFF0055555500464646000000000000000000C7C7C700F9F9F900FDFD
      FD00F6F6F60084848400E2E2E200FFFFFF00E2E2E200CECECE00A9A9A9005A5A
      5A005A5A5A009090900000000000000000000000000000000000000000000000
      00006666660068686800616161006868680068686800686868008D8D8D007E7E
      7E007D7D7D00000000000000000000000000A3A3A300858585009C9C9C009D9D
      9D00FFFFFF00FFFFFF00FFFFFF008C8C8C008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00666666005B5B5B004F4F4F00A3A3A300A3A3A300858585009C9C9C009D9D
      9D00FFFFFF00FFFFFF00FFFFFF008C8C8C008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00666666005C5C5C004F4F4F00A3A3A30000000000C7C7C700FDFDFD00FDFD
      FD00FDFDFD00F6F6F60084848400E2E2E200FFFFFF00E2E2E2006F6F6F008383
      8300D5D5D5005A5A5A005A5A5A00000000000000000000000000000000009999
      9900666666008686860068686800686868009898980077777700979797006B6B
      6B0000000000000000000000000000000000A3A3A3009A9A9A00AEAEAE00A1A1
      A1008C8C8C00FFFFFF00FFFFFF00FFFFFF00909090008F8F8F00FFFFFF00FFFF
      FF00FFFFFF0061616100565656007C7C7C00A3A3A3009A9A9A00AEAEAE00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0090909000FFFFFF00FFFFFF00FFFFFF008181
      81006A6A6A0061616100565656007C7C7C0000000000C7C7C700FFFFFF00FFFF
      FF00FDFDFD00FDFDFD00FAFAFA0084848400E2E2E2006F6F6F00D5D5D500D5D5
      D5006F6F6F0083838300D5D5D5005A5A5A005A5A5A0058585800000000000000
      00000000000066666600A1A1A1004F4F4F00595959006A6A6A00888888007474
      74000000000000000000000000000000000083838300B4B4B400B7B7B700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005A5A5A005151510083838300B4B4B400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00656565005A5A5A005151510000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00FDFDFD00F6F6F6007E7E7E0095959500FFFFFF006F6F
      6F00D5D5D5009595950083838300D5D5D500858585004E4E4E00000000000000
      00009999990068686800BCBCBC005C5C5C005F5F5F009F9F9F00717171000000
      00000000000000000000000000000000000088888800C5C5C500BFBFBF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00646464005454540088888800C5C5C500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00676767005D5D5D005454540000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00FDFDFD0083838300D5D5D5006F6F6F00FFFF
      FF00D5D5D5009595950095959500838383000000000056565600404040004141
      4100424242003D3D3D004C4C4C005E5E5E008585850090909000747474000000
      000000000000000000000000000000000000ADADAD00C8C8C800CBCBCB00B1B1
      B1008C8C8C00FFFFFF00FFFFFF00FFFFFF009090900090909000FFFFFF00FFFF
      FF00FFFFFF00696969005E5E5E0083838300ADADAD00C8C8C800CBCBCB00FFFF
      FF00FFFFFF00FFFFFF008C8C8C0090909000FFFFFF00FFFFFF00FFFFFF008A8A
      8A0081818100696969005E5E5E008383830000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FDFDFD0083838300D5D5D5009595
      9500FFFFFF00D5D5D50095959500959595000000000091919100565656008B8B
      8B00AFAFAF00666666005B5B5B00555555009F9F9F0071717100000000000000
      000000000000000000000000000000000000A3A3A300BEBEBE00D8D8D800BBBB
      BB00FFFFFF00FFFFFF00FFFFFF008C8C8C0093939300FFFFFF00FFFFFF00FFFF
      FF0085858500686868005E5E5E00A3A3A300A3A3A300BEBEBE00D8D8D800BBBB
      BB00FFFFFF00FFFFFF00FFFFFF008C8C8C0093939300FFFFFF00FFFFFF00FFFF
      FF0085858500686868005E5E5E00A3A3A30000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA0083838300D5D5
      D50095959500FFFFFF00D5D5D50095959500000000000000000052525200CFCF
      CF0068686800686868005B5B5B0069696900909090006C6C6C00000000000000
      000000000000000000000000000000000000000000009F9F9F00D8D8D800FFFF
      FF00FFFFFF00FFFFFF008C8C8C008C8C8C00FFFFFF00FFFFFF00FFFFFF009090
      900080808000666666005C5C5C0000000000000000009F9F9F00D8D8D800D2D2
      D200B8B8B800FFFFFF00FFFFFF00FFFFFF008C8C8C0098989800FFFFFF00FFFF
      FF00FFFFFF00666666005C5C5C000000000000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E3E3E3008383
      8300D5D5D50095959500FFFFFF00D5D5D5000000000000000000858585007171
      7100A6A6A600666666005B5B5B00B7B7B7008080800000000000000000000000
      00000000000000000000000000000000000000000000A3A3A300BDBDBD00FFFF
      FF00FEFEFE00BBBBBB00B1B1B1008C8C8C00FFFFFF00FDFDFD009D9D9D009090
      90007474740063636300A3A3A3000000000000000000A3A3A300BDBDBD00DBDB
      DB00D2D2D200BBBBBB00FDFDFD00FFFFFF008C8C8C00A1A1A1009D9D9D00FCFC
      FC00FFFFFF0063636300A3A3A3000000000000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100929292009292
      920083838300D5D5D50095959500FFFFFF000000000000000000CDCDCD005555
      55005A5A5A007171710093939300898989000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00BDBD
      BD00D8D8D800D8D8D800CBCBCB00BFBFBF00B7B7B700AEAEAE009C9C9C008383
      830067676700A2A2A20000000000000000000000000000000000BBBBBB00BDBD
      BD00D8D8D800D8D8D800CBCBCB00BFBFBF00B7B7B700AEAEAE009C9C9C008383
      830067676700A2A2A200000000000000000000000000C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100A2A2A200D3D3
      D300C8C8C80083838300D5D5D500959595000000000000000000000000007F7F
      7F007D7D7D006E6E6E0000000000868686000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A3009F9F9F00BEBEBE00C8C8C800C5C5C500B4B4B4009A9A9A00858585006A6A
      6A00A3A3A300000000000000000000000000000000000000000000000000A3A3
      A3009F9F9F00BEBEBE00C8C8C800C5C5C500B4B4B4009A9A9A00858585006A6A
      6A00A3A3A30000000000000000000000000000000000C7C7C700FFFFFF00FFFF
      FF00FDFDFD00FDFDFD00FDFDFD00F9F9F900F9F9F900D5D5D500A3A3A300D5D5
      D500ABABAB000000000083838300D5D5D5000000000000000000000000008585
      8500808080008585850000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A300ADADAD008888880083838300A3A3A300A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A300ADADAD008888880083838300A3A3A300A3A3A3000000
      00000000000000000000000000000000000000000000C2C2C200C7C7C700C7C7
      C700C7C7C700C7C7C700C7C7C700C1C1C100C0C0C000ACACAC009A9A9A00ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000858585000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008D8D8D00636363004C4C
      4C00444444004F4F4F0060606000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A9A00C7C7C700A0A0
      A00086868600646464004C4C4C0041414100424242004B4B4B005C5C5C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003E3E3E003E3E3E003E3E
      3E003E3E3E003E3E3E003E3E3E003E3E3E003E3E3E003E3E3E003E3E3E003E3E
      3E003E3E3E00000000000000000000000000000000005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F
      5F005F5F5F000000000000000000000000000000000081818100F3F3F300DADA
      DA00DADADA00D6D6D600C6C6C600AAAAAA00929292006B6B6B00515151004545
      4500585858000000000000000000000000000000000061616100616161006161
      610061616100616161006161610061616100616161005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B000000000000000000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A0003E3E3E000000000000000000777777008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E005F5F5F000000000000000000D1D1D100A0A0A000D9D9D900E3E3
      E300E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200D0D0D000A1A1
      A1003E3E3E000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B005B5B5B0000000000A0A0A000D8D8D800D8D8D800D8D8
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8D800D8D8D800D8D8D800D8D8
      D800A0A0A0006A6A6A003E3E3E00000000008E8E8E00FFFFFF00DEDEDE006969
      6900FFFFFF00FFFFFF00C7C7C700C7C7C7005F5F5F005F5F5F005F5F5F00D8D8
      D800777777005F5F5F000000000000000000D1D1D100C1C1C100AFAFAF00EFEF
      EF00E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E2E2
      E2005C5C5C004D4D4D0000000000000000007B7B7B00D4D4D400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00F7F7F700FFFF
      FF009C9C9C008B8B8B007B7B7B005B5B5B00A0A0A000D8D8D800A0A0A000A0A0
      A0003E3E3E003E3E3E003E3E3E003E3E3E00A0A0A000A0A0A000A0A0A000D8D8
      D800A0A0A0006A6A6A003E3E3E00000000008E8E8E00FFFFFF005F5F5F005F5F
      5F005F5F5F005F5F5F008E8E8E008E8E8E00D8D8D800D6D6D600BBBBBB005F5F
      5F005F5F5F005F5F5F000000000000000000D1D1D100CACACA009C9C9C00F9F9
      F900F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EBEB
      EB00AAAAAA003B3B3B0000000000000000007B7B7B00DDDDDD007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B009C9C9C008B8B8B007B7B7B005B5B5B00A0A0A000D8D8D800D8D8D800D8D8
      D800A0A0A000A0A0A000A0A0A000A0A0A000D8D8D800D8D8D800D8D8D800D8D8
      D800A0A0A0006A6A6A003E3E3E00000000008E8E8E00FFFFFF00C7C7C700C7C7
      C700C7C7C70077777700A5A5A500B3B3B300EBEBEB00D6D6D600BBBBBB007070
      7000707070005F5F5F000000000000000000D1D1D100CDCDCD00B0B0B000E8E8
      E800F6F6F600F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500EDED
      ED00EDEDED005050500055555500B8B8B8007B7B7B00DDDDDD009C9C9C00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C008B8B8B007B7B7B0061616100A0A0A000D8D8D800D8D8D800D8D8
      D800D8D8D800D8D8D800D8D8D800D8D8D800D8D8D800D8D8D80097979700D8D8
      D800A0A0A0006A6A6A003E3E3E00000000008E8E8E00FFFFFF00FFFFFF00FFFF
      FF0077777700A5A5A500A5A5A500B3B3B300E0E0E000D6D6D600929292008080
      8000EFEFEF00B3B3B3005F5F5F0000000000B7B7B700D2D2D200DBDBDB00A2A2
      A200BDBDBD00D6D6D600E9E9E900FBFBFB00F8F8F800F8F8F800F8F8F800EFEF
      EF00F2F2F200A2A2A200404040008C8C8C007B7B7B00D4D4D400BBBBBB00BBBB
      BB00BBBBBB00BBBBBB00BBBBBB00BBBBBB00BBBBBB009C9C9C00B2B2B2006868
      68009C9C9C008B8B8B007B7B7B0061616100A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E3E003E3E3E003E3E
      3E003E3E3E003E3E3E003E3E3E0000000000000000008E8E8E008E8E8E008E8E
      8E008E8E8E00A5A5A500B3B3B300A5A5A500A5A5A5008E8E8E0077777700E0E0
      E000E0E0E000FFFFFF005F5F5F0000000000AFAFAF00EDEDED00E6E6E600E6E6
      E600E6E6E600C8C8C800B9B9B900B5B5B500FDFDFD00FCFCFC00F3F3F300D9D9
      D9008F8F8F00E1E1E1004A4A4A00727272007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00F7F7
      F700FFFFFF008B8B8B007B7B7B006161610000000000A0A0A000D8D8D800D8D8
      D800D8D8D800D8D8D800D8D8D800D8D8D8006A6A6A00D8D8D8006A6A6A003E3E
      3E006A6A6A00FFFFFF00D1D1D1003E3E3E000000000000000000000000007777
      7700E0E0E000EBEBEB00E0E0E000B3B3B3008E8E8E005F5F5F008E8E8E00B3B3
      B300EBEBEB00E0E0E000D8D8D8005F5F5F00B4B4B400F4F4F400F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300D9D9D900B4B4B400ADADAD0073737300A4A4
      A40096969600868686005858580079797900000000007B7B7B009C9C9C009C9C
      9C009C9C9C00A1A1A100A7A7A700A3A3A300A1A1A1009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C007B7B7B00616161000000000000000000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000A0A0A0006A6A6A00D8D8D800A0A0A000A0A0
      A000A0A0A000A0A0A000D1D1D1003E3E3E000000000000000000000000007777
      7700B3B3B300B3B3B300D8D8D8008E8E8E005F5F5F00F1F1F1005F5F5F008E8E
      8E00D8D8D800D8D8D800D8D8D8005F5F5F00BABABA00E9E9E900F3F3F300F3F3
      F300F3F3F300F1F1F100ECECEC00F7F7F700F6F6F600D1D1D100BDBDBD00BEBE
      BE00CACACA00949494004A4A4A006767670000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00EDEDED00D8D8D800D8D8
      D800D8D8D800D1D1D100D1D1D1003E3E3E000000000000000000000000007777
      7700A5A5A500A5A5A50077777700ADADAD008E8E8E005F5F5F008E8E8E00A5A5
      A500B3B3B300D8D8D800D8D8D8005F5F5F0000000000A1A1A100E2E2E200FBFB
      FB00FBFBFB00A8A8A8008A8A8A009A9A9A009E9E9E007F7F7F007B7B7B00C4C4
      C400D3D3D300A5A5A50064646400828282000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00F0F0F000F0F0F000F0F0
      F000EAEAEA00EAEAEA00E8E8E8003E3E3E000000000000000000000000000000
      00008E8E8E00808080008F8F8F0095959500ADADAD008E8E8E00B3B3B300EFEF
      EF00E5E5E500B3B3B3005F5F5F00000000000000000000000000B3B3B300A1A1
      A100A8A8A800B9B9B900000000000000000000000000000000007D7D7D008E8E
      8E009A9A9A007B7B7B008A8A8A00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00FFFFFF00FFFFFF00FFFF
      FF00F0F0F000EAEAEA00EAEAEA003E3E3E000000000000000000000000000000
      00007777770095959500959595007777770095959500D7D7D700C7C7C700B3B3
      B300EFEFEF00E5E5E5005F5F5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AFAFAF00BABA
      BA007E7E7E009B9B9B00ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003E3E3E003E3E3E000000000000000000000000000000
      000000000000777777007777770095959500BBBBBB00CCCCCC00B3B3B300C7C7
      C700C7C7C7005F5F5F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00E8E8E800E8E8E8003E3E3E000000000000000000000000000000
      000000000000000000007777770077777700BBBBBB00CCCCCC00C7C7C7007777
      7700777777000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000000000000000000000000000000000000000
      0000000000000000000000000000000000007777770077777700777777000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B1B1
      B100A0A0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009E9E9E00A4A4A4009E9E9E00000000009D9D9D00797979007272
      7200727272007272720072727200727272007272720072727200727272007070
      700072727200737373009E9E9E0000000000000000009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F00A4A4A4009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E00000000000000000033333300333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      33003333330033333300333333000000000000000000000000009D9D9D007979
      7900727272007272720072727200727272007272720072727200727272007272
      72007070700072727200737373009E9E9E0000000000C5C5C500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7007F7F7F009E9E9E00000000009D9D9D0072727200727272007272
      72007070700072727200737373009D9D9D007272720072727200727272007070
      700072727200737373009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE0033333300000000000000000000000000C5C5C500F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007F7F7F009E9E9E0000000000CACACA00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE007F7F7F009E9E9E0000000000C5C5C500F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007F7F7F00C5C5C500F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7007F7F7F009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE0033333300000000000000000000000000CACACA00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE007F7F7F009E9E9E0000000000CACACA00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00808080009E9E9E0000000000CACACA00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE007F7F7F00CACACA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE007F7F7F009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE0033333300333333003333330033333300EEEEEE003333
      3300EEEEEE00EEEEEE00333333000000000000000000B1B1B100CACACA00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00808080009E9E9E0000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFFF
      FF00FFFFFF00838383009E9E9E0000000000CACACA00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0080808000CACACA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00808080009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE0033333300000000009D9D9D0079797900CACACA00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00818181009E9E9E0000000000C2C2C200E7E7E700E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E2E2E200E2E2E200E2E2
      E200E0E0E000959595009E9E9E0000000000CACACA00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0081818100CACACA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00818181009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE0033333300333333003333330033333300EEEEEE003333
      3300EEEEEE00EEEEEE003333330000000000C5C5C500F7F7F700CBCBCB00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00828282009E9E9E000000000073737300737373007171
      7100717171007171710071717100717171007070700088888800828282008787
      87007E7E7E00ACACAC009E9E9E0000000000CBCBCB00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0082828200CBCBCB00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00828282009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE003333330000000000CACACA00FFFFFF00CCCCCC00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00848484009E9E9E0000000000A6A6A6009D9D9D009A9A
      9A009898980098989800979797009A9A9A009292920097979700979797009B9B
      9B00979797009B9B9B009E9E9E0000000000CCCCCC00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0084848400CCCCCC00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00848484009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE00333333003333330033333300333333003333330033333300333333003333
      3300EEEEEE00EEEEEE003333330000000000CACACA00FFFFFF00CFCFCF00FFFF
      FF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00838383009E9E9E00000000009D9D9D00797979007272
      7200727272007272720072727200727272007272720072727200727272007070
      700072727200737373009E9E9E0000000000CACACA00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0080808000CACACA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00808080009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE003333330000000000CACACA00FFFFFF00C2C2C200E7E7
      E700E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E2E2E200E2E2
      E200E2E2E200E0E0E000959595009E9E9E0000000000C5C5C500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7007F7F7F009E9E9E0000000000CACACA00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0081818100CACACA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00818181009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE00333333003333330033333300333333003333330033333300333333003333
      3300EEEEEE00EEEEEE003333330000000000CBCBCB00FFFFFF00737373007373
      7300717171007171710071717100717171007171710070707000888888008282
      8200878787007E7E7E00ACACAC009E9E9E0000000000CACACA00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE007F7F7F009E9E9E0000000000CBCBCB00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0082828200CBCBCB00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00828282009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE0033333300EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE003333330000000000CCCCCC00FFFFFF00A6A6A6009D9D
      9D009A9A9A009898980098989800979797009A9A9A0092929200979797009797
      97009B9B9B00979797009B9B9B000000000000000000CACACA00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00808080009E9E9E0000000000CCCCCC00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0084848400CCCCCC00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00848484009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE0033333300EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE003333330000000000CFCFCF00FFFFFF00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00838383009E9E9E00000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFFF
      FF00FFFFFF00838383009E9E9E0000000000CFCFCF00FEFEFE00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF0083838300CFCFCF00FEFEFE00FEFEFE00FEFEFE00FFFF
      FF00FFFFFF00838383009E9E9E00000000000000000033333300EEEEEE00EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE0033333300EEEEEE00EEEEEE003333
      3300EEEEEE00EEEEEE003333330000000000C2C2C200E7E7E700E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E2E2E200E2E2E200E2E2E200E0E0
      E000959595009E9E9E00000000000000000000000000C2C2C200E7E7E700E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E2E2E200E2E2E200E2E2
      E200E0E0E000959595009E9E9E0000000000C2C2C200E4E4E400E2E2E200E2E2
      E200E2E2E200E0E0E00095959500C2C2C200E4E4E400E2E2E200E2E2E200E2E2
      E200E0E0E000959595009E9E9E00000000000000000000000000333333003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333003333330000000000000000007373730073737300717171007171
      7100717171007171710071717100707070008888880082828200878787007E7E
      7E00ACACAC009E9E9E0000000000000000000000000073737300737373007171
      7100717171007171710071717100717171007070700088888800828282008787
      87007E7E7E00ACACAC009E9E9E00000000007373730070707000888888008282
      8200878787007E7E7E00ACACAC00737373007070700088888800828282008787
      87007E7E7E00ACACAC009E9E9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A6009D9D9D009A9A9A009898
      980098989800979797009A9A9A009292920097979700979797009B9B9B009797
      97009B9B9B0000000000000000000000000000000000A6A6A6009D9D9D009A9A
      9A009898980098989800979797009A9A9A009292920097979700979797009B9B
      9B00979797009B9B9B000000000000000000A6A6A60092929200979797009797
      97009B9B9B00979797009B9B9B00A6A6A6009292920097979700979797009B9B
      9B00979797009B9B9B00000000000000000000000000929292009F9F9F00A5A5
      A500A0A0A000A5A5A500ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900BFBFBF00DEDE
      DE00D4D4D400C7C7C700BCBCBC00A9A9A900ACACAC00A2A2A200939393009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000333333003333330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000868686008686860086868600868686007D7D7D007D7D
      7D00727272007272720072727200000000000000000097979700A9A9A900E5E5
      E500DFDFDF00DFDFDF00DFDFDF008787870065656500CDCDCD00C8C8C800BEBE
      BE00939393000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000008888880088888800888888008888
      8800888888008888880088888800888888008888880083838300838383000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000091919100FFFFFF00BDBDBD0086868600868686008686
      860097979700FFFFFF007D7D7D0000000000000000009D9D9D00B4B4B400E3E3
      E300E8E8E800E7E7E700E7E7E700DCDCDC009292920089898900E7E7E700DDDD
      DD00939393000000000000000000000000000000000000000000000000000000
      00000000000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00333333000000
      0000000000000000000000000000000000009B9B9B009B9B9B00B3B3B300B3B3
      B300B3B3B300B3B3B300ADADAD00ADADAD00ADADAD00ADADAD00ADADAD008888
      8800000000000000000000000000000000000000000000000000000000000000
      000000000000000000009191910086868600FFFFFF00BDBDBD00868686009B9B
      9B00FFFFFF00979797007D7D7D000000000000000000A3A3A300BFBFBF00DCDC
      DC00F0F0F000EFEFEF00EFEFEF00EFEFEF00C0C0C000C9C9C90089898900D8D8
      D800E6E6E6009393930000000000000000000000000000000000000000000000
      000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300000000000000000000000000000000009B9B9B00DDDDDD009B9B9B00B7B7
      B700B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300ADADAD00ADADAD00ADAD
      AD00888888000000000000000000000000000000000060606000606060006060
      60005D5D5D005D5D5D009B9B9B009B9B9B009B9B9B00FFFFFF00BDBDBD00FFFF
      FF009B9B9B0086868600868686000000000000000000A7A7A700C6C6C600ACAC
      AC00F2F2F200F5F5F500F4F4F400F4F4F400EAEAEA0097979700BEBEBE007A7A
      7A00ECECEC009393930000000000000000000000000000000000000000003333
      3300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00333333000000000000000000000000009B9B9B00F3F3F300DDDDDD009B9B
      9B00B7B7B700B7B7B700B7B7B700B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300ADADAD0088888800000000000000000000000000A8A8A800F5F5F500FAFA
      FA00FAFAFA00FAFAFA009B9B9B008686860086868600ABABAB00FFFFFF00BDBD
      BD008686860086868600868686000000000000000000ADADAD00D6D6D600ACAC
      AC00ACACAC00ACACAC00ACACAC00E9E9E900ECECEC00A3A3A300B3B3B3009999
      9900F5F5F5009393930000000000000000000000000000000000000000000000
      0000333333003333330033333300EEEEEE00EEEEEE0033333300333333003333
      3300000000000000000000000000000000009B9B9B00F3F3F300DDDDDD00DDDD
      DD009B9B9B00B7B7B700B7B7B700B7B7B700B7B7B700B7B7B700B7B7B700B3B3
      B300B3B3B300B3B3B300888888000000000000000000A8A8A800FAFAFA00FFFF
      FF00FFFFFF00FFFFFF009B9B9B0086868600BDBDBD00FFFFFF00ABABAB00FFFF
      FF00BDBDBD0086868600868686000000000000000000B3B3B300E3E3E300DEDE
      DE00DADADA00D9D9D900D3D3D300ACACAC00E7E7E7009D9D9D00B7B7B7009393
      9300F7F7F700E1E1E100ACACAC00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000009B9B9B00F3F3F300F3F3F300DDDD
      DD00DDDDDD009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B0000000000A8A8A800F5F5F500FAFA
      FA00FAFAFA00FAFAFA00A9A9A900C3C3C300FFFFFF00BDBDBD00868686009B9B
      9B00FFFFFF00BDBDBD00919191000000000000000000B9B9B900F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000ECECEC00ACACAC009D9D9D00AEAEAE009191
      9100D4D4D400E0E0E000ACACAC00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000009B9B9B00F3F3F300F3F3F300F3F3
      F300DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00888888000000
      00000000000000000000000000000000000000000000A8A8A800F5F5F500FAFA
      FA00FAFAFA00FAFAFA00A9A9A900FFFFFF00C3C3C30086868600868686008686
      86009B9B9B00FFFFFF00919191000000000000000000BBBBBB00F3F3F300F2F2
      F200F2F2F200F0F0F000E0E0E000D7D7D700C2C2C2009D9D9D00A6A6A6008F8F
      8F00ACACAC00ACACAC00ACACAC00000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000009B9B9B00F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300DDDDDD00888888000000
      00000000000000000000000000000000000000000000A8A8A800FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00A9A9A900A9A9A900A9A9A9009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B000000000000000000B4B4B400E9E9E900F6F6
      F600F2F2F200545454006D6D6D008B8B8B007F7F7F00ACACAC00ADADAD009191
      9100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000009B9B9B00F3F3F300F3F3F300F3F3
      F300888888009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B000000
      00000000000000000000000000000000000000000000A8A8A800F5F5F500FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00EEEEEE00EEEE
      EE00E4E4E4006060600000000000000000000000000000000000B8B8B800BDBD
      BD00BABABA0086868600838383009090900099999900ACACAC00B3B3B300A2A2
      A200848484007878780000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      000000000000000000000000000000000000000000009B9B9B009B9B9B009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      00008383830083838300838383000000000000000000BABABA00ABABAB00ABAB
      AB009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0086868600868686008686
      8600868686007373730000000000000000000000000000000000000000000000
      000000000000000000007B7B7B008B8B8B0098989800A3A3A300ABABAB00ACAC
      AC00979797000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE0033333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000083838300838383000000000000000000BABABA00BDBDBD00ABAB
      AB00ABABAB00ABABAB009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B008686
      8600EEEEEE007373730000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F008E8E8E0097979700949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000333333003333330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008383830000000000000000000000
      00008383830000000000838383000000000000000000BABABA00BABABA00BABA
      BA00BABABA00A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8
      A800A8A8A800A8A8A80000000000000000000000000000000000000000000000
      00000000000000000000000000007E7E7E007D7D7D0080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083838300838383008383
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007575750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B3009999990099999900999999009999990099999900999999009999
      99009999990099999900999999009999990000000000CFCFCF00D3D3D300D4D4
      D400D4D4D400D3D3D300D3D3D300D2D2D200D2D2D200D1D1D100D1D1D100D1D1
      D100D1D1D100ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005D5D
      5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005D5D5D005D5D5D005D5D5D009999990000000000D3D3D300EFEFEF00F1F1
      F100EFEFEF00EDEDED00EBEBEB00E9E9E900E7E7E700E6E6E600E4E4E400E4E4
      E400DDDDDD00AFAFAF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800969696009E9E
      9E00D6D6D600B6B6B600B6B6B600C3C3C300D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600C8C8C8005D5D5D009999990000000000D3D3D300F1F1F100F3F3
      F300F1F1F100EFEFEF00EDEDED00EBEBEB00E9E9E900E7E7E700E7E7E700E4E4
      E400DEDEDE00AFAFAF0000000000000000000000000000000000B1B1B100A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009E9E9E00A4A4A4009E9E9E00000000000000000000000000939393009393
      9300939393009393930093939300939393009393930093939300888888008888
      880088888800838383008383830000000000BABABA0083838300686868007B7B
      7B00555555003C3C3C003C3C3C003C3C3C0064646400B6B6B600CBCBCB00D6D6
      D600D6D6D600C8C8C8005D5D5D009999990000000000D3D3D300F3F3F300F4F4
      F400F3F3F300F1F1F100EFEFEF00EDEDED00EBEBEB00EAEAEA00E9E9E900E7E7
      E700DFDFDF00AFAFAF000000000000000000000000009D9D9D00797979007272
      7200727272007272720072727200727272007272720072727200727272007070
      700072727200737373009E9E9E0000000000000000000000000093939300F3F3
      F300CDCDCD00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00B3B3
      B300B3B3B3009393930088888800000000007B7B7B00ADADAD00B4B4B4006464
      6400878787008181810093939300ADADAD00ADADAD003C3C3C00ADADAD00D5D5
      D500DADADA00C8C8C8005D5D5D009999990000000000D4D4D400F5F5F500F6F6
      F600F4F4F400F3F3F300F1F1F100EFEFEF00EDEDED00EBEBEB00EAEAEA00E9E9
      E900E1E1E100B0B0B000000000000000000000000000C5C5C500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7007F7F7F009E9E9E00000000000000000093939300F3F3F300D5D5
      D500D5D5D500CDCDCD00CDCDCD00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00B3B3B3009393930093939300000000007B7B7B00878787006D6D6D008181
      81008181810064646400BFBFBF0074747400747474007474740064646400CBCB
      CB00DADADA00C8C8C8005D5D5D009999990000000000D4D4D400F7F7F700F9F9
      F900F6F6F600F4F4F400F3F3F300F1F1F100EFEFEF00EEEEEE00EDEDED00EBEB
      EB00E3E3E300B0B0B000000000000000000000000000CACACA00FFFFFF00FEFE
      FE00B6B6B60088888800B5B5B500FEFEFE00CCCCCC0096969600A0A0A000FEFE
      FE00FEFEFE007F7F7F009E9E9E00000000000000000093939300F3F3F300D5D5
      D500D5D5D500D5D5D500D5D5D500CDCDCD00CDCDCD00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00A2A2A2009393930000000000B6B6B600A5A5A5008C8C8C007F7F
      7F0052525200BFBFBF00E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000BFBF
      BF00E0E0E000C8C8C8005D5D5D009999990000000000D4D4D400F9F9F900FBFB
      FB00F9F9F900F6F6F600F5F5F500F3F3F300F1F1F100F0F0F000EFEFEF00EDED
      ED00E4E4E400B0B0B000000000000000000000000000CACACA00FFFFFF00FEFE
      FE0098989800818181008A8A8A00A5A5A50098989800818181008E8E8E00FEFE
      FE00FEFEFE00808080009E9E9E000000000093939300F3F3F300DDDDDD00DDDD
      DD00D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500CDCDCD00BFBFBF00BFBF
      BF00A2A2A200C7C7C700939393000000000000000000A2A2A200A3A3A3007F7F
      7F005252520052525200525252005252520052525200525252005D5D5D00CBCB
      CB00E2E2E200C8C8C8006E6E6E009999990000000000D5D5D500FBFBFB00FCFC
      FC00FBFBFB00F9F9F900F6F6F600F4F4F400F3F3F300F1F1F100F1F1F100EFEF
      EF00E6E6E600B1B1B100000000000000000000000000CACACA00FFFFFF00FEFE
      FE00D5D5D500A1A1A10084848400818181008181810091919100C0C0C000FEFE
      FE00FEFEFE00818181009E9E9E000000000093939300F3F3F300DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00D5D5D500D5D5D500D5D5D500D5D5D500CDCDCD00CDCD
      CD00A2A2A200D2D2D20093939300000000008787870068686800A2A2A2009292
      92007474740092929200929292007B7B7B0081818100939393006D6D6D00CBCB
      CB00EAEAEA00CBCBCB006E6E6E009999990000000000D5D5D500FCFCFC00FEFE
      FE00FCFCFC00FBFBFB00F9F9F900F6F6F600F4F4F400F3F3F300F3F3F300F1F1
      F100E7E7E700B1B1B100000000000000000000000000CBCBCB00FFFFFF00FEFE
      FE00FEFEFE00C2C2C2008484840081818100818181009D9D9D00FEFEFE00FEFE
      FE00FEFEFE00828282009E9E9E0000000000A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200C7C7C700D2D2D2009393930000000000B6B6B6008787870068686800A2A2
      A20062626200BFBFBF00FFFFFF006B6B6B00939393007B7B7B008D8D8D00E7E7
      E700EFEFEF00CBCBCB006E6E6E009999990000000000D5D5D500FCFCFC00FFFF
      FF00FEFEFE00FCFCFC00FBFBFB00F9F9F900F6F6F600F5F5F500F4F4F400F3F3
      F300E5E5E500B0B0B000000000000000000000000000CCCCCC00FFFFFF00FEFE
      FE00D7D7D7009C9C9C008181810081818100818181008A8A8A00B5B5B500FEFE
      FE00FEFEFE00848484009E9E9E000000000000000000A2A2A200F3F3F300E0E0
      E000E0E0E000E0E0E000E0E0E000DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DDDDDD00DDDDDD00939393000000000000000000B6B6B60087878700E1E1
      E1008989890072727200727272007F7F7F008787870075757500FFFFFF00F2F2
      F200F2F2F200CBCBCB007B7B7B009999990000000000D5D5D500FDFDFD00FFFF
      FF00FFFFFF00FEFEFE00FBFBFB00FAFAFA00F8F8F800F6F6F600F4F4F400E7E7
      E700D5D5D500ADADAD00000000000000000000000000CFCFCF00FFFFFF00FFFF
      FF00999999008181810092929200B9B9B900A6A6A6008383830088888800FFFF
      FF00FFFFFF00838383009E9E9E000000000000000000A2A2A200F9F9F900F3F3
      F300E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000F8F8F800F8F8
      F800F3F3F300F3F3F30093939300000000000000000000000000B6B6B6008787
      8700D0D0D000CACACA00A6A6A6009797970087878700FFFFFF00ADADAD00EAEA
      EA00F7F7F700CBCBCB00828282009999990000000000D5D5D500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00FAFAFA00F3F3F300DADADA00C3C3
      C300B9B9B900A9A9A900000000000000000000000000C2C2C200E7E7E700E4E4
      E400BABABA0091919100C7C7C700E7E7E700DFDFDF00A3A3A300A5A5A500E2E2
      E200E0E0E000959595009E9E9E000000000000000000A2A2A200F4F4F400F9F9
      F900F9F9F900F3F3F300F3F3F300E0E0E000F8F8F80093939300A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A20000000000000000000000000000000000A4A4
      A4008787870087878700878787008787870087878700FFFFFF00979797006E6E
      6E006E6E6E006E6E6E00828282000000000000000000D5D5D500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00E2E2E200B0B0B000ACAC
      AC00A6A6A600ABABAB0000000000000000000000000073737300737373007171
      7100717171007171710071717100717171007070700088888800828282008787
      87007E7E7E00ACACAC009E9E9E00000000000000000000000000A2A2A200F4F4
      F400F5F5F500F5F5F500F9F9F900F8F8F8009393930000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400FFFFFF00FFFFFF00EFEFEF00D0D0D000A8A8A800A8A8A800D0D0D0008282
      8200CBCBCB0087878700B3B3B3000000000000000000D5D5D500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E3E3E300B9B9B900BEBE
      BE00B6B6B600CECECE00000000000000000000000000A6A6A6009D9D9D009A9A
      9A009898980098989800979797009A9A9A009292920097979700979797009B9B
      9B00979797009B9B9B000000000000000000000000000000000000000000A2A2
      A200A2A2A200A2A2A200A2A2A200939393000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400FDFDFD00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008282
      820096969600B3B3B300000000000000000000000000D5D5D500F9F9F900F9F9
      F900F8F8F800F7F7F700F6F6F600F5F5F500F3F3F300DBDBDB00B9B9B900C8C8
      C800D5D5D5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A4009E9E9E008282
      8200B3B3B30000000000000000000000000000000000CECECE00D5D5D500D5D5
      D500D3D3D300D2D2D200D1D1D100D0D0D000CFCFCF00C1C1C100B5B5B500D7D7
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009595950072727200414141003F3F3F006D6D6D00959595000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009595
      9500434343004040400040404000404040003E3E3E003B3B3B00363636003535
      3500959595000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300333333003333330033333300333333003333
      3300333333003333330000000000000000000000000099999900999999008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600868686008686860083838300000000000000000000000000939393004444
      44004646460047474700484848004747470045454500434343003F3F3F003A3A
      3A00323232007D7D7D000000000000000000000000000000000000000000AAAA
      AA00A2A2A2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000000000000085858500858585008080
      8000808080007A7A7A007A7A7A0075757500757575006F6F6F006F6F6F006F6F
      6F006A6A6A006A6A6A0086868600868686000000000095959500474747005959
      5900686868006F6F6F006A6A6A00656565005E5E5E0049494900464646004141
      41003B3B3B00323232009595950000000000000000000000000000000000ACAC
      AC00ACACAC00A9A9A900B8B8B800939393008E8E8E007D7D7D007A7A7A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333333003333330033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE0033333300000000000000000088888800CFCFCF0088888800F3F3
      F300D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500A3A3A300F3F3F3006A6A6A0086868600000000004B4B4B006C6C6C007E7E
      7E00FFFFFF00FFFFFF007777770074747400717171006A6A6A00FFFFFF00FFFF
      FF00414141003A3A3A0035353500000000000000000000000000000000008585
      8500A6A6A600ACACAC00A6A6A6009C9C9C0070707000848484008A8A8A006060
      6000000000000000000000000000000000000000000000000000000000000000
      000033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE003333330000000000000000008D8D8D00CFCFCF0091919100F3F3
      F300DEDEDE00D5D5D500DEDEDE00D5D5D500DEDEDE00D5D5D500DEDEDE00DEDE
      DE00ACACAC00F3F3F3006A6A6A0086868600959595006F6F6F008D8D8D008E8E
      8E00FFFFFF00FFFFFF00FFFFFF007B7B7B007A7A7A00FFFFFF00FFFFFF00FFFF
      FF00464646003F3F3F00363636009595950000000000000000006A6A6A004A4A
      4A004A4A4A00A2A2A200ACACAC00A6A6A6007D7D7D007D7D7D00A9A9A9009C9C
      9C007A7A7A000000000000000000000000000000000000000000333333003333
      330033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE0033333300000000000000000091919100CFCFCF0095959500F3F3
      F300E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500B6B6B600F3F3F3006F6F6F0086868600959595008A8A8A00A2A2A2009292
      920088888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006A6A
      6A0049494900434343003B3B3B006D6D6D0000000000858585004E4E4E005656
      5600606060006E6E6E00B0B0B000AAAAAA00CACACA00EBEBEB00F5F5F500F7F7
      F700D2D2D200000000000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE0033333300000000000000000091919100CFCFCF009B9B9B00F3F3
      F300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00BFBFBF00F3F3F3006F6F6F00868686006D6D6D00AAAAAA00ADADAD009696
      96008989890081818100FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A7A007171
      71005E5E5E00454545003E3E3E003F3F3F0000000000858585005E5E5E006969
      69006C6C6C006969690060606000B3B3B300F0F0F000F0F0F000F9F9F900FDFD
      FD00FEFEFE00B3B3B3000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE0033333300000000000000000095959500D5D5D5009B9B9B00F3F3
      F300F3F3F300EEEEEE00F3F3F300EEEEEE00F3F3F300EEEEEE00F3F3F300F3F3
      F300C8C8C800F3F3F3006F6F6F008686860073737300BEBEBE00B7B7B7009C9C
      9C008D8D8D0083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007474
      7400656565004747470040404000414141000000000085858500696969007A7A
      7A00747474007D7D7D008B8B8B00E1E1E100E0E0E000F0F0F000F8F8F800FCFC
      FC00F8F8F800E1E1E1009494940000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE0033333300000000000000000098989800DEDEDE0095959500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2E2E200FFFFFF007575750099999900A0A0A000C1C1C100C5C5C500A6A6
      A60092929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007777
      77006A6A6A004848480040404000727272000000000089898900777777007D7D
      7D00929292009292920097979700E1E1E100E5E5E500EBEBEB00F5F5F500F7F7
      F700F2F2F200D7D7D700AAAAAA0000000000000000000000000033333300EEEE
      EE0033333300EEEEEE0033333300333333003333330033333300333333003333
      33003333330033333300000000000000000098989800E5E5E500E2E2E2009595
      95009595950095959500959595009595950095959500919191008D8D8D008888
      88008585850085858500858585000000000095959500B5B5B500D3D3D300B2B2
      B200FFFFFF00FFFFFF00FFFFFF008383830081818100FFFFFF00FFFFFF00FFFF
      FF006F6F6F0047474700404040009595950000000000989898007A7A7A009797
      9700ABABAB00B1B1B100B2B2B200D7D7D700FDFDFD00E8E8E800E8E8E800E5E5
      E500EDEDED00B8B8B8000000000000000000000000000000000033333300EEEE
      EE0033333300EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE003333
      3300000000000000000000000000000000009B9B9B00EEEEEE00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080008686860000000000000000000000000090909000D4D4D400CDCD
      CD00FFFFFF00FFFFFF00929292008D8D8D008989890088888800FFFFFF00FFFF
      FF0068686800464646004343430000000000000000009898980092929200ABAB
      AB00C3C3C300D4D4D400CDCDCD00C7C7C700E5E5E500FBFBFB00EDEDED00EBEB
      EB00CFCFCF00A9A9A9000000000000000000000000000000000033333300EEEE
      EE00333333003333330033333300333333003333330033333300333333003333
      3300000000000000000000000000000000009B9B9B00FFFFFF00F3F3F300EEEE
      EE00EEEEEE00F3F3F300FFFFFF008D8D8D008888880088888800858585008585
      8500808080000000000000000000000000000000000095959500B4B4B400D6D6
      D600CDCDCD00B2B2B200A6A6A6009C9C9C0096969600929292008E8E8E007E7E
      7E00595959004444440095959500000000000000000000000000B1B1B100BBBB
      BB00D4D4D400E3E3E300E3E3E300CACACA00ADADAD00A5A5A500B7B7B700A4A4
      A400B3B3B300000000000000000000000000000000000000000033333300EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE0033333300000000000000
      000000000000000000000000000000000000000000009B9B9B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0091919100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B200B4B4
      B400D4D4D400D3D3D300C5C5C500B7B7B700ADADAD00A2A2A2008D8D8D006C6C
      6C0047474700939393000000000000000000000000000000000000000000CACA
      CA00D4D4D400E3E3E300DBDBDB00C0C0C000A4A4A4007A7A7A007B7B7B00A6A6
      A600000000000000000000000000000000000000000000000000333333003333
      3300333333003333330033333300333333003333330033333300000000000000
      00000000000000000000000000000000000000000000000000009B9B9B009B9B
      9B00989898009898980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009595
      950090909000B5B5B500C1C1C100BEBEBE00AAAAAA008A8A8A006F6F6F004B4B
      4B00959595000000000000000000000000000000000000000000000000000000
      000000000000C9C9C900C7C7C700ADADAD00A4A4A4009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000095959500A0A0A000737373006D6D6D0095959500959595000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A3008383830054545400515151007C7C7C00A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A3008383830054545400515151007C7C7C00A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2E2E200C5C5C500C2C2C200CBCBCB000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00D3D3D300D4D4
      D400D4D4D400D3D3D300D3D3D300D2D2D200D2D2D200D1D1D100D1D1D100D1D1
      D100D1D1D100ADADAD000000000000000000000000000000000000000000A3A3
      A3005C5C5C005E5E5E005E5E5E005D5D5D005A5A5A00565656004F4F4F004646
      4600A3A3A300000000000000000000000000000000000000000000000000A3A3
      A3005C5C5C005E5E5E005E5E5E005D5D5D005A5A5A00565656004F4F4F004646
      4600A3A3A300000000000000000000000000000000000000000000000000E1E1
      E100BEBEBE00CBCBCB00E8E8E800E0E0E000D4D4D400BBBBBB00C1C1C100D2D2
      D200DBDBDB0000000000000000000000000000000000D3D3D300EFEFEF00F1F1
      F100EFEFEF00EDEDED00EBEBEB00E9E9E900E7E7E700E6E6E600E4E4E400E4E4
      E400DDDDDD00AFAFAF0000000000000000000000000000000000A2A2A2006363
      63006666660067676700696969006767670065656500616161005B5B5B005454
      5400494949008A8A8A0000000000000000000000000000000000A2A2A2006363
      63006666660067676700696969006767670065656500616161005B5B5B005454
      5400494949008A8A8A0000000000000000000000000000000000DDDDDD00CACA
      CA00CBCBCB00D0D0D000EBEBEB00E7E7E700E5E5E500AFAFAF00A0A0A000B1B1
      B100CDCDCD00C4C4C400BFBFBF000000000000000000D3D3D300F1F1F100F3F3
      F300F1F1F100EFEFEF00EDEDED00EBEBEB00E9E9E900E7E7E700E7E7E700E4E4
      E400DEDEDE00AFAFAF00000000000000000000000000A3A3A300676767007474
      7400808080008585850081818100FFFFFF00FFFFFF006A6A6A00666666005E5E
      5E005656560049494900A3A3A3000000000000000000A3A3A300676767007474
      7400808080008585850081818100FFFFFF00FFFFFF006A6A6A00666666005E5E
      5E005656560049494900A3A3A3000000000000000000DCDCDC00D0D0D000D4D4
      D400CFCFCF00D4D4D400EFEFEF00ECECEC00E7E7E700A8A8A80091919100A9A9
      A900DADADA00D7D7D700C1C1C1000000000000000000D3D3D300F3F3F300F4F4
      F400F3F3F3006D6D6D00C3C3C300A1A1A100A7A7A700C2C2C200E9E9E900E7E7
      E700DFDFDF00AFAFAF000000000000000000000000006A6A6A00838383009090
      9000909090008C8C8C00FFFFFF00FFFFFF00FFFFFF0081818100777777006767
      67005E5E5E00545454004646460000000000000000006A6A6A00838383009090
      9000909090008C8C8C008A8A8A00FFFFFF00FFFFFF00FFFFFF00777777006767
      67005E5E5E0054545400464646000000000000000000D1D1D100DBDBDB00D7D7
      D700D3D3D300D8D8D800F2F2F200EFEFEF00EBEBEB00A9A9A9008F8F8F00A7A7
      A700DDDDDD00D9D9D900C2C2C2000000000000000000D4D4D400F5F5F500F6F6
      F600F4F4F4006D6D6D007A7A7A00717171007C7C7C0080808000C2C2C200E9E9
      E900E1E1E100B0B0B0000000000000000000A3A3A300858585009C9C9C009D9D
      9D0096969600FFFFFF00FFFFFF00FFFFFF008D8D8D008C8C8C00858585007777
      7700666666005B5B5B004F4F4F00A3A3A300A3A3A300858585009C9C9C009D9D
      9D0096969600909090008F8F8F008F8F8F00FFFFFF00FFFFFF00FFFFFF007777
      7700666666005B5B5B004F4F4F00A3A3A30000000000D3D3D300DFDFDF00DADA
      DA00CFCFCF00D8D8D800F6F6F600F2F2F200EEEEEE00AAAAAA008F8F8F00A8A8
      A800E1E1E100DDDDDD00C5C5C5000000000000000000D4D4D400F7F7F700F9F9
      F900F6F6F6006D6D6D006D6D6D0096969600CDCDCD00BABABA0098989800D4D4
      D400E3E3E300B0B0B0000000000000000000A3A3A3009A9A9A00AEAEAE00A1A1
      A100FFFFFF00FFFFFF00FFFFFF0090909000909090008F8F8F008C8C8C008181
      81006A6A6A0061616100565656007C7C7C00A3A3A3009A9A9A00AEAEAE00A1A1
      A1009898980091919100909090009090900090909000FFFFFF00FFFFFF00FFFF
      FF006A6A6A0061616100565656007C7C7C0000000000D4D4D400DDDDDD00CDCD
      CD00BFBFBF00CCCCCC00F9F9F900F6F6F600F2F2F200DBDBDB00C5C5C500C2C2
      C200E4E4E400E0E0E000C6C6C6000000000000000000D4D4D400F9F9F900FBFB
      FB00F9F9F9006D6D6D006D6D6D006D6D6D006D6D6D00F0F0F000C4C4C400CECE
      CE00E4E4E400B0B0B000000000000000000083838300B4B4B400B7B7B700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00656565005A5A5A005151510083838300B4B4B400B7B7B700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00656565005A5A5A005151510000000000CECECE00D5D5D500CECE
      CE00C5C5C500C0C0C000E4E4E400F8F8F800F5F5F500F2F2F200EEEEEE00EBEB
      EB00E7E7E700E4E4E400C9C9C9000000000000000000D5D5D500FBFBFB00FCFC
      FC00E5E5E500F9F9F900F6F6F600F4F4F400F3F3F300F1F1F100F1F1F100EFEF
      EF00E6E6E600B1B1B100000000000000000088888800C5C5C500BFBFBF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00676767005D5D5D005454540088888800C5C5C500BFBFBF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00676767005D5D5D005454540000000000D1D1D100DBDBDB00D7D7
      D700CFCFCF00C7C7C700C3C3C300E5E5E500F9F9F900F5F5F500F1F1F100EEEE
      EE00EAEAEA00DBDBDB00B9B9B900E0E0E00000000000D5D5D500FCFCFC00FEFE
      FE00CECECE00E6E6E600F9F9F9006D6D6D006D6D6D006D6D6D006D6D6D00F1F1
      F100E7E7E700B1B1B1000000000000000000ADADAD00C8C8C800CBCBCB00B1B1
      B100FFFFFF00FFFFFF00FFFFFF009090900090909000909090008F8F8F008A8A
      8A0081818100696969005E5E5E0083838300ADADAD00C8C8C800CBCBCB00B1B1
      B100A1A1A10098989800939393009090900090909000FFFFFF00FFFFFF00FFFF
      FF0081818100696969005E5E5E0083838300E0E0E000CFCFCF00D7D7D700DBDB
      DB00D8D8D800D1D1D100C8C8C800C6C6C600ECECEC00F9F9F900F5F5F500F1F1
      F100E1E1E100B5B5B500D3D3D3000000000000000000D5D5D500FCFCFC00FFFF
      FF00DBDBDB006D6D6D00DEDEDE00EBEBEB00919191006D6D6D006D6D6D00F3F3
      F300E5E5E500B0B0B0000000000000000000A3A3A300BEBEBE00D8D8D800BBBB
      BB00ABABAB00FFFFFF00FFFFFF00FFFFFF009393930091919100909090008C8C
      8C0085858500686868005E5E5E00A3A3A300A3A3A300BEBEBE00D8D8D800BBBB
      BB00ABABAB009E9E9E009898980094949400FFFFFF00FFFFFF00FFFFFF008C8C
      8C0085858500686868005E5E5E00A3A3A30000000000DBDBDB00CFCFCF00D4D4
      D400DADADA00D9D9D900D2D2D200CACACA00C9C9C900E9E9E900F8F8F800E9E9
      E900B7B7B700D1D1D100000000000000000000000000D5D5D500FDFDFD00FFFF
      FF00FFFFFF00B2B2B200828282008787870076767600727272006D6D6D00E7E7
      E700D5D5D500ADADAD000000000000000000000000009F9F9F00D8D8D800D2D2
      D200B8B8B800ABABAB00FFFFFF00FFFFFF00FFFFFF0098989800969696009090
      900080808000666666005C5C5C0000000000000000009F9F9F00D8D8D800D2D2
      D200B8B8B800ABABAB00A1A1A100FFFFFF00FFFFFF00FFFFFF00969696009090
      900080808000666666005C5C5C00000000000000000000000000D8D8D800CCCC
      CC00D4D4D400DADADA00D9D9D900D3D3D300CACACA00CACACA00E4E4E400C6C6
      C600D2D2D20000000000000000000000000000000000D5D5D500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00B8B8B8009393930095959500BABABA006D6D6D00C3C3
      C300B9B9B900A9A9A900000000000000000000000000A3A3A300BDBDBD00DBDB
      DB00D2D2D200BBBBBB00B1B1B100FFFFFF00FFFFFF00A1A1A1009D9D9D009090
      90007474740063636300A3A3A3000000000000000000A3A3A300BDBDBD00DBDB
      DB00D2D2D200BBBBBB00B1B1B100FFFFFF00FFFFFF00A1A1A1009D9D9D009090
      90007474740063636300A3A3A30000000000000000000000000000000000DEDE
      DE00CDCDCD00D2D2D200D9D9D900DADADA00D4D4D400CCCCCC00BFBFBF00C2C2
      C2000000000000000000000000000000000000000000D5D5D500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00E2E2E200B0B0B000ACAC
      AC00A6A6A600ABABAB0000000000000000000000000000000000BBBBBB00BDBD
      BD00D8D8D800D8D8D800CBCBCB00BFBFBF00B7B7B700AEAEAE009C9C9C008383
      830067676700A2A2A20000000000000000000000000000000000BBBBBB00BDBD
      BD00D8D8D800D8D8D800CBCBCB00BFBFBF00B7B7B700AEAEAE009C9C9C008383
      830067676700A2A2A20000000000000000000000000000000000000000000000
      0000DBDBDB00CCCCCC00D2D2D200DADADA00E3E3E300C1C1C10087878700B6B6
      B6000000000000000000000000000000000000000000D5D5D500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E3E3E300B9B9B900BEBE
      BE00B6B6B600CECECE000000000000000000000000000000000000000000A3A3
      A3009F9F9F00BEBEBE00C8C8C800C5C5C500B4B4B4009A9A9A00858585006A6A
      6A00A3A3A300000000000000000000000000000000000000000000000000A3A3
      A3009F9F9F00BEBEBE00C8C8C800C5C5C500B4B4B4009A9A9A00858585006A6A
      6A00A3A3A3000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800EAEAEA000000000000000000C1C1C1007A7A7A00BCBC
      BC000000000000000000000000000000000000000000D5D5D500F9F9F900F9F9
      F900F8F8F800F7F7F700F6F6F600F5F5F500F3F3F300DBDBDB00B9B9B900C8C8
      C800D5D5D5000000000000000000000000000000000000000000000000000000
      000000000000A3A3A300ADADAD008888880083838300A3A3A300A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A300ADADAD008888880083838300A3A3A300A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800D8D8D800E7E7
      E7000000000000000000000000000000000000000000CECECE00D5D5D500D5D5
      D500D3D3D300D2D2D200D1D1D100D0D0D000CFCFCF00C1C1C100B5B5B500D7D7
      D70000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001C00300000000
      8001C003000000008001C001000000008001C001000000008001C00100000000
      8001C001000000008001C003000000008001C003000000008001C00300000000
      8001C003000000008001C003000000008001C003000000008001C00700000000
      8001C00F00000000FFFFFFFF00000000F87FFFFFFFFFFFFFF00FFFFFC003FF0F
      E007E007C003FE03E003C003C003FC01E003C003C003E001E003C003C003C001
      E003E003C0038001E003F807C0038001F003F00FC0038003F807E01FC0038007
      F80FE003C0038007F80FE003C003C007F81FF003C003F007FC1FF807C007F80F
      FE3FFC0FC00FFE3FFFFFFFFFFFFFFFFFFFFFFE3F801FF80FC7C7F80F000FF003
      C387E0070000E001E10FC0030000C001E00FC00100008001F01F800100008001
      E01F000000008001C0070000000080018003800000008003000180000000C007
      800380010000E00FF83FC0010001E01FFC7FC003000FE03FFC7FE007000FE03F
      FC7FF00F801FC07FFEFFFC3FE07FC07FC000FCFFFF3FFFFFC000F8FFFF1FFFFF
      C000F007E00FC001C000E007E0078001C000C007E0038001C000E00FF0078001
      C000F0FFFF0F8001C000F9FFFF9F800100038001800180010003800180018001
      0003800180018001000380018001800100038001800180010003800180018003
      000380018001FFFF000380018001FFFFF800FFFFF07F8000FC010001A01F0000
      9E010000000F00001E03000000030000DF030000000100008007000000010000
      E007000000010000C00F000000010000F00F000000010000E81F000000010000
      F83F000000010000FC7F000000010000F07F000000010000FCFF0001C0010408
      F9FF0001F00F0200FDFFFFFFFC7F0000F81FF81F8003CF80E007E00780038FC1
      C003C0038003EFE3800180018003C007800180018003F007000000008001E00F
      000000008000380F000000008000301F000000008000801F000000008000803F
      000000008000C03F800180018000C07F800180018000C0FFC003C0038000E2FF
      E007E0078004E3FFF81FF81F800FF7FF81FFFFFFFFFFFFFF801FFFFF80078007
      8007800300030003000700010001000300030000000100030003000000010003
      00000000000100010000000000018001000000008000E00000008000C000E000
      0000C001FF00E0008000FFFFFF00F001C3C0FFFFFF00F001FFC1FFFFFF00F803
      FFF7FFFFFF00FC07FFFFFFFFFF81FF1FFFFFE000800180018001C00080010001
      8001C000800100018001C0008001000180018000800100018001000080010001
      8001000080010001800100008001000180010000800100018001000080010001
      8001000080010001800100018001000180010003800100018001000380010001
      C003000380010001FFFF00078003000381FFFFFFFFFFFFFF800FFE7FFFFFFC01
      8007FC3F001FFC018007F81F000FFC018003F00F000780018003E00700038001
      8003F00F000180018001FC3F000080018001FC3F001F80018001FC3F001F8001
      800FFC3F001F8003C003FC3F8FF18003FC07FC3FFFF98003FE1FFE7FFF758003
      FE3FFFFFFF8FFFFFFF7FFFFFFFFFFFFFFFFFF0008003FFFFFFFFE0008003FFFF
      FFFF80008003C001C001000080038001C0010000800380018001000080038001
      8001000080038001000180008003800100010000800380010001000080038001
      80018000800380018001C000800380018001E00180038001C07FE00180038003
      E0FFE0038007FFFFFFFFE007800FFFFFF81FFFFFFFFFFFFFE007FFFFFC038001
      C003E7FFFC0380008001E01FF00300008001E00FF00300000000C007C0030000
      00008007C003000000008003C003000000008001C003000000008001C0030001
      00008003C00F000380018003C00F00078001C007C03F81FFC003E00FC03FC3FF
      E007F83FFFFFFFFFF81FFFFFFFFFFFFFF81FF81FF0FF8003E007E007E0078003
      C003C003C0018003800180018001800380018001800180030000000080018003
      0000000080018003000000008001800300000000800080030000000000018003
      000000008003800380018001C007800380018001E00F8003C003C003F00F8003
      E007E007F98F8007F81FF81FFF8F800F00000000000000000000000000000000
      000000000000}
  end
  object StatusCheckedImageList: TImageList
    BkColor = clFuchsia
    Height = 14
    Left = 336
    Top = 128
    Bitmap = {
      494C010106000900040010000E00FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002A0000000100200000000000002A
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
      000000000000000000000000000000000000FF00FF0089695400896954008969
      540079605200796052006B5549006B5549005C4B43005C4B430055453E005545
      3E004331290079605200FF00FF00FF00FF00FF00FF0066635F0066635F006663
      5F0066635F0066635F0066635F0066635F0066635F0066635F0066635F006663
      5F0066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E795A00DDD6D100F5F1ED00F5EE
      E700F5EEE700F3EBE400F3EBE400F3EBE400EFE8E000EFE8E000EFE8E000F5F1
      ED00DDD6D10043312900FF00FF00FF00FF00FF00FF00B0817E00FDE2C400FDE2
      C400FDE2C400FCDDB300FCDDB300FCDDB300FADBB000FADBB000FADBB000FADB
      B00066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FEF9F300FEF9F300FEF5
      EB00CEA27800CEA27800CEA27800CEA27800CEA27800CEA27800CEA27800CEA2
      7800F5F1ED0055453E00FF00FF00FF00FF00FF00FF00B0817E00FCE6D500F4DF
      CA00F4DFCA00F4DFCA00F4DFCA00F4DFCA00F4DFCA00FFFFFF00147DFF00147D
      FF00147DFF00147DFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00F5EEE700FEF9F300FEF5
      EB00CEA27800FFE0C700FFD9BC00FFE0C700FFE0C700FFE0C700FFE0C700CEA2
      7800EFE8E00055453E00FF00FF00FF00FF00FF00FF00B78D8C00F8EAD900FDD4
      A900FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FDD4A900FFFFFF00147D
      FF00147DFF00147DFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0A47E00F5EEE700FEF9F300FEF5
      EB00CEA27800FFFFFF00FFD9BC00FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA2
      7800EFE8E0005C4B4300FF00FF00FF00FF00FF00FF00B78D8C00FAECDD00FAEC
      DD00F8EAD900FCE6D500FCE6D500FDE4CD00FDE4CD00FFFFFF00147DFF00147D
      FF00147DFF00147DFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0A47E00F5EEE700FEF9F300FEF9
      F300CEA27800FFE0C700FFD9BC00FFE0C700FFE0C700FFE0C700FFE0C700CEA2
      7800F3EBE4005C4B4300FF00FF00FF00FF00FF00FF00CF9F8F00F9EDE100FDD4
      A900FDD4A900FDD4A900FDD4A900FDD4A900FFFFFF00147DFF00147DFF00147D
      FF00FFFFFF00147DFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0A47E00F5EEE700CEA27800CEA2
      7800CEA27800FFFFFF00FFD9BC00FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA2
      7800F3EBE4006B554900FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700F9EDE100FAECDD00FAECDD00FFFFFF00147DFF00147DFF00147DFF00FFFF
      FF0066635F00FFFFFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCB38C00FAEFEA00CEA27800FFE0
      C700CE9D5100CE863300CE863300CE863300CE782E00CE782E00CE782E00CE7F
      4400F3EBE4006B554900FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FDD4
      A900FDD4A900FDD4A900FDD4A900FDD4A900FFFFFF00147DFF00FFFFFF00FADB
      B00066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3BC9600FAEFEA00CEA27800FFFF
      FF00FFE0C700FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA27800FDF2E500FDF2
      E500F3EBE40079605200FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FBF2E700F9EFE500F9EDE100FAECDD00FFFFFF00F4DFCA00F7D9
      C90066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8C49F00F5EEE700CEA27800FFE0
      C700FFE0C700FFE0C700FFE0C700FFE0C700FFE0C700CEA27800FEF5EB00FEF5
      EB00F3EBE40079605200FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FDF4EE00F9EFE500F9EDE100F8EAD900F4DFCA00F5E5CE00F5E5
      CE0066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DECBA800F5F1ED00CEA27800FFFF
      FF00FFE0C700FFFFFF00FFFFFF00FFE0C700FFFFFF00CEA27800FEF9F300FEF9
      F300F5EEE70089695400FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FBF2E700FBF2E700F9EFE500FAECDD00FCE6D500F5E5CE00F5E5
      CE0066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4D2AF00FEF5EB00CE9D5100CE86
      3300CE863300CE863300CE782E00CE782E00CE782E00CE7F4400FEF9F300FEF9
      F300F5F1ED0089695400FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700F9EFE500FBF2E700FBF2E700FBF2E700FBF2E700DC865300DC865300DC86
      530066635F00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4D2AF00F4E9DB00FDF2E500F4E9
      DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F4E9DB00F5EE
      E700DDD6D10089695400FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700CF9F8F00E0B896006663
      5F00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4E9DB00E4D2AF00E4D2AF00DECB
      A800D8C49F00D3BC9600CCB38C00C0A47E00C0A47E00C0A47E00FF00FF00FF00
      FF009E795A00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00CF9F8F00CF9F
      8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F0066635F00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0093939300757574007A79
      79000000FF000000FF000175AC000175AC000175AC000000FF000000FF008383
      8300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7A28F007E7D
      7C0048433D0048433D0048433D0048433D0048433D005E5C5B0066635F00B0AF
      AE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0066635F0066635F006663
      5F0066635F0066635F0066635F0066635F0066635F0066635F0066635F006663
      5F0066635F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF002F24BB002F24BB002F24BB002F24BB00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF008383830075726D007A7979007B73
      6F005B8490000000FF000000FF0048CDEF000000FF000000FF006F6D6B007575
      7400757574005F606200FF00FF00FF00FF00FF00FF00D0A79C00F8CFC000FDE8
      E700FDE8E700FDDFDE00FDDFDE006B6A6700928E8C00BEBCBC00BCB9B9006663
      5F00B0AFAE00FF00FF00FF00FF00FF00FF00FF00FF00B0817E00F7D9C900FCE6
      D500FCE9C900FCE9C900FCE9C900FCDDB300FCDDB300FCDDB300FDD7A500FDD7
      A50066635F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006158CB00D6D4F800D5D3F900796DEB00796DEB002F24
      BB002F24BB00FF00FF00FF00FF00FF00FF009D9D9D00F9EDE100F8EAD900FAEC
      DD00BBD6D90059BBDC000000FF000000FF000000FF0096C2CB00FAECDD00F8EA
      D900FEF5E3007E7D7C00FF00FF00FF00FF00FF00FF00D7A28F00FFFFFF00FBF7
      F700FDF4EE00FDE8E700E5D8D50048433D00BCB9B900EDD1B600EDD1B600B0AF
      AE0066635F00FF00FF00FF00FF00FF00FF00FF00FF00B0817E00F7D9C900FCE6
      D500FDD7A500FDD7A500FDD7A500FDD4A900E0B89600E0B89600E0B89600FDD7
      A50066635F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006059CF00BBB7F300B3B5FF00D6D3F9006F69DF009289FE009289
      FE00746CEA002F24BB00FF00FF00FF00FF00AAAAAA009A9A9A009A9A9A009A9A
      9A007E9AAB005AC2E5000000FF000000FF000000FF004F86A000939393009A9A
      9A009A9A9A00A5A5A500FF00FF00FF00FF00FF00FF00DC988000FDDFDE00FDF4
      EE00FFFFFF00FFFFFF00E5D8D5006B6A6700BCB9B9007B736F00EDD1B600EDD1
      B60048433D00FF00FF00FF00FF00FF00FF00FF00FF00B78D8C00F9EDE100B78D
      8C00AC838200AC838200AC8382007E9AAB0084ACE6007CC4DF00AC838200FECA
      C90066635F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0033AC700033AC
      700033AC70006059CF00D9D7F900938EF000EEECFD006E66DC00746CEA00746C
      EA009289FE00473ECD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00B7B7B7000000FF000000FF002E7F98000000FF000000FF00FD06FC00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7A28F00DC98
      8000DC988000DC988000DC9880009A9A9A007A797900FDDFDE00FFFFFF00BCB9
      B90066635F00FF00FF00FF00FF00FF00FF00FF00FF00B78D8C00F9EDE100B78D
      8C00B0817E00AE705B008A8292007CC4DF007EE4F30079DCF3008AA4B400FECA
      C90066635F00FF00FF00FF00FF00FF00FF00FF00FF0064C09300D5FAE700D4FB
      E70079DEAF006059CF00DAD8F900EEEEFF00C8C5FF005C53D200796DEB00796D
      EB007E76F4004B41D100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000FF000000FF008C76730068554D000C0000000000FF000000FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00E8B09700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5A5004843
      3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00F9EDE1008AA4
      B4006F8CC000454545006F8CC000719DC3007CC4DF007CC4DF006F8CC000FECA
      C90066635F00FF00FF00FF00FF00FF00FF0065C3930072CA9E0070D09D00D4FB
      E70075D3A300B4902B00B4902B00B4902B00B4902B007670E500B7B2FF00B7B2
      FF007E76F4004C42D500FF00FF00FF00FF00FF00FF00FF00FF00BCB9B9009393
      930093939300868685007A797900565555002929290038353500565555007E7D
      7C00A5A5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7A2
      8F00FFFFFF00DC988000DC988000DC988000DC988000A5A5A50048433D00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00F9EDE10069A7
      CA005374C00023324E006390D3006390D30079DCF30079DCF3006390D300FECA
      C90066635F00FF00FF00FF00FF00FF00FF0065C39300D3FBE40074CFA200C0EE
      D700C6AB5E00F6EDD600F7EDD500E5CA7300E5CA7300B4902B00B4902B00B7B2
      FF00B7B2FF003E38B500FF00FF00FF00FF00FF00FF009A9A9A009D9D9D00A5A5
      A50083838300868685008A8A8A0056555500505050006B6A67005F6062005E5C
      5B005E5C5B007E7D7C00FF00FF00FF00FF00FF00FF00FF00FF00D0A79C00FDE4
      CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBCBC0048433D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FEF5E3006390
      D3003B5E7C001A46A7004094F3002D7CFA005BC2FB002D7CFA004094F300FECA
      C90066635F00FF00FF00FF00FF00FF00FF0065C39300D9FBEA00EFFEF500CAAC
      5F00F0E1BA00FFE3B300F7EED500DABB6F00F9DD8F00F9DD8F00E4C57200B490
      2B006059CF00FF00FF00FF00FF00FF00FF00B0AFAE009A9A9A008A8A8A009696
      96009D9D9D00AAAAAA00A1A1A1006F6D6B005E5C5B007A79790075726D004545
      45008C76730066635F00FF00FF00FF00FF00FF00FF00FF00FF00DC988000FFFF
      FF00DC988000DC988000DC988000DC9880006B6A67007B736F007B736F007B73
      6F007B736F00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E7001A46
      A70023324E001A46A7001640C4001544D9000C49E0000C49E0001544D900FECA
      C90066635F00FF00FF00FF00FF00FF00FF0065C39300FFFFFF00B9F8D800CAAC
      5F00F7EED800ECD29300FCF8ED00D7BB6C00E4C57200E4C57200F9DD8F00C6A3
      4500FF00FF00FF00FF00FF00FF00FF00FF009D9D9D00A1A1A100AAAAAA00B7B7
      B700D8D8D800D8D8D800C8C8C800BCB9B900B0AFAE0096969600757574002929
      29007E7D7C007A797900FF00FF00FF00FF00FF00FF00FF00FF00D7A28F00FDDF
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECDCB006B6A6700B0AFAE00B0AF
      AE005E5C5B00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E7004094
      F3001A46A7002673F7004094F30050B5F90079DCF3007CC4DF0050B5F900FECA
      C90066635F00FF00FF00FF00FF00FF00FF0065C39300B9F8D800A2EDC800CAAC
      5F00F7EFDA00FFF9EE00FDEDC700CCAD5900E5CA7300E5CA7300EECF7C00CAA7
      4800FF00FF00FF00FF00FF00FF00FF00FF00B3B3B300CECDCB00D8D8D800D8D8
      D800F0F0F000E4E4E400F0F0F000F0F0F000DEDEDF00E2E2E200DEDEDF00BEBC
      BC008A8A8A007E7D7C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DC98
      8000FFFFFF00DC988000DC988000DC988000DC988000BCB9B9006B6A6700B0AF
      AE005E5C5B00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E7006C9E
      F3002673F7002673F7004094F30050B5F9005BC2FB00FEF5E300FCE6D500FCE6
      D50066635F00FF00FF00FF00FF00FF00FF00FF00FF0065C393006DC89A00CAAC
      5F00FFFFFF00FCE8B500FCE8B500E0C27600FCE8B500FCE8B500EECF7C00CEAA
      4900FF00FF00FF00FF00FF00FF00FF00FF00BCB9B900BEBCBC00BCB9B9007575
      740086868500D8D8D800FFFFFF00FBF7F700E2E2E200FBF7F700DEDEDF00C8C8
      C800B3B3B300B7B7B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00DC988000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBCBC005E5C
      5B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700DC865300DC865300DC86
      530066635F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CAAC
      5F00FCE8B500F2DB9D00F4DEA300DFC27200F2DB9D00FCE8B500FCE8B500AF8F
      3E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BCB9B900BCB9B900B3B3
      B300B7B7B700CECDCB00E2E2E200DEDEDF00D3D3D300C5C5C500BCB9B900FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00DC988000DC988000DC988000DC988000DC988000DC988000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00FBF2E700FBF2
      E700FBF2E700FBF2E700FBF2E700FBF2E700FBF2E700CF9F8F00E0B896006663
      5F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00CAAC5F00CCAF6300F4DEA300E3C57800FCE8B500CAAC5F00CAAC5F00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CF9F8F00CF9F8F00CF9F
      8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F00CF9F8F0066635F00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CAAC5F00CAAC5F00CAAC5F00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00424D3E000000000000003E000000
      28000000400000002A0000000100010000000000500100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8003800700000000000380070000000080038003000000008003800300000000
      0003800300000000000380030000000000038003000000000003800700000000
      0003800700000000000380070000000000038007000000000003800700000000
      0003800F000000000037801F00000000800FC00F8007FE1F000380078007FC07
      000380078007F803000380078007C003F01FC00780078003F01FF00F80070003
      C007E01F800700038003C03F800700070003C0078007000F0003C0078007000F
      0003E0078007800F0003F00F8007E00F801FF81F800FF01FFFFFFFFF801FFC7F
      00000000000000000000000000000000000000000000}
  end
  object StatusImageList: TImageList
    BkColor = clFuchsia
    Height = 14
    Left = 304
    Top = 128
    Bitmap = {
      494C010106000900040010000E00FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002A0000000100200000000000002A
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
      000000000000000000000000000000000000FF00FF0066666600666666006666
      66005E5E5E005E5E5E00535353000000FF000000FF004A4A4A00444444004444
      44000000FF000000FF00FF00FF00FF00FF00FF00FF0062626200626262006262
      62006262620062626200626262000000FF000000FF0062626200626262006262
      62000000FF000000FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073737300D5D5D500F0F0F000ECEC
      EC00ECECEC00E9E9E900E9E9E900E9E9E9000000FF000000FF00E6E6E6000000
      FF000000FF0030303000FF00FF00FF00FF00FF00FF0085858500DBDBDB00DBDB
      DB00DBDBDB00D3D3D300D3D3D300D3D3D3000000FF000000FF00D1D1D1000000
      FF000000FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00F7F7F700F7F7F700F2F2
      F2009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A000000FF000000FF000000
      FF00F0F0F00044444400FF00FF00FF00FF00FF00FF0085858500E3E3E300DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB000000FF000000FF000000
      FF009898980098989800FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00ECECEC00F7F7F700F2F2
      F2009A9A9A00DBDBDB00D4D4D400DBDBDB00DBDBDB000000FF000000FF000000
      FF00E6E6E60044444400FF00FF00FF00FF00FF00FF0091919100E6E6E600CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB000000FF000000FF000000
      FF009898980098989800FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00ECECEC00F7F7F700F2F2
      F2009A9A9A00FFFFFF00D4D4D400FFFFFF000000FF000000FF00FFFFFF000000
      FF000000FF004A4A4A00FF00FF00FF00FF00FF00FF0091919100E9E9E900E9E9
      E900E6E6E600E3E3E300E3E3E300DFDFDF000000FF000000FF00989898000000
      FF000000FF0098989800FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00ECECEC00F7F7F700F7F7
      F7009A9A9A00DBDBDB00D4D4D4000000FF000000FF00DBDBDB00DBDBDB009A9A
      9A000000FF000000FF00FF00FF00FF00FF00FF00FF009F9F9F00EAEAEA00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB000000FF000000FF0098989800989898009898
      98000000FF000000FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00ECECEC009A9A9A009A9A
      9A009A9A9A00FFFFFF00D4D4D400FFFFFF00FFFFFF00DBDBDB00FFFFFF009A9A
      9A00E9E9E90053535300FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EAEAEA00E9E9E900E9E9E900FFFFFF00989898009898980098989800FFFF
      FF0062626200FFFFFF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAA00EEEEEE009A9A9A00DBDB
      DB008B8B8B007575750075757500757575006B6B6B006B6B6B006B6B6B007575
      7500E9E9E90053535300FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FFFFFF0098989800FFFFFF00D1D1
      D10062626200FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3B3B300EEEEEE009A9A9A00FFFF
      FF00DBDBDB00FFFFFF00FFFFFF00DBDBDB00FFFFFF009A9A9A00EFEFEF00EFEF
      EF00E9E9E9005E5E5E00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EDEDED00EAEAEA00E9E9E900FFFFFF00DBDBDB00D7D7
      D70062626200FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBB00ECECEC009A9A9A00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB009A9A9A00F2F2F200F2F2
      F200E9E9E9005E5E5E00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00F3F3F300EDEDED00EAEAEA00E6E6E600DBDBDB00DFDFDF00DFDF
      DF0062626200FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2C2C200F0F0F0009A9A9A00FFFF
      FF00DBDBDB00FFFFFF00FFFFFF00DBDBDB00FFFFFF009A9A9A00F7F7F700F7F7
      F700ECECEC0066666600FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EDEDED00E9E9E900E3E3E300DFDFDF00DFDF
      DF0062626200FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900F2F2F2008B8B8B007575
      750075757500757575006B6B6B006B6B6B006B6B6B0075757500F7F7F700F7F7
      F700F0F0F00066666600FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EDEDED00EFEFEF00EFEFEF00EFEFEF00EFEFEF0080808000808080008080
      800062626200FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C9C900E6E6E600EFEFEF00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600ECEC
      EC00D5D5D50066666600FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009F9F9F00B2B2B2006262
      6200FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600C9C9C900C9C9C900C2C2
      C200BBBBBB00B3B3B300AAAAAA009B9B9B009B9B9B009B9B9B00FF00FF00FF00
      FF0073737300FF00FF00FF00FF00FF00FF00FF00FF009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F0062626200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0093939300757574007A79
      7900397493000175AC000175AC000175AC000175AC0039749300838383008383
      8300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A2A2A2007C7C
      7C004141410041414100414141000000FF000000FF005B5B5B0062626200AEAE
      AE000000FF000000FF00FF00FF00FF00FF00FF00FF0062626200626262006262
      62006262620062626200626262000000FF000000FF0062626200626262006262
      62000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000FF000000FF005252520052525200FF00
      FF000000FF000000FF00FF00FF00FF00FF008383830075726D007A7979007B73
      6F005B8490001EC1EF0048CDEF0048CDEF0015A5D4003B5E7C006F6D6B007575
      7400757574005F606200FF00FF00FF00FF00FF00FF00A8A8A800CFCFCF00EAEA
      EA00EAEAEA00E2E2E200E2E2E200696969000000FF000000FF00B9B9B9000000
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF0085858500D7D7D700E3E3
      E300E1E1E100E1E1E100E1E1E100D3D3D3000000FF000000FF00CCCCCC000000
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF007B7B7B00DFDFDF000000FF000000FF00949494000000
      FF000000FF00FF00FF00FF00FF00FF00FF009D9D9D00F9EDE100F8EAD900FAEC
      DD00BBD6D90059BBDC00F0FEFE00F0FEFE0048A6C70096C2CB00FAECDD00F8EA
      D900FEF5E3007E7D7C00FF00FF00FF00FF00FF00FF00A2A2A200FFFFFF00F7F7
      F700F3F3F300EAEAEA00D8D8D80041414100B9B9B9000000FF000000FF000000
      FF0062626200FF00FF00FF00FF00FF00FF00FF00FF0085858500D7D7D700E3E3
      E300CCCCCC00CCCCCC00CCCCCC00CBCBCB00B2B2B2000000FF000000FF000000
      FF0062626200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF007D7D7D00C9C9C900CACACA00DEDEDE000000FF000000FF000000
      FF009292920052525200FF00FF00FF00FF00AAAAAA009A9A9A009A9A9A009A9A
      9A007E9AAB005AC2E500CAEDF100CAEDF10059BBDC004F86A000939393009A9A
      9A009A9A9A00A5A5A500FF00FF00FF00FF00FF00FF0098989800E2E2E200F3F3
      F300FFFFFF00FFFFFF00D8D8D80069696900B9B9B9000000FF000000FF000000
      FF0041414100FF00FF00FF00FF00FF00FF00FF00FF0091919100EAEAEA009191
      91008787870087878700878787009C9C9C00B9B9B9000000FF000000FF000000
      FF0062626200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008C8C8C008C8C
      8C008C8C8C007D7D7D00E1E1E100ABABAB00F1F1F1000000FF000000FF000000
      FF00ADADAD0069696900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00B7B7B70048A6C7005BA0BF002E7F98001A678200B7B7B700FD06FC00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A2A2A2009898
      98009898980098989800989898009A9A9A000000FF000000FF00FFFFFF000000
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF0091919100EAEAEA009191
      9100858585007070700087878700C4C4C4000000FF000000FF00A5A5A5000000
      FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00A8A8A800F0F0F000F0F0
      F000C4C4C4007D7D7D00E2E2E200F3F3F3000000FF000000FF00949494000000
      FF000000FF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00928E8C008C76730068554D000C00000066635F00A5A5A500FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00A5A5A5004141
      41000000FF000000FF00FF00FF00FF00FF00FF00FF009F9F9F00EAEAEA00A5A5
      A5009898980045454500989898000000FF000000FF00C4C4C40098989800CFCF
      CF000000FF000000FF00FF00FF00FF00FF00AAAAAA00B3B3B300B6B6B600F0F0
      F000BABABA0075757500757575000000FF000000FF0093939300C9C9C900C9C9
      C9000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00BCB9B9009393
      930093939300868685007A797900565555002929290038353500565555007E7D
      7C00A5A5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A2A2
      A200FFFFFF0098989800989898009898980098989800A5A5A50041414100FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EAEAEA00AAAA
      AA0087878700383838009F9F9F009F9F9F00D8D8D800D8D8D8009F9F9F00CFCF
      CF0062626200FF00FF00FF00FF00FF00FF00AAAAAA00EFEFEF00B7B7B700E2E2
      E20096969600E7E7E700E6E6E600B2B2B200B2B2B2007575750075757500C9C9
      C900C9C9C9005E5E5E00FF00FF00FF00FF00FF00FF009A9A9A009D9D9D00A5A5
      A50083838300868685008A8A8A0056555500505050006B6A67005F6062005E5C
      5B005E5C5B007E7D7C00FF00FF00FF00FF00FF00FF00FF00FF00A8A8A800DFDF
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBCBC0041414100FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00F0F0F0009F9F
      9F00636363005E5E5E00A7A7A70099999900C7C7C70099999900A7A7A700CFCF
      CF0062626200FF00FF00FF00FF00FF00FF00AAAAAA00F2F2F200F9F9F9009898
      9800D6D6D600D7D7D700E7E7E700A7A7A700C8C8C800C8C8C800AFAFAF007575
      75007D7D7D00FF00FF00FF00FF00FF00FF00B0AFAE009A9A9A008A8A8A009696
      96009D9D9D00AAAAAA00A1A1A1006F6D6B005E5C5B007A79790075726D004545
      45008C76730066635F00FF00FF00FF00FF00FF00FF00FF00FF0098989800FFFF
      FF00989898009898980098989800989898006969690072727200727272007272
      720072727200FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF005E5E
      5E00383838005E5E5E00626262006B6B6B006F6F6F006F6F6F006B6B6B00CFCF
      CF0062626200FF00FF00FF00FF00FF00FF00AAAAAA00FFFFFF00E7E7E7009898
      9800E8E8E800C1C1C100F5F5F500A6A6A600AFAFAF00AFAFAF00C8C8C8008A8A
      8A00FF00FF00FF00FF00FF00FF00FF00FF009D9D9D00A1A1A100AAAAAA00B7B7
      B700D8D8D800D8D8D800C8C8C800BCB9B900B0AFAE0096969600757574002929
      29007E7D7C007A797900FF00FF00FF00FF00FF00FF00FF00FF00A2A2A200E2E2
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC0069696900AEAEAE00AEAE
      AE005B5B5B00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00A7A7
      A7005E5E5E0092929200A7A7A700BEBEBE00D8D8D800C4C4C400BEBEBE00CFCF
      CF0062626200FF00FF00FF00FF00FF00FF00AAAAAA00E7E7E700D9D9D9009898
      9800E9E9E900F6F6F600E3E3E30097979700B2B2B200B2B2B200B9B9B9008E8E
      8E00FF00FF00FF00FF00FF00FF00FF00FF00B3B3B300CECDCB00D8D8D800D8D8
      D800F0F0F000E4E4E400F0F0F000F0F0F000DEDEDF00E2E2E200DEDEDF00BEBC
      BC008A8A8A007E7D7C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009898
      9800FFFFFF0098989800989898009898980098989800B9B9B90069696900AEAE
      AE005B5B5B00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00B2B2
      B2009292920092929200A7A7A700BEBEBE00C7C7C700F0F0F000E3E3E300E3E3
      E30062626200FF00FF00FF00FF00FF00FF00FF00FF00AAAAAA00B0B0B0009898
      9800FFFFFF00DADADA00DADADA00AEAEAE00DADADA00DADADA00B9B9B9009090
      9000FF00FF00FF00FF00FF00FF00FF00FF00BCB9B900BEBCBC00BCB9B9007575
      740086868500D8D8D800FFFFFF00FBF7F700E2E2E200FBF7F700DEDEDF00C8C8
      C800B3B3B300B7B7B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0098989800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBCBC005B5B
      5B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0080808000808080008080
      800062626200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009898
      9800DADADA00CACACA00CECECE00ADADAD00CACACA00DADADA00DADADA007A7A
      7A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BCB9B900BCB9B900B3B3
      B300B7B7B700CECDCB00E2E2E200DEDEDF00D3D3D300C5C5C500BCB9B900FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00989898009898980098989800989898009898980098989800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009F9F9F00B2B2B2006262
      6200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00989898009B9B9B00CECECE00B1B1B100DADADA009898980098989800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F0062626200FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00989898009898980098989800FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00424D3E000000000000003E000000
      28000000400000002A0000000100010000000000500100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8003800300000000000380070000000080038003000000008003800300000000
      0003800300000000000380030000000000038003000000000003800700000000
      0003800700000000000380070000000000038007000000000003800700000000
      0003800F000000000037801F00000000800FC0038003FE13000380078007FC07
      000380078007F803000380078007C003F01FC00780078003F81FF00380030003
      C007E01F800700038003C03F800700070003C0078007000F0003C0078007000F
      0003E0078007800F0003F00F8007E00F801FF81F800FF01FFFFFFFFF801FFC7F
      00000000000000000000000000000000000000000000}
  end
  object LargeImageList: TImageList
    Left = 272
    Top = 128
  end
  object SideMemoPopup: TPopupMenu
    Left = 16
    Top = 228
    object CreateMemoItem: TMenuItem
      Caption = #26032#35215#12450#12452#12486#12512#20316#25104
      OnClick = CreateMemoItemClick
    end
    object DeleteMemoItem: TMenuItem
      Caption = #21066#38500
      OnClick = DeleteMemoItemClick
    end
  end
  object SideMemoTabPopup: TPopupMenu
    Left = 48
    Top = 228
    object CreateMemo: TMenuItem
      Caption = #26032#35215#12513#12514#20316#25104
      OnClick = CreateMemoClick
    end
    object DeleteMemo: TMenuItem
      Caption = #21066#38500
      OnClick = DeleteMemoClick
    end
  end
  object SidebarPopup: TPopupMenu
    Left = 80
    Top = 228
    object N32: TMenuItem
      Action = actBookmarkSidebar
    end
    object N33: TMenuItem
      Action = actHistorySidebar
    end
    object N34: TMenuItem
      Action = actGrepSidebar
    end
    object Grep1: TMenuItem
      Action = actLinkSidebar
    end
    object Web2: TMenuItem
      Action = actScriptSidebar
    end
    object N35: TMenuItem
      Action = actClipboardSidebar
    end
    object N40: TMenuItem
      Action = actMemoSidebar
    end
    object N41: TMenuItem
      Action = actTransferSidebar
    end
    object N42: TMenuItem
      Action = actUserDefinedSidebar
    end
    object Output1: TMenuItem
      Action = actOutputSidebar
      AutoCheck = True
    end
  end
  object ExtractPopup: TPopupMenu
    Left = 80
    Top = 260
    object a1: TMenuItem
      AutoCheck = True
      Caption = #12522#12531#12463#12450#12531#12459#12540#65288'<a>'#65289
      Checked = True
      Enabled = False
    end
    object img1: TMenuItem
      AutoCheck = True
      Caption = #30011#20687#65288'<img>'#65289
      Enabled = False
    end
    object N54: TMenuItem
      AutoCheck = True
      Caption = #32972#26223#30011#20687
      Enabled = False
    end
    object embed1: TMenuItem
      AutoCheck = True
      Caption = '<embed>'
      Enabled = False
    end
    object object1: TMenuItem
      AutoCheck = True
      Caption = '<object>'
      Enabled = False
    end
    object N48: TMenuItem
      Caption = '-'
    end
    object N49: TMenuItem
      AutoCheck = True
      Caption = #33258#21205#30340#12395#12501#12451#12523#12479#12522#12531#12464#12377#12427
      Enabled = False
    end
    object N51: TMenuItem
      Caption = '-'
    end
    object URL2: TMenuItem
      AutoCheck = True
      Caption = #12486#12461#12473#12488#12392'URL'#12434#34920#31034
      Checked = True
      Enabled = False
      GroupIndex = 1
      RadioItem = True
    end
    object N50: TMenuItem
      AutoCheck = True
      Caption = #12486#12461#12473#12488#12398#12415#34920#31034
      Enabled = False
      GroupIndex = 1
      RadioItem = True
    end
    object URL3: TMenuItem
      AutoCheck = True
      Caption = 'URL'#12398#12415#34920#31034
      Enabled = False
      GroupIndex = 1
      RadioItem = True
    end
    object N52: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N55: TMenuItem
      AutoCheck = True
      Caption = #36984#25246#31684#22258#12363#12425#25277#20986
      Enabled = False
      GroupIndex = 2
      RadioItem = True
    end
    object N56: TMenuItem
      AutoCheck = True
      Caption = #12377#12409#12390#12363#12425#25277#20986
      Checked = True
      Enabled = False
      GroupIndex = 2
      RadioItem = True
    end
    object N57: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object N53: TMenuItem
      Caption = #35443#32048#35373#23450'...'
      Enabled = False
      GroupIndex = 2
    end
  end
  object ExtractSavePopup: TPopupMenu
    Left = 48
    Top = 260
    object URL4: TMenuItem
      Caption = #21336#32020#12394'URL'#12522#12473#12488#12392#12375#12390#20445#23384
    end
    object URL5: TMenuItem
      Caption = #12481#12455#12483#12463#28168#12415'URL'#12434#12480#12454#12531#12525#12540#12489
    end
  end
  object DLPopupMenu: TPopupMenu
    Left = 16
    Top = 260
    object Open2: TMenuItem
      Caption = #38283#12367
      Default = True
    end
    object N44: TMenuItem
      Caption = #20445#23384#12501#12457#12523#12480#12434#38283#12367
    end
    object URI1: TMenuItem
      Caption = 'URI'#12398#12467#12500#12540
    end
    object N45: TMenuItem
      Caption = #20572#27490
    end
    object Delete1: TMenuItem
      Caption = #21066#38500
      Enabled = False
    end
    object N46: TMenuItem
      Caption = '-'
    end
    object Property1: TMenuItem
      Caption = #12503#12525#12497#12486#12451
      Enabled = False
    end
  end
  object DLToolPopup: TPopupMenu
    Left = 16
    Top = 292
    object DLAllImages: TMenuItem
      Caption = #30011#20687#12434#12377#12409#12390#12480#12454#12531#12525#12540#12489
    end
    object Flash1: TMenuItem
      Caption = 'Flash'#12434#12377#12409#12390#12480#12454#12531#12525#12540#12489
      Enabled = False
    end
  end
  object BookmarksPopup: TPopupMenu
    Left = 48
    Top = 292
    object BookmarkPOpen: TMenuItem
      Action = actOpenBookmark
      Default = True
    end
    object N68: TMenuItem
      Caption = '-'
    end
    object BookmarkPNewFolder: TMenuItem
      Caption = #26032#12375#12356#12501#12457#12523#12480
      OnClick = BookmarkPNewFolderClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object BookmarkPCopy: TMenuItem
      Action = actCopyBookmark
    end
    object BookmarkPCut: TMenuItem
      Action = actCutBookmark
    end
    object BookmarkPPaste: TMenuItem
      Action = actPasteBookmark
    end
    object BookmarkPDelete: TMenuItem
      Action = actDeleteBookmark
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object BookMarkPProps: TMenuItem
      Action = actBookmarkProperty
    end
  end
  object HistoryOrderPopup: TPopupMenu
    Left = 80
    Top = 292
    object HistorySortByVisit: TMenuItem
      Caption = #35370#21839#38918
      OnClick = HistorySortByVisitClick
    end
    object HistorySortByDate: TMenuItem
      Caption = #26085#20184#38918
      OnClick = HistorySortByDateClick
    end
    object HistorySortBySite: TMenuItem
      Caption = #12469#12452#12488#38918
      OnClick = HistorySortBySiteClick
    end
  end
  object ForwardHistoryPopup: TPopupMenu
    OnPopup = ForwardHistoryPopupPopup
    Left = 240
    Top = 168
  end
  object BackHistoryPopup: TPopupMenu
    OnPopup = BackHistoryPopupPopup
    Left = 208
    Top = 168
  end
  object TaskTrayPopup: TPopupMenu
    Left = 464
    Top = 168
    object miTaskTray: TMenuItem
      AutoCheck = True
    end
    object Bagel1: TMenuItem
    end
  end
  object GoUpPopup: TPopupMenu
    Left = 272
    Top = 168
  end
  object LinkListPopup: TPopupMenu
    Left = 336
    Top = 168
    object OpenLinkListItem: TMenuItem
      Caption = #38283#12367
      Default = True
      OnClick = OpenLinkListItemClick
    end
    object CopyLinkListURL: TMenuItem
      Caption = 'URL'#12434#12467#12500#12540
      OnClick = CopyLinkListURLClick
    end
    object CopyLinkListText: TMenuItem
      Caption = #12486#12461#12473#12488#12434#12467#12500#12540
      OnClick = CopyLinkListTextClick
    end
    object CopyLinkListBoth: TMenuItem
      Caption = #20001#26041#12467#12500#12540
      OnClick = CopyLinkListBothClick
    end
    object CopyLinkForDownloader: TMenuItem
      Caption = #12480#12454#12531#12525#12540#12480#12395#28193#12377
      Enabled = False
    end
  end
  object GeckoInputPopup: TPopupMenu
    Left = 400
    Top = 168
    object GPICopy: TMenuItem
      Caption = #12467#12500#12540
      OnClick = GPICopyClick
    end
    object GPICut: TMenuItem
      Caption = #20999#12426#21462#12426
      OnClick = GPICutClick
    end
    object GPIPaste: TMenuItem
      Caption = #36028#12426#12388#12369
      OnClick = GPIPasteClick
    end
    object GPISep1: TMenuItem
      Caption = '-'
    end
    object GPISelectAll: TMenuItem
      Caption = #20840#12390#36984#25246
      OnClick = GPISelectAllClick
    end
  end
  object ToolbarPopup: TPopupMenu
    Left = 432
    Top = 168
    object ToolbarPPref: TMenuItem
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object actToggleMainbarVisible1: TMenuItem
      AutoCheck = True
      Visible = False
    end
    object MenuToggleSearchBar: TMenuItem
      AutoCheck = True
    end
    object N3: TMenuItem
      AutoCheck = True
    end
    object N4: TMenuItem
      AutoCheck = True
    end
    object N5: TMenuItem
      AutoCheck = True
    end
    object N6: TMenuItem
      AutoCheck = True
    end
  end
  object RewindPopup: TPopupMenu
    OnPopup = RewindPopupPopup
    Left = 208
    Top = 208
  end
  object FForwardPopup: TPopupMenu
    OnPopup = FForwardPopupPopup
    Left = 240
    Top = 208
  end
  object ChevronPopupMenu: TPopupMenu
    OwnerDraw = True
    Left = 304
    Top = 208
  end
  object ChevronLinkMenu: TPopupMenu
    Left = 336
    Top = 208
    object d1: TMenuItem
      Caption = 'd'
    end
  end
  object UpMenuPopup: TPopupMenu
    Left = 368
    Top = 208
  end
  object GoButtonPopup: TPopupMenu
    OnPopup = GoButtonPopupPopup
    Left = 400
    Top = 208
    object N59: TMenuItem
      Caption = #20837#21147#12375#12383#12450#12489#12524#12473#12395#31227#21205
      Default = True
    end
    object N60: TMenuItem
      Caption = '-'
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 464
    Top = 128
  end
  object MainMenu1: TMainMenu
    OwnerDraw = True
    Left = 208
    Top = 248
    object GoMenu: TMenuItem
      Caption = #31227#21205'(&G)'
      object GoUpListMenu: TMenuItem
        Caption = #12373#12425#12395#19978#12398#38542#23652
        OnClick = GoUpListMenuClick
        object GoUpDummyMenu: TMenuItem
          Visible = False
        end
      end
    end
    object ToolsMenu: TMenuItem
      Caption = #12484#12540#12523'(&T)'
      object ToolPCmdExt: TMenuItem
        Caption = #12467#12510#12531#12489#22411#25313#24373'(&C)'
        GroupIndex = 6
      end
      object ToolPScript: TMenuItem
        Caption = #12473#12463#12522#12503#12488'(&S)'
        GroupIndex = 6
        object N65: TMenuItem
          Caption = '-'
        end
        object N64: TMenuItem
        end
      end
      object ToolPCookieConfig: TMenuItem
        Caption = 'Cookie'#12510#12493#12540#12472#12515
        GroupIndex = 6
        OnClick = ToolPCookieConfigClick
        object ObeyDefaultThisSiteCookie: TMenuItem
          AutoCheck = True
          Caption = #12487#12501#12457#12523#12488#12398'Cookie'#35373#23450#12395#24467#12358
          GroupIndex = 1
          RadioItem = True
          OnClick = ThisSiteCookieClick
        end
        object AllowThisSiteCookie: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = #12371#12398#12469#12452#12488#12363#12425#12398'Cookie'#12434#35377#21487#12377#12427
          GroupIndex = 1
          RadioItem = True
          OnClick = ThisSiteCookieClick
        end
        object AllowThisSiteSessionCookie: TMenuItem
          Tag = 8
          AutoCheck = True
          Caption = #12371#12398#12469#12452#12488#12363#12425#12398'Cookie'#12434#12475#12483#12471#12519#12531#38291#12384#12369#35377#21487
          GroupIndex = 1
          RadioItem = True
          OnClick = ThisSiteCookieClick
        end
        object DenyThisSiteCookie: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = #12371#12398#12469#12452#12488#12363#12425#12398'Cookie'#12434#25298#21542#12377#12427
          GroupIndex = 1
          RadioItem = True
          OnClick = ThisSiteCookieClick
        end
        object N38: TMenuItem
          Caption = '-'
          GroupIndex = 2
        end
        object CookiePLifeTime: TMenuItem
          Caption = 'Cookie'#12398#20445#23384#26399#38291
          GroupIndex = 3
          OnClick = CookiePLifeTimeClick
          object CookieLifetimeNormal: TMenuItem
            AutoCheck = True
            Caption = #12469#12452#12488#12398#25351#23450#26399#38480#12414#12391
            GroupIndex = 3
            RadioItem = True
            OnClick = CookieLifetimeNormalClick
          end
          object CookieLifetimeSession: TMenuItem
            AutoCheck = True
            Caption = 'Bagel'#12364#32066#20102#12377#12427#12414#12391
            GroupIndex = 3
            RadioItem = True
            OnClick = CookieLifetimeSessionClick
          end
          object CookieLifetimeAskEach: TMenuItem
            AutoCheck = True
            Caption = #27598#22238#30906#35469#12377#12427
            GroupIndex = 3
            RadioItem = True
            OnClick = CookieLifetimeAskEachClick
          end
        end
        object N39: TMenuItem
          Caption = '-'
          GroupIndex = 4
        end
        object DenyAllCookie: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = #12377#12409#12390#12398'Cookie'#12434#25298#21542
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object CookieP3PHigh: TMenuItem
          Tag = 23
          AutoCheck = True
          Caption = #39640
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object DenyOtherSiteCookie: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = #21516#12376#12469#12452#12488#20197#22806#12363#12425#12398'Cookie'#12434#25298#21542
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object CookieP3PCustom: TMenuItem
          Tag = 33
          AutoCheck = True
          Caption = #12459#12473#12479#12512
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object CookieP3PMedium: TMenuItem
          Tag = 13
          AutoCheck = True
          Caption = #20013
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object CookieP3PLow: TMenuItem
          Tag = 3
          AutoCheck = True
          Caption = #20302
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object AllowAllCookie: TMenuItem
          AutoCheck = True
          Caption = #12377#12409#12390#12398'Cookie'#12434#35377#21487
          GroupIndex = 5
          RadioItem = True
          OnClick = DenyAllowCookieMenuClick
        end
        object N37: TMenuItem
          Caption = '-'
          GroupIndex = 6
        end
        object N36: TMenuItem
          GroupIndex = 7
        end
        object ToolPOpenCookieMan: TMenuItem
          GroupIndex = 8
        end
      end
    end
    object hiddenMenu: TMenuItem
      Caption = #31192#20253#12513#12491#12517#12540
      Visible = False
      object AddToMemo: TMenuItem
        Caption = #12513#12514#12395#36861#21152
        OnClick = AddToMemoClick
        object InsertPointofMemoList1: TMenuItem
          Caption = 'Insert Point of MemoList'
          Visible = False
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 240
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 248
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 304
    Top = 248
  end
  object DelayedSidebarToggler: TTimer
    Enabled = False
    OnTimer = DelayedSidebarTogglerTimer
    Left = 208
    Top = 288
  end
  object AutoScrollTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = AutoScrollTimerTimer
    Left = 240
    Top = 288
  end
  object TimerFireSetfocus: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerFireSetfocusTimer
    Left = 272
    Top = 288
  end
  object bbgSaveTimer: TTimer
    Enabled = False
    OnTimer = bbgSaveTimerTimer
    Left = 304
    Top = 288
  end
  object BagelTrayIcon: TTrayIcon
    PopupMenu = TaskTrayPopup
    OnDblClick = BagelTrayIconDblClick
    Left = 336
    Top = 248
  end
  object DelayedSearchButtonCreator: TTimer
    Enabled = False
    Interval = 100
    OnTimer = DelayedSearchButtonCreatorTimer
    Left = 336
    Top = 288
  end
  object RandomProxySelector: TTimer
    Enabled = False
    OnTimer = RandomProxySelectorTimer
    Left = 368
    Top = 288
  end
  object NewTabPopup: TPopupMenu
    Left = 240
    Top = 128
    object N8: TMenuItem
      Action = actAddTabBlank
    end
    object N9: TMenuItem
      Action = actAddTabClip
    end
    object N10: TMenuItem
      Action = actAddTabCurr
    end
    object N11: TMenuItem
      Action = actAddTabHome
    end
  end
end
