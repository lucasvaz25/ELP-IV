unit UCadastroPaises;

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
  Upaises,
  UControllerPaises;

type
  TCadastroPaises = class( TCadastro )
    EdtPais: TEdit;
    EdtSigla: TEdit;
    EdtDDI: TEdit;
    LblPais: TLabel;
    LblDDI: TLabel;
    LblSigla: TLabel;
  private
    { Private declarations }
  protected
    Opais: Paises;
    ACtrlPais: ControllerPaises;
  public
    { Public declarations }
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure LimparEdt; Override;
    procedure CarregaEdt; Override;
    procedure BloqueiEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Override;
  end;

var
  CadastroPaises: TCadastroPaises;

implementation

{$R *.dfm}

{ TCadastroPaises }

procedure TCadastroPaises.BloqueiEdt;
begin
  inherited;
  Self.EdtPais.Enabled  := False;
  Self.EdtSigla.Enabled := False;
  Self.EdtDDI.Enabled   := False;

end;

procedure TCadastroPaises.CarregaEdt;
begin
  inherited;
  Self.EdtCodigo.Text  := IntToStr( Opais.GetCodigo );
  Self.EdtPais.Text    := Opais.GetPais;
  Self.EdtSigla.Text   := Opais.GetSigla;
  Self.EdtDDI.Text     := Opais.GetDDI;
  Self.EdtDataCad.Text := Opais.GetDataCad;
end;

procedure TCadastroPaises.ConhecaObj( PObj, PCtrl: TObject );
begin
  inherited;
  Opais     := Paises( PObj );
  ACtrlPais := ControllerPaises( PCtrl );
end;

procedure TCadastroPaises.DesbloqueiaEdt;
begin
  inherited;
  Self.EdtPais.Enabled  := True;
  Self.EdtSigla.Enabled := True;
  Self.EdtDDI.Enabled   := True;
end;

procedure TCadastroPaises.LimparEdt;
begin
  inherited;
  Self.EdtPais.Clear;
  Self.EdtSigla.Clear;
  Self.EdtDDI.Clear;
end;

procedure TCadastroPaises.Sair;
begin
  inherited;

end;

procedure TCadastroPaises.Salvar;
begin
  inherited;
  if EdtPais.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Pa�s � Obrigat�rio!!' );
    EdtPais.SetFocus;
  end
  else if EdtSigla.Text = EmptyStr then
  begin
    ShowMessage( 'Campo Sigla � obrigat�rio!!' );
    EdtSigla.SetFocus;
  end
  else
  begin
    with Opais do
    begin
      SetCodigo( StrToInt( EdtCodigo.Text ) );
      SetPais( EdtPais.Text );
      SetSigla( EdtSigla.Text );
      SetDDI( EdtDDI.Text );
      SetDataCad( EdtDataCad.Text );
      ACtrlPais.Salvar( Clone );
    end;
  end;
end;

end.
