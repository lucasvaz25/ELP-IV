object DM: TDM
  OldCreateOrder = False
  Height = 344
  Width = 479
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\ELP4_2020.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    Left = 48
    Top = 24
  end
  object Trans: TFDTransaction
    Connection = Conexao
    Left = 136
    Top = 24
  end
  object QPaises: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PAISES;')
    Left = 48
    Top = 136
  end
  object QEstados: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ESTADOS;')
    Left = 112
    Top = 136
  end
  object QCidades: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM CIDADES;')
    Left = 184
    Top = 136
  end
  object DsPaises: TDataSource
    DataSet = QPaises
    Left = 56
    Top = 224
  end
  object DsEstados: TDataSource
    DataSet = QEstados
    Left = 112
    Top = 216
  end
  object DsCidades: TDataSource
    DataSet = QCidades
    Left = 176
    Top = 208
  end
end
