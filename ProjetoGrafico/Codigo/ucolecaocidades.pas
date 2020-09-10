unit uColecaoCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uCidades, uEstados;

type

  { ColecaoCidades }

  ColecaoCidades = class(Colecao)
  private
  protected
  public
    constructor CrieObj; override;
    destructor Destrua_se; override;
    function Pesquisa(pChave: string; pQuero: boolean): integer;  Overload;
    function Pesquisa(pChave : Integer; pQuero: Boolean): Integer; Overload;
    procedure SalvaArq;
    procedure LerArq;
  end;

implementation

{ ColecaoCidades }

constructor ColecaoCidades.CrieObj;
begin
  inherited;
  Self.LerArq;
end;

destructor ColecaoCidades.Destrua_se;
begin
//  Self.SalvaArq;
  inherited;
end;

function ColecaoCidades.Pesquisa(pChave: string; pQuero: boolean): integer;
var
  I: integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    while (I <= Tam) and (pChave > Cidades(Item[I]).GetCidade) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
      if pChave = Cidades(Item[I]).GetCidade then
        Result := I
      else
        Result := 0;
    end
    else
    if I > Tam then
      Result := I
    else
    if pChave = Cidades(Item[I]).GetCidade then
      Result := 0
    else
      Result := I;
  end;
end;

function ColecaoCidades.Pesquisa(pChave: Integer; pQuero: Boolean): Integer;
var
  I: Integer;
  Cidade : Cidades;
begin
  if VerColVazia then
    result := 1
  else
  begin
    I := 1;
    Cidade := Cidades(Item[I]);
    While ( I <= Tam ) and ( pChave <> Cidade.GetCodigo ) do
    begin
      I := I + 1;
      Cidade := Cidades( Item[I] );
    end;
    if pQuero then
      if pChave = Cidade.GetCodigo then
        Result := I
      else
        Result := 0
    else
      if pChave = Cidade.GetCodigo then
        Result := 0
      else
        Result := 1;
  end;
end;

procedure ColecaoCidades.SalvaArq;
var
  Arq: TextFile;
  I: integer;
begin
  Assign(Arq, 'Cidades.Dat');
  Rewrite(Arq);
  for I := 1 to Tam do
  begin
    WriteLn(Arq, Cidades(Item[I]).GetCodigo);
    WriteLn(Arq, Cidades(Item[I]).GetCidade);
    WriteLn(Arq, Cidades(Item[I]).GetDDD);
    WriteLn(Arq, Cidades(Item[I]).GetSigla);
    WriteLn(Arq, Cidades(Item[I]).GetoEstado.GetCodigo);
    WriteLn(Arq, Cidades(Item[I]).GetDataCad);
  end;
  Close(Arq);
end;

procedure ColecaoCidades.LerArq;
var
  Arq: TextFile;
  mCodigo, mCodEstado: integer;
  mCidade: string[50];
  mDDD: string[3];
  mSigla: string[3];
  mDataCad: string[10];
  umaCidade: Cidades;
begin
  Assign(Arq, 'Cidades.Dat');
  Reset(Arq);
  while (not eof(Arq)) do
  begin
    ReadLn(Arq, mCodigo);
    ReadLn(Arq, mCidade);
    ReadLn(Arq, mDDD);
    ReadLn(Arq, mSigla);
    ReadLn(Arq, mCodEstado);
    ReadLn(Arq, mDataCad);
    umaCidade := Cidades.CrieObj;
    umaCidade.SetCodigo(mCodigo);
    umaCidade.SetDDD(mDDD);
    umaCidade.SetSigla(mSigla);
    umaCidade.GetoEstado.SetCodigo(mCodEstado);
    umaCidade.SetDataCad(mDataCad);
    Self.InsereFim(umaCidade);
  end;
  Close(Arq);
end;

end.
