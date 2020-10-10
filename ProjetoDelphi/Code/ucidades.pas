unit uCidades;



interface

uses
  Classes,
  SysUtils,
  UPai,
  UEstados;

type

  { Cidades }

  Cidades = Class( Pai )
  protected
    OEstado: Estados;
    Cidade: String[ 50 ];
    DDD: String[ 3 ];
    Sigla: String[ 3 ];
  public
    constructor CrieObj;
    destructor Destrua_se;
    constructor CrieInit( MCodigo: Integer; UmEstado: Estados; MCidade, MDDD, MSigla, MDataCad: string );

    procedure SetoEstado( PoEstado: Estados );
    procedure SetCidade( PCidade: String );
    procedure SetDDD( PDDD: String );
    procedure SetSigla( PSigla: String );
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
  OEstado := Estados.CrieObj;
end;

destructor Cidades.Destrua_se;
begin
  inherited;
  OEstado.Destrua_se;
end;

constructor Cidades.CrieInit( MCodigo: Integer; UmEstado: Estados; MCidade,
            MDDD, MSigla, MDataCad: string );
begin
  Codigo  := MCodigo;
  OEstado := UmEstado;
  Cidade  := MCidade;
  DDD     := MDDD;
  Sigla   := MSigla;
  DataCad := MDataCad;
end;

procedure Cidades.SetoEstado( PoEstado: Estados );
begin
  OEstado := PoEstado;
end;

procedure Cidades.SetCidade( PCidade: String );
begin
  Cidade := PCidade;
end;

procedure Cidades.SetDDD( PDDD: String );
begin
  DDD := PDDD;
end;

procedure Cidades.SetSigla( PSigla: String );
begin
  Sigla := PSigla;
end;

function Cidades.GetoEstado: Estados;
begin
  Result := OEstado;
end;

function Cidades.GetCidade: String;
begin
  Result := Cidade;
end;

function Cidades.GetDDD: String;
begin
  Result := DDD;
end;

function Cidades.GetSigla: String;
begin
  Result := Sigla;
end;

function Cidades.Clone: Cidades;
begin
  Result := Cidades.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetCidade( Cidade );
  Result.SetDDD( DDD );
  Result.SetSigla( Sigla );
  Result.SetoEstado( OEstado.Clone );
  Result.SetDataCad( DataCad );
end;

end.
