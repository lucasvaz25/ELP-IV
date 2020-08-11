unit uConsultaCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroCidades, uCidades;

type

  { TConsultaCidades }

  TConsultaCidades = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroCidades : TCadastroCidades;
    aCidade : Cidades;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;
    procedure SetFormCadastro( pObj : TObject ); Override;
    procedure ConhecaObj( pObj : TObject );
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
  oCadastroCidades.ConhecaObj( aCidade );
  oCadastroCidades.LimparEdt;
  oCadastroCidades.ShowModal;
  inherited Novo;
end;

procedure TConsultaCidades.Alterar;
begin
  oCadastroCidades.ConhecaObj( aCidade );
  oCadastroCidades.LimparEdt;
  oCadastroCidades.CarregaEdt;
  oCadastroCidades.ShowModal;
  inherited Alterar;
end;

procedure TConsultaCidades.Excluir;
var
  Aux : String;
begin
  oCadastroCidades.ConhecaObj( aCidade );
  oCadastroCidades.LimparEdt;
  oCadastroCidades.CarregaEdt;
  oCadastroCidades.BloqueiEdt;
  Aux := oCadastroCidades.btn_Salvar.Caption;
  oCadastroCidades.btn_Salvar.Caption := 'Excluir';
  oCadastroCidades.ShowModal;
  oCadastroCidades.btn_Salvar.Caption := Aux;
  oCadastroCidades.DesbloqueiaEdt;
  inherited Excluir;
end;

procedure TConsultaCidades.Pesquisar;
begin
  inherited Pesquisar;
end;

procedure TConsultaCidades.SetFormCadastro(pObj: TObject);
begin
  oCadastroCidade := TCadastroCidades( pObj );
  inherited SetFormCadastro( oCadastroCidades );
end;

procedure TConsultaCidades.ConhecaObj(pObj: TObject);
begin
  aCidade := Cidades( pObj );
end;

end.

