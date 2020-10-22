unit uDAO;

interface

uses
  Data.DB;

type
  DAO = class
  private
  protected
  public
    constructor CrieObj; virtual;
    destructor Destrua_se; virtual;

    procedure Salvar( PObj: Tobject ); virtual;
    procedure Excluir( PObj: TObject ); virtual;
    procedure SetDM( PObj: TObject ); virtual;
    function Pesquisar( PChave: String ): string; virtual;
    function Carregar( PObj: TObject ): string; virtual;
    function GetDS: TDataSource; virtual;
  end;

implementation

{ DAO }

function DAO.Carregar( PObj: TObject ): string;
begin

end;

constructor DAO.CrieObj;
begin

end;

destructor DAO.Destrua_se;
begin

end;

procedure DAO.Excluir( PObj: TObject );
begin

end;

function DAO.GetDS: TDataSource;
begin

end;

function DAO.Pesquisar( PChave: String ): string;
begin

end;

procedure DAO.Salvar( PObj: Tobject );
begin

end;

procedure DAO.SetDM( PObj: TObject );
begin

end;

end.
