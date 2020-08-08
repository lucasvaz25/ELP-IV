unit uCadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadastro }

  TCadastro = class(TForm)
    btn_Salvar: TButton;
    btn_Sair: TButton;
    edt_DataCad: TEdit;
    edt_Codigo: TEdit;
    lbl_CamposObrigatorios: TLabel;
    lbl_DataCadastro: TLabel;
    lbl_Codigo: TLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private

  public
    procedure Salvar;         Virtual;
    procedure Sair;           Virtual;
    procedure LimparEdt;      Virtual;
    procedure CarregaEdt;     Virtual;
    procedure BloqueiEdt;     Virtual;
    procedure DesbloqueiaEdt; Virtual;
  end;

var
  Cadastro: TCadastro;

implementation

{$R *.lfm}

{ TCadastro }

procedure TCadastro.btn_SalvarClick(Sender: TObject);
begin
  Self.Salvar;
end;

procedure TCadastro.btn_SairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TCadastro.Salvar;
begin

end;

procedure TCadastro.Sair;
begin
  Close;
end;

procedure TCadastro.LimparEdt;
begin
  Self.Edt_Codigo.Clear;
end;

procedure TCadastro.CarregaEdt;
begin

end;

procedure TCadastro.BloqueiEdt;
begin
  Self.Edt_Codigo.Enabled:= False;
end;

procedure TCadastro.DesbloqueiaEdt;
begin
  Self.Edt_Codigo.Enabled := True;
end;

end.

