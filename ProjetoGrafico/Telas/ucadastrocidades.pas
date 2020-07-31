unit uCadastroCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaEstados;

type

  { TCadastroCidades }

  TCadastroCidades = class(TCadastro)
    btn_Pesquisar: TButton;
    edt_Cidade: TEdit;
    edt_DDD: TEdit;
    edt_Estado: TEdit;
    lbl_Cidade: TLabel;
    lbl_DDD: TLabel;
    lbl_Estado: TLabel;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    aConsultaEstados : TConsultaEstados;
  public

  end;

var
  CadastroCidades: TCadastroCidades;

implementation

{$R *.lfm}

{ TCadastroCidades }

procedure TCadastroCidades.FormCreate(Sender: TObject);
begin
  aConsultaEstados := TConsultaEstados.Create(nil);
end;

procedure TCadastroCidades.btn_PesquisarClick(Sender: TObject);
begin
  aConsultaEstados.ShowModal;
end;

procedure TCadastroCidades.FormDestroy(Sender: TObject);
begin
  aConsultaEstados.FreeInstance;
end;

end.

