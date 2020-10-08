unit uCadastroSubGrupos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, UCadastro,
  uConsultaGrupos,
  USubGrupo,
  uControllerSubGrupos,
  UGrupo;                                                      //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;

type

  { TCadastroSubGrupos }

  TCadastroSubGrupos = class(TCadastro)
    btn_pesquisar: TButton;
    edt_Grupo: TEdit;
    Edt_SubGrupo: TEdit;
    Label1: TLabel;
    lbl_SubGrupo: TLabel;
    edt_Obs: TMemo;
    procedure btn_pesquisarClick(Sender: TObject);
  private
    oSubGrupo: SubGrupos;
    aConsultaGrupo: TConsultaGrupos;
    aCtrlSubGrupo: CtrlSubGrupo;
  public
    procedure Salvar; override;
    procedure Sair; override;
    procedure LimparEdt; override;
    procedure CarregaEdt; override;
    procedure BloqueiEdt; override;
    procedure DesbloqueiaEdt; override;
    procedure SetConsultaGrupo(pConsultaGrupos: TObject);
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
  end;

var
  CadastroSubGrupos: TCadastroSubGrupos;

implementation

{$R *.lfm}
                                                                    //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
{ TCadastroSubGrupos }


procedure TCadastroSubGrupos.btn_pesquisarClick(Sender: TObject);
var
  mAux: string;
begin
  mAux := aConsultaGrupo.btn_Sair.Caption;
  aConsultaGrupo.btn_Sair.Caption := 'Selecionar';
  aConsultaGrupo.ConhecaObj(oSubgrupo.GetumGrupo, aCtrlSubGrupo.getCtrlGrupos);
  aConsultaGrupo.ShowModal;
  oSubGrupo.SetUmGrupo(Grupos(aConsultaGrupo.RetornaObj));
  aConsultaGrupo.btn_Sair.Caption := mAux;
  edt_Grupo.Text := oSubGrupo.GetumGrupo.GetGrupo;
end;

procedure TCadastroSubGrupos.Salvar;
begin
  if Edt_SubGrupo.Text = EmptyStr then
  begin
    Showmessage('Campo Sub-Grupo é obrigatório!!');
    Edt_SubGRupo.SetFocus;;
  end
  else
  if Edt_Obs.Lines.Text = EmptyStr then
  begin
    ShowMessage('Campo Observação é obrigatório!!');
    Edt_Obs.SetFocus;
  end
  else
  begin
    oSubGrupo.SetCodigo(StrToInt(Edt_Codigo.Text));
    oSubGrupo.SetSubGrupo(Edt_SubGrupo.Text);
    oSubGrupo.SetObs(Edt_Obs.Lines.Text);
    oSubGrupo.GetumGrupo.SetGrupo(Edt_Grupo.Text);
    oSubGrupo.SetDataCad(DateToStr(Now));
    aCtrlSubGrupo.Salvar(oSubGrupo.Clone);
    inherited Salvar;
  end;

end;

procedure TCadastroSubGrupos.Sair;
begin
  inherited Sair;
end;

procedure TCadastroSubGrupos.LimparEdt;
begin
  inherited LimparEdt;
  edt_SubGrupo.Clear;
  edt_Obs.Clear;
  Edt_Grupo.Clear;
end;

procedure TCadastroSubGrupos.CarregaEdt;
begin
  inherited CarregaEdt;
  edt_Codigo.Text := IntToStr(oSubGrupo.GetCodigo);
  edt_SubGrupo.Text := oSubGrupo.GetSubGrupo;
  edt_Obs.Lines.Text:= oSubGrupo.GetObs;
  edt_Grupo.Text := OSubGrupo.GetumGrupo.GetGrupo;
  edt_datacad.Text:= oSubGrupo.GetDataCad;
end;

procedure TCadastroSubGrupos.BloqueiEdt;
begin
  inherited BloqueiEdt;
  edt_SubGrupo.enabled := False;
  edt_Obs.enabled := False;
  Edt_Grupo.enabled := False;
end;

procedure TCadastroSubGrupos.DesbloqueiaEdt;
begin
  inherited DesbloqueiaEdt;
  edt_SubGrupo.enabled := True;
  edt_Obs.enabled := True;
  Edt_Grupo.enabled := True;
end;

procedure TCadastroSubGrupos.SetConsultaGrupo(pConsultaGrupos: TObject);
begin
  aConsultaGrupo := TConsultaGrupos(pConsultaGrupos);
end;

procedure TCadastroSubGrupos.ConhecaObj(pObj: TObject; pCtrl: TObject);
begin
  inherited ConhecaObj(pObj, pCtrl);
  oSubGrupo := SubGrupos(pObj);                                     //ELP4_2020_09_24_LUCAS_JOSE_VAZ_PROVA;
  aCtrlSubGrupo := CtrlSubGrupo(pCtrl);
end;

end.

