unit uColecaoPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uPaises;

type

  { ColecaoPaises }

  ColecaoPaises = class(Colecao)
  private
  protected
  public
    constructor CrieObj;      Override;
    destructor Destrua_se;    Override;
    function Pesquisa(pChave: string; pQuero: boolean): integer;
    procedure SalvaArq;
    procedure LerArq;
  end;

implementation

{ ColecaoPaises }

constructor ColecaoPaises.CrieObj;
begin
  inherited;
  Self.LerArq;
end;

destructor ColecaoPaises.Destrua_se;
begin
  Self.SalvaArq;
  inherited;
end;

function ColecaoPaises.Pesquisa(pChave: string; pQuero: boolean): integer;
var
  I: integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    while (I <= Tam) and (pChave > Paises(Item[I]).GetPais) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
      if pChave = Paises(Item[I]).GetPais then
        Result := I
      else
        Result := 0;
    end
    else
    if I > Tam then
      Result := I
    else
    if pChave = Paises(Item[I]).GetPais then
      Result := 0
    else
      Result := I;
  end;
end;

procedure ColecaoPaises.SalvaArq;
var
  Arq: TextFile;
  I: integer;
begin
  Assign(Arq, 'Paises.Dat');
  Rewrite(Arq);
  for I := 1 to Tam do
  begin
    WriteLn(Arq, Paises(Item[I]).GetCodigo);
    WriteLn(Arq, Paises(Item[I]).GetPais);
    WriteLn(Arq, Paises(Item[I]).GetDDI);
    WriteLn(Arq, Paises(Item[I]).GetSigla);
    WriteLn(Arq, Paises(Item[I]).GetDataCad);
  end;
  Close(Arq);
end;

procedure ColecaoPaises.LerArq;
var
  Arq: TextFile;
  I, mCodigo: integer;
  mPais: string[50];
  mDDI: string[5];
  mSigla: string[3];
  mDataCad: string[10];
  umPais: Paises;
begin
  Assign(Arq, 'Paises.Dat');
  Reset(Arq);
  while (not eof(Arq)) do
  begin
    ReadLn(Arq, mCodigo);
    ReadLn(Arq, mPais);
    ReadLn(Arq, mDDI);
    ReadLn(Arq, mSigla);
    ReadLn(Arq, mDataCad);
    umPais := Paises.CrieInit(mCodigo, mPais, mDDI, mSigla, mDataCad);
    Self.InsereFim(umPais);
  end;
end;

end.
