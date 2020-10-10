unit uPai;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

   { Pai }

   Pai = class
     private
     protected
       Codigo : Integer;
       DataCad: String[15];
     public
       constructor CrieObj;
       destructor Destrua_se;

       procedure SetCodigo( pCodigo : Integer );
       procedure SetDataCad( pDataCad : String );
       function GetCodigo: Integer;
       function GetDataCad: String;

   end;

implementation

{ Pai }

constructor Pai.CrieObj;
begin
  Codigo  := 0;
  DataCad := '';
end;

destructor Pai.Destrua_se;
begin

end;

procedure Pai.SetCodigo(pCodigo: Integer);
begin
  Codigo := pCodigo;
end;

procedure Pai.SetDataCad(pDataCad: String);
begin
  DataCad := pDataCad;
end;

function Pai.GetCodigo: Integer;
begin
  Result := Codigo;
end;

function Pai.GetDataCad: String;
begin
  Result := DataCad;
end;

end.

