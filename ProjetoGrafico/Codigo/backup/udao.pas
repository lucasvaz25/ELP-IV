unit uDAO;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
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

end.

