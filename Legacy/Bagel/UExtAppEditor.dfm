object frmExtAppEditor: TfrmExtAppEditor
  Left = 209
  Top = 238
  BorderStyle = bsDialog
  Caption = #22806#37096#12450#12503#12522#12465#12540#12471#12519#12531#35373#23450
  ClientHeight = 324
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lbExtApp: TListBox
    Left = 8
    Top = 8
    Width = 365
    Height = 161
    ItemHeight = 12
    TabOrder = 0
    OnClick = lbExtAppClick
  end
  object btnOK: TButton
    Left = 212
    Top = 297
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 296
    Top = 297
    Width = 75
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 172
    Width = 369
    Height = 121
    TabOrder = 3
    object Label1: TLabel
      Left = 32
      Top = 21
      Width = 36
      Height = 12
      Caption = #20869#37096#21517
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 62
      Height = 12
      Caption = #12461#12515#12503#12471#12519#12531
    end
    object Label3: TLabel
      Left = 20
      Top = 69
      Width = 51
      Height = 12
      Caption = #12458#12503#12471#12519#12531
    end
    object edtName: TEdit
      Left = 76
      Top = 17
      Width = 281
      Height = 20
      TabOrder = 0
      OnChange = edtNameChange
    end
    object btnInsert: TButton
      Left = 300
      Top = 64
      Width = 55
      Height = 21
      Caption = #25407#20837
      TabOrder = 1
      OnClick = btnInsertClick
    end
    object edtCaption: TEdit
      Left = 76
      Top = 41
      Width = 281
      Height = 20
      TabOrder = 2
    end
    object edtOption: TEdit
      Left = 76
      Top = 65
      Width = 221
      Height = 20
      TabOrder = 3
    end
    object btnAdd: TButton
      Left = 8
      Top = 92
      Width = 75
      Height = 21
      Caption = #36861#21152
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnOverride: TButton
      Left = 92
      Top = 92
      Width = 75
      Height = 21
      Caption = #19978#26360#12365
      TabOrder = 5
      OnClick = btnOverrideClick
    end
    object btnDel: TButton
      Left = 176
      Top = 92
      Width = 75
      Height = 21
      Caption = #21066#38500
      TabOrder = 6
      OnClick = btnDelClick
    end
  end
  object InsertPopup: TPopupMenu
    Left = 92
    Top = 96
    object File1: TMenuItem
      Caption = #12501#12449#12452#12523
      OnClick = File1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object URI1: TMenuItem
      Caption = #12479#12452#12488#12523
    end
    object URI2: TMenuItem
      Caption = 'URI'
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Exe'#12501#12449#12452#12523'|*.exe|'#12377#12409#12390#12398#12501#12449#12452#12523'|*.*'
    Left = 56
    Top = 12
  end
end
