unit uColecaoCidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uColecao, uCidades;
type
  ColecaoCidades = Class ( Colecao )
    private
    protected
    public
      function Pesquisa( pChave : String; pQuero : Boolean ): Integer;
      procedure SalvaArq;
      procedure LerArq;
  end;

implementation

end.

