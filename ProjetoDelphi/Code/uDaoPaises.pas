unit uDaoPaises;

interface

uses
  Data.DB,
  UDAO;

type
  DaoPaises = class( DAO )
  private
  protected
  public
    constructor CrieObj; override;
    destructor Destrua_se; override;

    procedure Salvar( PObj: Tobject ); override;
    procedure Excluir( PObj: TObject ); override;
    procedure SetDM( PObj: TObject ); override;
    function Pesquisar( PChave: String ): string; override;
    function Carregar( PObj: TObject ): string; override;
    function GetDS: TDataSource; override;
  end;

implementation

{ DaoPaises }

function DaoPaises.Carregar( PObj: TObject ): string;
begin

end;

constructor DaoPaises.CrieObj;
begin
  inherited;

end;

destructor DaoPaises.Destrua_se;
begin

  inherited;
end;

procedure DaoPaises.Excluir( PObj: TObject );
begin
  inherited;

end;

function DaoPaises.GetDS: TDataSource;
begin

end;

function DaoPaises.Pesquisar( PChave: String ): string;
begin

end;

procedure DaoPaises.Salvar( PObj: Tobject );
begin
  inherited;

end;

procedure DaoPaises.SetDM( PObj: TObject );
begin
  inherited;

end;

end.
