unit UConsultaSubGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, UConsulta,
  uCadastroSubGrupos,
  uSubGrupo,
  StdCtrls, ComCtrls,
  uControllerSubGrupos;

type                              //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  { TConsultaSubGrupos }

  TConsultaSubGrupos = class(TConsulta)
  private
    oCadastroSubGrupo: TCadastroSubGrupos;
    oSubGrupo: Subgrupos;
    aCtrlSubGrupo: CtrlSubGrupo;
  public
    procedure Sair; override;
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
    procedure Pesquisar; override;
    procedure SetFormCadastro(pObj: TObject); override;
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure CarregaListView; override;
    function Selecionar: integer;
    function RetornaObj : TObject;  Override;
  end;

var
  ConsultaSubGrupos: TConsultaSubGrupos;

implementation

{$R *.lfm}

{ TConsultaSubGrupos }

procedure TConsultaSubGrupos.Sair;
begin
  inherited Sair;
end;

procedure TConsultaSubGrupos.Novo;
begin
  oCadastrosubGrupo.ConhecaObj(oSubGrupo, aCtrlSubGrupo);
  oCadastrosubGrupo.LimparEdt;
  oCadastrosubGrupo.ShowModal;
  Self.CarregaListView;
  inherited Novo;
end;

procedure TConsultaSubGrupos.Alterar;
begin
  oCadastrosubGrupo.ConhecaObj(oSubGrupo, aCtrlSubGrupo);
  oCadastrosubGrupo.LimparEdt;
  oCadastrosubGrupo.CarregaEdt;
  oCadastrosubGrupo.ShowModal;
  Self.CarregaListView;
  inherited Alterar;
end;

procedure TConsultaSubGrupos.Excluir;                                       //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
var
  Aux: string;
begin
  oCadastrosubGrupo.ConhecaObj(oSubGrupo, aCtrlSubGrupo);
  oCadastrosubGrupo.LimparEdt;
  oCadastrosubGrupo.CarregaEdt;
  oCadastrosubGrupo.BloqueiEdt;
  Aux := oCadastrosubGrupo.btn_Salvar.Caption;
  oCadastrosubGrupo.btn_Salvar.Caption := 'Excluir';
  oCadastrosubGrupo.ShowModal;
  oCadastrosubGrupo.btn_Salvar.Caption := Aux;
  oCadastrosubGrupo.DesbloqueiaEdt;
  Self.CarregaListView;
  inherited Excluir;
end;

procedure TConsultaSubGrupos.Pesquisar;
begin
  Self.CarregaListView;
  inherited Pesquisar;
end;

procedure TConsultaSubGrupos.SetFormCadastro(pObj: TObject);
begin
  oCadastrosubGrupo := TCadastroSubGrupos(pObj);
  inherited SetFormCadastro(pObj);
end;

procedure TConsultaSubGrupos.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  oSubGrupo := SubGrupos(pObj);
  aCtrlSubGrupo := CtrlSubGrupo(pCtrl);
  Self.Pesquisar();
end;

procedure TConsultaSubGrupos.CarregaListView;
var
  I, Tam: integer;
  umSubGrupo: SubGrupos;
  LvITem: TListItem;
begin
  Tam := aCtrlSubGrupo.TotalDados;
  Self.ListView1.Clear;
  for I := 1 to Tam do
  begin
    umSubGrupo := SubGrupos(aCtrlSubGrupo.Carregar(I));
    LvItem := self.ListView1.Items.Add;
    LvItem.Caption := IntToStr(umSubGrupo.GetCodigo);
    LvItem.SubItems.Add(umSubGrupo.GetSubGrupo);
    LvItem.SubItems.Add(umSubGrupo.GetObs);
    LvItem.SubItems.Add(umSubGrupo.GetumGrupo.GetGrupo);
    LvItem.SubItems.Add(umSubGrupo.GetDataCad);
  end;
end;

function TConsultaSubGrupos.Selecionar: integer;
var
  I, Tam: integer;
  Achei: Boolean;
begin
  Tam := aCtrlSubGrupo.TotalDados;
  Achei := False;
  I := 0;
  While ( I < Tam ) and not achei do
  begin
    if self.ListView1.Items.Item[I].Checked then
      Achei := True;
    I := I + 1;
  end;
  Result := I;
end;

function TConsultaSubGrupos.RetornaObj: TObject;
begin
  oSubGrupo := SubGrupo( aCtrlSubGrupo.Carregar( Self.Selecionar ) );
  Result := oSubGrupo.Clone;
end;
           //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end.

