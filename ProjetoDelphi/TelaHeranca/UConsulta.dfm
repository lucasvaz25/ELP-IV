object Consulta: TConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 383
  ClientWidth = 561
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
    Width = 561
    Height = 383
    Align = alClient
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object edChave: TEdit
      Left = 16
      Top = 24
      Width = 442
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 464
      Top = 22
      Width = 75
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object btnNovo: TButton
      Left = 221
      Top = 338
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 2
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 302
      Top = 338
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 383
      Top = 338
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 464
      Top = 338
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = btnSairClick
    end
    object ListView1: TListView
      Left = 16
      Top = 72
      Width = 523
      Height = 241
      Checkboxes = True
      Columns = <>
      RowSelect = True
      TabOrder = 6
    end
  end
end