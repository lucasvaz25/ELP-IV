unit uControllerGrupos;

{$mode objfpc}{$H+}

interface                                                 //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

uses
  Classes, SysUtils, uController, uGrupo, uDaoGrupos;
type

  { CtrlGrupos }

  CtrlGrupos = Class(Controller)
    protected
       aDaoGrupo: DaoGrupos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Duplicado(pCodigo: integer; pGrupo: string): string;
    function Carregar(pPos: integer): TObject; override;
    function TotalDados: integer; override;
  end;

implementation

{ CtrlGrupos }

constructor CtrlGrupos.CrieObj;
begin
  aDaoGrupo := DaoGrupos.CrieObj;
end;

destructor CtrlGrupos.Destrua_se;
begin
    aDaoGrupo.Destrua_se;
end;

procedure CtrlGrupos.Salvar(pObj: TObject);
begin
  aDaoGrupo.Salvar(pObj);
end;                                                                  //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

procedure CtrlGrupos.Excluir(pObj: TObject);
begin
  aDaoGrupo.Excluir(pObj);
end;

function CtrlGrupos.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: integer;
begin
  mPos := 1;
  mRes := aDaoGrupo.Pesquisar(pChave);
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
end;

function CtrlGrupos.Duplicado(pCodigo: integer; pGrupo: string): string;
var
  mRes: string;
  mPos, Code: integer;
  mGrupo: Grupos;
begin
  mPos := 1;
  if pCodigo = 0 then
  begin
    mRes := aDaoGrupo.Pesquisar(pGrupo, False); //insert
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
    mRes := aDaoGrupo.Pesquisar(pGrupo, True); //update or delete
    mGrupo := Grupos(aDaoGrupo.Carregar(StrToInt(mRes)));
    if pCodigo <> mGrupo.GetCodigo then
      Result := 'O nome já existe com o codigo = ' + IntToStr(mGrupo.GetCodigo)
    else
      Result := '';
  end;
end;

function CtrlGrupos.Carregar(pPos: integer): TObject;
begin
  Result := aDaoGrupo.Carregar(pPos);
end;

function CtrlGrupos.TotalDados: integer;                     //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
begin
  Result := aDaoGrupo.TotalDados;
end;

end.

