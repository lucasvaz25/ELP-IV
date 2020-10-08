unit UConsulta;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TConsulta }                                          //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  TConsulta = class(TForm)
    Btn_Pesquisar: TButton;
    Btn_Novo: TButton;
    Btn_Alterar: TButton;
    Btn_Excluir: TButton;
    Btn_Sair: TButton;
    Edt_Chave: TEdit;
    ListView1: TListView;
    procedure Btn_AlterarClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_PesquisarClick(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
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
    Function RetornaObj: TObject; Virtual;

  end;                                                      //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

var
  Consulta: TConsulta;

implementation

{$R *.lfm}

{ TConsulta }

procedure TConsulta.Btn_SairClick(Sender: TObject);
begin
  Self.Sair;
end;

procedure TConsulta.Btn_PesquisarClick(Sender: TObject);
begin
  Self.Pesquisar;
end;

procedure TConsulta.Btn_NovoClick(Sender: TObject);
begin
  Self.Novo;
end;

procedure TConsulta.Btn_AlterarClick(Sender: TObject);
begin                                                       //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  Self.Alterar;
end;

procedure TConsulta.Btn_ExcluirClick(Sender: TObject);
begin
  Self.Excluir;
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

procedure TConsulta.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin

end;
                                                                 //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
procedure TConsulta.CarregaListView;
begin

end;

function TConsulta.RetornaObj: TObject;
begin

end;

end.

