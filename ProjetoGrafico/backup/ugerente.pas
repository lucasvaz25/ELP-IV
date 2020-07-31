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
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
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

procedure TGerente.MenuItem2Click(Sender: TObject);
begin
  aInter.PecaDadosPaises;
end;

procedure TGerente.MenuItem3Click(Sender: TObject);
begin
  aInter.PecaDadosCidades;
end;

procedure TGerente.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TGerente.N1Click(Sender: TObject);
begin
  aInter.PecaDadosEstados;
end;

end.

