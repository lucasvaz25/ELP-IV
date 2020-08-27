unit uDaoPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecaoPaises, uDAO, uPaises;
type

  { DaoPaises }

  DaoPaises = Class ( DAO )
  private
  protected
    aColPaises : ColecaoPaises;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar( pObj : TObject );             Override;
    procedure Excluir( pObj : TObject );            Override;
    function Pesquisar( pChave : string ) : string; Override;
    function Carregar( pPos : Integer ): TObject;   Override;
    function TotalDados: Integer;                   Override;
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
  pPos : Integer;
  pPais: String;
begin
  if Paises(pObj).GetCodigo = 0 then
  begin
    Paises(pObj).setCodigo(aColPaises.GetTam + 1);
    pPais := Paises(pObj).GetPais;
    pPos  := aColPaises.Pesquisa(pPais, False);
    if pPos <> 0 then
      aColPaises.Insere( pObj, pPos );
  end;
  inherited Salvar( pObj );
end;

procedure DaoPaises.Excluir(pObj: TObject);
var
  pPos : Integer;
begin
  pPos := 1; //provisório
  aColPaises.Remove( pObj, pPos );
//  inherited Excluir(pObj);
end;

function DaoPaises.Pesquisar(pChave: string): string;
begin
  Result := IntToStr( aColPaises.Pesquisa( pChave, False ) );
//  Result:= inherited Pesquisar(pChave);
end;

function DaoPaises.Carregar(pPos: Integer): TObject;
begin
  Result := aColPaises.CarregaObj( pPos );
  // Result:=inherited Carregar(pPos);
end;

function DaoPaises.TotalDados: Integer;
begin
  Result:=inherited TotalDados;
end;

end.

