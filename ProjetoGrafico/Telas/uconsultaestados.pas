unit uConsultaEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroEstados;

type

  { TConsultaEstados }

  TConsultaEstados = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroEstados : TCadastroEstados;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;

  end;

var
  ConsultaEstados: TConsultaEstados;

implementation

{$R *.lfm}

{ TConsultaEstados }

procedure TConsultaEstados.FormCreate(Sender: TObject);
begin
  oCadastroEstados := TCadastroEstados.Create(nil);
end;

procedure TConsultaEstados.FormDestroy(Sender: TObject);
begin
  oCadastroEstados.FreeInstance;
end;

procedure TConsultaEstados.Sair;
begin
  inherited Sair;
end;

procedure TConsultaEstados.Novo;
begin
  inherited Novo;
  oCadastroEstados.ShowModal;
end;

procedure TConsultaEstados.Alterar;
begin
  inherited Alterar;
  oCadastroEstados.ShowModal;
end;

procedure TConsultaEstados.Excluir;
begin
  inherited Excluir;
end;

procedure TConsultaEstados.Pesquisar;
begin
  inherited Pesquisar;
end;

end.

