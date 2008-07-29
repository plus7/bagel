object AboutBagelForm: TAboutBagelForm
  Left = 175
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Bagel'#12395#12388#12356#12390
  ClientHeight = 277
  ClientWidth = 465
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 465
    Height = 277
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Bagel'
      object Label2: TLabel
        Left = 46
        Top = 3
        Width = 146
        Height = 16
        Caption = 'Bagel prototype 74'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 46
        Top = 25
        Width = 133
        Height = 12
        Caption = #12356#12435#12373#12540#12392#12288#12418#12387#12392#12288#12402#12354#65281
      end
      object Image1: TImage
        Left = 8
        Top = 3
        Width = 32
        Height = 32
        AutoSize = True
        Stretch = True
        Transparent = True
      end
      object ListView1: TListView
        Left = 8
        Top = 43
        Width = 441
        Height = 198
        Columns = <
          item
            Width = 200
          end
          item
            Width = 200
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TabSheet3: TTabSheet
      Caption = #12496#12464#22577#21578
      ImageIndex = 2
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 210
        Height = 12
        Caption = #12496#12464#22577#21578#12486#12531#12503#12524#12391#12377#12290#27963#29992#12375#12390#12367#12384#12373#12356#12290
        WordWrap = True
      end
      object Memo1: TMemo
        Left = 8
        Top = 26
        Width = 441
        Height = 215
        Lines.Strings = (
          #12304'OS'#12305
          'Windows98'
          #12304'Gecko'#12305
          '20040709'
          #12304'Bagel'#12305
          'prototype75'
          #12304#12501#12449#12452#12516#12540#12454#12457#12540#12523#12539#12454#12452#12523#12473#23550#31574#12305
          #33075#35930
          #12304#22238#32218#31561#12305
          'Tepco'#20809)
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
