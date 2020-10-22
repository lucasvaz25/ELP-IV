program ProjetoDelphi;

uses
  Vcl.Forms,
  UGerente in 'UGerente.pas' {Gerente},
  UConsulta in 'TelaHeranca\UConsulta.pas' {Consulta},
  UCadastro in 'TelaHeranca\UCadastro.pas' {Cadastro},
  ucidades in 'Code\ucidades.pas',
  uestados in 'Code\uestados.pas',
  uinter in 'Code\uinter.pas',
  upai in 'Code\upai.pas',
  upaises in 'Code\upaises.pas',
  UConsultaPaises in 'Telas\UConsultaPaises.pas' {ConsultaPaises},
  UConsultaEstados in 'Telas\UConsultaEstados.pas' {ConsultaEstados},
  UConsultaCidades in 'Telas\UConsultaCidades.pas' {ConsultaCidades},
  UCadastroPaises in 'Telas\UCadastroPaises.pas' {CadastroPaises},
  UCadastroEstados in 'Telas\UCadastroEstados.pas' {CadastroEstados},
  UCadastroCidades in 'Telas\UCadastroCidades.pas' {CadastroCidades},
  UController in 'Code\UController.pas',
  UControllerPaises in 'Code\UControllerPaises.pas',
  UControllerEstados in 'Code\UControllerEstados.pas',
  UControllerCidades in 'Code\UControllerCidades.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uDAO in 'Code\uDAO.pas',
  uDaoPaises in 'Code\uDaoPaises.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGerente, Gerente);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
