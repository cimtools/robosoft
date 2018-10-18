object Form2: TForm2
  Left = 331
  Top = 230
  BorderStyle = bsToolWindow
  Caption = 'Configuração do tipo do controlador'
  ClientHeight = 127
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 441
    Height = 125
    Caption = 'Configuração'
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 19
      Width = 126
      Height = 13
      Caption = 'Local do arquivo de config'
    end
    object Edit1: TEdit
      Left = 135
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 359
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Add...'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 360
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 2
      OnClick = Button1Click
    end
    object RadioButton1: TRadioButton
      Left = 4
      Top = 50
      Width = 113
      Height = 17
      Caption = 'Controlador Tipo A'
      TabOrder = 3
    end
    object RadioButton2: TRadioButton
      Left = 4
      Top = 74
      Width = 113
      Height = 17
      Caption = 'Controlador Tipo B'
      TabOrder = 4
    end
    object RadioButton3: TRadioButton
      Left = 4
      Top = 98
      Width = 113
      Height = 17
      Caption = 'Controlador Tipo AC'
      TabOrder = 5
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'INI files|*.ini'
    InitialDir = 'c:\'
    Left = 160
    Top = 56
  end
end
