unit uInter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uConsultaPaises, uConsultaEstados, uConsultaCidades,
  uCadastroPaises, uCadastroEstados, uCadastroCidades,
  uControllerPaises;
type

  { Inter }

  Inter = Class
    private
    protected
      aConsultaPaises  : TConsultaPaises;
      aConsultaEstados : TConsultaEstados;
      aConsultaCidades : TConsultaCidades;
      oCadastroPaises  : TCadastroPaises;
      oCadastroEstados : TCadastroEstados;
      oCadastroCidades : TCadastroCidades;
    public
      constructor CrieObj;
      destructor Destrua_se;

      procedure ConsultaPaises( pObj : TObject; pCtrl : TObject );
      procedure ConsultaEstados( pObj : TObject; pCtrl : TObject );
      procedure ConsultaCidades( pObj : TObject; pCtrl : TObject );

  end;

implementation

{ Inter }
{$REGION 'Constructor and Destructor'}
constructor Inter.CrieObj;
begin
  aConsultaPaises  := TConsultaPaises.Create(nil);
  aConsultaEstados := TConsultaEstados.Create(nil);
  aConsultaCidades := TConsultaCidades.Create(nil);
  oCadastroPaises  := TCadastroPaises.Create(nil);
  oCadastroEstados := TCadastroEstados.Create(nil);
  oCadastroCidades := TCadastroCidades.Create(nil);

  aConsultaPaises.SetFormCadastro( oCadastroPaises );
  aConsultaEstados.SetFormCadastro( oCadastroEstados );
  aConsultaCidades.SetFormCadastro( oCadastroCidades );

  oCadastroEstados.SetConsultaPaises( aConsultaPaises );
  oCadastroCidades.SetConsultaEstados( aConsultaEstados );
end;

destructor Inter.Destrua_se;
begin
  aConsultaPaises.FreeInstance;
  aConsultaEstados.FreeInstance;
  aConsultaCidades.FreeInstance;
  oCadastroPaises.FreeInstance;
  oCadastroEstados.FreeInstance;
  oCadastroCidades.FreeInstance;
end;
{$ENDREGION}
{$REGION 'PECA_DADOS'}
 procedure Inter.ConsultaPaises( pObj : TObject; pCtrl : TObject );
begin
  aConsultaPaises.ConhecaObj( pObj, pCtrl );
  aConsultaPaises.ShowModal;
end;

procedure Inter.ConsultaEstados( pObj : TObject; pCtrl : TObject );
begin
  aConsultaEstados.ConhecaObj( pObj, pCtrl );
  aConsultaEstados.ShowModal;
end;

procedure Inter.ConsultaCidades( pObj : TObject; pCtrl : TObject );
begin
  aConsultaCidades.ConhecaObj( pObj, pCtrl );
  aConsultaCidades.ShowModal;
end;

{$ENDREGION}
end.

