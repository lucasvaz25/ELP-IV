unit uColecao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

  { Colecao }

  Colecao = class
    private
    protected
      Item : Array [1..100] of TObject;
      Tam  : Integer;
    public
      constructor CrieObj;
      destructor Destrua_se;

      procedure InsereFim( pObj : TObject );
      procedure Insere( pObj : TObject; pPos : Integer );
      procedure Remove( Var pObj : TObject; pPos : Integer );
      function VerColVazia: Boolean;
      function VerColCheia: Boolean;
      function GetTam: Integer;
      function CarregaObj( pPos : Integer ): TObject;
  end;

implementation

{ Colecao }

constructor Colecao.CrieObj;
begin
  Tam := 0;
end;

destructor Colecao.Destrua_se;
var
  I : Integer;
begin
  for I := 1 to Tam do
    Item[I].FreeInstance;
end;

procedure Colecao.InsereFim(pObj: TObject);
begin
  Tam       := Tam + 1;
  Item[Tam] := pObj;
end;

procedure Colecao.Insere(pObj: TObject; pPos: Integer);
var
  I : Integer;
begin
  if ( pPos = Tam + 1 ) then
    Self.InsereFim( pObj )
  else
  begin
    Tam := Tam + 1;
    for I := Tam DownTo pPos + 1 do
    begin
      Item[ I ] := Item[ I + 1 ];
    end;
    Item[ pPos ] := pObj;
  end;
end;

procedure Colecao.Remove( Var pObj: TObject; pPos: Integer);
var
  I : Integer;
begin
  pObj := Item[ pPos ];
  for I := pPos to Tam - 1 do
    Item[ I ] := Item[ I + 1 ];
  Tam := Tam - 1;
end;

function Colecao.VerColVazia: Booelan;
begin
  Result := Tam = 0;
end;

function Colecao.VerColCheia: Booelan;
begin
  Result := Tam = 100;
end;

function Colecao.GetTam: Integer;
begin
  Result := Tam;
end;

function Colecao.CarregaObj(pPos: Integer): TObject;
begin
  Result := Item[ pPos ];
end;

end.

