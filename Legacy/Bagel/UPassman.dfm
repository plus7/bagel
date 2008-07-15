object frmPassMan: TfrmPassMan
  Left = 287
  Top = 253
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #12497#12473#12527#12540#12489#12510#12493#12540#12472#12515
  ClientHeight = 282
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 469
    Height = 247
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object SavedPassSheet: TTabSheet
      Caption = #20445#23384#12373#12428#12390#12356#12427#12497#12473#12527#12540#12489
      ExplicitLeft = 8
      ExplicitTop = 21
      ExplicitWidth = 465
      ExplicitHeight = 219
      object lvSavedPassword: TListView
        Left = 3
        Top = 3
        Width = 449
        Height = 179
        Columns = <
          item
            Caption = #12469#12452#12488
            Width = 250
          end
          item
            Caption = #12518#12540#12470#12540#21517
            Width = 100
          end>
        HideSelection = False
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object btnRemoveSelectedPass: TButton
        Left = 8
        Top = 188
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 1
        OnClick = btnRemoveSelectedPassClick
      end
      object btnRemoveAllSavedPass: TButton
        Left = 89
        Top = 188
        Width = 75
        Height = 21
        Caption = #20840#12390#21066#38500
        TabOrder = 2
        OnClick = btnRemoveAllSavedPassClick
      end
      object btnShowSavedPassword: TButton
        Left = 327
        Top = 188
        Width = 125
        Height = 21
        Caption = #12497#12473#12527#12540#12489#12434#34920#31034#12377#12427
        TabOrder = 3
        OnClick = btnShowSavedPasswordClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #12497#12473#12527#12540#12489#12434#20445#23384#12375#12394#12356#12469#12452#12488
      ImageIndex = 1
      object lvPasswordNeverSaved: TListView
        Left = 8
        Top = 8
        Width = 449
        Height = 121
        Columns = <
          item
            Caption = #12469#12452#12488
            Width = 400
          end>
        HideSelection = False
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object btnRemoveNeverSavedSite: TButton
        Left = 8
        Top = 140
        Width = 75
        Height = 21
        Caption = #21066#38500
        TabOrder = 1
        OnClick = btnRemoveNeverSavedSiteClick
      end
      object btnRemoveAllNeverSavedSite: TButton
        Left = 92
        Top = 140
        Width = 75
        Height = 21
        Caption = #20840#12390#21066#38500
        TabOrder = 2
        OnClick = btnRemoveAllNeverSavedSiteClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 247
    Width = 469
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 381
      Top = 6
      Width = 75
      Height = 21
      Cancel = True
      Caption = #38281#12376#12427
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
