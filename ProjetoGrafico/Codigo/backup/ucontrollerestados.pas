unit uControllerEstados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uDaoEstados, uController,
  uEstados,
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
    function Duplicado(pCodigo: integer; pEstado: string): string;
    function TotalDados: integer; override;
    function getCtrlPaises: TObject;
    procedure setCtrlPaises(pCtrlPaises: TObject);
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

function CtrlEstados.Duplicado(pCodigo: integer; pEstado: string): string;
var
  mRes: string;
  mPos, Code: integer;
  mEstado: Estados;
begin
  mPos := 1;
  if pCodigo = 0 then
  begin
    mRes := aDaoEstado.Pesquisar(pEstado, False); //insert
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
  end
  else
  begin
    mRes := aDaoEstado.Pesquisar(pEstado, True); //update or delete
    mEstado := Estados(aDaoEstado.Carregar(StrToInt(mRes)));
    if pCodigo <> mEstado.GetCodigo then
      Result := 'O nome já existe com o codigo = ' + IntToStr(mEstado.GetCodigo)
    else
      Result := '';
  end;
end;

function CtrlEstados.TotalDados: integer;
begin
  Result := aDaoEstado.TotalDados;
  //  Result := inherited TotalDados;
end;

function CtrlEstados.getCtrlPaises: TObject;
begin
  Result := aCtrlPaises;
end;

procedure CtrlEstados.setCtrlPaises(pCtrlPaises: TObject);
begin
  aCtrlPaises := CtrlPaises(pCtrlPaises);
end;

end.
