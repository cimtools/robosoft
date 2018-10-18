object Form5: TForm5
  Left = 383
  Top = 149
  Width = 516
  Height = 432
  BorderStyle = bsSizeToolWin
  Caption = 'Logs do Terminal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 508
    Height = 398
    Align = alClient
    Caption = 'Logs do Teminal'
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 504
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object RadioButton1: TRadioButton
        Left = 1
        Top = 2
        Width = 89
        Height = 17
        Caption = 'Habilitar Log'
        TabOrder = 0
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 105
        Top = 2
        Width = 97
        Height = 17
        Caption = 'Desabilitar Log'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RadioButton2Click
      end
    end
    object RichEdit1: TRichEdit
      Left = 2
      Top = 37
      Width = 504
      Height = 327
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
    object Panel2: TPanel
      Left = 2
      Top = 364
      Width = 504
      Height = 32
      Align = alBottom
      TabOrder = 2
      object Button1: TButton
        Left = 6
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Limpar'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 84
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Copiar'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 424
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Fechar'
        TabOrder = 2
        OnClick = Button3Click
      end
    end
  end
end
