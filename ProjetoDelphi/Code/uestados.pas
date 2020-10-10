unit uEstados;

interface

uses
  Classes,
  SysUtils,
  UPai,
  UPaises;

type

  { Estados }

  Estados = class( Pai )
  protected
    OPais: Paises;
    Estado: string[ 50 ];
    UF: string[ 2 ];
  public
    constructor CrieObj;
    destructor Destrua_se;
    constructor CrieInit( MCodigo: Integer; UmPais: Paises;
                MEstado, MUF, MDataCad: string );

    procedure SetoPais( PoPais: Paises );
    procedure SetEstado( PEstado: string );
    procedure SetUF( PUF: string );
    function GetoPais: Paises;
    function GetEstado: string;
    function GetUF: string;
    function Clone: Estados;
  end;

implementation

{ Estados }

constructor Estados.CrieObj;
begin
  inherited;
  OPais  := Paises.CrieObj;
  Estado := '';
  UF     := '';
end;

destructor Estados.Destrua_se;
begin
  inherited;
  OPais.Destrua_se;
end;

constructor Estados.CrieInit( MCodigo: Integer; UmPais: Paises;
            MEstado, MUF, MDataCad: string );
begin
  Codigo  := MCodigo;
  OPais   := UmPais;
  Estado  := MEstado;
  UF      := MUF;
  DataCad := MDataCad;
end;

procedure Estados.SetoPais( PoPais: Paises );
begin
  OPais := PoPais;
end;

procedure Estados.SetEstado( PEstado: string );
begin
  Estado := PEstado;
end;

procedure Estados.SetUF( PUF: string );
begin
  UF := PUF;
end;

function Estados.GetoPais: Paises;
begin
  Result := OPais;
end;

function Estados.GetEstado: string;
begin
  Result := Estado;
end;

function Estados.GetUF: string;
begin
  Result := UF;
end;

function Estados.Clone: Estados;
begin
  Result := Estados.CrieObj;
  Result.SetCodigo( Codigo );
  Result.SetEstado( Estado );
  Result.SetUF( UF );
  Result.SetoPais( OPais.Clone );
  Result.SetDataCad( DataCad );
end;

end.
