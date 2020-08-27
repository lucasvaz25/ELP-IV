unit uConsulta;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TConsulta }

  TConsulta = class(TForm)
    btn_Excluir: TButton;
    btn_Pesquisar: TButton;
    btn_Novo: TButton;
    btn_Alterar: TButton;
    btn_Sair: TButton;
    edt_Chave: TEdit;
    ListView1: TListView;
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private

  public
    procedure Sair;      Virtual;
    procedure Novo;      Virtual;
    procedure Alterar;   Virtual;
    procedure Excluir;   virtual;
    procedure Pesquisar; Virtual;
    procedure SetFormCadastro( pObj : TObject ); Virtual;
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);   Virtual;
    procedure CarregaListView;  Virtual;

  end;

var
  Consulta: TConsulta;

implementation

{$R *.lfm}

{ TConsulta }

procedure TConsulta.btn_SairClick(Sender: TObject);
begin
  Self.Sair;
end;

procedure TConsulta.btn_PesquisarClick(Sender: TObject);
begin
  Self.Pesquisar;
end;

procedure TConsulta.btn_NovoClick(Sender: TObject);
begin
  Self.Novo;
end;

procedure TConsulta.btn_AlterarClick(Sender: TObject);
begin
  Self.Alterar;
end;

procedure TConsulta.btn_ExcluirClick(Sender: TObject);
begin
  Self.Excluir;;
end;

procedure TConsulta.Sair;
begin
  Close;
end;

procedure TConsulta.Novo;
begin

end;

procedure TConsulta.Alterar;
begin

end;

procedure TConsulta.Excluir;
begin

end;

procedure TConsulta.Pesquisar;
begin

end;

procedure TConsulta.SetFormCadastro(pObj: TObject);
begin

end;

end.

