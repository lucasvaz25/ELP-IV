unit uPaises;

interface

uses
  Classes,
  SysUtils,
  UPai;

type

  { Paises }

  Paises = class( Pai )
  private
  protected
    Pais: string[ 50 ];
    DDI: string[ 5 ];
    Sigla: string[ 3 ];
  public
    constructor CrieObj;
    destructor Destrua_se;
    constructor CrieInit( PCodigo: Integer; PPais, PDDI, PSigla, PDataCad: string );
    procedure SetPais( PPais: string );
    procedure SetDDI( PDDI: string );
    procedure SetSigla( PSigla: string );
    function GetPais: string;
    function GetDDI: string;
    function GetSigla: string;
    function Clone: Paises;
  end;

implementation

{ Paises }

constructor Paises.CrieObj;
begin
  inherited;
  Pais  := '';
  DDI   := '';
  Sigla := '';
end;

destructor Paises.Destrua_se;
begin
  inherited;
end;

constructor Paises.CrieInit( PCodigo: Integer; PPais, PDDI, PSigla, PDataCad: string );
begin
  Codigo  := PCodigo;
  Pais    := PPais;
  DDI     := PDDI;
  Sigla   := PSigla;
  DataCad := PDataCad;
end;

procedure Paises.SetPais( PPais: string );
begin
  Pais := PPais;
end;

procedure Paises.SetDDI( PDDI: string );
begin
  DDI := PDDI;
end;

procedure Paises.SetSigla( PSigla: string );
begin
  Sigla := PSigla;
end;

function Paises.GetPais: string;
begin
  Result := Pais;
end;

function Paises.GetDDI: string;
begin
  Result := DDI;
end;

function Paises.GetSigla: string;
begin
  Result := Sigla;
end;

function Paises.Clone: Paises;
begin
  Result := Paises.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetPais( Pais );
  Result.SetDDI( DDI );
  Result.SetSigla( Sigla );
  Result.SetDataCad( DataCad );
end;

end.
