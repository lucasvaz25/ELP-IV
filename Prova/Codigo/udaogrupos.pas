unit uDaoGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecaoGrupos, uDao, uGrupo;
type                                                                    //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  { aColGrupos }

  DaoGrupos = class(DAO)
  protected
    aColGrupos: ColecaoGrupos;
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

{ aColGrupos }

constructor DaoGrupos.CrieObj;
begin
  aColGrupos := ColecaoGrupos.CrieObj;
end;

destructor DaoGrupos.Destrua_se;
begin                                                                          //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
 aColGrupos.Destrua_se;
end;

procedure DaoGrupos.Salvar(pObj: TObject);
var
  pPos: integer;
  pGrupo: string;
  umGrupo: Grupos;
begin
  umGrupo := Grupos(pObj);
  if umGrupo.GetCodigo = 0 then
  begin
    umGrupo.setCodigo(aColGrupos.GetTam + 1);
    pGrupo := umGrupo.GetGrupo;
    pPos := aColGrupos.Pesquisa(pGrupo, False);
    if pPos <> 0 then
      aColGrupos.Insere(umGrupo, pPos);
  end;
  aColGrupos.SalvaArq;
  inherited Salvar(pObj);
end;

procedure DaoGrupos.Excluir(pObj: TObject);
var                                                                      //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  pPos: integer;
begin
  pPos := 1;
  aColGrupos.Remove(pObj, pPos);
end;

function DaoGrupos.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: Integer;
begin
  Val(mRes, mPos, Code);
  if Code = 0 then
    Result := IntToStr(aColGrupos.Pesquisa(StrToInt( pChave ), False));
end;

function DaoGrupos.Pesquisar(pChave: string; pQuero: Boolean): string;
begin
  Result := IntToStr(aColGrupos.Pesquisa(pChave, pQuero));
end;

function DaoGrupos.Carregar(pPos: integer): TObject;
begin
  Result := aColGrupos.CarregaObj(pPos);
end;

function DaoGrupos.TotalDados: integer;
begin
  Result := aColGrupos.GetTam;
end;

end.

