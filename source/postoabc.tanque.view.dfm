inherited frmTanques: TfrmTanques
  Caption = 'Tanques'
  KeyPreview = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    ActivePage = tbsDados
    inherited tbsListagem: TTabSheet
      inherited dbgListagem: TDBGrid
        DataSource = dsCadastro
        Columns = <
          item
            Expanded = False
            FieldName = 'TANQUE_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_TANQUE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAPACIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUEATUAL'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORUNIT'
            Visible = True
          end>
      end
    end
    inherited tbsDados: TTabSheet
      object Label2: TLabel [0]
        Left = 24
        Top = 48
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbedtCodigo
      end
      object Label3: TLabel [1]
        Left = 24
        Top = 135
        Width = 56
        Height = 13
        Caption = 'Capacidade'
        FocusControl = dbedtCapacidade
      end
      object Label4: TLabel [2]
        Left = 24
        Top = 225
        Width = 88
        Height = 13
        Caption = 'Valor Unit'#225'rio Litro'
        FocusControl = dbedtValorUnit
      end
      object Label5: TLabel [3]
        Left = 24
        Top = 91
        Width = 96
        Height = 13
        Caption = 'Tipo de Combust'#237'vel'
      end
      object Label1: TLabel [4]
        Left = 24
        Top = 181
        Width = 67
        Height = 13
        Caption = 'Estoque Atual'
        FocusControl = dbedtEstoqueAtual
      end
      inherited Panel2: TPanel
        TabOrder = 5
      end
      object dbedtCodigo: TDBEdit
        Left = 24
        Top = 64
        Width = 134
        Height = 21
        DataField = 'TANQUE_ID'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 4
        OnKeyDown = dbedtCodigoKeyDown
      end
      object dbedtCapacidade: TDBEdit
        Left = 24
        Top = 152
        Width = 134
        Height = 21
        DataField = 'CAPACIDADE'
        DataSource = dsCadastro
        TabOrder = 1
        OnKeyDown = dbedtCodigoKeyDown
      end
      object dbedtValorUnit: TDBEdit
        Left = 24
        Top = 242
        Width = 134
        Height = 21
        DataField = 'VALORUNIT'
        DataSource = dsCadastro
        TabOrder = 3
        OnKeyDown = dbedtCodigoKeyDown
      end
      object dbcbxTipoTanque: TDBComboBox
        Left = 24
        Top = 107
        Width = 134
        Height = 21
        DataField = 'TIPO_TANQUE'
        DataSource = dsCadastro
        Items.Strings = (
          'DIESEL'
          'GASOLINA')
        TabOrder = 0
        OnKeyDown = dbedtCodigoKeyDown
      end
      object dbedtEstoqueAtual: TDBEdit
        Left = 24
        Top = 197
        Width = 134
        Height = 21
        DataField = 'ESTOQUEATUAL'
        DataSource = dsCadastro
        TabOrder = 2
        OnKeyDown = dbedtCodigoKeyDown
      end
    end
  end
  inherited qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    AfterEdit = qryCadastroAfterEdit
    SQL.Strings = (
      'select *'
      'from tanques')
    object qryCadastroTANQUE_ID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'TANQUE_ID'
      KeyFields = 'TANQUE_ID'
      Origin = 'TANQUE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryCadastroTIPO_TANQUE: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_TANQUE'
      Origin = 'TIPO_TANQUE'
      Required = True
    end
    object qryCadastroCAPACIDADE: TSingleField
      DisplayLabel = 'Capacidade'
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
      Required = True
      DisplayFormat = '#,###'
      EditFormat = '#,###'
    end
    object qryCadastroESTOQUEATUAL: TSingleField
      DisplayLabel = 'Estoque Atual'
      FieldName = 'ESTOQUEATUAL'
      Origin = 'ESTOQUEATUAL'
      Required = True
      DisplayFormat = '#,###'
      EditFormat = '#,###'
    end
    object qryCadastroVALORUNIT: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio Litro'
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      Required = True
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
      currency = True
      Precision = 18
      Size = 3
    end
  end
end
