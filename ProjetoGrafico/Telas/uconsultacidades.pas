unit uConsultaCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, uConsulta,
  uCadastroCidades, uCidades, uControllerCidades;

type

  { TConsultaCidades }

  TConsultaCidades = class(TConsulta)
    procedure btn_PesquisarClick(Sender: TObject);
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
    procedure CarregaListView; override;
  end;

var
  ConsultaCidades: TConsultaCidades;

implementation

{$R *.lfm}

{ TConsultaCidades }

procedure TConsultaCidades.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  Self.CarregaListView;
end;

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
  Self.CarregaListView;

  inherited Novo;
end;

procedure TConsultaCidades.Alterar;
begin
  oCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  oCadastroCidades.LimparEdt;
  oCadastroCidades.CarregaEdt;
  oCadastroCidades.ShowModal;
  Self.CarregaListView;
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

procedure TConsultaCidades.CarregaListView;
var
  I, Tam: integer;
  umaCidade: Cidades;
  LvITem: TListItem;
begin
  Tam := aCtrlCidade.TotalDados;
  Self.ListView1.Clear;
  for I := 1 to Tam do
  begin
    umaCidade := Cidades(aCtrlCidade.Carregar(I));
    LvItem := self.ListView1.Items.Add;
    LvItem.Caption := IntToStr(umaCidade.GetCodigo);
    LvItem.SubItems.Add(umaCidade.GetCidade);
    LvItem.SubItems.Add(umaCidade.GetDDD);
    LvItem.SubItems.Add(umaCidade.GetSigla);
    LvItem.SubItems.Add(umaCidade.GetoEstado.GetEstado);
    LvItem.SubItems.Add(umaCidade.GetDataCad);
  end;
end;

end.

