object frmProperties: TfrmProperties
  Left = 351
  Top = 135
  BorderStyle = bsDialog
  Caption = #12503#12525#12497#12486#12451
  ClientHeight = 455
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object gbLinkProps: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 65
    Caption = #12522#12531#12463#12398#12503#12525#12497#12486#12451
    TabOrder = 1
    Visible = False
    object Label6: TLabel
      Left = 12
      Top = 20
      Width = 21
      Height = 12
      Caption = 'URI:'
    end
    object Label7: TLabel
      Left = 12
      Top = 40
      Width = 33
      Height = 12
      Caption = #38283#12367#20808':'
    end
    object edtLinkURI: TEdit
      Left = 52
      Top = 20
      Width = 249
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtLinkWillOpenTo: TEdit
      Left = 52
      Top = 40
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object gbImgProps: TGroupBox
    Left = 8
    Top = 80
    Width = 313
    Height = 125
    Caption = #30011#20687#12398#12503#12525#12497#12486#12451
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 42
      Height = 12
      Caption = #12450#12489#12524#12473':'
    end
    object Label2: TLabel
      Left = 12
      Top = 40
      Width = 23
      Height = 12
      Caption = #39640#12373':'
    end
    object Label3: TLabel
      Left = 12
      Top = 60
      Width = 14
      Height = 12
      Caption = #24133':'
    end
    object Label4: TLabel
      Left = 12
      Top = 80
      Width = 77
      Height = 12
      Caption = #12501#12449#12452#12523#12469#12452#12474':'
    end
    object Label5: TLabel
      Left = 12
      Top = 100
      Width = 68
      Height = 12
      Caption = #20195#26367#12486#12461#12473#12488':'
    end
    object edtImgAddr: TEdit
      Left = 56
      Top = 20
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtImgHeight: TEdit
      Left = 56
      Top = 40
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtImgWidth: TEdit
      Left = 56
      Top = 60
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtImgFilesize: TEdit
      Left = 92
      Top = 80
      Width = 209
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edtImgAlt: TEdit
      Left = 92
      Top = 100
      Width = 209
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object gbInsDelProps: TGroupBox
    Left = 8
    Top = 212
    Width = 313
    Height = 65
    Caption = #36861#21152#12539#21066#38500#12398#12503#12525#12497#12486#12451
    TabOrder = 3
    Visible = False
    object Label8: TLabel
      Left = 12
      Top = 20
      Width = 26
      Height = 12
      Caption = #24773#22577':'
    end
    object Label9: TLabel
      Left = 12
      Top = 40
      Width = 26
      Height = 12
      Caption = #26085#26178':'
    end
    object edtInsDelDatetime: TEdit
      Left = 56
      Top = 40
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtInsDelCite: TEdit
      Left = 56
      Top = 20
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object gbQuoteProps: TGroupBox
    Left = 8
    Top = 284
    Width = 313
    Height = 45
    Caption = #24341#29992#12398#12503#12525#12497#12486#12451
    TabOrder = 4
    Visible = False
    object Label10: TLabel
      Left = 12
      Top = 20
      Width = 38
      Height = 12
      Caption = #24341#29992#20803':'
    end
    object edtQuoteCite: TEdit
      Left = 56
      Top = 21
      Width = 245
      Height = 20
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object gbMiscProps: TGroupBox
    Left = 8
    Top = 336
    Width = 313
    Height = 81
    Caption = #12381#12398#20182#12398#12503#12525#12497#12486#12451
    TabOrder = 5
    Visible = False
    object Label11: TLabel
      Left = 12
      Top = 20
      Width = 80
      Height = 12
      Caption = #12486#12461#12473#12488#12398#35328#35486':'
    end
    object Label12: TLabel
      Left = 12
      Top = 40
      Width = 41
      Height = 12
      Caption = #12479#12452#12488#12523':'
    end
    object Label13: TLabel
      Left = 12
      Top = 60
      Width = 84
      Height = 12
      Caption = #12486#12540#12502#12523#12398#27010#35201':'
    end
  end
  object btnOK: TButton
    Left = 240
    Top = 424
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOKClick
  end
end
