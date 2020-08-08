unit uInter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uConsultaPaises, uConsultaEstados, uConsultaCidades,
  uCadastroPaises, uCadastroEstados, uCadastroCidades;
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

      procedure ConsultaPaises( pObj : TObject );
      procedure ConsultaEstados( pObj : TObject );
      procedure ConsultaCidades( pObj : TObject );

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
 procedure Inter.ConsultaPaises( pObj : TObject );
begin
  aConsultaPaises.ConhecaObj( pObj );
  aConsultaPaises.ShowModal;
end;

procedure Inter.ConsultaEstados( pObj : TObject );
begin
  aConsultaEstados.ShowModal;
end;

procedure Inter.ConsultaCidades( pObj : TObject );
begin
  aConsultaCidades.ShowModal;
end;

{$ENDREGION}
end.

