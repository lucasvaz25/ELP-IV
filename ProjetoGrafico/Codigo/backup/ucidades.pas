unit uCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uPai, uEstados;
type

  { Cidades }

  Cidades = Class( Pai )
  protected
    oEstado : Estados;
    Cidade  : String[50];
    DDD     : String[3];
    Sigla   : String[3];
  public
    constructor CrieObj;
    destructor Destrua_se;

    procedure SetoEstado( poEstado : Estados );
    procedure SetCidade( pCidade : String );
    procedure SetDDD( pDDD : String );
    procedure SetSigla( pSigla : String );
    function GetoEstado: Estados;
    function GetCidade: String;
    function GetDDD: String;
    function GetSigla: String;
    function Clone: Cidades;
end;

implementation

{ Cidades }

constructor Cidades.CrieObj;
begin
  inherited;
  Cidade  := '';
  DDD     := '';
  Sigla   := '';
  oEstado := Estados.CrieObj;
end;

destructor Cidades.Destrua_se;
begin
  inherited;
  oEstado.Destrua_se;
end;

procedure Cidades.SetoEstado(poEstado: Estados);
begin

end;

procedure Cidades.SetCidade(pCidade: String);
begin

end;

procedure Cidades.SetDDD(pDDD: String);
begin

end;

procedure Cidades.SetSigla(pSigla: String);
begin

end;

function Cidades.GetoEstado: Estados;
begin

end;

function Cidades.GetCidade: String;
begin

end;

function Cidades.GetDDD: String;
begin

end;

function Cidades.GetSigla: String;
begin

end;

function Cidades.Clone: Cidades;
begin

end;

end.

