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
  UControllerCidades;

type
  TCadastroCidades = class( TCadastro )
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  protected
    ACidade: Cidades;
    ACtrlCidade: ControllerCidades;
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

end;

procedure TCadastroCidades.CarregaEdt;
begin
  inherited;

end;

procedure TCadastroCidades.ConhecaObj( PObj, PCtrl: TObject );
begin
  inherited;

end;

procedure TCadastroCidades.DesbloqueiaEdt;
begin
  inherited;

end;

procedure TCadastroCidades.LimparEdt;
begin
  inherited;

end;

procedure TCadastroCidades.Sair;
begin
  inherited;

end;

procedure TCadastroCidades.Salvar;
begin
  inherited;

end;

procedure TCadastroCidades.SetConsultaEstados( PConsultaEstados: TObject );
begin

end;

end.