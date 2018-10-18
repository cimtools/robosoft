object Form3: TForm3
  Left = 160
  Top = 134
  BorderStyle = bsToolWindow
  ClientHeight = 404
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 432
    Top = 0
    Width = 4
    Height = 315
    Cursor = crHSplit
    ResizeStyle = rsLine
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 315
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BorderWidth = 2
    Caption = 'Panel2'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 424
      Height = 307
      Align = alClient
      Caption = 'Visualizador da memÛria do controlador'
      TabOrder = 0
      object ListView1: TListView
        Left = 2
        Top = 15
        Width = 420
        Height = 290
        Cursor = crHandPoint
        Align = alClient
        Columns = <
          item
            Caption = 'Nome'
            Width = 200
          end
          item
            Caption = 'Tipo'
            ImageIndex = -11
            Width = 200
          end>
        GridLines = True
        IconOptions.AutoArrange = True
        SmallImages = ImageList1
        SortType = stText
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ListView1DblClick
        OnKeyUp = ListView1KeyUp
        OnMouseMove = ListView1MouseMove
        OnSelectItem = ListView1SelectItem
      end
    end
  end
  object Panel3: TPanel
    Left = 436
    Top = 0
    Width = 365
    Height = 315
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BorderWidth = 2
    Caption = 'Panel3'
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 4
      Top = 4
      Width = 357
      Height = 307
      Align = alClient
      Caption = 'Listagem do programa'
      TabOrder = 0
      object SynEdit1: TSynEdit
        Left = 2
        Top = 15
        Width = 353
        Height = 290
        Cursor = crIBeam
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Terminal'
        Gutter.Font.Style = []
        Gutter.LeftOffset = 1
        Gutter.ShowLineNumbers = True
        Gutter.Visible = False
        Highlighter = SynGeneralSyn1
        Keystrokes = <
          item
            Command = ecUp
            ShortCut = 38
          end
          item
            Command = ecSelUp
            ShortCut = 8230
          end
          item
            Command = ecScrollUp
            ShortCut = 16422
          end
          item
            Command = ecDown
            ShortCut = 40
          end
          item
            Command = ecSelDown
            ShortCut = 8232
          end
          item
            Command = ecScrollDown
            ShortCut = 16424
          end
          item
            Command = ecLeft
            ShortCut = 37
          end
          item
            Command = ecSelLeft
            ShortCut = 8229
          end
          item
            Command = ecWordLeft
            ShortCut = 16421
          end
          item
            Command = ecSelWordLeft
            ShortCut = 24613
          end
          item
            Command = ecRight
            ShortCut = 39
          end
          item
            Command = ecSelRight
            ShortCut = 8231
          end
          item
            Command = ecWordRight
            ShortCut = 16423
          end
          item
            Command = ecSelWordRight
            ShortCut = 24615
          end
          item
            Command = ecPageDown
            ShortCut = 34
          end
          item
            Command = ecSelPageDown
            ShortCut = 8226
          end
          item
            Command = ecPageBottom
            ShortCut = 16418
          end
          item
            Command = ecSelPageBottom
            ShortCut = 24610
          end
          item
            Command = ecPageUp
            ShortCut = 33
          end
          item
            Command = ecSelPageUp
            ShortCut = 8225
          end
          item
            Command = ecPageTop
            ShortCut = 16417
          end
          item
            Command = ecSelPageTop
            ShortCut = 24609
          end
          item
            Command = ecLineStart
            ShortCut = 36
          end
          item
            Command = ecSelLineStart
            ShortCut = 8228
          end
          item
            Command = ecEditorTop
            ShortCut = 16420
          end
          item
            Command = ecSelEditorTop
            ShortCut = 24612
          end
          item
            Command = ecLineEnd
            ShortCut = 35
          end
          item
            Command = ecSelLineEnd
            ShortCut = 8227
          end
          item
            Command = ecEditorBottom
            ShortCut = 16419
          end
          item
            Command = ecSelEditorBottom
            ShortCut = 24611
          end
          item
            Command = ecToggleMode
            ShortCut = 45
          end
          item
            Command = ecCopy
            ShortCut = 16429
          end
          item
            Command = ecCut
            ShortCut = 8238
          end
          item
            Command = ecPaste
            ShortCut = 8237
          end
          item
            Command = ecDeleteChar
            ShortCut = 46
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8200
          end
          item
            Command = ecDeleteLastWord
            ShortCut = 16392
          end
          item
            Command = ecUndo
            ShortCut = 32776
          end
          item
            Command = ecRedo
            ShortCut = 40968
          end
          item
            Command = ecLineBreak
            ShortCut = 13
          end
          item
            Command = ecLineBreak
            ShortCut = 8205
          end
          item
            Command = ecTab
            ShortCut = 9
          end
          item
            Command = ecShiftTab
            ShortCut = 8201
          end
          item
            Command = ecContextHelp
            ShortCut = 16496
          end
          item
            Command = ecSelectAll
            ShortCut = 16449
          end
          item
            Command = ecCopy
            ShortCut = 16451
          end
          item
            Command = ecPaste
            ShortCut = 16470
          end
          item
            Command = ecCut
            ShortCut = 16472
          end
          item
            Command = ecBlockIndent
            ShortCut = 24649
          end
          item
            Command = ecBlockUnindent
            ShortCut = 24661
          end
          item
            Command = ecLineBreak
            ShortCut = 16461
          end
          item
            Command = ecInsertLine
            ShortCut = 16462
          end
          item
            Command = ecDeleteWord
            ShortCut = 16468
          end
          item
            Command = ecDeleteLine
            ShortCut = 16473
          end
          item
            Command = ecDeleteEOL
            ShortCut = 24665
          end
          item
            Command = ecUndo
            ShortCut = 16474
          end
          item
            Command = ecRedo
            ShortCut = 24666
          end
          item
            Command = ecGotoMarker0
            ShortCut = 16432
          end
          item
            Command = ecGotoMarker1
            ShortCut = 16433
          end
          item
            Command = ecGotoMarker2
            ShortCut = 16434
          end
          item
            Command = ecGotoMarker3
            ShortCut = 16435
          end
          item
            Command = ecGotoMarker4
            ShortCut = 16436
          end
          item
            Command = ecGotoMarker5
            ShortCut = 16437
          end
          item
            Command = ecGotoMarker6
            ShortCut = 16438
          end
          item
            Command = ecGotoMarker7
            ShortCut = 16439
          end
          item
            Command = ecGotoMarker8
            ShortCut = 16440
          end
          item
            Command = ecGotoMarker9
            ShortCut = 16441
          end
          item
            Command = ecSetMarker0
            ShortCut = 24624
          end
          item
            Command = ecSetMarker1
            ShortCut = 24625
          end
          item
            Command = ecSetMarker2
            ShortCut = 24626
          end
          item
            Command = ecSetMarker3
            ShortCut = 24627
          end
          item
            Command = ecSetMarker4
            ShortCut = 24628
          end
          item
            Command = ecSetMarker5
            ShortCut = 24629
          end
          item
            Command = ecSetMarker6
            ShortCut = 24630
          end
          item
            Command = ecSetMarker7
            ShortCut = 24631
          end
          item
            Command = ecSetMarker8
            ShortCut = 24632
          end
          item
            Command = ecSetMarker9
            ShortCut = 24633
          end
          item
            Command = ecNormalSelect
            ShortCut = 24654
          end
          item
            Command = ecColumnSelect
            ShortCut = 24643
          end
          item
            Command = ecLineSelect
            ShortCut = 24652
          end
          item
            Command = ecMatchBracket
            ShortCut = 24642
          end>
        Lines.Strings = (
          '')
        ReadOnly = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 315
    Width = 801
    Height = 70
    Align = alBottom
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 430
      Height = 68
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 430
        Height = 68
        Align = alClient
        Caption = ' Recursos '
        TabOrder = 0
        object Label2: TLabel
          Left = 6
          Top = 26
          Width = 105
          Height = 13
          Caption = 'Programa selecionado'
        end
        object Edit1: TEdit
          Left = 114
          Top = 21
          Width = 124
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object Button2: TButton
          Left = 277
          Top = 38
          Width = 71
          Height = 23
          Caption = 'Refresh'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 352
          Top = 38
          Width = 71
          Height = 23
          Caption = 'Sair'
          TabOrder = 2
          OnClick = Button3Click
        end
      end
    end
    object Panel5: TPanel
      Left = 431
      Top = 1
      Width = 369
      Height = 68
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 4
        Width = 3
        Height = 13
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 369
        Height = 68
        Align = alClient
        Caption = ' Ferramentas '
        TabOrder = 0
        object Button1: TButton
          Left = 299
          Top = 36
          Width = 64
          Height = 25
          Caption = 'Copiar'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button4: TButton
          Left = 211
          Top = 36
          Width = 86
          Height = 25
          Caption = 'Selecionar tudo'
          TabOrder = 1
          OnClick = Button4Click
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 385
    Width = 801
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM2'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 511
    Top = 40
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    IncludeStrings = True
    OnPacket = ComDataPacket1Packet
    Left = 543
    Top = 40
  end
  object ImageList1: TImageList
    Left = 447
    Top = 40
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00002B723700547B60004A745C0046745D0042715C003F705B003C6E5C00376C
      5A00356A5900316859002E6B5D00004A14000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000076997A00FEFFFF00EAF8FF00DCF2FF00DAEEFC00CCE8FA00C8E7FC00BBDC
      F400B1D8F100A9D3EF00B3DEFD002E6B5D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000577A5C00BFC5C900ACB5BA00A5B1B900A7B8C100ACBFCC0062757F00BEDD
      F100B0D1E700A6CCE400A8D2EF00316959000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042654600B0B2B400A7ACB100B3BABE00454949000000000077858F00C9E4
      F700B9D7E900B0D0E700B3D9F200356A59000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000476C4E00D5D3D2005C5C57000C1521004D6DAC0045505600EAFEFF00C9DF
      EE00C1DCEB00BAD6E900BEE0F500366A57000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000030513200090F0B0028477A005277CD00C0DBFF00D9EBFF00EEFCFF00EEFF
      FF00D7EFFE00D1EBFE00CFEFFF00396B58000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000271E
      6C0032454300235082005B79C600BAD1FF00BBDBFF005E5D5600797F83000000
      0000636B6F0041484C0044494E0040705B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000023216900004A
      92002865D6004068D10096B6F300D8F1FF00D4DEFF00C6C7C500000000006569
      6C00C1D0D700565C6000D9EDF9003E6D56000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241E660000458E00057A
      E800037FFB005F8AE400EAF6FF00A9C4F600FFFFFF00FFFFFF0093949600FFFF
      FF00414345008C919500CCDAE2003C6850000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B187100004992000978E700078C
      FD000076F80095ACED008AC2EF00EBEEFE00FFFFFF00FFFFFF00FFFFFF00F8FB
      FD00F7FDFF00E0E7ED00C5CED200386146000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000479300097AE8000689FE000071
      F5008DCCFF002F75CC00DEE4E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6F5F400D4D5D600A3B0B40032573C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000878E8000589FC000077F500ACD5
      FF003A80CE00E0E5E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D2
      D200484A4A004E545500616963004C844D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000388F9000075F600BCDEFF003796
      CF0088909400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F8F
      8F00F2F2F200FFFFFF00AD86AD00DF08DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007CF700C0DFFF002CA6C800EA00
      EB0087A79500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009797
      9700FFFFFF009474940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009BEFFC0026A7C400DD00E0000000
      000084AE9700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F7008D94
      8C00A880A8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006FA18E008F989E008A939800878F9400858C90007E848700686E7000637D
      6700E203E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F000000000000000F000000000000000
      F000000000000000F000000000000000F000000000000000F000000000000000
      E000000000000000C00000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000000000
      1007000000000000F007000000000000}
  end
  object ComPort2: TComPort
    BaudRate = br9600
    Port = 'COM2'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 479
    Top = 40
  end
  object SynGeneralSyn1: TSynGeneralSyn
    Comments = []
    DetectPreprocessor = False
    IdentifierChars = 
      '!"#$%&'#39'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`' +
      'abcdefghijklmnopqrstuvwxyz{|}~ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü†' +
      '°¢£§•¶ß®©™´¨≠ÆØ∞±≤≥¥µ∂∑∏π∫ªºΩæø¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›ﬁﬂ‡' +
      '·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘˙˚¸˝˛ˇ'
    KeyWords.Strings = (
      ''
      'ANDIF'
      'CLOSE'
      'CLRCOM'
      'DEFINE'
      'DEFP'
      'DELAY'
      'DIM'
      'DIMG'
      'DIMP'
      'ELSE'
      'END'
      'ENDFOR'
      'ENDIF'
      'FOR'
      'GET'
      'GETCOM'
      'GLOBAL'
      'GOSUB'
      'GOTO'
      'IF'
      'JAW'
      'LABEL'
      'MOVE'
      'MOVEC'
      'MOVECD'
      'MOVED'
      'MOVEL'
      'MOVELD'
      'MOVES'
      'MOVESD'
      'OPEN'
      'ORIF'
      'PRINT'
      'PRINTLN'
      'PROGRAM'
      'READ'
      'READCOM'
      'RUN'
      'SENDCOM'
      'SET'
      'SETP'
      'SPEED'
      'SPEEDL'
      'TO'
      'TRIGGER'
      'WAIT')
    NumberAttri.Foreground = clRed
    StringAttri.Foreground = clMaroon
    Left = 572
    Top = 36
  end
end
