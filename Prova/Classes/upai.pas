unit UPai;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

  { Pai }

  Pai = Class                             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
   protected
     Codigo : Integer;
     DataCad: String[10];
   public
     constructor CrieObj;
     destructor Destrua_se;

     procedure SetCodigo( pCodigo: Integer);
     procedure SetDataCad( pDataCad: String );
     function GetCodigo: Integer;
     function GetDataCad: String;

  end;

implementation

{ Pai }

constructor Pai.CrieObj;
begin
  Codigo  := 0;
  DataCad := '';                                  //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
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
end;                                                       //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

function Pai.GetDataCad: String;
begin
  Result := DataCad;
end;

end.

