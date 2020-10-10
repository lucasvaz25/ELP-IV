unit UConsultaCidades;

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
  UCadastroCidades,
  UControllerCidades,
  Ucidades;

type
  TConsultaCidades = class( TConsulta )
  private
    { Private declarations }
    OCadastroCidade: TCadastroCidades;
    ACtrlCidade: ControllerCidades;
    ACidade: Cidades;
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
  ConsultaCidades: TConsultaCidades;

implementation

{$R *.dfm}

{ TConsultaCidades }

procedure TConsultaCidades.Alterar;
begin
  inherited;

end;

procedure TConsultaCidades.ConhecaObj( PObj, PCtrl: TObject );
begin
  ACidade     := Cidades( PObj );
  ACtrlCidade := ControllerCidades( PCtrl );
  Self.Pesquisar( );
end;

procedure TConsultaCidades.Excluir;
begin
  inherited;

end;

procedure TConsultaCidades.Novo;
begin
  OCadastroCidade.ConhecaObj( ACidade, ACtrlCidade );
  OCadastroCidade.LimparEdt;
  OCadastroCidade.ShowModal;
  inherited;
end;

procedure TConsultaCidades.Pesquisar;
begin
  inherited;

end;

function TConsultaCidades.RetornaObj: TObject;
begin

end;

procedure TConsultaCidades.Sair;
begin
  inherited;

end;

function TConsultaCidades.Selecionar: TObject;
begin

end;

procedure TConsultaCidades.SetFormCadastro( PObj: TObject );
begin
  OCadastroCidade := TCadastroCidades( PObj );
  inherited SetFormCadastro( OCadastroCidade );
end;

end.