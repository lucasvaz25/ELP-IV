unit UConsulta;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TConsulta = class( TForm )
    Panel1: TPanel;
    EdChave: TEdit;
    BtnPesquisar: TButton;
    BtnNovo: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    BtnSair: TButton;
    ListView1: TListView;
    procedure BtnSairClick( Sender: TObject );
    procedure BtnPesquisarClick( Sender: TObject );
    procedure BtnNovoClick( Sender: TObject );
    procedure BtnAlterarClick( Sender: TObject );
    procedure BtnExcluirClick( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Sair; Virtual;
    procedure Novo; Virtual;
    procedure Alterar; Virtual;
    procedure Excluir; virtual;
    procedure Pesquisar; Virtual;
    procedure SetFormCadastro( PObj: TObject ); Virtual;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Virtual;
    Function RetornaObj: TObject; Virtual;
  end;

var
  Consulta: TConsulta;

implementation

{$R *.dfm}


procedure TConsulta.Alterar;
begin

end;

procedure TConsulta.BtnAlterarClick( Sender: TObject );
begin
  Self.Alterar;
end;

procedure TConsulta.BtnExcluirClick( Sender: TObject );
begin
  Self.Excluir;
end;

procedure TConsulta.BtnNovoClick( Sender: TObject );
begin
  Self.Novo;
end;

procedure TConsulta.BtnPesquisarClick( Sender: TObject );
begin
  Self.Pesquisar;
end;

procedure TConsulta.BtnSairClick( Sender: TObject );
begin
  Self.Sair;
end;

procedure TConsulta.ConhecaObj( PObj, PCtrl: TObject );
begin

end;

procedure TConsulta.Excluir;
begin

end;

procedure TConsulta.Novo;
begin

end;

procedure TConsulta.Pesquisar;
begin

end;

function TConsulta.RetornaObj: TObject;
begin

end;

procedure TConsulta.Sair;
begin
  Close;
end;

procedure TConsulta.SetFormCadastro( PObj: TObject );
begin

end;

end.