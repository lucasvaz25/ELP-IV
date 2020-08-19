unit uController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

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
  end;

implementation

{ Controller }

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;

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

end.

