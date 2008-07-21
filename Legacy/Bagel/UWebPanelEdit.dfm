object frmWebPanelEditor: TfrmWebPanelEditor
  Left = 203
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Web'#12497#12493#12523
  ClientHeight = 252
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lstExtGo: TListBox
    Left = 8
    Top = 36
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
    Left = 221
    Top = 223
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 302
    Top = 223
    Width = 75
    Height = 21
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnAdd: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 21
    Caption = #36861#21152
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnDel: TButton
    Left = 89
    Top = 9
    Width = 75
    Height = 21
    Caption = #21066#38500
    TabOrder = 4
    OnClick = btnDelClick
  end
end
