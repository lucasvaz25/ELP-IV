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
    Item: array [1..100] of TObject;
    Tam: integer;
  public
    constructor CrieObj; virtual;
    destructor Destrua_se; virtual;

    procedure InsereFim(pObj: TObject);
    procedure Insere(pObj: TObject; pPos: integer);
    procedure Remove(var pObj: TObject; pPos: integer);
    function VerColVazia: boolean;
    function VerColCheia: boolean;
    function GetTam: integer;
    function CarregaObj(pPos: integer): TObject;
  end;

implementation

{ Colecao }

constructor Colecao.CrieObj;
begin
  Tam := 0;
end;

destructor Colecao.Destrua_se;
var
  I: integer;
begin
  for I := 1 to Tam do
    (Item[I]).FreeInstance;
end;

procedure Colecao.InsereFim(pObj: TObject);
begin
  Tam := Tam + 1;
  Item[Tam] := pObj;
end;

procedure Colecao.Insere(pObj: TObject; pPos: integer);
var
  I: integer;
begin
  if (pPos = Tam + 1) then
    Self.InsereFim(pObj)
  else
  begin
    Tam := Tam + 1;
    for I := Tam downto pPos + 1 do
    begin
      Item[I] := Item[I - 1];
    end;
    Item[pPos] := pObj;
  end;
end;

procedure Colecao.Remove(var pObj: TObject; pPos: integer);
var
  I: integer;
begin
  pObj := Item[pPos];
  for I := pPos to Tam - 1 do
    Item[I] := Item[I + 1];
  Tam := Tam - 1;
end;

function Colecao.VerColVazia: boolean;
begin
  Result := Tam = 0;
end;

function Colecao.VerColCheia: boolean;
begin
  Result := Tam = 100;
end;

function Colecao.GetTam: integer;
begin
  Result := Tam;
end;

function Colecao.CarregaObj(pPos: integer): TObject;
begin
  Result := Item[pPos];
end;

end.
