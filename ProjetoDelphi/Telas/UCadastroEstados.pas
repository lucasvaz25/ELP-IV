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
  UControllerEstados;

type
  TCadastroEstados = class( TCadastro )
    edtEstado: TEdit;
    edtSigla: TEdit;
    edtCodPais: TEdit;
    edtPais: TEdit;
    btnPesquisarPais: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  protected
    OEstado: Estados;
    ACtrlEstado: ControllerEstados;
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

end;

procedure TCadastroEstados.CarregaEdt;
begin
  inherited;

end;

procedure TCadastroEstados.ConhecaObj( PObj, PCtrl: TObject );
begin
  inherited;

end;

procedure TCadastroEstados.DesbloqueiaEdt;
begin
  inherited;

end;

procedure TCadastroEstados.LimparEdt;
begin
  inherited;

end;

procedure TCadastroEstados.Sair;
begin
  inherited;

end;

procedure TCadastroEstados.Salvar;
begin
  inherited;

end;

procedure TCadastroEstados.SetConsultaPaises(PConsultaPais: TObject);
begin

end;

end.
