unit uCadastroCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaEstados, uCidades, uEstados,
  uControllerCidades;

type

  { TCadastroCidades }

  TCadastroCidades = class(TCadastro)
    btn_Pesquisar: TButton;
    edt_Cidade: TEdit;
    edt_DDD: TEdit;
    edt_Sigla: TEdit;
    edt_Estado: TEdit;
    lbl_Cidade: TLabel;
    lbl_DDD: TLabel;
    lbl_Sigla: TLabel;
    lbl_Estado: TLabel;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure edt_CidadeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    aConsultaEstados: TConsultaEstados;
  protected
    oEstado: Estados;
    aCidade: Cidades;
    aCtrlCidade: CtrlCidades;
  public
    procedure Salvar; override;
    procedure Sair; override;
    procedure LimparEdt; override;
    procedure CarregaEdt; override;
    procedure BloqueiEdt; override;
    procedure DesbloqueiaEdt; override;
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure SetConsultaEstados(pConsultaEstados: TObject);

  end;

var
  CadastroCidades: TCadastroCidades;

implementation

{$R *.lfm}

{ TCadastroCidades }

procedure TCadastroCidades.FormCreate(Sender: TObject);
begin

end;

procedure TCadastroCidades.btn_PesquisarClick(Sender: TObject);
var
  mAux: string;
begin
  mAux := aConsultaEstados.btn_Sair.Caption;
  aConsultaEstados.btn_Sair.Caption := 'Selecionar';
  aConsultaEstados.ConhecaObj(aCidade.GetoEstado, aCtrlCidade.getCtrlEstados);
  aConsultaEstados.ShowModal;
  aCidade.SetoEstado(Estados(aConsultaEstados.RetornaObj));
  aConsultaEstados.btn_Sair.Caption := mAux;
  ;
  edt_Estado.Text := aCidade.GetoEstado.GetEstado;
end;

procedure TCadastroCidades.edt_CidadeExit(Sender: TObject);
var
  msg: string;
begin
  if Self.edt_Cidade.Text = EmptyStr then
  begin
    ShowMessage('Campo Cidade é obrigatório!');
    Self.edt_Cidade.SetFocus;
  end
  else
  begin
    msg := aCtrlCidade.Duplicado(StrToInt(Self.edt_Codigo.Text), Self.edt_Cidade.Text);
    if msg <> '' then
    begin
      ShowMessage(msg);
      Self.edt_Cidade.SetFocus;
    end;
  end;
end;

procedure TCadastroCidades.FormDestroy(Sender: TObject);
begin

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
    aCidade.SetCodigo(StrToInt(Edt_Codigo.Text));
    aCidade.SetCidade(Edt_Cidade.Text);
    aCidade.SetDDD(Edt_DDD.Text);
    aCidade.SetSigla(edt_Sigla.Text);
    aCidade.GetoEstado.SetEstado(Edt_Estado.Text);
    aCidade.SetDataCad(DateToStr(Now));
    aCtrlCidade.Salvar(aCidade.Clone);
    //    inherited Salvar;
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
  edt_Sigla.Clear;
end;

procedure TCadastroCidades.CarregaEdt;
begin
  inherited CarregaEdt;
  Edt_Codigo.Text := IntToStr(aCidade.GetCodigo);
  Edt_Cidade.Text := aCidade.GetCidade;
  Edt_DDD.Text := aCidade.GetDDD;
  edt_Sigla.Text := aCidade.GetSigla;
  Edt_Estado.Text := aCidade.GetoEstado.GetEstado;
  edt_DataCad.Text := aCidade.GetDataCad;
end;

procedure TCadastroCidades.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Edt_Cidade.Enabled := False;
  Edt_DDD.Enabled := False;
  edt_Sigla.Enabled := False;
  Edt_Estado.Enabled := False;
end;

procedure TCadastroCidades.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Edt_Cidade.Enabled := True;
  Edt_DDD.Enabled := True;
  edt_Sigla.Enabled := False;
  Edt_Estado.Enabled := True;
end;

procedure TCadastroCidades.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
end;

procedure TCadastroCidades.SetConsultaEstados(pConsultaEstados: TObject);
begin
  aConsultaEstados := TConsultaEstados(pConsultaEstados);
end;

end.
