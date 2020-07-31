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
    edt_Codigo: TEdit;
    lbl_Codigo: TLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private

  public
    procedure Salvar;   Virtual;
    procedure Sair;     Virtual;
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

end.

