object Form1: TForm1
  Left = 119
  Top = 101
  Width = 854
  Height = 542
  Caption = 'Interpretador da Linguagem ACL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 424
    Top = 0
    Width = 417
    Height = 321
    Caption = 'Resultado do Programa'
    TabOrder = 1
    object RichEdit3: TRichEdit
      Left = 2
      Top = 15
      Width = 413
      Height = 304
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 360
    Width = 281
    Height = 145
    Caption = 'Interpretação do comandos'
    TabOrder = 2
    object RichEdit2: TRichEdit
      Left = 2
      Top = 15
      Width = 277
      Height = 128
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 417
    Height = 321
    Caption = 'Programa'
    TabOrder = 3
    object RichEdit1: TRichEdit
      Left = 2
      Top = 15
      Width = 413
      Height = 304
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      WantTabs = True
    end
  end
  object Button2: TButton
    Left = 88
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Teste laços'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Lista variavel'
    TabOrder = 5
    OnClick = Button3Click
  end
  object GroupBox4: TGroupBox
    Left = 295
    Top = 360
    Width = 258
    Height = 145
    Caption = 'Variáveis'
    TabOrder = 6
    object RichEdit4: TRichEdit
      Left = 2
      Top = 15
      Width = 254
      Height = 128
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 560
    Top = 360
    Width = 281
    Height = 145
    Caption = 'Erros'
    TabOrder = 7
    object RichEdit5: TRichEdit
      Left = 2
      Top = 15
      Width = 277
      Height = 128
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
