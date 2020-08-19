unit uCadastroCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaEstados, uCidades, uEstados;

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
  protected
    oEstado : Estados;
    aCidade : Cidades;
  public
    procedure Salvar;         Override;
    procedure Sair;           Override;
    procedure LimparEdt;      Override;
    procedure CarregaEdt;     Override;
    procedure BloqueiEdt;     Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj(pObj : TObject);

  end;

var
  CadastroCidades: TCadastroCidades;

implementation

{$R *.lfm}

{ TCadastroCidades }

procedure TCadastroCidades.FormCreate(Sender: TObject);
begin
  oEstado          := Estados.CrieObj;
  aConsultaEstados := TConsultaEstados.Create(nil);
end;

procedure TCadastroCidades.btn_PesquisarClick(Sender: TObject);
begin
  aConsultaEstados.ConhecaObj( oEstado );
  aConsultaEstados.ShowModal;
end;

procedure TCadastroCidades.FormDestroy(Sender: TObject);
begin
  oEstado.Destrua_se;
  aConsultaEstados.FreeInstance;
end;

procedure TCadastroCidades.Salvar;
begin
  if Edt_Cidade.Text = EmptyStr then
  begin
    ShowMessage('Campo Cidade é obrigatório!');
    Edt_Cidade.SetFocus;
  end
  else
  if Edt_DDD.Text = EmptyStr then
  begin
    ShowMessage('Campo DDD é obrigatório!');
    Edt_DDD.SetFocus;
  end
  else
  if Edt_Estado.Text = EmptyStr then
  begin
    ShowMessage('campo Estado é obrigatório');
    Edt_Estado.SetFocus;
  end
  else
  begin
    aCidade.SetCodigo( StrToInt( Edt_Codigo.Text ) );
    aCidade.SetCidade( Edt_Cidade.Text );
    aCidade.SetDDD( Edt_DDD.Text );
    oEstado.SetEstado( Edt_Estado.Text );
    aCidade.SetoEstado( oEstado );
    aCidade.SetDataCad( DateToStr( Now ) );
    inherited Salvar;
  end;
end;

procedure TCadastroCidades.Sair;
begin
  inherited Sair;
end;

procedure TCadastroCidades.LimparEdt;
begin
  inherited LimparEdt;
  Edt_Cidade.Clear;
  Edt_DDD.Clear;
  Edt_Estado.Clear;
end;

procedure TCadastroCidades.CarregaEdt;
begin
  inherited CarregaEdt;
  Edt_Codigo.Text  := IntToStr( aCidade.GetCodigo );
  Edt_Cidade.Text  := aCidade.GetCidade;
  Edt_DDD.Text     := aCidade.GetDDD;
  Edt_Estado.Text  := aCidade.GetoEstado.GetEstado;
  edt_DataCad.Text := aCidade.GetDataCad;
end;

procedure TCadastroCidades.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Edt_Cidade.Enabled := False;
  Edt_DDD.Enabled    := False;
  Edt_Estado.Enabled := False;
end;

procedure TCadastroCidades.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Edt_Cidade.Enabled := True;
  Edt_DDD.Enabled    := True;
  Edt_Estado.Enabled := True;
end;

procedure TCadastroCidades.ConhecaObj(pObj: TObject);
begin
  aCidade := Cidades( pObj );
end;

end.

