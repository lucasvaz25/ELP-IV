unit UConsultaGrupos;

{$mode objfpc}{$H+}

interface
//ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, UConsulta, CadastroGrupos,StdCtrls, ComCtrls, uGrupo, uControllerGrupos;

type

  { TConsultaGrupos }

  TConsultaGrupos = class(TConsulta)
  private
    oCadastroGrupo : TCadastroGrupos;
    oGrupo : Grupos;
    aCtrlGrupo: CtrlGrupos;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;
    procedure SetFormCadastro( pObj : TObject ); Override;
    procedure ConhecaObj( pObj : TObject; pCtrl :TObject ); Override;
    procedure CarregaListView;  Override;
    function Selecionar: integer;
    function RetornaObj : TObject; Override;
  end;

var
  ConsultaGrupos: TConsultaGrupos;

implementation

{$R *.lfm}

{ TConsultaGrupos }

procedure TConsultaGrupos.Sair;
begin
  inherited Sair;
end;

procedure TConsultaGrupos.Novo;
begin
   oCadastroGrupo.ConhecaObj(oGrupo, aCtrlGrupo);
   oCadastroGrupo.LimparEdt;
   oCadastroGrupo.ShowModal;
   Self.CarregalistView;
  inherited Novo;
end;

procedure TConsultaGrupos.Alterar;
begin
  oGrupo := Grupos(aCtrlGrupo.Carregar(Self.Selecionar));
  oCadastroGrupo.ConhecaObj(oGrupo, aCtrlGrupo);
  oCadastroGrupo.LimparEdt;
  oCadastroGrupo.CarregaEdt;
  oCadastroGrupo.ShowModal;
  Self.CarregaListView;
  inherited Alterar;
end;

procedure TConsultaGrupos.Excluir;
var
  Aux : String;
begin
  oGrupo := Grupos(aCtrlGrupo.Carregar(Self.Selecionar));
  oCadastroGrupo.ConhecaObj(oGrupo, aCtrlGrupo);
  oCadastroGrupo.LimparEdt;
  oCadastroGrupo.CarregaEdt;
  oCadastroGrupo.BloqueiEdt;
  Aux := ocadastroGrupo.Btn_Salvar.caption;
  oCadastroGrupo.Btn_Salvar.caption := 'Excluir';
  oCadastroGrupo.ShowModal;
  oCadastroGrupo.btn_Salvar.Caption := Aux;
  oCadastroGrupo.DesbloqueiaEdt;
  Self.CarregaListView;
  inherited Excluir;                                                  //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end;

procedure TConsultaGrupos.Pesquisar;
begin
  Self.CarregaListView;
  inherited Pesquisar;
end;

procedure TConsultaGrupos.SetFormCadastro(pObj: TObject);
begin
  ocadastroGrupo := TCadastroGrupos(pObj);
  inherited SetFormCadastro(oCadastroGrupo);
end;

procedure TConsultaGrupos.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  oGrupo := Grupos(pObj);
  aCtrlGrupo := CtrlGrupos(pCtrl);
  Self.Pesquisar();
end;

procedure TConsultaGrupos.CarregaListView;
var
  I, Tam : Integer;
  umGrupo: Grupos;
  LvITem: TListItem;
begin
  Tam := aCtrlGrupo.TotalDados;
  Self.ListView1.Clear;
  for I := 1 to Tam do
  begin
    umGrupo := Grupos(aCtrlGrupo.Carregar(I));
    LvItem := self.ListView1.Items.Add;
    LvItem.Caption := IntToStr(umGrupo.GetCodigo);
    LvItem.SubItems.Add(umGrupo.GetGrupo);
    LvItem.SubItems.Add(umGrupo.GetObs);
    LvItem.SubItems.Add(umPais.GetDataCad);
  end;
end;

function TConsultaGrupos.Selecionar: integer;
var
  I, Tam: integer;
  Achei: Boolean;
begin
  Tam := aCtrlGrupo.TotalDados;
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

function TConsultaGrupos.RetornaObj: TObject;
begin
  oGrupo := Grupos( aCtrlGrupo.Carregar( Self.Selecionar ) );
  Result := oGrupo.Clone;
end;
           //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end.

