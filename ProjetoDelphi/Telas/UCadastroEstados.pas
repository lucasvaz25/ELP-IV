unit UCadastroEstados;

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
  Uestados,
  UControllerEstados,
  UConsultaPaises;

type
  TCadastroEstados = class( TCadastro )
    EdtEstado: TEdit;
    EdtSigla: TEdit;
    EdtCodPais: TEdit;
    EdtPais: TEdit;
    BtnPesquisarPais: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BtnPesquisarPaisClick( Sender: TObject );
  private
    { Private declarations }
  protected
    OEstado: Estados;
    ACtrlEstado: ControllerEstados;
    AConsultaPais: TConsultaPaises;
  public
    { Public declarations }
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure LimparEdt; Override;
    procedure CarregaEdt; Override;
    procedure BloqueiEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Override;
    procedure SetConsultaPaises( PConsultaPais: TObject );
  end;

var
  CadastroEstados: TCadastroEstados;

implementation

{$R *.dfm}

{ TCadastroEstados }

procedure TCadastroEstados.BloqueiEdt;
begin
  inherited;
  EdtEstado.Enabled  := False;
  EdtSigla.Enabled   := False;
  EdtPais.Enabled    := False;
  EdtCodPais.Enabled := False;
end;

procedure TCadastroEstados.BtnPesquisarPaisClick( Sender: TObject );
begin
  inherited;
  AConsultaPais.ConhecaObj( OEstado.GetoPais, nil { ACtrlEstado.GetCtrlPais } );
  AConsultaPais.ShowModal;
end;

procedure TCadastroEstados.CarregaEdt;
begin
  inherited;
  with OEstado do
  begin
    EdtCodigo.Text  := IntToStr( GetCodigo );
    EdtEstado.Text  := GetEstado;
    EdtSigla.Text   := GetUF;
    EdtCodPais.Text := IntToStr( GetoPais.GetCodigo );
    EdtPais.Text    := GetoPais.GetPais;
    EdtDataCad.Text := GetDataCad;
  end;

end;

procedure TCadastroEstados.ConhecaObj( PObj, PCtrl: TObject );
begin
  inherited;
  OEstado     := Estados( PObj );
  ACtrlEstado := ControllerEstados( PCtrl );
end;

procedure TCadastroEstados.DesbloqueiaEdt;
begin
  inherited;
  EdtEstado.Enabled  := True;
  EdtSigla.Enabled   := True;
  EdtPais.Enabled    := True;
  EdtCodPais.Enabled := True;
end;

procedure TCadastroEstados.LimparEdt;
begin
  inherited;
  EdtEstado.Clear;
  EdtSigla.Clear;
  EdtPais.Clear;
  EdtCodPais.Clear;
end;

procedure TCadastroEstados.Sair;
begin
  inherited;

end;

procedure TCadastroEstados.Salvar;
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
  else if EdtPais.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Pa�s � Obrigat�rio!!' );
    EdtPais.SetFocus;
  end
  else
  begin
    with OEstado do
    begin
      SetCodigo( StrToInt( EdtCodigo.Text ) );
      SetEstado( EdtEstado.Text );
      SetUF( EdtSigla.Text );
      GetoPais.SetCodigo( StrToInt( EdtCodPais.Text ) );
      GetoPais.SetPais( EdtPais.Text );
      ACtrlEstado.Salvar( Clone );
    end;
  end;
end;

procedure TCadastroEstados.SetConsultaPaises( PConsultaPais: TObject );
begin
  AConsultaPais := TConsultaPaises( PConsultaPais );
end;

end.
