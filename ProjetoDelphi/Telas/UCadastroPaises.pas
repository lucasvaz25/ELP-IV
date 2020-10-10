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
    edtPais: TEdit;
    edtSigla: TEdit;
    edtDDI: TEdit;
    lblPais: TLabel;
    lblDDI: TLabel;
    lblSigla: TLabel;
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

end;

procedure TCadastroPaises.CarregaEdt;
begin
  inherited;

end;

procedure TCadastroPaises.ConhecaObj(PObj, PCtrl: TObject);
begin
  inherited;

end;

procedure TCadastroPaises.DesbloqueiaEdt;
begin
  inherited;

end;

procedure TCadastroPaises.LimparEdt;
begin
  inherited;

end;

procedure TCadastroPaises.Sair;
begin
  inherited;

end;

procedure TCadastroPaises.Salvar;
begin
  inherited;

end;

end.
