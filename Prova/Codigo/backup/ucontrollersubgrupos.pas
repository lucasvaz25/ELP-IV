unit uControllerSubGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uController, uDaoSubGrupos, uSubGrupo, uControllergrupos;
type

  { CtrlSubGrupo }

  CtrlSubGrupo = Class(Controller)
  protected
    aDaoSubGrupo: DaoSubGrupos;                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
    aCtrlGrupos: CtrlGrupos;
  public
    constructor CrieObj;
    destructor Destrua_se;
    procedure Salvar(pObj: TObject); override;
    procedure Excluir(pObj: TObject); override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pPos: integer): TObject; override;
    function Duplicado(pCodigo: integer; pSubGrupo: string): string;
    function TotalDados: integer; override;
    function getCtrlGrupos: TObject;
    procedure setCtrlGrupos(pCtrlGrupos: TObject);
  end;

implementation

{ CtrlSubGrupo }

constructor CtrlSubGrupo.CrieObj;
begin
  aDaoSubGrupo := DaoSubGrupos.CrieObj;
end;

destructor CtrlSubGrupo.Destrua_se;
begin                                                             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
   aDaoSubGrupo.Destrua_se;
end;

procedure CtrlSubGrupo.Salvar(pObj: TObject);
begin
  aDaoSubGrupo.Salvar(pObj);
end;

procedure CtrlSubGrupo.Excluir(pObj: TObject);
begin
  aDaoSubGrupo.Excluir(pObj);
end;

function CtrlSubGrupo.Pesquisar(pChave: string): string;
var
  mRes: string;
  mPos, Code: integer;
begin
  mPos := 1;
  mRes := aDaoSubGrupo.Pesquisar(pChave);
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

function CtrlSubGrupo.Carregar(pPos: integer): TObject;
begin
  aDaoSubGrupo.Carregar(pPos);
end;

function CtrlSubGrupo.Duplicado(pCodigo: integer; pSubGrupo: string): string;
var
  mRes: string;
  mPos, Code: integer;
  mSubGrupo: SubGrupos;
begin
  mPos := 1;
  if pCodigo = 0 then
  begin
    mRes := aDaoSubGrupo.Pesquisar(pSubGrupo, False); //insert
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
    mRes := aDaoSubGrupo.Pesquisar(pSubGrupo, True); //update or delete
    mSubGrupo := SubGrupo(aDaoSubGrupo.Carregar(StrToInt(mRes)));
    if pCodigo <> mSubGrupo.GetCodigo then
      Result := 'O nome já existe com o codigo = ' + IntToStr(mSubGrupo.GetCodigo)
    else
      Result := '';                                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  end;

end;

function CtrlSubGrupo.TotalDados: integer;
begin
  Result := aDaoSubGrupo.TotalDados;
end;

function CtrlSubGrupo.getCtrlGrupos: TObject;
begin
   Result := aCtrlGrupos;
end;

procedure CtrlSubGrupo.setCtrlGrupos(pCtrlGrupos: TObject);
begin
    aCtrlGrupos := CtrlGrupos(pCtrlGrupos);
end;

end.

