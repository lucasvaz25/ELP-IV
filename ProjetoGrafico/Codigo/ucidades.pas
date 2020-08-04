unit uCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai, uEstados;
type

  { Cidades }

  Cidades = Class( Pai )
  protected
    oEstado : Estados;
    Cidade  : String[50];
    DDD     : String[3];
    Sigla   : String[3];
  public
    constructor CrieObj;
    destructor Destrua_se;

    procedure SetoEstado( poEstado : Estados );
    procedure SetCidade( pCidade : String );
    procedure SetDDD( pDDD : String );
    procedure SetSigla( pSigla : String );
    function GetoEstado: Estados;
    function GetCidade: String;
    function GetDDD: String;
    function GetSigla: String;
    function Clone: Cidades;
end;

implementation

{ Cidades }

constructor Cidades.CrieObj;
begin
  inherited;
  Cidade  := '';
  DDD     := '';
  Sigla   := '';
  oEstado := Estados.CrieObj;
end;

destructor Cidades.Destrua_se;
begin
  inherited;
  oEstado.Destrua_se;
end;

procedure Cidades.SetoEstado(poEstado: Estados);
begin
  oEstado := poEstado;
end;

procedure Cidades.SetCidade(pCidade: String);
begin
  Cidade := pCidade;
end;

procedure Cidades.SetDDD(pDDD: String);
begin
  DDD := pDDD;
end;

procedure Cidades.SetSigla(pSigla: String);
begin
  Sigla := pSigla;
end;

function Cidades.GetoEstado: Estados;
begin
  Result := oEstado;
end;

function Cidades.GetCidade: String;
begin
  Result := Cidade;
end;

function Cidades.GetDDD: String;
begin
  Result := DDD;
end;

function Cidades.GetSigla: String;
begin
  Result := Sigla;
end;

function Cidades.Clone: Cidades;
begin
  Result := Cidades.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetCidade( Cidade );
  Result.SetDDD( DDD );
  Result.SetSigla( Sigla );
  Result.SetoEstado( oEstado.Clone );
  Result.SetDataCad( DataCad );
end;

end.

