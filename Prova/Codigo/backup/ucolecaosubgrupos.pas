unit UColecaoSubGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uSubGrupo, uGrupo;

type

  { ColecaoSubGrupos }
                                                      //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  ColecaoSubGrupos = class(Colecao)
  protected
  public
    constructor CrieObj; override;
    destructor Destrua_se; override;
    function Pesquisa(pChave: string; pQuero: boolean): integer; overload;
    function Pesquisa(pChave: integer; pQuero: boolean): integer; overload;
    procedure SalvaArq;
    procedure LerArq;
  end;

implementation

{ ColecaoSubGrupos }

constructor ColecaoSubGrupos.CrieObj;
begin
  inherited;
//  Self.LerArq;
end;

destructor ColecaoSubGrupos.Destrua_se;
begin
  self.SalvaArq;                       //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  inherited;
end;

function ColecaoSubGrupos.Pesquisa(pChave: string; pQuero: boolean): integer;
var
  I: integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    while (I <= Tam) and (pChave > SubGrupos(Item[I]).GetSubGrupo) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
      if pChave = SubGrupos(Item[I]).GetSubGrupo then
        Result := I
      else
        Result := 0;
    end
    else
    if I > Tam then
      Result := I
    else
    if pChave = SubGrupos(Item[I]).GetSubGrupo then
      Result := 0
    else
      Result := I;                                         //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  end;
end;

function ColecaoSubGrupos.Pesquisa(pChave: integer; pQuero: boolean): integer;
var
  I: Integer;
  SubGrupo : SubGrupos;
begin
  if VerColVazia then
    result := 1
  else
  begin
    I := 1;
    SubGrupo := SubGrupos(Item[I]);
    While ( I <= Tam ) and ( pChave <> SubGrupo.GetCodigo ) do
    begin
      I := I + 1;
      SubGrupo := SubGrupos( Item[I] );
    end;
    if pQuero then
      if pChave = SubGrupo.GetCodigo then
        Result := I
      else
        Result := 0
    else
      if pChave = SubGrupo.GetCodigo then
        Result := 0
      else
        Result := 1;
  end;
end;

procedure ColecaoSubGrupos.SalvaArq;
var
  Arq: TextFile;
  I: integer;
begin
  Assign(Arq, 'SubGrupos.Dat');
  Rewrite(Arq);
  for I := 1 to Tam do
  begin
    WriteLn(Arq, SubGrupos(Item[I]).GetCodigo);
    WriteLn(Arq, SubGrupos(Item[I]).GetSubGrupo);
    WriteLn(Arq, SubGrupos(Item[I]).GetObs);
    WriteLn(Arq, SubGrupos(Item[I]).GetumGrupo.GetCodigo);
    WriteLn(Arq, SubGrupos(Item[I]).GetDataCad);
  end;
  Close(Arq);
end;

procedure ColecaoSubGrupos.LerArq;
var
  Arq: TextFile;
  I, mCodigo, mCodGrupo: integer;
  mSubGrupo: string[50];
  mObs: string[200];
  mDataCad: string[10];
  umSubGrupo: SubGrupos;
begin
  Assign(Arq, 'SubGrupos.Dat');
  Reset(Arq);
  while (not eof(Arq)) do
  begin
    ReadLn(Arq, mCodigo);
    ReadLn(Arq, mSubGrupo);
    ReadLn(Arq, mObs);
    ReadLn(Arq, mCodGrupo);
    ReadLn(Arq, mDataCad);
    umSubGrupo := SubGrupos.CrieObj;
    umSubGrupo.SetCodigo(mCodigo);
    umSubGrupo.SetSubGrupo(mSubGrupo);
    umSubGrupo.SetObs(mObs);
    umSubGrupo.GetumGrupo.SetCodigo(mCodGrupo);
    umSubGrupo.SetDataCad(mDataCad);

    Self.InsereFim(umSubGrupo);
  end;
  Close(Arq);
end;

end.

