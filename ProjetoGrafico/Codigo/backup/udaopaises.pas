unit uDaoPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColPaises, uDAO;
type

  { DaoPaises }

  DaoPaises = Class ( DAO )
  private
  protected
    aColPaises : ColPaises;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar( pObj : TObject );             Override;
    procedure Excluir( pObj : TObject );            Override;
    function Pesquisar( pChave : string ) : string; Override;
    function Carregar( pPos : Integer ): TObject;   Override;
  end;

implementation

{ DaoPaises }

constructor DaoPaises.CrieObj;
begin

end;

destructor DaoPaises.Destrua_se;
begin

end;

procedure DaoPaises.Salvar(pObj: TObject);
begin
  inherited Salvar(pObj);
end;

procedure DaoPaises.Excluir(pObj: TObject);
begin
  inherited Excluir(pObj);
end;

function DaoPaises.Pesquisar(pChave: string): string;
begin
  Result:=inherited Pesquisar(pChave);
end;

function DaoPaises.Carregar(pPos: Integer): TObject;
begin
  Result:=inherited Carregar(pPos);
end;

end.

