unit uDAO;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

  { DAO }

  DAO = class
    private
    protected
    public
      constructor CrieObj;
      destructor Destrua_se;
      procedure Salvar( pObj : TObject );             Virtual;
      procedure Excluir( pObj : TObject );            Virtual;
      function Pesquisar( pChave : string ) : string; Virtual;
      function Carregar( pPos : Integer ): TObject;   Virtual;
  end;

implementation

{ DAO }

constructor DAO.CrieObj;
begin

end;

destructor DAO.Destrua_se;
begin

end;

procedure DAO.Salvar(pObj: TObject);
begin

end;

procedure DAO.Excluir(pObj: TObject);
begin

end;

function DAO.Pesquisar(pChave: string): string;
begin

end;

function DAO.Carregar(pPos: Integer): TObject;
begin

end;

end.

