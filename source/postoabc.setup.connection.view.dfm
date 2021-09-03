object frmSetupConnection: TfrmSetupConnection
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o do Banco de Dados'
  ClientHeight = 195
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 50
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label2: TLabel
    Left = 32
    Top = 96
    Width = 76
    Height = 13
    Caption = 'Banco de dados'
  end
  object Label3: TLabel
    Left = 32
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label4: TLabel
    Left = 236
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label5: TLabel
    Left = 236
    Top = 50
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object spdbtnFindDatabase: TSpeedButton
    Left = 394
    Top = 114
    Width = 24
    Height = 24
    OnClick = spdbtnFindDatabaseClick
  end
  object edtServer: TEdit
    Left = 32
    Top = 69
    Width = 180
    Height = 21
    TabOrder = 2
    OnKeyDown = edtUserNameKeyDown
  end
  object edtDatabase: TEdit
    Left = 32
    Top = 115
    Width = 361
    Height = 21
    TabOrder = 4
    OnKeyDown = edtUserNameKeyDown
  end
  object edtUserName: TEdit
    Left = 32
    Top = 27
    Width = 180
    Height = 21
    TabOrder = 0
    OnKeyDown = edtUserNameKeyDown
  end
  object edtPassword: TEdit
    Left = 236
    Top = 27
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyDown = edtUserNameKeyDown
  end
  object edtPort: TEdit
    Left = 236
    Top = 69
    Width = 180
    Height = 21
    TabOrder = 3
    OnKeyDown = edtUserNameKeyDown
  end
  object btnCancelar: TButton
    Left = 212
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton
    Left = 293
    Top = 152
    Width = 123
    Height = 25
    Caption = '&Salvar Configura'#231#227'o'
    ModalResult = 1
    TabOrder = 6
    OnClick = btnSalvarClick
  end
  object btnTestarConexao: TButton
    Left = 33
    Top = 152
    Width = 96
    Height = 25
    Caption = '&Testar Conex'#227'o'
    TabOrder = 5
    OnClick = btnTestarConexaoClick
  end
  object fodFindDatabase: TFileOpenDialog
    DefaultExtension = '*.fdb'
    FavoriteLinks = <>
    FileName = 'C:\Meus Projetos\Controle de Bombas\source'
    FileTypes = <
      item
        DisplayName = 'Firebird'
        FileMask = '*.fdb'
      end>
    Options = []
    Left = 200
    Top = 96
  end
end
