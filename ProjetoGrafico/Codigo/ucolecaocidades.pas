unit uColecaoCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uCidades;
type

  { ColecaoCidades }

  ColecaoCidades = Class ( Colecao )
    private
    protected
    public
      function Pesquisa( pChave : String; pQuero : Boolean ): Integer;
      procedure SalvaArq;
      procedure LerArq;
  end;

implementation

{ ColecaoCidades }

function ColecaoCidades.Pesquisa(pChave: String; pQuero: Boolean): Integer;
var
  I : Integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    While ( I <= Tam ) and ( pChave > Cidades( Item[ I ] ).GetCidade ) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
        if pChave = Cidades( Item[ I ] ).GetCidade then
          Result := I
        else
          Result := 0
    end
    else
      if I > Tam then
        Result := I
      else
        if pChave = Cidades( Item[ I ] ).GetCidade then
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

