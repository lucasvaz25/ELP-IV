unit UConsultaPaises;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UConsulta,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  UCadastroPaises,
  UControllerPaises,
  Upaises;

type
  TConsultaPaises = class( TConsulta )
  private
    { Private declarations }
    OCadastroPaises: TCadastroPaises;
    OPais: Paises;
    ACtrlPais: ControllerPaises;
  public
    { Public declarations }
    procedure Sair; Override;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Pesquisar; Override;
    procedure SetFormCadastro( PObj: TObject ); Override;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Override;
    function Selecionar: TObject;
    function RetornaObj: TObject; Override;
  end;

var
  ConsultaPaises: TConsultaPaises;

implementation

{$R *.dfm}

{ TConsultaPaises }

procedure TConsultaPaises.Alterar;
begin
  OPais := Paises( ACtrlPais.Carregar( Self.Selecionar ) );
  OCadastroPaises.ConhecaObj( OPais, ACtrlPais );
  OCadastroPaises.LimparEdt;
  OCadastroPaises.CarregaEdt;
  OCadastroPaises.ShowModal;
  inherited;

end;

procedure TConsultaPaises.ConhecaObj( PObj, PCtrl: TObject );
begin
  OPais     := Paises( PObj );
  ACtrlPais := ControllerPaises( PCtrl );
  Self.Pesquisar( );
end;

procedure TConsultaPaises.Excluir;
var
  Aux: string;
begin
  OPais := Paises( ACtrlPais.Carregar( Self.Selecionar ) );
  OCadastroPaises.ConhecaObj( OPais, ACtrlPais );
  OCadastroPaises.LimparEdt;
  OCadastroPaises.CarregaEdt;
  OCadastroPaises.BloqueiEdt;
  Aux                               := OCadastroPaises.BtnSalvar.Caption;
  OCadastroPaises.BtnSalvar.Caption := 'Excluir';
  OCadastroPaises.ShowModal;
  OCadastroPaises.BtnSalvar.Caption := Aux;
  OCadastroPaises.DesbloqueiaEdt;
  inherited;

end;

procedure TConsultaPaises.Novo;
begin
  OCadastroPaises.ConhecaObj( OPais, ACtrlPais );
  OCadastroPaises.LimparEdt;
  OCadastroPaises.ShowModal;
  inherited;

end;

procedure TConsultaPaises.Pesquisar;
begin
  inherited;

end;

function TConsultaPaises.RetornaObj: TObject;
begin
  OPais  := Paises( ACtrlPais.Carregar( Self.Selecionar ) );
  Result := OPais.Clone;
end;

procedure TConsultaPaises.Sair;
begin
  inherited;

end;

function TConsultaPaises.Selecionar: TObject;
begin

end;

procedure TConsultaPaises.SetFormCadastro( PObj: TObject );
begin
  OCadastroPaises := TCadastroPaises( PObj );

  inherited SetFormCadastro( OCadastroPaises );

end;

end.
