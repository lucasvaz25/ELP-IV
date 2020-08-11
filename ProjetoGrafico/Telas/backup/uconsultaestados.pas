unit uConsultaEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroEstados, uEstados;

type

  { TConsultaEstados }

  TConsultaEstados = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroEstados : TCadastroEstados;
    oEstado : Estados;
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
  oCadastroEstados.ConhecaObj( oEstado );
  oCadastroEstados.LimparEdt;
  oCadastroEstados.ShowModal;
  inherited Novo;
end;

procedure TConsultaEstados.Alterar;
begin
  oCadastroEstados.ConhecaObj( oEstado );
  oCadastroEstados.LimparEdt;
  oCadastroEstados.CarregaEdt;
  oCadastroEstados.ShowModal;
  inherited Alterar;
end;

procedure TConsultaEstados.Excluir;
var
  Aux : String;
begin
  oCadastroEstados.ConhecaObj( oEstado );
  oCadastroEstados.LimparEdt;
  oCadastroEstados.CarregaEdt;
  oCadastroEstados.BloqueiEdt;
  Aux := oCadastroEstados.btn_Salvar.Caption;
  oCadastroEstados.btn_Salvar.Caption := 'Excluir';
  oCadastroEstados.ShowModal;
  oCadastroEstados.btn_Salvar.Caption := Aux;
  oCadastroEstados.DesbloqueiaEdt;
  inherited Excluir;
end;

procedure TConsultaEstados.Pesquisar;
begin
  inherited Pesquisar;
end;

procedure TConsultaEstados.SetFormCadastro(pObj: TObject);
begin
  inherited SetFormCadastro(pObj);
end;

procedure TConsultaEstados.ConhecaObj(pObj: TObject);
begin
  oEstado := Estados( pObj );
end;

end.

