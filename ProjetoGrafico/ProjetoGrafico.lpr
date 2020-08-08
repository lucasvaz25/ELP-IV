program ProjetoGrafico;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uGerente, uConsulta, uCadastro, uConsultaPaises, uConsultaEstados,
  uConsultaCidades, uCadastroPaises, uCadastroEstados, uCadastroCidades, uInter,
  uPai, uPaises, uEstados, uCidades, uColecao, uColecaoPaises, uColecaoEstados,
  uColecaoCidades
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TGerente, Gerente);
  Application.Run;
end.

