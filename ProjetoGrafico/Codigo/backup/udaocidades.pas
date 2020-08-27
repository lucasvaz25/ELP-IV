unit uDaoCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uDAO, uColecaoCidades, uCidades;

type

  { DaoCidades }

  DaoCidades = class(DAO)
  private
  protected
    aColCidade: ColecaoCidades;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
  end;

implementation

{ DaoCidades }

constructor DaoCidades.CrieObj;
begin
  aColCidade := ColecaoCidades.CrieObj;
end;

destructor DaoCidades.Destrua_se;
begin
  aColCidade.Destrua_se;
end;

procedure DaoCidades.Salvar(pObj: TObject);
var
  pPos: integer;
  pCidade: string;
begin
  if Cidades(pObj).GetCodigo = 0 then
  begin
    Cidades(pObj).setCodigo(aColCidade.GetTam + 1);
    pCidade := Cidades(pObj).GetCidade;
    pPos := aColCidade.Pesquisa(pCidade, False);
    if pPos <> 0 then
      aColCidade.Insere(pObj, pPos);
  end;
  inherited Salvar(pObj);
end;

procedure DaoCidades.Excluir(pObj: TObject);
var
  pPos: integer;
begin
  pPos := 1; //provisório
  aColCidade.Remove(pObj, pPos);
  //  inherited Excluir(pObj);
end;

function DaoCidades.Pesquisar(pChave: string): string;
begin
  Result := IntToStr(aColCidade.Pesquisa(pChave, False));
  //  Result := inherited Pesquisar(pChave);
end;

function DaoCidades.Carregar(pPos: integer): TObject;
begin
  Result := aColCidade.CarregaObj(pPos);
  //  Result := inherited Carregar(pPos);
end;

function DaoCidades.TotalDados: integer;
begin
  Result := inherited TotalDados;
end;

end.
