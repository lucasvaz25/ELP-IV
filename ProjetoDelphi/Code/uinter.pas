unit uInter;



interface

uses
  Classes,
  SysUtils,
  UCadastroPaises,
  UCadastroEstados,
  UCadastroCidades,
  UConsultaPaises,
  UConsultaEstados,
  UConsultaCidades;

type

  { Inter }

  Inter = Class
  private
  protected
    AConsultaPaises: TConsultaPaises;
    AConsultaEstados: TConsultaEstados;
    AConsultaCidades: TConsultaCidades;
    OCadastroPaises: TCadastroPaises;
    OCadastroEstados: TCadastroEstados;
    OCadastroCidades: TCadastroCidades;
  public
    constructor CrieObj;
    destructor Destrua_se;

    procedure ConsultaPaises( PObj: TObject; PCtrl: TObject );
    procedure ConsultaEstados( PObj: TObject; PCtrl: TObject );
    procedure ConsultaCidades( PObj: TObject; PCtrl: TObject );

  end;

implementation

{ Inter }
{$REGION 'Constructor and Destructor'}


constructor Inter.CrieObj;
begin
  AConsultaPaises  := TConsultaPaises.Create( nil );
  AConsultaEstados := TConsultaEstados.Create( nil );
  AConsultaCidades := TConsultaCidades.Create( nil );
  OCadastroPaises  := TCadastroPaises.Create( nil );
  OCadastroEstados := TCadastroEstados.Create( nil );
  OCadastroCidades := TCadastroCidades.Create( nil );

  AConsultaPaises.SetFormCadastro( OCadastroPaises );
  AConsultaEstados.SetFormCadastro( OCadastroEstados );
  AConsultaCidades.SetFormCadastro( OCadastroCidades );

  OCadastroEstados.SetConsultaPaises( AConsultaPaises );
  OCadastroCidades.SetConsultaEstados( AConsultaEstados );
end;

destructor Inter.Destrua_se;
begin
  AConsultaPaises.FreeInstance;
  AConsultaEstados.FreeInstance;
  AConsultaCidades.FreeInstance;
  OCadastroPaises.FreeInstance;
  OCadastroEstados.FreeInstance;
  OCadastroCidades.FreeInstance;
end;
{$ENDREGION}
{$REGION 'PECA_DADOS'}


procedure Inter.ConsultaPaises( PObj: TObject; PCtrl: TObject );
begin
  AConsultaPaises.ConhecaObj( PObj, PCtrl );
  AConsultaPaises.ShowModal;
end;

procedure Inter.ConsultaEstados( PObj: TObject; PCtrl: TObject );
begin
  AConsultaEstados.ConhecaObj( PObj, PCtrl );
  AConsultaEstados.ShowModal;
end;

procedure Inter.ConsultaCidades( PObj: TObject; PCtrl: TObject );
begin
  AConsultaCidades.ConhecaObj( PObj, PCtrl );
  AConsultaCidades.ShowModal;
end;

{$ENDREGION}

end.
