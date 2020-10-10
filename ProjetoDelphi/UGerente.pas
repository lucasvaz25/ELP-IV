unit UGerente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  UControllerPaises,
  UControllerEstados,
  UControllerCidades,
  Upaises,
  Uestados,
  Ucidades,
  Uinter;

type
  TGerente = class( TForm )
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Paises1: TMenuItem;
    Estados1: TMenuItem;
    Cidades1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    procedure Sair1Click( Sender: TObject );
    procedure FormCreate( Sender: TObject );
    procedure FormDestroy( Sender: TObject );
    procedure Paises1Click( Sender: TObject );
    procedure Estados1Click( Sender: TObject );
    procedure Cidades1Click( Sender: TObject );
  private
    { Private declarations }
    AInter: Inter;
    OPais: Paises;
    OEstado: Estados;
    ACidade: Cidades;

    ActrlPais: ControllerPaises;
    ACtrlEstado: ControllerEstados;
    ACtrlCidade: ControllerCidades;
  public
    { Public declarations }
  end;

var
  Gerente: TGerente;

implementation

{$R *.dfm}


procedure TGerente.Cidades1Click( Sender: TObject );
begin
  AInter.ConsultaCidades( ACidade, ACtrlCidade );
end;

procedure TGerente.Estados1Click( Sender: TObject );
begin
  AInter.ConsultaEstados( OEstado, ACtrlEstado );
end;

procedure TGerente.FormCreate( Sender: TObject );
begin
  AInter  := Inter.CrieObj;
  OPais   := Paises.CrieObj;
  OEstado := Estados.CrieObj;
  ACidade := Cidades.CrieObj;

  ActrlPais   := ControllerPaises.CrieObj;
  ACtrlEstado := ControllerEstados.CrieObj;
  ACtrlCidade := ControllerCidades.CrieObj;

end;

procedure TGerente.FormDestroy( Sender: TObject );
begin
  Ainter.Destrua_se;
  OPais.Destrua_se;
  OEstado.Destrua_se;
  ACidade.Destrua_se;

  ActrlPais.Destrua_se;
  ACtrlEstado.Destrua_se;
  ACtrlCidade.Destrua_se;
end;

procedure TGerente.Paises1Click( Sender: TObject );
begin
  AInter.ConsultaPaises( OPais, ActrlPais );
end;

procedure TGerente.Sair1Click( Sender: TObject );
begin
  Close;
end;

end.
