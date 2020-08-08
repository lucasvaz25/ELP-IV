unit uCadastroPaises;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uCadastro, uPaises;

type

  { TCadastroPaises }

  TCadastroPaises = class(TCadastro)
    Edt_Sigla: TEdit;
    edt_Pais: TEdit;
    edt_DDI: TEdit;
    lbl_Sigla: TLabel;
    lbl_Pais: TLabel;
    lbl_DDI: TLabel;
  private

  protected
    oPais : Paises;
  public
    procedure Salvar;         Override;
    procedure Sair;           Override;
    procedure LimparEdt;      Override;
    procedure CarregaEdt;     Override;
    procedure BloqueiEdt;     Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj(pObj : TObject);
  end;

var
  CadastroPaises: TCadastroPaises;

implementation

{$R *.lfm}

{ TCadastroPaises }

procedure TCadastroPaises.Salvar;
begin
  inherited Salvar;
  if Edt_Pais.Text = EmptyStr then
  begin
    ShowMessage('Campo País é obrigatório!');
    Self.Edt_Pais.SetFocus;
  end
  else if Self.Edt_DDI.Text = EmptyStr then
  begin
    ShowMessage('Campo DDI obrigatório!');
    Self.Edt_DDI.SetFocus;
  end
  else if Self.edt_Sigla.Text = EmptyStr then
  begin
    ShowMessage('Campo Sigla obrigatório!');
    Self.Edt_Sigla.SetFocus;
  end
  else
  begin
    oPais.SetCodigo( StrToInt( Edt_Codigo.Text ));
    oPais.SetPais( Edt_Pais.Text );
    oPais.SetDDI( Edt_DDI.Text);
    oPais.SetSigla( Edt_Sigla.Text );
    oPais.SetDataCad( Edt_DataCad.Text );
    inherited Salvar;
  end;
end;

procedure TCadastroPaises.Sair;
begin
  inherited Sair;
end;

procedure TCadastroPaises.LimparEdt;
begin
  inherited LimparEdt;
  Self.Edt_Pais.Clear;
  Self.Edt_DDI.Clear;
  Self.Edt_Sigla.Clear;
  Self.Edt_DataCad.Clear;
end;

procedure TCadastroPaises.CarregaEdt;
begin
  inherited CarregaEdt;
  self.Edt_Codigo.Text  := IntToStr( oPais.GetCodigo );
  self.Edt_Pais.text    := oPais.getPais;
  Self.edt_DDI.Text     := oPais.GetDDi;
  Self.Edt_Sigla.Text   := oPais.GetSigla;
  Self.Edt_DataCad.Text := oPais.GetDataCad;
end;

procedure TCadastroPaises.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Self.Edt_Pais.Enabled  := False;
  Self.Edt_DDI.Enabled   := False;
  Self.Edt_Sigla.Enabled := False;
end;

procedure TCadastroPaises.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Self.Edt_Pais.Enabled  := True;
  Self.Edt_DDI.Enabled   := True;
  Self.Edt_Sigla.Enabled := True;
end;

procedure TCadastroPaises.ConhecaObj(pObj: TObject);
begin
  oPais := Paises( pObj );
end;

end.

