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
  UEstados;

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
    function Selecionar: TObject;
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

end;

procedure TConsultaEstados.ConhecaObj( PObj, PCtrl: TObject );
begin
  OEstado     := Estados( PObj );
  ACtrlEstado := ControllerEstados( PCtrl );
  Self.Pesquisar( );
end;

procedure TConsultaEstados.Excluir;
begin
  inherited;

end;

procedure TConsultaEstados.Novo;
begin
  OCadastroEstado.ConhecaObj( OEstado, ACtrlEstado );
  OCadastroEstado.LimparEdt;
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

function TConsultaEstados.Selecionar: TObject;
begin

end;

procedure TConsultaEstados.SetFormCadastro( PObj: TObject );
begin
  OCadastroEstado := TCadastroEstados( PObj );
  inherited SetFormCadastro( OCadastroEstado );
end;

end.