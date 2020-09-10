unit uControllerCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uController, uControllerEstados, uDaoCidades,
  uCidades,
  uEstados;

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
    function Duplicado(pCodigo: integer; pCidade: string): string;
    function TotalDados: integer; override;
    function getCtrlEstados: TObject;
    procedure setCtrlEstados(pCtrlEstados: TObject);
  end;

implementation

{ CtrlCidades }

constructor CtrlCidades.CrieObj;
begin
  aDaoCidade := DaoCidades.CrieObj;
end;

destructor CtrlCidades.Destrua_se;
begin
  aDaoCidade.Destrua_se;
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

function CtrlCidades.Duplicado(pCodigo: integer; pCidade: string): string;
var
  mRes: string;
  mPos, Code: integer;
  mCidade: Cidades;
begin
  mPos := 1;
  if pCodigo = 0 then
  begin
    mRes := aDaoCidade.Pesquisar(pCidade, False); //insert
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
    mRes := aDaoCidade.Pesquisar(pCidade, True); //update or delete
    mCidade := Cidades(aDaoCidade.Carregar(StrToInt(mRes)));
    if pCodigo <> mCidade.GetCodigo then
      Result := 'O nome já existe com o codigo = ' + IntToStr(mCidade.GetCodigo)
    else
      Result := '';
  end;
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

procedure CtrlCidades.setCtrlEstados(pCtrlEstados: TObject);
begin
  aCtrlEstado := CtrlEstados(pCtrlEstados);
end;

end.
