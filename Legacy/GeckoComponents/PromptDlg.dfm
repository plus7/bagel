object PromptDlg: TPromptDlg
  Left = 374
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 186
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 12
  object PromptText: TLabel
    Left = 8
    Top = 8
    Width = 59
    Height = 12
    Caption = 'PromptText'
    WordWrap = True
  end
  object Button1: TButton
    Left = 128
    Top = 156
    Width = 81
    Height = 21
    Caption = 'Button1'
    Default = True
    TabOrder = 0
  end
  object PromptValue: TEdit
    Left = 8
    Top = 32
    Width = 377
    Height = 20
    TabOrder = 1
    Text = 'PromptValue'
  end
  object Button2: TButton
    Left = 216
    Top = 156
    Width = 81
    Height = 21
    Caption = 'Button2'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 304
    Top = 156
    Width = 81
    Height = 21
    Caption = 'Button3'
    TabOrder = 3
  end
  object PromptPassword: TEdit
    Left = 8
    Top = 64
    Width = 377
    Height = 20
    PasswordChar = '*'
    TabOrder = 4
    Text = 'PromptPassword'
  end
  object PromptCheck: TCheckBox
    Left = 8
    Top = 88
    Width = 377
    Height = 17
    Caption = 'PromptCheck'
    TabOrder = 5
  end
  object PromptList: TComboBox
    Left = 8
    Top = 32
    Width = 377
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 6
  end
end
