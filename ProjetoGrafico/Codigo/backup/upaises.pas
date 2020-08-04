unit uPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai;
type

  { Paises }

  Paises = Class (Pai)
    private
    protected
      Pais : String[50];
      DDI  : String[5];
      Sigla: String[3];
    public
      constructor CrieObj;
      destructor Destrua_se;
      procedure SetPais( pPais : String );
      procedure SetDDI( pDDI : String );
      procedure SetSigla( pSigla : String );
      function GetPais: String;
      function GetDDI: String;
      function GetSigla: String;
      function Clone: Paises;
  end;

implementation

{ Paises }

constructor Paises.CrieObj;
begin
  inherited;
  Pais  := '';
  DDI   := '';
  Sigla := '';
end;

destructor Paises.Destrua_se;
begin
  inherited;
end;

procedure Paises.SetPais(pPais: String);
begin
  Pais := pPais;
end;

procedure Paises.SetDDI(pDDI: String);
begin
  DDI := pDDI;
end;

procedure Paises.SetSigla(pSigla: String);
begin
  Sigla := pSigla;
end;

function Paises.GetPais: String;
begin
  Result := Pais;
end;

function Paises.GetDDI: String;
begin
  Result := DDI;
end;

function Paises.GetSigla: String;
begin
  Result := Sigla;
end;

function Paises.Clone: Paises;
begin
  Result := Paises.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetPais( Pais );
  Result.SetDDI( DDI );
  Result.SetSigla( Sigla );
  Result.SetDataCad( DataCad );
end;

end.

