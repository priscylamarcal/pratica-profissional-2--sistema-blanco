unit uCadastroCores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.Buttons, Vcl.StdCtrls,
  campoEdit, Vcl.ExtCtrls,
  uCores,
  uCtrlCores;

type
  Tform_cadastro_cores = class(Tform_cadastro_pai)
    lbl_cor: TLabel;
    edt_cor: PriTEdit;
  private
    { Private declarations }
    aCor: Cores;
    aCtrlCor: ctrlCores;
    NomeCor: string;
  public
    { Public declarations }
    procedure conhecaObj(pCtrl, pObj: TObject); override;
    procedure salvar; override;
    procedure sair; override;
    procedure limpaEdt; override;
    procedure carregaEdt; override;
    procedure bloqueiaEdt; override;
    procedure desbloqueiaEdt; override;
    function validaFormulario: Boolean; override;
  end;

var
  form_cadastro_cores: Tform_cadastro_cores;

implementation

{$R *.dfm}

{ Tform_cadastro_cores }
procedure Tform_cadastro_cores.bloqueiaEdt;
begin
  inherited;
  self.edt_cor.Enabled := False;
end;

procedure Tform_cadastro_cores.carregaEdt;
begin
  inherited;
  if aCor.getCodigo <> 0 then
    self.edt_codigo.Text := IntToStr(aCor.getCodigo);
  self.edt_cor.Text := aCor.getCor;
  self.edt_data_cadastro.Text := DateToStr(aCor.getDataCad);
  self.edt_data_ult_alt.Text := DateToStr(aCor.getUltAlt);
  NomeCor := aCor.getCor;
end;

procedure Tform_cadastro_cores.conhecaObj(pCtrl, pObj: TObject);
begin
  inherited;
  aCor := Cores(pObj);
  aCtrlCor := ctrlCores(pCtrl);
  self.limpaEdt;
  self.carregaEdt;
end;

procedure Tform_cadastro_cores.desbloqueiaEdt;
begin
  inherited;
  self.edt_cor.Enabled := True;
end;

procedure Tform_cadastro_cores.limpaEdt;
begin
  inherited;
  self.edt_cor.Clear;
end;

procedure Tform_cadastro_cores.sair;
begin
  inherited;
end;

procedure Tform_cadastro_cores.salvar;
begin
  inherited;
  if validaFormulario then
  begin
    aCor.setCodigo(StrToInt(self.edt_codigo.Text));
    aCor.setCor(self.edt_cor.Text);
//    aCor.setDataCad(Date);
    aCor.setCodUsu(StrToInt(self.edt_cod_usuario.Text));
    if self.btn_botao_salvar.Caption = 'Salvar' then
    begin
      if (aCor.getCodigo = 0) then
      begin
        if (aCtrlCor.VerificaExiste(aCor.getCor)) then
        // verifica se existe Cor quando � incluir
        begin
          ShowMessage('J� existe uma Cor ' + aCor.getCor + ' cadastrada!');
          edt_cor.SetFocus;
          Exit;
        end;
      end
      else
      begin
        if not(NomeCor = aCor.getCor) then
          if (aCtrlCor.VerificaExiste(aCor.getCor)) then
          // se mudou verifica se j� existe Cor com o nome
          begin
            aCtrlCor.SetPosicao(aCor.getCodigo);
            ShowMessage('J� existe uma Cor ' + aCor.getCor +
              ' cadastrada!');
            edt_cor.SetFocus;
            Exit;
          end;
      end;
      aCtrlCor.salvar(aCor.clone);
    end
    else if aCtrlCor.ValidaExclusao(aCor.clone) then
      aCtrlCor.excluir(aCor.clone)
    else
      ShowMessage
        ('A Cor est� vinculada a uma ou mais roupas, n�o pode ser exclu�da!');

    self.sair;
  end;
end;

function Tform_cadastro_cores.validaFormulario: Boolean;
begin
  Result := False;
  if self.edt_cor.Text = '' then
  begin
    MessageDlg('O campo Cor � obrigat�rio!', MtInformation, [MbOK], 0);
    edt_cor.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
