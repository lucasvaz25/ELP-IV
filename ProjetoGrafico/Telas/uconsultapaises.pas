unit uConsultaPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uConsulta,
  uCadastroPaises, uPaises;

type

  { TConsultaPaises }

  TConsultaPaises = class(TConsulta)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    oCadastroPaises : TCadastroPaises;
    oPais : Paises;
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
  ConsultaPaises: TConsultaPaises;

implementation

{$R *.lfm}

{ TConsultaPaises }

procedure TConsultaPaises.FormCreate(Sender: TObject);
begin
  oCadastroPaises := TCadastroPaises.Create(nil);
end;

procedure TConsultaPaises.FormDestroy(Sender: TObject);
begin
  oCadastroPaises.FreeInstance;
end;

procedure TConsultaPaises.Sair;
begin
  inherited Sair;
end;

procedure TConsultaPaises.Novo;
begin
  oCadastroPaises.ConhecaObj( oPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.ShowModal;
  inherited Novo;
end;

procedure TConsultaPaises.Alterar;
begin
  oCadastroPaises.ConhecaObj( oPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.CarregaEdt;
  oCadastroPaises.ShowModal;
  inherited Alterar;
end;

procedure TConsultaPaises.Excluir;
var
  Aux : String;
begin
  oCadastroPaises.ConhecaObj( oPais );
  oCadastroPaises.LimparEdt;
  oCadastroPaises.CarregaEdt;
  oCadastroPaises.BloqueiEdt;
  Aux := oCadastroPaises.btn_Salvar.Caption;
  oCadastroPaises.btn_Salvar.Caption := 'Excluir';
  oCadastroPaises.ShowModal;
  oCadastroPaises.btn_Salvar.Caption := Aux;
  oCadastroPaises.DesbloqueiaEdt;
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

procedure TConsultaPaises.ConhecaObj(pObj: TObject);
begin
  oPais := Paises( pObj );
end;

end.

