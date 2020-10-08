unit uGerente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,
  uInter, uGrupo, uSubGrupo,
  uControllerGrupos, uControllerSubGrupos;

type

  { TGerente }

  TGerente = class(TForm)                               //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    aInter: Inter;
    oGrupo: Grupos;
    oSubGrupo: SubGrupos;


    aCtrlGrupo: CtrlGrupos;
    aCtrlSubGrupo: CtrlSubGrupo;


  public

  end;

var
  Gerente: TGerente;

implementation

{$R *.lfm}

{ TGerente }

procedure TGerente.MenuItem4Click(Sender: TObject);
begin
  Close;                                                  //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end;

procedure TGerente.FormCreate(Sender: TObject);
begin
  aInter := Inter.CrieObj;
  oGrupo := Grupos.CrieObj;
  oSubGrupo := SubGrupos.CrieObj;

  aCtrlGrupo := CtrlGrupos.CrieObj;
  aCtrlsubgrupo := CtrlSubGrupo.CrieObj;

  aCtrlsubgrupo.setCtrlGrupos(aCtrlGrupo);
end;

procedure TGerente.FormDestroy(Sender: TObject);
begin
  aInter.Destrua_se;
  oGrupo.Destrua_se;
  oSubGrupo.Destrua_se;

  aCtrlGrupo.Destrua_se;
  aCtrlsubgrupo.Destrua_se;
end;

procedure TGerente.MenuItem2Click(Sender: TObject);
begin
  aInter.ConsultaGrupos(oGrupo, aCtrlGrupo);
end;

procedure TGerente.MenuItem3Click(Sender: TObject);        //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
begin
  aInter.ConsultaSubGrupos(oSubGrupo, aCtrlSubGrupo);
end;

end.

