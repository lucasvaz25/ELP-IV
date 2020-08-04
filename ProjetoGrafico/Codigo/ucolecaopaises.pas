unit uColecaoPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uPaises;
type

  { ColecaoPaises }

  ColecaoPaises = Class( Colecao )
    private
    protected
    public
      function Pesquisa( pChave : String; pQuero : Boolean ): Integer;
      procedure SalvaArq;
      procedure LerArq;
  end;

implementation

{ ColecaoPaises }

function ColecaoPaises.Pesquisa(pChave: String; pQuero: Boolean): Integer;
var
  I : Integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    While ( I <= Tam ) and ( pChave > Paises( Item[ I ] ).GetPais ) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
        if pChave = Paises( Item[ I ] ).GetPais then
          Result := I
        else
          Result := 0
    end
    else
      if I > Tam then
        Result := I
      else
        if pChave = Paises( Item[ I ] ).GetPais then
          Result := 0
        else
          Result := I;
  end;
end;

procedure ColecaoPaises.SalvaArq;
begin

end;

procedure ColecaoPaises.LerArq;
begin

end;

end.

