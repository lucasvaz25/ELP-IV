unit UControllerPaises;

interface

uses
  UController,
  Data.DB;

type
  ControllerPaises = class( Controller )
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

{ ControllerPaises }

function ControllerPaises.Carregar( PObj: TObject ): string;
begin

end;

constructor ControllerPaises.CrieObj;
begin
  inherited;

end;

destructor ControllerPaises.Destrua_se;
begin

  inherited;
end;

procedure ControllerPaises.Excluir( PObj: TObject );
begin
  inherited;

end;

function ControllerPaises.GetDS: TDataSource;
begin

end;

function ControllerPaises.Pesquisar( PChave: String ): string;
begin

end;

procedure ControllerPaises.Salvar( PObj: Tobject );
begin
  inherited;

end;

end.
