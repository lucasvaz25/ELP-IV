unit uControllerEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uDaoEstados, uController,
  uControllerPaises;

type

  { CtrlEstados }

  CtrlEstados = class(Controller)
  private

  protected
    aDaoEstado: DaoEstados;
    aCtrlPaises: CtrlPaises;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
    function getCtrlPaises: TObject;
  end;

implementation

{ CtrlEstados }

constructor CtrlEstados.CrieObj;
begin
  aCtrlPaises := CtrlPaises.CrieObj;
  aDaoEstado := DaoEstados.CrieObj;
end;

destructor CtrlEstados.Destrua_se;
begin
  aCtrlPaises.Destrua_se;
  aDaoEstado.Destrua_se;
end;

procedure CtrlEstados.Salvar(pObj: TObject);
begin
  aDaoEstado.Salvar(pObj);
  //  inherited Salvar(pObj);
end;

procedure CtrlEstados.Excluir(pObj: TObject);
begin
  aDaoEstado.Excluir(pObj);
  //  inherited Excluir(pObj);
end;

function CtrlEstados.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: integer;
begin
  mPos := 1;
  mRes := aDaoEstado.Pesquisar(pChave);
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

function CtrlEstados.Carregar(pPos: integer): TObject;
begin
  aDaoEstado.Carregar(pPos);
//  Result := inherited Carregar(pPos);
end;

function CtrlEstados.TotalDados: integer;
begin
  Result := inherited TotalDados;
end;

function CtrlEstados.getCtrlPaises: TObject;
begin
  Result := aCtrlPaises;
end;

end.
