unit UColecaoGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uGrupo;
type

  { ColecaoGrupos }

  ColecaoGrupos = Class (Colecao)
  protected
  public                                                          //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
    constructor CrieObj;      Override;
    destructor Destrua_se;    Override;
    function Pesquisa(pChave: string; pQuero: boolean): integer;  Overload;
    function Pesquisa(pChave : Integer; pQuero: Boolean): Integer; Overload;
    procedure SalvaArq;
    procedure LerArq;
  end;

implementation

{ ColecaoGrupos }

constructor ColecaoGrupos.CrieObj;
begin
  inherited;
//  Self.LerArq;
end;

destructor ColecaoGrupos.Destrua_se;
begin
  self.SalvaArq;
  inherited;
end;

function ColecaoGrupos.Pesquisa(pChave: string; pQuero: boolean): integer;
var
  I: integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    while (I <= Tam) and (pChave > Grupos(Item[I]).GetGrupo) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
      if pChave = Grupos(Item[I]).GetGrupo then
        Result := I
      else
        Result := 0;
    end
    else
    if I >= Tam then
      Result := I
    else
    if pChave = Grupos(Item[I]).GetGrupo then
      Result := 0
    else
      Result := I;
  end;
end;

function ColecaoGrupos.Pesquisa(pChave: Integer; pQuero: Boolean): Integer;
var
  I: Integer;
  Grupo : Grupos;
begin
  if VerColVazia then
    result := 1
  else
  begin
    I := 1;
    Grupo := Grupos(Item[I]);
    While ( I <= Tam ) and ( pChave <> Grupo.GetCodigo ) do
    begin
      I := I + 1;
      Grupo := Grupos( Item[I] );
    end;
    if pQuero then                                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
      if pChave = Grupo.GetCodigo then
        Result := I
      else
        Result := 0
    else
      if pChave = Grupo.GetCodigo then
        Result := 0
      else
        Result := 1;
  end;
end;

procedure ColecaoGrupos.SalvaArq;
var
  Arq: TextFile;
  I: integer;
begin
  Assign(Arq, 'Grupos.Dat');
  Rewrite(Arq);
  for I := 1 to Tam do
  begin
    WriteLn(Arq, Grupos(Item[I]).GetCodigo);
    WriteLn(Arq, Grupos(Item[I]).GetGrupo);
    WriteLn(Arq, Grupos(Item[I]).GetObs);
    WriteLn(Arq, Grupos(Item[I]).GetDataCad);
  end;
  Close(Arq);
end;

procedure ColecaoGrupos.LerArq;
var
  Arq: TextFile;
  I, mCodigo: integer;
  mGrupo: string[50];
  mObs: string[200];
  mDataCad: string[10];
  umGrupo: Grupos;                                         //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
begin
  Assign(Arq, 'Grupos.Dat');
  Reset(Arq);
  while (not eof(Arq)) do
  begin
    ReadLn(Arq, mCodigo);
    ReadLn(Arq, mGrupo);
    ReadLn(Arq, mObs);
    ReadLn(Arq, mDataCad);
    umGrupo := Grupos.CrieInit(mCodigo, mGrupo, mObs, mDataCad);
    Self.InsereFim(umGrupo);
  end;
  Close(Arq);
end;

end.

