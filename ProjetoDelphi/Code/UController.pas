unit UController;

interface

type
  Controller = class
  private
  protected
  public
    constructor CrieObj; virtual;
    destructor Destrua_se; virtual;

    procedure Salvar( PObj: Tobject ); virtual;
    procedure Excluir( PObj: TObject ); virtual;
    function Pesquisar( PChave: String ): string; virtual;
    function Carregar( PObj: TObject ): string; virtual;

  end;

implementation

{ Controller }

function Controller.Carregar(PObj: TObject): string;
begin

end;

constructor Controller.CrieObj;
begin

end;

destructor Controller.Destrua_se;
begin

end;

procedure Controller.Excluir(PObj: TObject);
begin

end;

function Controller.Pesquisar(PChave: String): string;
begin

end;

procedure Controller.Salvar(PObj: Tobject);
begin

end;

end.
