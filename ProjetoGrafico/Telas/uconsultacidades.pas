unit uConsultaCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroCidades;

type

  { TConsultaCidades }

  TConsultaCidades = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroCidades : TCadastroCidades;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;
  end;

var
  ConsultaCidades: TConsultaCidades;

implementation

{$R *.lfm}

{ TConsultaCidades }

procedure TConsultaCidades.FormCreate(Sender: TObject);
begin
  oCadastroCidades := TCadastroCidades.Create(nil);
end;

procedure TConsultaCidades.FormDestroy(Sender: TObject);
begin
  oCadastroCidades.FreeInstance;
end;

procedure TConsultaCidades.Sair;
begin
  inherited Sair;
end;

procedure TConsultaCidades.Novo;
begin
  inherited Novo;
  oCadastroCidades.ShowModal;
end;

procedure TConsultaCidades.Alterar;
begin
  inherited Alterar;
  oCadastroCidades.ShowModal;
end;

procedure TConsultaCidades.Excluir;
begin
  inherited Excluir;
end;

procedure TConsultaCidades.Pesquisar;
begin
  inherited Pesquisar;
end;

end.

