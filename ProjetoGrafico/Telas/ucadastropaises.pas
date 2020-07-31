unit uCadastroPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro;

type

  { TCadastroPaises }

  TCadastroPaises = class(TCadastro)
    edt_Pais: TEdit;
    edt_DDI: TEdit;
    lbl_Pais: TLabel;
    lbl_DDI: TLabel;
  private

  public

  end;

var
  CadastroPaises: TCadastroPaises;

implementation

{$R *.lfm}

end.

