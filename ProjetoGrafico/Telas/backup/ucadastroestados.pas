unit uCadastroEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaPaises;

type

  { TCadastroEstados }

  TCadastroEstados = class(TCadastro)
    btn_Pesquisar: TButton;
    edt_Sigla: TEdit;
    edt_Estado: TEdit;
    edt_Pais: TEdit;
    lbl_Sigla: TLabel;
    lbl_Estado: TLabel;
    Label3: TLabel;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    aConsultaPaises : TConsultaPaises;
  public

  end;

var
  CadastroEstados: TCadastroEstados;

implementation

{$R *.lfm}

{ TCadastroEstados }

procedure TCadastroEstados.FormCreate(Sender: TObject);
begin
  aConsultaPaises := TConsultaPaises.Create(nil);
end;

procedure TCadastroEstados.btn_PesquisarClick(Sender: TObject);
begin
  aConsultaPaises.show
end;

procedure TCadastroEstados.FormDestroy(Sender: TObject);
begin
  aConsultaPaises.FreeInstance;
end;

end.

