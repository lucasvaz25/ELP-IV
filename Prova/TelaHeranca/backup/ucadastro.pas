unit UCadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadastro }

  TCadastro = class(TForm)
    Btn_Salvar: TButton;
    Btn_Sair: TButton;                        //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
    Edt_Codigo: TEdit;
    Edt_DataCad: TEdit;
    lblCodigo: TLabel;
    lbl_DataCad: TLabel;
    procedure Btn_SairClick(Sender: TObject);
  private

  public
    procedure Salvar; virtual;
    procedure Sair; virtual;
    procedure LimparEdt; virtual;
    procedure CarregaEdt; virtual;
    procedure BloqueiEdt; virtual;
    procedure DesbloqueiaEdt; virtual;
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); Virtual;
  end;

var
  Cadastro: TCadastro;

implementation

{$R *.lfm}

{ TCadastro }

procedure TCadastro.Btn_SairClick(Sender: TObject);
begin
  Self.Sair;
end;

procedure TCadastro.Salvar;                             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
begin

end;

procedure TCadastro.Sair;
begin
  Close;
end;

procedure TCadastro.LimparEdt;
begin
   Self.Edt_Codigo.Text := '0';
end;

procedure TCadastro.CarregaEdt;
begin

end;

procedure TCadastro.BloqueiEdt;
begin
  Self.Edt_Codigo.Enabled := False;
end;

procedure TCadastro.DesbloqueiaEdt;
begin
  Self.Edt_Codigo.Enabled := True;
end;

procedure TCadastro.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin

end;
                                                    //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end.

