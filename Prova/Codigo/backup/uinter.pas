unit UInter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uConsultaGrupos, uConsultaSubGrupos,
  CadastroGrupos, uCadastroSubGrupos,
  uControllerGrupos;
type                                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

  { Inter }

  Inter = Class
    private
    protected
      aConsultaGrupos  : TConsultaGrupos;
      aConsultaSubGrupos : TConsultaSubGrupos;
      oCadastroGrupos  : TCadastroGrupos;
      oCadastroSubGrupos : TCadastroSubGrupos;
    public
      constructor CrieObj;
      destructor Destrua_se;

      procedure ConsultaGrupos( pObj : TObject; pCtrl : TObject );
      procedure ConsultaSubGrupos( pObj : TObject; pCtrl : TObject );


  end;

implementation

{ Inter }
{$REGION 'Constructor and Destructor'}
constructor Inter.CrieObj;
begin
  aConsultaGrupos  := TConsultaGrupos.Create(nil);
  aConsultaSubGrupos := TConsultaEstados.Create(nil);

  oCadastroGrupos  := TCadastroGrupos.Create(nil);
  oCadastroSubGrupos := TCadastroSubGrupos.Create(nil);


  aConsultaGrupos.SetFormCadastro( oCadastroGrupos );
  aConsultaSubGrupos.SetFormCadastro( oCadastroSubGrupos );          //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;


  oCadastroSubGrupos.SetConsultaGrupo( aConsultaGrupos );

end;

destructor Inter.Destrua_se;
begin
  aConsultaGrupos.FreeInstance;
  aConsultaSubGrupos.FreeInstance;

  oCadastroGrupos.FreeInstance;
  oCadastroSubGrupos.FreeInstance;

end;
{$ENDREGION}
{$REGION 'PECA_DADOS'}
 procedure Inter.ConsultaGrupos( pObj : TObject; pCtrl : TObject );
begin
  aConsultaGrupos.ConhecaObj( pObj, pCtrl );
  aConsultaGrupos.ShowModal;
end;

procedure Inter.ConsultaSubGrupos( pObj : TObject; pCtrl : TObject );
begin
  aConsultaSubGrupos.ConhecaObj( pObj, pCtrl );
  aConsultaSubGrupos.ShowModal;
end;

{$ENDREGION}                         //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end.


