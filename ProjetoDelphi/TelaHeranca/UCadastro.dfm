object Cadastro: TCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 427
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 427
    Align = alClient
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object edtCodigo: TLabeledEdit
      Left = 24
      Top = 32
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDataCad: TLabeledEdit
      Left = 24
      Top = 392
      Width = 81
      Height = 21
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Data Cadastro'
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object btnSalvar: TButton
      Left = 384
      Top = 390
      Width = 75
      Height = 25
      Caption = '&Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnSair: TButton
      Left = 480
      Top = 390
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
end
