unit uEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai, uPaises;

type

  { Estados }

  Estados = class(Pai)
  protected
    oPais: Paises;
    Estado: string[50];
    UF: string[2];
  public
    constructor CrieObj;
    destructor Destrua_se;
    constructor CrieInit(mCodigo: integer; umPais: Paises;
      mEstado, mUF, mDataCad: string);

    procedure SetoPais(poPais: Paises);
    procedure SetEstado(pEstado: string);
    procedure SetUF(pUF: string);
    function GetoPais: Paises;
    function GetEstado: string;
    function GetUF: string;
    function Clone: Estados;
  end;

implementation

{ Estados }

constructor Estados.CrieObj;
begin
  inherited;
  oPais := Paises.CrieObj;
  Estado := '';
  UF := '';
end;

destructor Estados.Destrua_se;
begin
  inherited;
  oPais.Destrua_se;
end;

constructor Estados.CrieInit(mCodigo: integer; umPais: Paises;
  mEstado, mUF, mDataCad: string);
begin
  Codigo := mCodigo;

  oPais := umPais;
  Estado := mEstado;
  UF := mUF;

  DataCad := mDataCad;
end;

procedure Estados.SetoPais(poPais: Paises);
begin
  oPais := poPais;
end;

procedure Estados.SetEstado(pEstado: string);
begin
  Estado := pEstado;
end;

procedure Estados.SetUF(pUF: string);
begin
  UF := pUF;
end;

function Estados.GetoPais: Paises;
begin
  Result := oPais;
end;

function Estados.GetEstado: string;
begin
  Result := Estado;
end;

function Estados.GetUF: string;
begin
  Result := UF;
end;

function Estados.Clone: Estados;
begin
  Result := Estados.CrieObj;
  Result.SetCodigo(Codigo);
  Result.SetEstado(Estado);
  Result.SetUF(UF);
  Result.SetoPais(oPais.Clone);
  Result.SetDataCad(DataCad);
end;

end.
