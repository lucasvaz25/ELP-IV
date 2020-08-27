unit uEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai, uPaises;
type

  { Estados }

  Estados = Class(Pai)
    protected
      oPais : Paises;
      Estado: String[50];
      UF    : String[2];
    public
      constructor CrieObj;
      destructor Destrua_se;
       constructor CrieInit(pCodigo: integer; pEstado, pUF, pPais, pDataCad: string);

      procedure SetoPais( poPais : Paises );
      procedure SetEstado( pEstado : String );
      procedure SetUF( pUF : String );
      function GetoPais: Paises;
      function GetEstado: String;
      function GetUF: String;
      function Clone: Estados;
  end;

implementation

{ Estados }

constructor Estados.CrieObj;
begin
  inherited;
  oPais  := Paises.CrieObj;
  Estado := '';
  UF     := '';
end;

destructor Estados.Destrua_se;
begin
  inherited;
  oPais.Destrua_se;
end;

constructor Estados.CrieInit(pCodigo: integer; pEstado, pUF, pPais,
  pDataCad: string);
begin
  Codigo := pCodigo;
  Estado := pEstado;
  UF := pUF;
  oPais.SetPais(pPais);
end;

procedure Estados.SetoPais(poPais: Paises);
begin
  oPais := poPais;
end;

procedure Estados.SetEstado(pEstado: String);
begin
  Estado := pEstado;
end;

procedure Estados.SetUF(pUF: String);
begin
  UF := pUF;
end;

function Estados.GetoPais: Paises;
begin
  Result := oPais;
end;

function Estados.GetEstado: String;
begin
  Result := Estado;
end;

function Estados.GetUF: String;
begin
  Result := UF;
end;

function Estados.Clone: Estados;
begin
  Result := Estados.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetEstado( Estado );
  Result.SetUF( UF );
  Result.SetoPais( oPais.Clone );
  Result.SetDataCad( DataCad );
end;

end.

