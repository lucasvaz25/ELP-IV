unit uCadastroEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaPaises, uEstados, uControllerEstados, uPaises;

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
    aConsultaPaises: TConsultaPaises;
  protected
    oEstado: Estados;
    aCtrlEstado: CtrlEstados;
  public

    procedure Salvar; override;
    procedure Sair; override;
    procedure LimparEdt; override;
    procedure CarregaEdt; override;
    procedure BloqueiEdt; override;
    procedure DesbloqueiaEdt; override;
    procedure SetConsultaPaises(pConsultaPais: TObject);
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;

  end;

var
  CadastroEstados: TCadastroEstados;

implementation

{$R *.lfm}

{ TCadastroEstados }

procedure TCadastroEstados.FormCreate(Sender: TObject);
begin

end;

procedure TCadastroEstados.btn_PesquisarClick(Sender: TObject);
var
  mAux: string;
begin
  mAux := aConsultaPaises.btn_Sair.Caption;
  aConsultaPaises.btn_Sair.Caption := 'Selecionar';
  aConsultaPaises.ConhecaObj(oEstado.GetoPais, aCtrlEstado.getCtrlPaises);
  aConsultaPaises.ShowModal;
  oEstado.SetoPais( Paises( aConsultaPaises.RetornaPaises ) );
  aConsultaPaises.btn_Sair.Caption := mAux;
  edt_Pais.Text := oEstado.GetoPais.GetPais;
end;

procedure TCadastroEstados.FormDestroy(Sender: TObject);
begin

end;

procedure TCadastroEstados.Salvar;
begin
  if Edt_Estado.Text = EmptyStr then
  begin
    ShowMessage('Campo Estado é obrigatório!');
    Edt_Estado.SetFocus;
  end
  else
  if Edt_Sigla.Text = EmptyStr then
  begin
    ShowMessage('Campo Sigla é obrigatório!');
    Edt_Sigla.SetFocus;
  end
  else
  if Edt_Pais.Text = EmptyStr then
  begin
    ShowMessage('Campo País é obrigatório!');
    Edt_Pais.SetFocus;
  end
  else
  begin
    oEstado.SetCodigo(StrToInt(Edt_Codigo.Text));
    oEstado.SetEstado(Edt_Estado.Text);
    oEstado.SetUF(Edt_Sigla.Text);
    oEstado.GetoPais.SetPais(Edt_Pais.Text);
    oEstado.SetoPais(oEstado.GetoPais);
    oEstado.SetDataCad(DateToStr(Now));
    aCtrlEstado.Salvar(oEstado.Clone);
    inherited Salvar;
  end;
end;

procedure TCadastroEstados.Sair;
begin
  inherited Sair;
end;

procedure TCadastroEstados.LimparEdt;
begin
  inherited LimparEdt;
  Edt_Estado.Clear;
  Edt_Sigla.Clear;
  Edt_Pais.Clear;
end;

procedure TCadastroEstados.CarregaEdt;
begin
  inherited CarregaEdt;
  Edt_Codigo.Text := IntToStr(oEstado.GetCodigo);
  Edt_Estado.Text := oEstado.GetEstado;
  Edt_Sigla.Text := oEstado.GetUF;
  Edt_Pais.Text := oEstado.GetoPais.GetPais;
  edt_DataCad.Text := oEstado.GetDataCad;
end;

procedure TCadastroEstados.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Edt_Estado.Enabled := False;
  Edt_Sigla.Enabled := False;
  Edt_Pais.Enabled := False;
end;

procedure TCadastroEstados.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Edt_Estado.Enabled := True;
  Edt_Sigla.Enabled := True;
  Edt_Pais.Enabled := True;
end;

procedure TCadastroEstados.SetConsultaPaises(pConsultaPais: TObject);
begin
  aConsultaPaises := TConsultaPaises(pConsultaPais);
end;

procedure TCadastroEstados.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
  //  inherited ConhecaObj(pObj, pCtrl);
end;

end.

