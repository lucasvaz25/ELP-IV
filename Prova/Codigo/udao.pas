unit UDao;

{$mode objfpc}{$H+}

interface                                                                              //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

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
      function TotalDados: Integer;                   Virtual;
  end;

implementation

{ DAO }

constructor DAO.CrieObj;
begin

end;

destructor DAO.Destrua_se;
begin

end;
                                                                                        //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
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
                                                                             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
function DAO.TotalDados: Integer;
begin

end;

end.


