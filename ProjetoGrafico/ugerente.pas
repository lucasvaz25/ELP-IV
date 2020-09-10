unit uGerente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,
  uInter, uPaises, uEstados, uCidades,
  uControllerPaises, ucontrollerEstados, uControllerCidades;

type

  { TGerente }

  TGerente = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuPaises: TMenuItem;
    MenuCidades: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem3: TMenuItem;
    MenuEstados: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuPaisesClick(Sender: TObject);
    procedure MenuCidadesClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuEstadosClick(Sender: TObject);
  private
    aInter: Inter;
    oPais: Paises;
    oEstado: Estados;
    aCidade: Cidades;

    aCtrlPais: CtrlPaises;
    aCtrlEstado: CtrlEstados;
    aCtrlCidade: CtrlCidades;
  public

  end;

var
  Gerente: TGerente;

implementation

{$R *.lfm}

{ TGerente }

procedure TGerente.FormCreate(Sender: TObject);
begin
  aInter := Inter.CrieObj;
  oPais := Paises.CrieObj;
  oEstado := Estados.CrieObj;
  aCidade := Cidades.CrieObj;

  aCtrlPais := CtrlPaises.CrieObj;
  aCtrlEstado := CtrlEstados.CrieObj;
  aCtrlCidade := CtrlCidades.CrieObj;

  aCtrlEstado.setCtrlPaises(aCtrlPais);
  aCtrlCidade.setCtrlEstados(aCtrlEstado);
end;

procedure TGerente.FormDestroy(Sender: TObject);
begin
  aInter.Destrua_se;
  oPais.Destrua_se;
  oEstado.Destrua_se;
  aCidade.Destrua_se;

  aCtrlPais.Destrua_se;
  aCtrlEstado.Destrua_se;
  aCtrlCidade.Destrua_se;
end;

procedure TGerente.MenuPaisesClick(Sender: TObject);
begin
  aInter.ConsultaPaises(oPais, aCtrlPais);

end;

procedure TGerente.MenuCidadesClick(Sender: TObject);
begin
  aInter.ConsultaCidades(aCidade, aCtrlCidade);
end;

procedure TGerente.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TGerente.MenuEstadosClick(Sender: TObject);
begin
  aInter.ConsultaEstados(oEstado, aCtrlEstado);
end;


end.

