object frmCookieMan: TfrmCookieMan
  Left = 210
  Top = 165
  Caption = 'Cookie'#31649#29702
  ClientHeight = 386
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 412
    Height = 355
    ActivePage = StoredCookieSheet
    Align = alClient
    TabOrder = 0
    object StoredCookieSheet: TTabSheet
      Caption = #20445#23384#12373#12428#12390#12356#12427'Cookie'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lvSavedCookies: TListView
        Left = 4
        Top = 8
        Width = 393
        Height = 157
        Columns = <
          item
            Caption = #12469#12452#12488
            Width = 175
          end
          item
            Caption = 'Cookie'#12398#21517#21069
            Width = 175
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvSavedCookiesSelectItem
      end
      object Button7: TButton
        Left = 96
        Top = 300
        Width = 129
        Height = 21
        Caption = #12377#12409#12390#12398'Cookie'#12434#21066#38500
        TabOrder = 1
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 4
        Top = 300
        Width = 85
        Height = 21
        Caption = 'Cookie'#12434#21066#38500
        TabOrder = 2
        OnClick = Button8Click
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 172
        Width = 393
        Height = 121
        Caption = #36984#25246#12375#12383'Cookie'#12398#24773#22577
        TabOrder = 3
        object Label1: TLabel
          Left = 32
          Top = 20
          Width = 24
          Height = 12
          Caption = #21517#21069
        end
        object Label2: TLabel
          Left = 32
          Top = 36
          Width = 24
          Height = 12
          Caption = #20869#23481
        end
        object Label3: TLabel
          Left = 26
          Top = 52
          Width = 30
          Height = 12
          Caption = #12507#12473#12488
        end
        object Label4: TLabel
          Left = 33
          Top = 68
          Width = 23
          Height = 12
          Caption = #12497#12473
        end
        object Label5: TLabel
          Left = 8
          Top = 84
          Width = 48
          Height = 12
          Caption = #36865#20449#26465#20214
        end
        object Label6: TLabel
          Left = 8
          Top = 100
          Width = 48
          Height = 12
          Caption = #26377#21177#26399#38480
        end
        object lblCookieName: TLabel
          Left = 64
          Top = 20
          Width = 76
          Height = 12
          Caption = 'lblCookieName'
        end
        object lblCookieContent: TLabel
          Left = 64
          Top = 36
          Width = 87
          Height = 12
          Caption = 'lblCookieContent'
        end
        object lblCookieHost: TLabel
          Left = 64
          Top = 52
          Width = 71
          Height = 12
          Caption = 'lblCookieHost'
        end
        object lblCookiePath: TLabel
          Left = 64
          Top = 68
          Width = 70
          Height = 12
          Caption = 'lblCookiePath'
        end
        object lblCookieSendCondition: TLabel
          Left = 64
          Top = 84
          Width = 120
          Height = 12
          Caption = 'lblCookieSendCondition'
        end
        object lblCookieExpires: TLabel
          Left = 64
          Top = 100
          Width = 85
          Height = 12
          Caption = 'lblCookieExpires'
        end
      end
    end
    object CookieSitesSheet: TTabSheet
      Caption = #20363#22806#12469#12452#12488
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object edtExpSite: TEdit
        Left = 4
        Top = 4
        Width = 121
        Height = 20
        TabOrder = 0
      end
      object btnAddBlock: TButton
        Left = 132
        Top = 4
        Width = 77
        Height = 21
        Caption = #25298#21542
        TabOrder = 1
        OnClick = btnAddBlockClick
      end
      object btnAddSession: TButton
        Left = 216
        Top = 4
        Width = 93
        Height = 21
        Caption = #12475#12483#12471#12519#12531#12398#12415
        TabOrder = 2
        OnClick = btnAddSessionClick
      end
      object btnAddAllow: TButton
        Left = 316
        Top = 4
        Width = 77
        Height = 21
        Caption = #35377#21487
        TabOrder = 3
        OnClick = btnAddAllowClick
      end
      object lvCookieExpSites: TListView
        Left = 4
        Top = 32
        Width = 393
        Height = 261
        Columns = <
          item
            Caption = #12469#12452#12488
            Width = 175
          end
          item
            Caption = #29694#22312#12398#35373#23450
            Width = 175
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
      end
      object Button2: TButton
        Left = 4
        Top = 300
        Width = 77
        Height = 21
        Caption = #12469#12452#12488#12434#21066#38500
        TabOrder = 5
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 88
        Top = 300
        Width = 129
        Height = 21
        Caption = #12377#12409#12390#12398#12469#12452#12488#12434#21066#38500
        TabOrder = 6
        OnClick = Button3Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 355
    Width = 412
    Height = 31
    Align = alBottom
    TabOrder = 1
    object btnClose: TButton
      Left = 272
      Top = 164
      Width = 75
      Height = 21
      Caption = #38281#12376#12427
      TabOrder = 0
    end
    object Button1: TButton
      Left = 332
      Top = 4
      Width = 75
      Height = 21
      Caption = #38281#12376#12427
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
