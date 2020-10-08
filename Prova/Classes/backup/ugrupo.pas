unit UGrupo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UPai;
type

    { Grupos }

    Grupos = Class ( Pai )
      private
        Grupo: String[50];
        Obs: String[200];
      public
        constructor CrieObj;
        destructor Destrua_se;
        constructor CrieInit(pCodigo: integer; pGrupo, pObs, pDataCad: String);

        procedure SetGrupo( pGrupo: String );
        procedure SetObs( pObs: String );
        function GetGrupo: String;
        function GetObs: String;
        function Clone: Grupos;
    end;

implementation

{ Grupos }

constructor Grupos.CrieObj;
begin
  inherited;
  Grupo := '';
  Obs   := '';
end;

destructor Grupos.Destrua_se;
begin

end;

constructor Grupos.CrieInit(pCodigo: integer; pGrupo, pObs, pDataCad: String);
begin
  Codigo   := pCodigo;
  Grupo    := pGrupo;
  pObs     := pObs;
  pDataCad := pDataCad;
end;

procedure Grupos.SetGrupo(pGrupo: String);
begin
  Grupo := pGrupo;
end;

procedure Grupos.SetObs(pObs: String);
begin
  Obs := pObs;
end;

function Grupos.GetGrupo: String;
begin
  Result := Grupo;
end;

function Grupos.GetObs: String;
begin
  Result := Obs;
end;

function Grupos.Clone: Grupos;
begin
  Result := Grupos.CrieObj;
  Result.SetCodigo(Codigo);
  Result.SetGrupo(Grupo);
  Result.SetObs(Obs);
  Result.SetDataCad(DataCad);
end;

end.

