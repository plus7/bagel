object frmExtGoEditor: TfrmExtGoEditor
  Left = 311
  Top = 241
  BorderStyle = bsDialog
  Caption = #12450#12489#12524#12473#12496#12540#25313#24373
  ClientHeight = 244
  ClientWidth = 377
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lstExtGo: TListBox
    Left = 4
    Top = 28
    Width = 369
    Height = 181
    DragMode = dmAutomatic
    ItemHeight = 12
    TabOrder = 0
    OnDblClick = lstExtGoDblClick
    OnDragDrop = lstExtGoDragDrop
    OnDragOver = lstExtGoDragOver
  end
  object btnOK: TButton
    Left = 208
    Top = 216
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 292
    Top = 216
    Width = 75
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnAdd: TButton
    Left = 4
    Top = 4
    Width = 75
    Height = 21
    Caption = #36861#21152
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnDel: TButton
    Left = 84
    Top = 4
    Width = 75
    Height = 21
    Caption = #21066#38500
    TabOrder = 4
    OnClick = btnDelClick
  end
end
