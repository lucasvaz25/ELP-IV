unit uControllerCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uController, uControllerEstados, uDaoCidades;

type

  { CtrlCidades }

  CtrlCidades = class(Controller)
  private

  protected
    aDaoCidade: DaoCidades;
    aCtrlEstado: CtrlEstados;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
    function getCtrlEstados: TObject;
  end;

implementation

{ CtrlCidades }

constructor CtrlCidades.CrieObj;
begin
  aDaoCidade := DaoCidades.CrieObj;
  aCtrlEstado := CtrlEstados.CrieObj;
end;

destructor CtrlCidades.Destrua_se;
begin
  aDaoCidade.Destrua_se;
  aCtrlEstado.Destrua_se;
end;

procedure CtrlCidades.Salvar(pObj: TObject);
begin
  aDaoCidade.Salvar(pObj);
  //  inherited Salvar(pObj);
end;

procedure CtrlCidades.Excluir(pObj: TObject);
begin
  aDaoCidade.Excluir(pObj);
  //  inherited Excluir(pObj);
end;

function CtrlCidades.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: integer;
begin
  mPos := 1;
  mRes := aDaoCidade.Pesquisar(pChave);
  Val(mRes, mPos, Code);
  if code <> 0 then
    Result := 'Erro'
  else
  begin
    mPos := StrToInt(mRes);
    if mPos = 0 then
      Result := 'O nome já existe!'
    else
      Result := '';
  end;
  //  Result := inherited Pesquisar(pChave);
end;

function CtrlCidades.Carregar(pPos: integer): TObject;
begin
  Result := aDaoCidade.Carregar(pPos);
//  Result := inherited Carregar(pPos);
end;

function CtrlCidades.TotalDados: integer;
begin
  Result := aDaoCidade.TotalDados;
  //  Result := inherited TotalDados;
end;

function CtrlCidades.getCtrlEstados: TObject;
begin
  Result := aCtrlEstado;
end;

end.
