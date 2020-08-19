unit uCadastroEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro,
  uConsultaPaises, uEstados, uPaises;

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
  protected
    oEstado : Estados;
    oPais   : Paises;
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
  CadastroEstados: TCadastroEstados;

implementation

{$R *.lfm}

{ TCadastroEstados }

procedure TCadastroEstados.FormCreate(Sender: TObject);
begin
  aConsultaPaises := TConsultaPaises.Create(nil);
  oPais := Paises.CrieObj;
end;

procedure TCadastroEstados.btn_PesquisarClick(Sender: TObject);
begin
  aConsultaPaises.ConhecaObj( oPais ) ;
  aConsultaPaises.ShowModal;
end;

procedure TCadastroEstados.FormDestroy(Sender: TObject);
begin
  oPais.Destrua_se;
  aConsultaPaises.FreeInstance;
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
    oEstado.SetCodigo( StrToInt( Edt_Codigo.Text ) );
    oEstado.SetEstado( Edt_Estado.Text );
    oEstado.SetUF( Edt_Sigla.Text );
    oPais.SetPais( Edt_Pais.Text );
    oEstado.SetoPais( oPais );
    oEstado.SetDataCad( DateToStr( Now ) );
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
  Edt_Codigo.Text  := IntToStr( oEstado.GetCodigo );
  Edt_Estado.Text  := oEstado.GetEstado;
  Edt_Sigla.Text   := oEstado.GetUF;
  Edt_Pais.Text    := oEstado.GetoPais.GetPais;
  edt_DataCad.Text := oEstado.GetDataCad;
end;

procedure TCadastroEstados.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Edt_Estado.Enabled := False;
  Edt_Sigla.Enabled  := False;
  Edt_Pais.Enabled   := False;
end;

procedure TCadastroEstados.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Edt_Estado.Enabled := True;
  Edt_Sigla.Enabled  := True;
  Edt_Pais.Enabled   := True;
end;

procedure TCadastroEstados.ConhecaObj(pObj: TObject);
begin
  oEstado := Estados( pObj );
end;

end.

