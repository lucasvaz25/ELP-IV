unit uColecaoCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uCidades;

type

  { ColecaoCidades }

  ColecaoCidades = class(Colecao)
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

{ ColecaoCidades }

constructor ColecaoCidades.CrieObj;
begin
  inherited;
  Self.LerArq;
end;

destructor ColecaoCidades.Destrua_se;
begin
  Self.SalvaArq;
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

procedure ColecaoCidades.SalvaArq;
begin

end;

procedure ColecaoCidades.LerArq;
begin

end;

end.
