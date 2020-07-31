unit uGerente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus,
  uInter;

type

  { TGerente }

  TGerente = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuPaises: TMenuItem;
    MenuCidades: TMenuItem;
    MenuItem4: TMenuItem;
    N2: TMenuItem;
    MenuEstados: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuPaisesClick(Sender: TObject);
    procedure MenuCidadesClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuEstadosClick(Sender: TObject);
  private
    aInter : Inter;
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
end;

procedure TGerente.FormDestroy(Sender: TObject);
begin
  aInter.Destrua_se;
end;

procedure TGerente.MenuPaisesClick(Sender: TObject);
begin
  aInter.PecaDadosPaises;
end;

procedure TGerente.MenuCidadesClick(Sender: TObject);
begin
  aInter.PecaDadosCidades;
end;

procedure TGerente.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TGerente.MenuEstadosClick(Sender: TObject);
begin
  aInter.PecaDadosEstados;
end;

end.

