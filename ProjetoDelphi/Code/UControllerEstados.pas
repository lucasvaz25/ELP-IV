unit UControllerEstados;

interface

uses
  UController,
  Data.DB;

type
  ControllerEstados = class( Controller )
  private
  protected
  public
    constructor CrieObj; override;
    destructor Destrua_se; override;

    procedure Salvar( PObj: Tobject ); override;
    procedure Excluir( PObj: TObject ); override;
    function Pesquisar( PChave: String ): string; override;
    function Carregar( PObj: TObject ): string; override;
    function GetDS: TDataSource; override;
  end;

implementation

{ ControllerEstados }

function ControllerEstados.Carregar( PObj: TObject ): string;
begin

end;

constructor ControllerEstados.CrieObj;
begin
  inherited;

end;

destructor ControllerEstados.Destrua_se;
begin

  inherited;
end;

procedure ControllerEstados.Excluir( PObj: TObject );
begin
  inherited;

end;

function ControllerEstados.GetDS: TDataSource;
begin

end;

function ControllerEstados.Pesquisar( PChave: String ): string;
begin

end;

procedure ControllerEstados.Salvar( PObj: Tobject );
begin
  inherited;

end;

end.
