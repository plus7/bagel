object frmSearchEdit: TfrmSearchEdit
  Left = 344
  Top = 150
  BorderStyle = bsDialog
  Caption = #26908#32034#12456#12531#12472#12531#12398#32232#38598
  ClientHeight = 201
  ClientWidth = 358
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 341
    Height = 161
    ActivePage = EngineSheet
    Style = tsFlatButtons
    TabOrder = 0
    object EngineSheet: TTabSheet
      Caption = 'EngineSheet'
      TabVisible = False
      object Label77: TLabel
        Left = 32
        Top = 4
        Width = 36
        Height = 12
        Caption = #34920#31034#21517
      end
      object Label78: TLabel
        Left = 24
        Top = 28
        Width = 43
        Height = 12
        Caption = #21069#26041'URI'
      end
      object Label79: TLabel
        Left = 24
        Top = 52
        Width = 43
        Height = 12
        Caption = #24460#26041'URI'
      end
      object Label80: TLabel
        Left = 16
        Top = 76
        Width = 54
        Height = 12
        Caption = #25991#23383#12467#12540#12489
      end
      object Label81: TLabel
        Left = 4
        Top = 100
        Width = 66
        Height = 12
        Caption = #12471#12519#12540#12488#12459#12483#12488
      end
      object edtCaptionE: TEdit
        Left = 76
        Top = 0
        Width = 253
        Height = 20
        TabOrder = 0
      end
      object edtPrefixE: TEdit
        Left = 76
        Top = 24
        Width = 253
        Height = 20
        TabOrder = 1
      end
      object edtSuffixE: TEdit
        Left = 76
        Top = 48
        Width = 253
        Height = 20
        TabOrder = 2
      end
      object cboEncodeE: TComboBox
        Left = 76
        Top = 72
        Width = 97
        Height = 20
        ItemHeight = 12
        TabOrder = 3
        Items.Strings = (
          'Shift_JIS'
          'EUC-JP'
          'UTF-8')
      end
      object edtShortcutE: TEdit
        Left = 76
        Top = 96
        Width = 97
        Height = 20
        TabOrder = 4
      end
    end
    object GroupSheet: TTabSheet
      Caption = 'GroupSheet'
      ImageIndex = 1
      TabVisible = False
      object Label1: TLabel
        Left = 32
        Top = 4
        Width = 36
        Height = 12
        Caption = #34920#31034#21517
      end
      object Label2: TLabel
        Left = 4
        Top = 28
        Width = 66
        Height = 12
        Caption = #12471#12519#12540#12488#12459#12483#12488
      end
      object edtCaptionG: TEdit
        Left = 76
        Top = 0
        Width = 253
        Height = 20
        TabOrder = 0
      end
      object edtShortcutG: TEdit
        Left = 76
        Top = 24
        Width = 97
        Height = 20
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 52
        Width = 313
        Height = 93
        Caption = #12464#12523#12540#12503#12395#21547#12417#12427#26908#32034#12456#12531#12472#12531
        TabOrder = 2
        object btnAddG: TButton
          Left = 228
          Top = 28
          Width = 75
          Height = 21
          Caption = #36861#21152
          TabOrder = 0
          OnClick = btnAddGClick
        end
        object btnDelG: TButton
          Left = 228
          Top = 56
          Width = 75
          Height = 21
          Caption = #21066#38500
          TabOrder = 1
          OnClick = btnDelGClick
        end
        object lstEngine: TListBox
          Left = 8
          Top = 20
          Width = 209
          Height = 65
          DragMode = dmAutomatic
          ItemHeight = 12
          TabOrder = 2
          OnDragDrop = lstEngineDragDrop
          OnDragOver = lstEngineDragOver
          OnStartDrag = lstEngineStartDrag
        end
      end
    end
  end
  object btnOK: TButton
    Left = 188
    Top = 172
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 272
    Top = 172
    Width = 75
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 2
  end
  object EnginePopup: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = EnginePopupPopup
    Left = 256
    Top = 60
  end
end
