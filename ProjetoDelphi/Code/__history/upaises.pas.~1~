unit uPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai;

type

  { Paises }

  Paises = class(Pai)
  private
  protected
    Pais: string[50];
    DDI: string[5];
    Sigla: string[3];
  public
    constructor CrieObj;
    destructor Destrua_se;
    constructor CrieInit(pCodigo: integer; pPais, pDDI, pSigla, pDataCad: string);
    procedure SetPais(pPais: string);
    procedure SetDDI(pDDI: string);
    procedure SetSigla(pSigla: string);
    function GetPais: string;
    function GetDDI: string;
    function GetSigla: string;
    function Clone: Paises;
  end;

implementation

{ Paises }

constructor Paises.CrieObj;
begin
  inherited;
  Pais := '';
  DDI := '';
  Sigla := '';
end;

destructor Paises.Destrua_se;
begin
  inherited;
end;

constructor Paises.CrieInit(pCodigo: integer; pPais, pDDI, pSigla, pDataCad: string);
begin
  Codigo  := pCodigo;
  Pais    := pPais;
  DDI     := pDDI;
  Sigla   := pSigla;
  DataCad := pDataCad;
end;

procedure Paises.SetPais(pPais: string);
begin
  Pais := pPais;
end;

procedure Paises.SetDDI(pDDI: string);
begin
  DDI := pDDI;
end;

procedure Paises.SetSigla(pSigla: string);
begin
  Sigla := pSigla;
end;

function Paises.GetPais: string;
begin
  Result := Pais;
end;

function Paises.GetDDI: string;
begin
  Result := DDI;
end;

function Paises.GetSigla: string;
begin
  Result := Sigla;
end;

function Paises.Clone: Paises;
begin
  Result := Paises.CrieObj;
  Result.SetCodigo(Codigo);
  Result.SetPais(Pais);
  Result.SetDDI(DDI);
  Result.SetSigla(Sigla);
  Result.SetDataCad(DataCad);
end;

end.
