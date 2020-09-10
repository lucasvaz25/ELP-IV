unit uDaoEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uDAO, uColecaoEstados, uEstados;

type

  { DaoEstados }

  DaoEstados = class(DAO)
  private
  protected
    aColEstado: ColecaoEstados;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override; Overload;
    function Pesquisar(pChave: string; pQuero: Boolean): string; Overload;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
  end;

implementation

{ DaoEstados }

constructor DaoEstados.CrieObj;
begin
  aColEstado := ColecaoEstados.CrieObj;
end;

destructor DaoEstados.Destrua_se;
begin
  aColEstado.Destrua_se;
end;

procedure DaoEstados.Salvar(pObj: TObject);
var
  pPos: integer;
  pEstado: string;
begin
  if Estados(pObj).GetCodigo = 0 then
  begin
    Estados(pObj).setCodigo(aColEstado.GetTam + 1);
    pEstado := Estados(pObj).GetEstado;
    pPos := aColEstado.Pesquisa(pEstado, False);
    if pPos <> 0 then
      aColEstado.Insere(pObj, pPos);
  end;
  aColEstado.SalvaArq;
  inherited Salvar(pObj);
end;

procedure DaoEstados.Excluir(pObj: TObject);
var
  pPos: integer;
begin
  pPos := 1; //provisório
  aColEstado.Remove(pObj, pPos);
  //  inherited Excluir(pObj);
end;

function DaoEstados.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: Integer;
begin
  Val(mRes, mPos, Code);
  if Code = 0 then
    Result := IntToStr(aColEstado.Pesquisa(StrToInt( pChave ), False));
  //  Result := inherited Pesquisar(pChave);
end;

function DaoEstados.Pesquisar(pChave: string; pQuero: Boolean): string;
begin
  Result := IntToStr(aColPaises.Pesquisa(pChave, pQuero));
end;

function DaoEstados.Carregar(pPos: integer): TObject;
begin
  Result := aColEstado.CarregaObj( pPos );
  //  Result := inherited Carregar(pPos);
end;

function DaoEstados.TotalDados: integer;
begin
  Result := aColEstado.GetTam;
  //  Result := inherited TotalDados;
end;

end.
