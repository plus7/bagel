object frmPageInfo: TfrmPageInfo
  Left = 246
  Top = 314
  BorderStyle = bsDialog
  Caption = #12506#12540#12472#24773#22577
  ClientHeight = 297
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 397
    Height = 253
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #19968#33324
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 41
        Height = 12
        Caption = #12479#12452#12488#12523':'
      end
      object Label2: TLabel
        Left = 4
        Top = 24
        Width = 60
        Height = 12
        Caption = 'MIME'#12479#12452#12503':'
      end
      object Label3: TLabel
        Left = 4
        Top = 44
        Width = 57
        Height = 12
        Caption = #25551#30011#12514#12540#12489':'
      end
      object Label4: TLabel
        Left = 4
        Top = 64
        Width = 90
        Height = 12
        Caption = #12461#12515#12483#12471#12517#12398#31278#39006':'
      end
      object Label5: TLabel
        Left = 4
        Top = 84
        Width = 56
        Height = 12
        Caption = #25991#23383#12467#12540#12489':'
      end
      object Label6: TLabel
        Left = 4
        Top = 104
        Width = 36
        Height = 12
        Caption = #12469#12452#12474':'
      end
      object Label7: TLabel
        Left = 4
        Top = 124
        Width = 57
        Height = 12
        Caption = #21442#29031#20803'URI:'
      end
      object Label8: TLabel
        Left = 4
        Top = 144
        Width = 50
        Height = 12
        Caption = #26356#26032#26085#26178':'
      end
      object Label9: TLabel
        Left = 4
        Top = 164
        Width = 50
        Height = 12
        Caption = #26377#21177#26399#38480':'
        Visible = False
      end
      object edtTitle: TEdit
        Left = 100
        Top = 4
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object edtMIMEType: TEdit
        Left = 100
        Top = 24
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 1
      end
      object edtRenderingMode: TEdit
        Left = 100
        Top = 44
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 2
      end
      object edtCacheType: TEdit
        Left = 100
        Top = 64
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 3
      end
      object edtEncoding: TEdit
        Left = 100
        Top = 84
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 4
      end
      object edtSize: TEdit
        Left = 100
        Top = 104
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 5
      end
      object edtReferer: TEdit
        Left = 100
        Top = 124
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 6
      end
      object edtLastModified: TEdit
        Left = 100
        Top = 144
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 7
      end
      object edtExpire: TEdit
        Left = 100
        Top = 164
        Width = 285
        Height = 13
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 8
        Visible = False
      end
    end
  end
  object Button1: TButton
    Left = 324
    Top = 268
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
