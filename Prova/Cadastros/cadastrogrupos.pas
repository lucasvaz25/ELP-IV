unit CadastroGrupos;

{$mode objfpc}{$H+}

interface
                                               //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, UCadastro, UGrupo, UControllerGrupos;

type

  { TCadastroGrupos }

  TCadastroGrupos = class(TCadastro)
    Edt_Grupo: TEdit;
    lbl_Obs: TLabel;
    lbl_Grupo: TLabel;
    Edt_Obs: TMemo;
  private
    oGrupo: Grupos;
    aCtrlGrupo: CtrlGrupos;
  public
    procedure Salvar;         Override;
    procedure Sair;           Override;
    procedure LimparEdt;      Override;
    procedure CarregaEdt;     Override;
    procedure BloqueiEdt;     Override;
    procedure DesbloqueiaEdt; Override;
    procedure ConhecaObj(pObj : TObject; pCtrl : TObject ); Override;

  end;



implementation

{$R *.lfm}

{ TCadastroGrupos }

procedure TCadastroGrupos.Salvar;
begin
  if Edt_Grupo.Text = EmptyStr then
  begin
    Showmessage('Campo Grupo é obrigatório!!');
    Edt_Grupo.SetFocus;
  end
  else if Edt_Obs.Lines.Text = EmptyStr then
  begin
    Showmessage('Campo Observação é obrigatório!!');             //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
    Edt_Obs.SetFocus;
  end
  else
  begin
    oGrupo.SetCodigo( StrToInt(Edt_Codigo.Text) );
    oGrupo.SetGrupo(Edt_Grupo.Text);
    oGrupo.SetObs(Edt_Obs.Lines.Text);
    oGrupo.SetDataCad(DateToStr(Now));
    aCtrlGrupo.Salvar(oGrupo.Clone);
    inherited Salvar;
  end;

end;

procedure TCadastroGrupos.Sair;
begin
  inherited Sair;
end;

procedure TCadastroGrupos.LimparEdt;
begin
  inherited LimparEdt;
  Edt_Grupo.Clear;
  Edt_Obs.Clear;
end;

procedure TCadastroGrupos.CarregaEdt;
begin
  inherited CarregaEdt;
  Edt_Codigo.Text    := IntToStr(oGrupo.GetCodigo);
  Edt_Grupo.Text     := oGrupo.GetGrupo;
  Edt_Obs.Lines.Text := oGrupo.GetObs;
  Edt_DataCad.Text   := oGrupo.GetDataCad;
end;

procedure TCadastroGrupos.BloqueiEdt;
begin
  inherited BloqueiEdt;
  Edt_Grupo.Enabled := False;
  Edt_Obs.Enabled   := False;
end;

procedure TCadastroGrupos.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  Edt_Grupo.Enabled := True;
  Edt_Obs.Enabled   := True;
end;

procedure TCadastroGrupos.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  inherited ConhecaObj(pObj, pCtrl);
  oGrupo     := Grupos(pObj);
  aCtrlGrupo := CtrlGrupos(pCtrl);                                //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
end;

end.

