unit uConsultaEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ComCtrls, Dialogs, uConsulta,
  uCadastroEstados, uEstados, uControllerEstados;

type

  { TConsultaEstados }

  TConsultaEstados = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroEstados: TCadastroEstados;
    oEstado: Estados;
    aCtrlEstado: CtrlEstados;
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
  ConsultaEstados: TConsultaEstados;

implementation

{$R *.lfm}

{ TConsultaEstados }

procedure TConsultaEstados.FormCreate(Sender: TObject);
begin

end;

procedure TConsultaEstados.FormDestroy(Sender: TObject);
begin

end;

procedure TConsultaEstados.Sair;
begin
  inherited Sair;
end;

procedure TConsultaEstados.Novo;
begin
  oCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  oCadastroEstados.LimparEdt;
  oCadastroEstados.ShowModal;
  inherited Novo;
end;

procedure TConsultaEstados.Alterar;
begin
  oCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  oCadastroEstados.LimparEdt;
  oCadastroEstados.CarregaEdt;
  oCadastroEstados.ShowModal;
  inherited Alterar;
end;

procedure TConsultaEstados.Excluir;
var
  Aux: string;
begin
  oCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
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
  oCadastroEstados := TCadastroEstados(pObj);
  inherited SetFormCadastro(oCadastroEstados);
end;

procedure TConsultaEstados.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
end;

procedure TConsultaEstados.CarregaListView;
var
  I, Tam: integer;
  umEstado: Estados;
  LvITem: TListItem;
begin
  Tam := aCtrlEstado.TotalDados;
  Self.ListView1.Clear;
  for I := 1 to Tam do
  begin
    umEstado := Estados(aCtrlEstado.Carregar(I));
    LvItem := self.ListView1.Items.Add;
    LvItem.Caption := IntToStr(umEstado.GetCodigo);
    LvItem.SubItems.Add(umEstado.GetEstado);
    LvItem.SubItems.Add(umEstado.GetUF);
    LvItem.SubItems.Add(umEstado.GetoPais.GetPais);
    LvItem.SubItems.Add(umEstado.GetDataCad);
  end;
  //  inherited CarregaListView;
end;

end.

