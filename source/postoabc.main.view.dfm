object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 702
  ClientWidth = 1012
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TPageControl
    Left = 0
    Top = 40
    Width = 1012
    Height = 662
    ActivePage = tbsAjustes
    Align = alClient
    TabOrder = 0
    object tbsBombas: TTabSheet
      Caption = 'tbsBombas'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1004
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        object Shape1: TShape
          AlignWithMargins = True
          Left = 283
          Top = 3
          Width = 150
          Height = 59
          Align = alLeft
        end
        object Shape2: TShape
          AlignWithMargins = True
          Left = 79
          Top = 3
          Width = 198
          Height = 59
          Align = alLeft
          ExplicitLeft = 3
        end
        object Shape3: TShape
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 70
          Height = 59
          Align = alLeft
        end
        object Label6: TLabel
          Left = 12
          Top = 9
          Width = 35
          Height = 13
          Caption = 'BOMBA'
        end
        object lblCodigoBomba: TLabel
          Left = 14
          Top = 28
          Width = 22
          Height = 25
          Caption = '01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 92
          Top = 9
          Width = 24
          Height = 13
          Caption = 'TIPO'
        end
        object lblTipoCombustivel: TLabel
          Left = 94
          Top = 28
          Width = 68
          Height = 25
          Caption = 'DIESEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 292
          Top = 9
          Width = 86
          Height = 13
          Caption = 'VALOR UNIT'#193'RIO'
        end
        object lblValorUnitCombustivel: TLabel
          Left = 370
          Top = 28
          Width = 50
          Height = 25
          Alignment = taRightJustify
          Caption = '0,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object scbBombas: TScrollBox
        Left = 0
        Top = 502
        Width = 1004
        Height = 132
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 14145495
        ParentColor = False
        TabOrder = 1
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 68
        Width = 433
        Height = 431
        Margins.Left = 0
        Margins.Right = 0
        Align = alLeft
        BevelOuter = bvNone
        Color = 14145495
        ParentBackground = False
        TabOrder = 2
        object Label8: TLabel
          Left = 14
          Top = 22
          Width = 129
          Height = 25
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 14
          Top = 73
          Width = 101
          Height = 25
          Caption = 'SUBTOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 14
          Top = 124
          Width = 70
          Height = 25
          Caption = 'TARIFA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 14
          Top = 175
          Width = 175
          Height = 25
          Caption = 'VALOR DA TARIFA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 14
          Top = 226
          Width = 154
          Height = 25
          Caption = 'TOTAL A PAGAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtQtde: TEdit
          Left = 230
          Top = 11
          Width = 198
          Height = 47
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
          OnExit = edtQtdeExit
          OnKeyDown = edtQtdeKeyDown
          OnKeyPress = edtQtdeKeyPress
        end
        object edtSubTotal: TEdit
          Left = 230
          Top = 62
          Width = 198
          Height = 47
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0,00'
          OnKeyDown = edtQtdeKeyDown
          OnKeyPress = edtQtdeKeyPress
        end
        object edtTarifa: TEdit
          Left = 230
          Top = 113
          Width = 198
          Height = 47
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '13,00'
          OnKeyDown = edtQtdeKeyDown
          OnKeyPress = edtQtdeKeyPress
        end
        object edtValorTarifa: TEdit
          Left = 230
          Top = 164
          Width = 198
          Height = 47
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0,00'
          OnKeyDown = edtQtdeKeyDown
          OnKeyPress = edtQtdeKeyPress
        end
        object edtTotalPagar: TEdit
          Left = 230
          Top = 215
          Width = 198
          Height = 47
          Alignment = taRightJustify
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227327
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0,00'
          OnKeyDown = edtQtdeKeyDown
          OnKeyPress = edtQtdeKeyPress
        end
        object btnSalvarAbastecimento: TButton
          Left = 230
          Top = 296
          Width = 198
          Height = 46
          Caption = 'SALVAR ABASTECIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnSalvarAbastecimentoClick
        end
        object btnLimparCampos: TButton
          Left = 230
          Top = 348
          Width = 198
          Height = 46
          Caption = 'LIMPAR CAMPOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = btnLimparCamposClick
        end
      end
    end
    object tbsAjustes: TTabSheet
      Caption = 'tbsAjustes'
      ImageIndex = 1
      ExplicitLeft = 8
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 264
        Height = 19
        Caption = 'Cadastros                                       '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 208
        Width = 265
        Height = 19
        Caption = 'Relat'#243'rios                                       '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 261
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label4: TLabel
        Left = 191
        Top = 261
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object Label5: TLabel
        Left = 155
        Top = 283
        Width = 17
        Height = 13
        Caption = 'At'#233
      end
      object Label17: TLabel
        Left = 440
        Top = 16
        Width = 252
        Height = 19
        Caption = 'Lan'#231'amentos                                '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 440
        Top = 208
        Width = 258
        Height = 19
        Caption = 'Banco de Dados                             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object btnTanques: TButton
        Left = 32
        Top = 48
        Width = 121
        Height = 25
        Caption = 'Tanques'
        TabOrder = 0
        OnClick = btnTanquesClick
      end
      object btnBombas: TButton
        Left = 32
        Top = 85
        Width = 121
        Height = 25
        Caption = 'Bombas'
        TabOrder = 1
        OnClick = btnBombasClick
      end
      object dtpDataIni: TDateTimePicker
        Left = 32
        Top = 280
        Width = 105
        Height = 21
        Date = 44441.653548240740000000
        Time = 44441.653548240740000000
        TabOrder = 2
      end
      object dtpDataFin: TDateTimePicker
        Left = 191
        Top = 280
        Width = 105
        Height = 21
        Date = 44441.653548240740000000
        Time = 44441.653548240740000000
        TabOrder = 3
      end
      object btnAbrirRelatorio: TButton
        Left = 32
        Top = 325
        Width = 265
        Height = 25
        Caption = 'Visualizar'
        TabOrder = 4
        OnClick = btnAbrirRelatorioClick
      end
      object btnAbastecimentos: TButton
        Left = 440
        Top = 48
        Width = 121
        Height = 25
        Caption = 'Abastecimentos'
        TabOrder = 5
        OnClick = btnAbastecimentosClick
      end
      object Button1: TButton
        Left = 440
        Top = 238
        Width = 121
        Height = 25
        Caption = 'Configura'#231#227'o'
        TabOrder = 6
        OnClick = Button1Click
      end
    end
    object tbsModelos: TTabSheet
      Caption = 'tbsModelos'
      ImageIndex = 2
      object pnlModelBombaGasolina: TPanel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 96
        Height = 112
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        BevelOuter = bvNone
        Color = 4227327
        ParentBackground = False
        TabOrder = 0
        object imgModelBombaFoto: TImage
          Left = 0
          Top = 0
          Width = 96
          Height = 112
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
            0040100400000050F065160000000467414D410000B18F0BFC61050000000262
            4B47440000AA8D23320000000970485973000000600000006000F06B42CF0000
            000774494D4507E5081F05171B3B7AA3080000030E4944415478DAED9BCF6BD4
            4014C7DF280AA2C5B317C54B2F2A8A3F0E82D49BF6A4C5D26ED54BFD5511BCE9
            AD7811112F420F225815FCD9DAAE567B1244042F7A7211FCF52F54C443C193A8
            F1FB32A94DB3499338C9663BF31E7C1FECECDB64BE9F6477339389A29CE19142
            3E029D86B643ABF36EC22066A057D015F4E243215B54F9CC2F47BE0F1D6EA1E9
            B8F8090DA2F3E3AD067001F962C5E6C310762E38133CDA16987A5F3C008F5621
            7F853AAA761E8A3118381A32FF2E681F42FBEDA2017421BFAEDA71246660605D
            D0BFADC80D6819F487F8374AD1AD2201F4223F8E79E7293409FD2ED1E81A88BF
            7E1B9B7AA57CC373AF4E208FE6829003405F60341A1DD8C88F12CDCFEDFF3872
            F369AD2216F2423006A0F2FD8E1A00C8BE7F0DEB6600C183CEA2EABA3B00747D
            F44CE847E5139700AC447E4BFA628D630295036E00D0E6B9F660A8B58ECA7EFB
            01C49B770440B2790700E871CA147420610BD603E8467EBEC816AC079074A126
            000480230092066BCE00481BAE5B0F206DC2C67200BA6618F9526B01102E4094
            3FDA2A1B400DF9510A00BE18BA477AD6BA650006FD9D2A7FDC5D96793EBD1F40
            871605A06BF9358FFA78DA7E07E9D9A45201541B695F41EFDF81110002400008
            000120000480001000024000080001200004802D0074F08AB14FD065185A3833
            EC088070F0FAC1BB2E01A8939EF6DA47E4CF09CE421B606CD60D00F3D3E2E145
            9CFBD1FAC23500E1FEF17AA0BA00700C40F8DEE0005A2782FB04BF82B649B4D5
            6C06B01BF94DD0FA0C3A46E41FF11B41DB55549EB719001FEDCF50674C15DFB9
            DA85CA86BD00741F79C5F834B43E62FE1CAA46123E6F1100DDCFB5C867A0CDA4
            9F30198B3DF2D602C8FF790190669CBF576C7E0FD455B5DF98B843FA49917198
            F95E1C008F56205F834E65E1D406C1D7FE279B46830600F8FF73A86A5739839F
            5AE986A9976600F469DFA0A571E4A3F105DA9479C14602005E67335CB51383D8
            02631F4D003CA4F875364B257A606CDA0400FFDDF555EDC220E64783024000FC
            17005E8F57CBB481F68C5E189B3201D0437AC1613B3D279C35F86F702F8C7DCB
            54FD1719DD7550D521C4480000002574455874646174653A6372656174650032
            3032312D30382D33315430353A32333A32372B30303A3030C6115D8000000025
            74455874646174653A6D6F6469667900323032312D30382D33315430353A3233
            3A32372B30303A3030B74CE53C0000000049454E44AE426082}
          ExplicitTop = -16
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object lblModelNumeroBomba: TLabel
          Left = 35
          Top = 31
          Width = 20
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = '01'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblModelValorCombustivel: TLabel
          Left = 3
          Top = 91
          Width = 90
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = '3,459'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblModelBombaCombustivel: TLabel
          Left = 3
          Top = 2
          Width = 90
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'GASOLINA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlModelBombaDiesel: TPanel
        AlignWithMargins = True
        Left = 120
        Top = 8
        Width = 96
        Height = 112
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        BevelOuter = bvNone
        Color = clBlack
        ParentBackground = False
        TabOrder = 1
        object Image4: TImage
          Left = 0
          Top = 0
          Width = 96
          Height = 112
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
            0040100400000050F065160000000467414D410000B18F0BFC61050000000262
            4B47440000AA8D23320000000970485973000000600000006000F06B42CF0000
            000774494D4507E5081F05171B3B7AA3080000030E4944415478DAED9BCF6BD4
            4014C7DF280AA2C5B317C54B2F2A8A3F0E82D49BF6A4C5D26ED54BFD5511BCE9
            AD7811112F420F225815FCD9DAAE567B1244042F7A7211FCF52F54C443C193A8
            F1FB32A94DB3499338C9663BF31E7C1FECECDB64BE9F6477339389A29CE19142
            3E029D86B643ABF36EC22066A057D015F4E243215B54F9CC2F47BE0F1D6EA1E9
            B8F8090DA2F3E3AD067001F962C5E6C310762E38133CDA16987A5F3C008F5621
            7F853AAA761E8A3118381A32FF2E681F42FBEDA2017421BFAEDA71246660605D
            D0BFADC80D6819F487F8374AD1AD2201F4223F8E79E7293409FD2ED1E81A88BF
            7E1B9B7AA57CC373AF4E208FE6829003405F60341A1DD8C88F12CDCFEDFF3872
            F369AD2216F2423006A0F2FD8E1A00C8BE7F0DEB6600C183CEA2EABA3B00747D
            F44CE847E5139700AC447E4BFA628D630295036E00D0E6B9F660A8B58ECA7EFB
            01C49B770440B2790700E871CA147420610BD603E8467EBEC816AC079074A126
            000480230092066BCE00481BAE5B0F206DC2C67200BA6618F9526B01102E4094
            3FDA2A1B400DF9510A00BE18BA477AD6BA650006FD9D2A7FDC5D96793EBD1F40
            871605A06BF9358FFA78DA7E07E9D9A45201541B695F41EFDF81110002400008
            000120000480001000024000080001200004802D0074F08AB14FD065185A3833
            EC088070F0FAC1BB2E01A8939EF6DA47E4CF09CE421B606CD60D00F3D3E2E145
            9CFBD1FAC23500E1FEF17AA0BA00700C40F8DEE0005A2782FB04BF82B649B4D5
            6C06B01BF94DD0FA0C3A46E41FF11B41DB55549EB719001FEDCF50674C15DFB9
            DA85CA86BD00741F79C5F834B43E62FE1CAA46123E6F1100DDCFB5C867A0CDA4
            9F30198B3DF2D602C8FF790190669CBF576C7E0FD455B5DF98B843FA49917198
            F95E1C008F56205F834E65E1D406C1D7FE279B46830600F8FF73A86A5739839F
            5AE986A9976600F469DFA0A571E4A3F105DA9479C14602005E67335CB51383D8
            02631F4D003CA4F875364B257A606CDA0400FFDDF555EDC220E64783024000FC
            17005E8F57CBB481F68C5E189B3201D0437AC1613B3D279C35F86F702F8C7DCB
            54FD1719DD7550D521C4480000002574455874646174653A6372656174650032
            3032312D30382D33315430353A32333A32372B30303A3030C6115D8000000025
            74455874646174653A6D6F6469667900323032312D30382D33315430353A3233
            3A32372B30303A3030B74CE53C0000000049454E44AE426082}
          ExplicitLeft = -3
          ExplicitTop = 2
        end
        object Label13: TLabel
          Left = 35
          Top = 31
          Width = 20
          Height = 18
          AutoSize = False
          Caption = '01'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 3
          Top = 91
          Width = 90
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = '3,459'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 3
          Top = 2
          Width = 90
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'DIESEL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1012
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 10
      Top = 0
      Width = 226
      Height = 40
      Align = alLeft
      Alignment = taCenter
      Caption = 'Posto ABC - Controle de Bombas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 21
    end
    object spdbtnMenu: TSpeedButton
      Left = 888
      Top = 0
      Width = 124
      Height = 40
      Align = alRight
      Caption = 'Menu'
      OnClick = spdbtnMenuClick
    end
  end
end
