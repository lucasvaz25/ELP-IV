program prova;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset                       //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  Forms, uGerente, UGrupo, UPai, USubGrupo, UCadastro, UConsulta,
  UCadastroGrupos, uCadastroSubGrupos, UConsultaGrupos, UConsultaSubGrupos,
  UColecao, UColecaoGrupos, UColecaoSubGrupos, UDao, uDaoGrupos, UDaoSubGrupos,
  UController, uControllerGrupos, uControllerSubGrupos, UInter
  { you can add units after this };

{$R *.res}

begin                                               //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;                 //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  Application.CreateForm(TGerente, Gerente);
  Application.Run;
end.

