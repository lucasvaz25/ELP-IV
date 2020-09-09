unit uControllerPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uController, uDaoPaises, uPaises;

type

  { CtrlPaises }

  CtrlPaises = class(Controller)
  private
  protected
    aDaoPais: DaoPaises;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Duplicado(pCodigo: integer; pPais: string): string;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
  end;

implementation

{ CtrlPaises }

constructor CtrlPaises.CrieObj;
begin
  aDaoPais := DaoPaises.CrieObj;
end;

destructor CtrlPaises.Destrua_se;
begin
  aDaoPais.Destrua_se;
end;

procedure CtrlPaises.Salvar(pObj: TObject);
begin
  aDaoPais.Salvar(pObj);
  //  inherited Salvar(pObj);
end;

procedure CtrlPaises.Excluir(pObj: TObject);
begin
  aDaoPais.Excluir(pObj);
  //  inherited Excluir(pObj);
end;

function CtrlPaises.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: integer;
begin
  mPos := 1;
  mRes := aDaoPais.Pesquisar(pChave);
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
  //  Result:=inherited Pesquisar(pChave);
end;

function CtrlPaises.Duplicado(pCodigo: integer; pPais: string): string;
var
  mRes: string;
  mPos, Code: integer;
  mPais: Paises;
begin
  mPos := 1;
  if pCodigo = 0 then
  begin
    mRes := aDaoPais.Pesquisar(pPais, False); //insert
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
    mRes := aDaoPais.Pesquisar(pPais, True); //update or delete
    mPais := Paises(aDaoPais.Carregar(StrToInt(mRes)));
    if pCodigo = mPais.GetCodigo then
      Result := 'O nome já existe com o codigo = ' + IntToStr(mPais.GetCodigo)
    else
      Result := '';
  end;
end;

function CtrlPaises.Carregar(pPos: integer): TObject;
begin
  Result := aDaoPais.Carregar(pPos);
  //  Result:=inherited Carregar(pPos);
end;

function CtrlPaises.TotalDados: integer;
begin
  //  Result:=inherited TotalDados;
  Result := aDaoPais.TotalDados;
end;

end.
