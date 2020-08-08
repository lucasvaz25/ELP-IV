unit uColecaoEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uEstados;
type

  { ColecaoEstados }

  ColecaoEstados = Class( Colecao )
    private
    protected
    public
      function Pesquisa( pChave : String; pQuero : Boolean ): Integer;
      procedure SalvaArq;
      procedure LerArq;
  end;

implementation

{ ColecaoEstados }

function ColecaoEstados.Pesquisa(pChave: String; pQuero: Boolean): Integer;
var
  I : Integer;
begin
  if VerColVazia then
    Result := 1
  else
  begin
    I := 1;
    While ( I <= Tam ) and ( pChave > Estados( Item[ I ] ).GetEstado ) do
      I := I + 1;
    if pQuero then
    begin
      if I > Tam then
        Result := 0
      else
        if pChave = Estados( Item[ I ] ).GetEstado then
          Result := I
        else
          Result := 0
    end
    else
      if I > Tam then
        Result := I
      else
        if pChave = Estados( Item[ I ] ).GetEstado then
          Result := 0
        else
          Result := I;
  end;
end;

procedure ColecaoEstados.SalvaArq;
begin

end;

procedure ColecaoEstados.LerArq;
begin

end;

end.

