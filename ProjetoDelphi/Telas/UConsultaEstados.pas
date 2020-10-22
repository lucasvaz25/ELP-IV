unit UConsultaEstados;

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
  UCadastroEstados,
  UControllerEstados,
  UEstados,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids;

type
  TConsultaEstados = class( TConsulta )
  private
    { Private declarations }
    OCadastroEstado: TCadastroEstados;
    ACtrlEstado: ControllerEstados;
    OEstado: Estados;
  public
    { Public declarations }
    procedure Sair; Override;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Pesquisar; Override;
    procedure SetFormCadastro( PObj: TObject ); Override;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Override;
    // function Selecionar: TObject;
    function RetornaObj: TObject; Override;
  end;

var
  ConsultaEstados: TConsultaEstados;

implementation

{$R *.dfm}

{ TConsultaEstados }

procedure TConsultaEstados.Alterar;
begin
  inherited;
  ACtrlEstado.Carregar( OEstado );
  OCadastroEstado.ConhecaObj( OEstado, ACtrlEstado );
  OCadastroEstado.LimparEdt;
  OCadastroEstado.CarregaEdt;
  OCadastroEstado.ShowModal;

end;

procedure TConsultaEstados.ConhecaObj( PObj, PCtrl: TObject );
begin
  OEstado     := Estados( PObj );
  ACtrlEstado := ControllerEstados( PCtrl );
  Self.Pesquisar( );
end;

procedure TConsultaEstados.Excluir;
var
  Aux: string;
begin
  inherited;
  OEstado.SetCodigo( 0 );
  OCadastroEstado.ConhecaObj( OEstado, ACtrlEstado );
  OCadastroEstado.LimparEdt;
  OCadastroEstado.CarregaEdt;
  OCadastroEstado.BloqueiEdt;
  Aux                               := OCadastroEstado.BtnSalvar.Caption;
  OCadastroEstado.BtnSalvar.Caption := 'Excluir';
  OCadastroEstado.ShowModal;
  OCadastroEstado.BtnSalvar.Caption := Aux;
  OCadastroEstado.DesbloqueiaEdt;
  OCadastroEstado.ShowModal;

end;

procedure TConsultaEstados.Novo;
begin
  OEstado.SetCodigo( 0 );
  OCadastroEstado.ConhecaObj( OEstado, ACtrlEstado );
  OCadastroEstado.LimparEdt;
  OCadastroEstado.CarregaEdt;
  OCadastroEstado.ShowModal;
  inherited;

end;

procedure TConsultaEstados.Pesquisar;
begin
  inherited;

end;

function TConsultaEstados.RetornaObj: TObject;
begin

end;

procedure TConsultaEstados.Sair;
begin
  inherited;

end;

// function TConsultaEstados.Selecionar: TObject;
// begin
//
// end;

procedure TConsultaEstados.SetFormCadastro( PObj: TObject );
begin
  OCadastroEstado := TCadastroEstados( PObj );
  inherited SetFormCadastro( OCadastroEstado );
end;

end.
