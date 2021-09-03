object frmCadPadrao: TfrmCadPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadPadrao'
  ClientHeight = 411
  ClientWidth = 675
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TPageControl
    Left = 0
    Top = 40
    Width = 675
    Height = 371
    ActivePage = tbsListagem
    Align = alClient
    TabOrder = 0
    object tbsListagem: TTabSheet
      Caption = 'Listagem'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object spdbtnExcluir: TSpeedButton
          Left = 140
          Top = 0
          Width = 50
          Height = 40
          Action = actExcluir
          Align = alLeft
          ExplicitLeft = 100
        end
        object spdbtnEditar: TSpeedButton
          Left = 70
          Top = 0
          Width = 70
          Height = 40
          Action = actEditar
          Align = alLeft
        end
        object spdbtnNovo: TSpeedButton
          Left = 0
          Top = 0
          Width = 70
          Height = 40
          Action = actNovo
          Align = alLeft
        end
        object spdbtnAtualizar: TSpeedButton
          Left = 576
          Top = 0
          Width = 91
          Height = 40
          Action = actAtualizar
          Align = alRight
        end
      end
      object dbgListagem: TDBGrid
        Left = 0
        Top = 40
        Width = 667
        Height = 303
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbsDados: TTabSheet
      Caption = 'Campos'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object spdbtnSalvar: TSpeedButton
          Left = 567
          Top = 0
          Width = 100
          Height = 40
          Action = actSalvar
          Align = alRight
          ExplicitLeft = 587
        end
        object spdbtnCancelar: TSpeedButton
          Left = 487
          Top = 0
          Width = 80
          Height = 40
          Action = actCancelar
          Align = alRight
          ExplicitLeft = 527
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 10
    TabOrder = 1
    object lblTitulo: TLabel
      Left = 10
      Top = 0
      Width = 90
      Height = 40
      Align = alLeft
      Alignment = taCenter
      Caption = 'Titulo da Tela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 21
    end
  end
  object qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    AfterPost = qryCadastroAfterPost
    Connection = dmConexao.fdconBomba
    Left = 336
    Top = 224
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    OnDataChange = dsCadastroDataChange
    Left = 424
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 416
    Top = 152
  end
  object ActionList1: TActionList
    Left = 368
    Top = 312
    object actNovo: TAction
      Caption = 'Novo [F2]'
      ShortCut = 113
      OnExecute = actNovoExecute
    end
    object actEditar: TAction
      Caption = 'Editar [F3]'
      ShortCut = 114
      OnExecute = actEditarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar [Esc]'
      ShortCut = 27
      OnExecute = actCancelarExecute
    end
    object actSalvar: TAction
      Caption = 'Salvar [Ctrl+S]'
      ShortCut = 16467
      OnExecute = actSalvarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
    end
    object actAtualizar: TAction
      Caption = 'Atualizar [F5]'
      ShortCut = 116
      OnExecute = actAtualizarExecute
    end
  end
end
