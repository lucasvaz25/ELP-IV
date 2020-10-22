unit UCadastro;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TCadastro = class( TForm )
    Panel1: TPanel;
    EdtCodigo: TLabeledEdit;
    EdtDataCad: TLabeledEdit;
    BtnSalvar: TButton;
    BtnSair: TButton;
    procedure BtnSairClick( Sender: TObject );
    procedure BtnSalvarClick( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar; virtual;
    procedure Sair; virtual;
    procedure LimparEdt; virtual;
    procedure CarregaEdt; virtual;
    procedure BloqueiEdt; virtual;
    procedure DesbloqueiaEdt; virtual;
    procedure ConhecaObj( PObj: TObject; PCtrl: TObject ); Virtual;
  end;

var
  Cadastro: TCadastro;

implementation

{$R *.dfm}


procedure TCadastro.BloqueiEdt;
begin
  Self.EdtCodigo.Enabled := False;
end;

procedure TCadastro.BtnSairClick( Sender: TObject );
begin
  Close;
end;

procedure TCadastro.BtnSalvarClick( Sender: TObject );
begin
  Self.Salvar;
end;

procedure TCadastro.CarregaEdt;
begin

end;

procedure TCadastro.ConhecaObj( PObj, PCtrl: TObject );
begin

end;

procedure TCadastro.DesbloqueiaEdt;
begin
  Self.EdtCodigo.Enabled := True;
end;

procedure TCadastro.LimparEdt;
begin
  Self.EdtCodigo.Text  := '0';
  Self.EdtDataCad.Text := DateToStr( Now );
end;

procedure TCadastro.Sair;
begin
  Close;
end;

procedure TCadastro.Salvar;
begin

end;

end.
