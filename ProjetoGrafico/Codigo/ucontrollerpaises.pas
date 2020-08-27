unit uControllerPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uController, uDaoPaises;
type

  { CtrlPaises }

  CtrlPaises = Class (Controller)
    private
    protected
      aDaoPais : DaoPaises;
    public
      constructor CrieObj;
      destructor Destrua_se;
      procedure Salvar( pObj : TObject );             Override;
      procedure Excluir( pObj : TObject );            Override;
      function Pesquisar( pChave : string ) : string; Override;
      function Carregar( pPos : Integer ) : TObject;  Override;
      function TotalDados: Integer;                   Override;
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
  aDaoPais.Salvar( pObj );
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
  mPos, Code: Integer;
begin
  mPos := 1;
  mRes := aDaoPais.Pesquisar(pChave);
  Val( mRes, mPos, Code);
  if code <> 0 then
    Result := 'Erro'
  else
    begin
      mPos := StrToInt(mRes);
      if mPos = 0 then
        result := 'O nome já existe!'
        else
          result := '';
    end;
  //  Result:=inherited Pesquisar(pChave);
end;

function CtrlPaises.Carregar(pPos: Integer): TObject;
begin
  Result := aDaoPais.Carregar(pPos);
  //  Result:=inherited Carregar(pPos);
end;

function CtrlPaises.TotalDados: Integer;
begin
//  Result:=inherited TotalDados;
  Result := aDaoPais.TotalDados;
end;

end.

