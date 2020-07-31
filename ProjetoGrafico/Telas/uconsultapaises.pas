unit uConsultaPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroPaises;

type

  { TConsultaPaises }

  TConsultaPaises = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroPaises : TCadastroPaises;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;

  end;

var
  ConsultaPaises: TConsultaPaises;

implementation

{$R *.lfm}

{ TConsultaPaises }

procedure TConsultaPaises.FormCreate(Sender: TObject);
begin
  oCadastroPaises := TCadastroPaises.Create(nil);
end;

procedure TConsultaPaises.FormDestroy(Sender: TObject);
begin
  oCadastroPaises.FreeInstance;
end;

procedure TConsultaPaises.Sair;
begin
  inherited Sair;
end;

procedure TConsultaPaises.Novo;
begin
  inherited Novo;
  oCadastroPaises.ShowModal;
end;

procedure TConsultaPaises.Alterar;
begin
  inherited Alterar;
  oCadastroPaises.ShowModal
end;

procedure TConsultaPaises.Excluir;
begin
  inherited Excluir;
end;

procedure TConsultaPaises.Pesquisar;
begin
  inherited Pesquisar;
end;

end.

