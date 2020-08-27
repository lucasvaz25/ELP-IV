unit uConsultaPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ComCtrls, Dialogs, uConsulta,
  uCadastroPaises, uPaises, uControllerPaises;

type

  { TConsultaPaises }

  TConsultaPaises = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    oCadastroPaises : TCadastroPaises;
    oPais : Paises;
    aCtrlPais : CtrlPaises;
  public
    procedure Sair;      Override;
    procedure Novo;      Override;
    procedure Alterar;   Override;
    procedure Excluir;   Override;
    procedure Pesquisar; Override;
    procedure SetFormCadastro( pObj : TObject ); Override;
    procedure ConhecaObj( pObj : TObject; pCtrl :TObject ); Override;
    procedure CarregaListView;  Override;
  end;

var
  ConsultaPaises: TConsultaPaises;

implementation

{$R *.lfm}

{ TConsultaPaises }

procedure TConsultaPaises.FormCreate(Sender: TObject);
begin

end;

procedure TConsultaPaises.FormDestroy(Sender: TObject);
begin

end;

procedure TConsultaPaises.FormShow(Sender: TObject);
begin
  Self.CarregaListView;
end;

procedure TConsultaPaises.Sair;
begin
  inherited Sair;
end;

procedure TConsultaPaises.Novo;
begin
  oCadastroPaises.ConhecaObj( oPais, aCtrlPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.ShowModal;
  Self.CarregaListView;
  inherited Novo;
end;

procedure TConsultaPaises.Alterar;
begin
  oCadastroPaises.ConhecaObj( oPais, aCtrlPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.CarregaEdt;
  oCadastroPaises.ShowModal;
  Self.CarregaListView;
  inherited Alterar;
end;

procedure TConsultaPaises.Excluir;
var
  Aux : String;
begin
  oCadastroPaises.ConhecaObj( oPais, aCtrlPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.CarregaEdt;
  oCadastroPaises.BloqueiEdt;
  Aux := oCadastroPaises.btn_Salvar.Caption;
  oCadastroPaises.btn_Salvar.Caption := 'Excluir';
  oCadastroPaises.ShowModal;
  oCadastroPaises.btn_Salvar.Caption := Aux;
  oCadastroPaises.DesbloqueiaEdt;
  Self.CarregaListView;
  inherited Excluir;
end;

procedure TConsultaPaises.Pesquisar;
begin
  inherited Pesquisar;
end;

procedure TConsultaPaises.SetFormCadastro(pObj: TObject);
begin
  oCadastroPaises := TCadastroPaises( pObj );
  inherited SetFormCadastro( oCadastroPaises ) ;
end;

procedure TConsultaPaises.ConhecaObj(pObj: TObject; pCtrl :TObject);
begin
  oPais := Paises( pObj );
  aCtrlPais := CtrlPaises(  pCtrl );
end;

procedure TConsultaPaises.CarregaListView;
var
  I, Tam : Integer;
  umPais: Paises;
  LvITem: TListItem;
begin
  Tam := aCtrlPais.TotalDados;
  Self.ListView1.Clear;
  for I := 1 to Tam do
  begin
    umPais := Paises(aCtrlPais.Carregar(I));
    LvItem := self.ListView1.Items.Add;
    LvItem.Caption := IntToStr(umPais.GetCodigo);
    LvItem.SubItems.Add(umPais.GetPais);
    LvItem.SubItems.Add(umPais.GetDDI);
    LvItem.SubItems.Add(umPais.GetSigla);
    LvItem.SubItems.Add(umPais.GetDataCad);
  end;
end;

end.

