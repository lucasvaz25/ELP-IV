unit uColecaoEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uEstados, uPaises;

type

  { ColecaoEstados }

  ColecaoEstados = class(Colecao)
  private
  protected
  public
    constructor CrieObj; override;
    destructor Destrua_se; override;
    function Pesquisa(pChave: string; pQuero: boolean): integer;
    procedure SalvaArq;
    procedure LerArq;
  end;

implementation

{ ColecaoEstados }

constructor ColecaoEstados.CrieObj;
begin
  inherited;
  Self.LerArq;
end;

destructor ColecaoEstados.Destrua_se;
begin
  Self.SalvaArq;
  inherited;
end;

function ColecaoEstados.Pesquisa(pChave: string; pQuero: boolean): integer;
var
  I: integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    while (I <= Tam) and (pChave > Estados(Item[I]).GetEstado) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
      if pChave = Estados(Item[I]).GetEstado then
        Result := I
      else
        Result := 0;
    end
    else
    if I > Tam then
      Result := I
    else
    if pChave = Estados(Item[I]).GetEstado then
      Result := 0
    else
      Result := I;
  end;
end;

procedure ColecaoEstados.SalvaArq;
var
  Arq: TextFile;
  I: integer;
begin
  Assign(Arq, 'Estados.Dat');
  Rewrite(Arq);
  for I := 1 to Tam do
  begin
    WriteLn(Arq, Estados(Item[I]).GetCodigo);
    WriteLn(Arq, Estados(Item[I]).GetEstado);
    WriteLn(Arq, Estados(Item[I]).GetUF);
    WriteLn(Arq, Estados(Item[I]).GetoPais.GetPais);
    WriteLn(Arq, Estados(Item[I]).GetDataCad);
  end;
  Close(Arq);
end;

procedure ColecaoEstados.LerArq;
var
  Arq: TextFile;
  I, mCodigo: integer;
  mEstado: string[50];
  mUF: string[2];
  mPais: string[50];
  mDataCad: string[10];
  umEstado: Estados;
  umPais: Paises;
begin
  Assign(Arq, 'Estados.Dat');
  Reset(Arq);
  while (not eof(Arq)) do
  begin
    ReadLn(Arq, mCodigo);
    ReadLn(Arq, mEstado);
    ReadLn(Arq, mUF);
    ReadLn(Arq, mPais);
    ReadLn(Arq, mDataCad);
    umPais := Paises.CrieObj;
    umPais.SetPais(mPais);
    umEstado := Estados.CrieInit(mCodigo, umPais, mEstado, mUF, mDataCad);
    umPais.Destrua_se;
    Self.InsereFim(umEstado);
  end;
  Close(Arq);
end;

end.
