inherited CadastroCidades: TCadastroCidades
  Caption = 'Cadastro Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object lblCidade: TLabel [0]
      Left = 24
      Top = 73
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblDDD: TLabel [1]
      Left = 408
      Top = 73
      Width = 21
      Height = 13
      Caption = 'DDD'
    end
    object lblSigla: TLabel [2]
      Left = 464
      Top = 73
      Width = 22
      Height = 13
      Caption = 'Sigla'
    end
    object lblCodEstado: TLabel [3]
      Left = 24
      Top = 154
      Width = 59
      Height = 13
      Caption = 'C'#243'd. Estado'
    end
    object lblEstado: TLabel [4]
      Left = 89
      Top = 154
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object edtCidade: TEdit
      Left = 24
      Top = 88
      Width = 378
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edtDDD: TEdit
      Left = 408
      Top = 88
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edtSigla: TEdit
      Left = 464
      Top = 88
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edtCodEstado: TEdit
      Left = 24
      Top = 168
      Width = 59
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
    end
    object edtEstado: TEdit
      Left = 89
      Top = 168
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object btn_PesquisarEstado: TButton
      Left = 408
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 9
      OnClick = btn_PesquisarEstadoClick
    end
  end
end
