unit UController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type                                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  { Controller }

  Controller = class
    private
    protected
    public
      constructor CrieObj;
      destructor Destrua_se;
      procedure Salvar( pObj : TObject );             Virtual;
      procedure Excluir( pObj : TObject );            Virtual;
      function Pesquisar( pChave : string ) : string; Virtual;
      function Carregar( pPos : Integer ) : TObject;  Virtual;
      function TotalDados: Integer;                   Virtual;
  end;

implementation

{ Controller }

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;                                                                 //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

procedure Controller.Salvar(pObj: TObject);
begin

end;

procedure Controller.Excluir(pObj: TObject);
begin

end;

function Controller.Pesquisar(pChave: string): string;
begin

end;

function Controller.Carregar(pPos: Integer): TObject;
begin

end;

function Controller.TotalDados: Integer;
begin
                                             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end;

end.


