unit USubGrupo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UPai, UGrupo;
type

  { SubGrupos }                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  SubGrupos = Class( Pai )
    protected
      SubGrupo: String[50];
      umGrupo: Grupos;
      Obs: String[200];
    public
      constructor CrieObj;
      destructor Destrua_se;

      procedure SetSubGrupo( pSubGrupo: String );
      procedure SetumGrupo( pumGrupo: Grupos );
      procedure SetObs( pObs: String );
      function GetSubGrupo: String;
      function GetumGrupo: Grupos;
      function GetObs: String;
      function Clone: SubGrupos;
  end;

implementation

{ SubGrupos }

constructor SubGrupos.CrieObj;
begin
  inherited;
  SubGrupo := '';
  Obs      := '';
  umGrupo  := Grupos.CrieObj;
end;

destructor SubGrupos.Destrua_se;
begin
  umGrupo.Destrua_se;
end;                                              //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

procedure SubGrupos.SetSubGrupo(pSubGrupo: String);
begin
  SubGrupo := pSubGrupo;
end;

procedure SubGrupos.SetumGrupo(pumGrupo: Grupos);
begin
  umGrupo := pumGrupo;
end;

procedure SubGrupos.SetObs(pObs: String);
begin
  Obs := pObs;
end;

function SubGrupos.GetSubGrupo: String;
begin
  Result := SubGrupo;
end;

function SubGrupos.GetumGrupo: Grupos;
begin
  Result := umGrupo;
end;

function SubGrupos.GetObs: String;
begin
  Result := Obs;
end;

function SubGrupos.Clone: SubGrupos;
begin
  Result := SubGrupos.CrieObj;
  Result.SetCodigo(Codigo);
  Result.setSubGrupo(SubGrupo);
  Result.SetObs(Obs);                          //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  Result.SetumGrupo(umGrupo.Clone);
  Result.SetDataCad(DataCad);
end;

end.

