unit UDaoSubGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecaoSubGrupos, uSubgrupo, uDao;
type

  { DaoSubGrupos }                                                                 //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  DaoSubGrupos = class (DAO)
    protected
      aColSubGrupos: ColecaoSubGrupos;
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

{ DaoSubGrupos }

constructor DaoSubGrupos.CrieObj;
begin
  aColSubGrupos := ColecaoSubGrupos.CrieObj;
end;

destructor DaoSubGrupos.Destrua_se;
begin
  aColSubGrupos.Destrua_se;
end;

procedure DaoSubGrupos.Salvar(pObj: TObject);
var                                                                                  //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  pPos: integer;
  pSubGrupo: string;
begin
  if SubGrupos(pObj).GetCodigo = 0 then
  begin
    SubGrupos(pObj).setCodigo(aColSubGrupos.GetTam + 1);
    pSubGrupo := SubGrupos(pObj).GetEstado;
    pPos := aColSubGrupos.Pesquisa(pSubGrupo, False);
    if pPos <> 0 then
      aColSubGrupos.Insere(pObj, pPos);
  end;
  aColSubGrupos.SalvaArq;
  inherited Salvar(pObj);
end;

procedure DaoSubGrupos.Excluir(pObj: TObject);
var
  pPos: integer;
begin
  pPos := 1;
  aColSubGrupos.Remove(pObj, pPos);
end;

function DaoSubGrupos.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: Integer;
begin
  Val(mRes, mPos, Code);
  if Code = 0 then
    Result := IntToStr(aColSubGrupos.Pesquisa(StrToInt( pChave ), False));
end;

function DaoSubGrupos.Pesquisar(pChave: string; pQuero: Boolean): string;
begin
    Result := IntToStr(aColSubGrupos.Pesquisa(pChave, pQuero));
end;

function DaoSubGrupos.Carregar(pPos: integer): TObject;
begin
  Result := aColSubGrupos.CarregaObj( pPos );
end;

function DaoSubGrupos.TotalDados: integer;
begin
  Result := aColSubGrupos.GetTam;                                                      //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end;

end.

