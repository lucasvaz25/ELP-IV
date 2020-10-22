unit UCadastroCidades;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UCadastro,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Ucidades,
  UControllerCidades,
  UConsultaEstados;

type
  TCadastroCidades = class( TCadastro )
    EdtCidade: TEdit;
    EdtDDD: TEdit;
    EdtSigla: TEdit;
    EdtCodEstado: TEdit;
    EdtEstado: TEdit;
    Btn_PesquisarEstado: TButton;
    LblCidade: TLabel;
    LblDDD: TLabel;
    LblSigla: TLabel;
    LblCodEstado: TLabel;
    LblEstado: TLabel;
    procedure Btn_PesquisarEstadoClick( Sender: TObject );
  private
    { Private declarations }
  protected
    ACidade: Cidades;
    ACtrlCidade: ControllerCidades;
    AConsultaEstado: TConsultaEstados;
  public
    { Public declarations }
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure LimparEdt; Override;
    procedure CarregaEdt; Override;
    procedure BloqueiEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Override;
    procedure SetConsultaEstados( PConsultaEstados: TObject );
  end;

var
  CadastroCidades: TCadastroCidades;

implementation

{$R *.dfm}

{ TCadastroCidades }

procedure TCadastroCidades.BloqueiEdt;
begin
  inherited;
  EdtCidade.Enabled    := False;
  EdtSigla.Enabled     := False;
  EdtDDD.Enabled       := False;
  EdtCodEstado.Enabled := False;
  EdtEstado.Enabled    := False;
end;

procedure TCadastroCidades.Btn_PesquisarEstadoClick( Sender: TObject );
begin
  inherited;
  AConsultaEstado.ConhecaObj( ACidade.GetoEstado, nil { ACtrlCidade.GetCtrlEstado } );
  AConsultaEstado.ShowModal;
end;

procedure TCadastroCidades.CarregaEdt;
begin
  inherited;
  with ACidade do
  begin
    EdtCodigo.Text    := IntToStr( GetCodigo );
    EdtCidade.Text    := GetCidade;
    EdtSigla.Text     := GetSigla;
    EdtDDD.Text       := GetDDD;
    EdtCodEstado.Text := IntToStr( GetoEstado.GetCodigo );
    EdtEstado.Text    := GetoEstado.GetEstado;
    EdtDataCad.Text   := GetDataCad;
  end;
end;

procedure TCadastroCidades.ConhecaObj( PObj, PCtrl: TObject );
begin
  inherited;
  ACidade     := Cidades( PObj );
  ACtrlCidade := ControllerCidades( PCtrl );
end;

procedure TCadastroCidades.DesbloqueiaEdt;
begin
  inherited;
  EdtCidade.Enabled    := True;
  EdtSigla.Enabled     := True;
  EdtDDD.Enabled       := True;
  EdtCodEstado.Enabled := True;
  EdtEstado.Enabled    := True;
end;

procedure TCadastroCidades.LimparEdt;
begin
  inherited;
  EdtCidade.Clear;
  EdtSigla.Clear;
  EdtDDD.Clear;
  EdtCodEstado.Clear;
  EdtEstado.Clear;
end;

procedure TCadastroCidades.Sair;
begin
  inherited;

end;

procedure TCadastroCidades.Salvar;
begin
  inherited;
  if EdtEstado.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Estado � Obrigat�rio!!' );
    EdtEstado.SetFocus;
  end
  else if EdtSigla.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Sigla � Obrigat�rio!!' );
    EdtSigla.SetFocus;
  end
  else if EdtEstado.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Estado � Obrigat�rio!!' );
    EdtEstado.SetFocus;
  end
  else
  begin
    with ACidade do
    begin
      SetCodigo( StrToInt( EdtCodigo.Text ) );
      SetCidade( EdtCidade.Text );
      SetSigla( EdtSigla.Text );
      SetDDD( EdtDDD.Text );
      GetoEstado.SetCodigo( StrToInt( EdtCodEstado.Text ) );
      GetoEstado.SetEstado( EdtEstado.Text );
      SetDataCad( EdtDataCad.Text );
      ACtrlCidade.Salvar( Clone );
    end;
  end;
end;

procedure TCadastroCidades.SetConsultaEstados( PConsultaEstados: TObject );
begin
  AConsultaEstado := TConsultaEstados( PConsultaEstados );
end;

end.
