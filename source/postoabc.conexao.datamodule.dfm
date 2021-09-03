object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 383
  Width = 527
  object fdconBomba: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Meus Projetos\Controle de Bombas\database\BOMBAS.FDB'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB'
      'PageSize=8192')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 64
    Top = 88
  end
  object qryListarBombas: TFDQuery
    Connection = fdconBomba
    SQL.Strings = (
      'select b.tanque_id, b.bomba_id, t.tipo_tanque, t.valorunit'
      'from bombas b'
      'left join tanques t on b.TANQUE_ID = t.TANQUE_ID'
      'order by tipo_tanque, bomba_id')
    Left = 248
    Top = 176
    object qryListarBombasTANQUE_ID: TIntegerField
      FieldName = 'TANQUE_ID'
      Origin = 'TANQUE_ID'
      Required = True
    end
    object qryListarBombasBOMBA_ID: TIntegerField
      FieldName = 'BOMBA_ID'
      Origin = 'BOMBA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListarBombasTIPO_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_TANQUE'
      Origin = 'TIPO_TANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryListarBombasVALORUNIT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object qryBuscarDadosBomba: TFDQuery
    Connection = fdconBomba
    SQL.Strings = (
      'select b.tanque_id, b.bomba_id, t.tipo_tanque, t.valorunit'
      'from bombas b'
      'left join tanques t on b.TANQUE_ID = t.TANQUE_ID'
      'where bomba_id = :id'
      'order by bomba_id')
    Left = 240
    Top = 288
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'TANQUE_ID'
      Origin = 'TANQUE_ID'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'BOMBA_ID'
      Origin = 'BOMBA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_TANQUE'
      Origin = 'TIPO_TANQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object cmdSQL: TFDCommand
    Connection = fdconBomba
    CommandText.Strings = (
      
        'insert into abastecimentos(bomba_id, data_inc, hora_inc, qtde, v' +
        'alorunit, subtotal, percentualtarifa, valortarifa)'
      
        'values(:bombaid, :data, :hora, :qtde, :valorunit, :subtotal, :ta' +
        'rifa, :valortarifa)')
    ParamData = <
      item
        Name = 'BOMBAID'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        Name = 'QTDE'
        ParamType = ptInput
      end
      item
        Name = 'VALORUNIT'
        ParamType = ptInput
      end
      item
        Name = 'SUBTOTAL'
        ParamType = ptInput
      end
      item
        Name = 'TARIFA'
        ParamType = ptInput
      end
      item
        Name = 'VALORTARIFA'
        ParamType = ptInput
      end>
    Left = 144
    Top = 256
  end
end
