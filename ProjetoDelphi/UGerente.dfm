object Gerente: TGerente
  Left = 0
  Top = 0
  Caption = 'Gerente'
  ClientHeight = 308
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 308
    Align = alClient
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 447
    ExplicitHeight = 201
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 8
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Paises1: TMenuItem
        Caption = '&Paises'
        OnClick = Paises1Click
      end
      object Estados1: TMenuItem
        Caption = '&Estados'
        OnClick = Estados1Click
      end
      object Cidades1: TMenuItem
        Caption = '&Cidades'
        OnClick = Cidades1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
  end
end