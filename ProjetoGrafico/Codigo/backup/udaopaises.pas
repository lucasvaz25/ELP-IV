unit uDaoPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecaoPaises, uDAO, uPaises;

type

  { DaoPaises }

  DaoPaises = class(DAO)
  private
  protected
    aColPaises: ColecaoPaises;
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

{ DaoPaises }

constructor DaoPaises.CrieObj;
begin
  aColpaises := ColecaoPaises.CrieObj;
end;

destructor DaoPaises.Destrua_se;
begin
  aColPaises.Destrua_se;
end;

procedure DaoPaises.Salvar(pObj: TObject);
var
  pPos: integer;
  pPais: string;
  umPais: Paises;
begin
  umPais := Paises(pObj);
  if umPais.GetCodigo = 0 then
  begin
    umPais.setCodigo(aColPaises.GetTam + 1);
    pPais := umPais.GetPais;
    pPos := aColPaises.Pesquisa(pPais, False);
    if pPos <> 0 then
      aColPaises.Insere(umPais, pPos);
  end;
  aColPaises.SalvaArq;
  inherited Salvar(pObj);
end;

procedure DaoPaises.Excluir(pObj: TObject);
var
  pPos: integer;
begin
  pPos := 1; //provisório
  aColPaises.Remove(pObj, pPos);
  //  inherited Excluir(pObj);
end;

function DaoPaises.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: Integer;
begin
  Val(mRes, mPos, Code);
  if Code = 0 then
    Result := IntToStr(aColPaises.Pesquisa(StrToInt( pChave ), False));
    //  Result:= inherited Pesquisar(pChave);
end;

function DaoPaises.Pesquisar(pChave: string; pQuero: Boolean): string;
begin
  Result := IntToStr(aColPaises.Pesquisa(pChave, pQuero);
end;

function DaoPaises.Carregar(pPos: integer): TObject;
begin
  Result := aColPaises.CarregaObj(pPos);
  // Result:=inherited Carregar(pPos);
end;

function DaoPaises.TotalDados: integer;
begin
  //  Result:=inherited TotalDados;
  Result := aColPaises.GetTam;
end;

end.
