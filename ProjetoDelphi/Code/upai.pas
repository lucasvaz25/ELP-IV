unit uPai;

interface

uses
  Classes,
  SysUtils;

type

  { Pai }

  Pai = class
  private
  protected
    Codigo: Integer;
    DataCad: String[ 15 ];
  public
    constructor CrieObj;
    destructor Destrua_se;

    procedure SetCodigo( PCodigo: Integer );
    procedure SetDataCad( PDataCad: String );
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

procedure Pai.SetCodigo( PCodigo: Integer );
begin
  Codigo := PCodigo;
end;

procedure Pai.SetDataCad( PDataCad: String );
begin
  DataCad := PDataCad;
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
