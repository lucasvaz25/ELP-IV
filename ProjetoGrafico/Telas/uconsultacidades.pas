unit uConsultaCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroCidades, uCidades, uControllerCidades;

type

  { TConsultaCidades }

  TConsultaCidades = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroCidades: TCadastroCidades;
    aCidade: Cidades;
    aCtrlCidade: CtrlCidades;
  public
    procedure Sair; override;
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
    procedure Pesquisar; override;
    procedure SetFormCadastro(pObj: TObject); override;
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
  end;

var
  ConsultaCidades: TConsultaCidades;

implementation

{$R *.lfm}

{ TConsultaCidades }

procedure TConsultaCidades.FormCreate(Sender: TObject);
begin

end;

procedure TConsultaCidades.FormDestroy(Sender: TObject);
begin

end;

procedure TConsultaCidades.Sair;
begin
  inherited Sair;
end;

procedure TConsultaCidades.Novo;
begin
  oCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  oCadastroCidades.LimparEdt;
  oCadastroCidades.ShowModal;
  inherited Novo;
end;

procedure TConsultaCidades.Alterar;
begin
  oCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  oCadastroCidades.LimparEdt;
  oCadastroCidades.CarregaEdt;
  oCadastroCidades.ShowModal;
  inherited Alterar;
end;

procedure TConsultaCidades.Excluir;
var
  Aux: string;
begin
  oCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
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
  oCadastroCidades := TCadastroCidades(pObj);
  inherited SetFormCadastro(oCadastroCidades);
end;

procedure TConsultaCidades.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
end;

end.

