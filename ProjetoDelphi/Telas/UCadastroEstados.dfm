inherited CadastroEstados: TCadastroEstados
  Caption = 'Cadastro Estados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 24
      Top = 75
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label2: TLabel [1]
      Left = 496
      Top = 75
      Width = 22
      Height = 13
      Caption = 'Sigla'
    end
    object Label3: TLabel [2]
      Left = 24
      Top = 143
      Width = 45
      Height = 13
      Caption = 'C'#243'd. Pa'#237's'
    end
    object Label4: TLabel [3]
      Left = 98
      Top = 141
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
    end
    object edtEstado: TEdit
      Left = 24
      Top = 88
      Width = 457
      Height = 21
      TabOrder = 4
    end
    object edtSigla: TEdit
      Left = 496
      Top = 88
      Width = 59
      Height = 21
      TabOrder = 5
    end
    object edtCodPais: TEdit
      Left = 24
      Top = 156
      Width = 57
      Height = 21
      TabOrder = 6
    end
    object edtPais: TEdit
      Left = 96
      Top = 156
      Width = 385
      Height = 21
      TabOrder = 7
    end
    object btnPesquisarPais: TButton
      Left = 496
      Top = 154
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 8
      OnClick = btnPesquisarPaisClick
    end
  end
end
