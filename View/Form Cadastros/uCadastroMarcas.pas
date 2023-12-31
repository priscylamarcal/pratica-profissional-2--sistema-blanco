unit uCadastroMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.Buttons, Vcl.StdCtrls,
  campoEdit, Vcl.ExtCtrls,
  uMarcas, uCtrlMarcas;

type
  Tform_cadastro_marcas = class(Tform_cadastro_pai)
    edt_marca: PriTEdit;
    lbl_marca: TLabel;
  private
    { Private declarations }
    aMarca: Marcas;
    aCtrlMarca: ctrlMarcas;
    NomeMarca: string;
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
  form_cadastro_marcas: Tform_cadastro_marcas;

implementation

{$R *.dfm}

{ Tform_cadastro_marcas }
procedure Tform_cadastro_marcas.bloqueiaEdt;
begin
  inherited;
  self.edt_marca.Enabled := False;
end;

procedure Tform_cadastro_marcas.carregaEdt;
begin
  inherited;
  if aMarca.getCodigo <> 0 then
    self.edt_codigo.Text := IntToStr(aMarca.getCodigo);
  self.edt_marca.Text := aMarca.getMarca;
  self.edt_data_cadastro.Text := DateToStr(aMarca.getDataCad);
  self.edt_data_ult_alt.Text := DateToStr(aMarca.getUltAlt);
  NomeMarca := aMarca.getMarca;
end;

procedure Tform_cadastro_marcas.conhecaObj(pCtrl, pObj: TObject);
begin
  inherited;
  aMarca := Marcas(pObj);
  aCtrlMarca := ctrlMarcas(pCtrl);
  self.limpaEdt;
  self.carregaEdt;
end;

procedure Tform_cadastro_marcas.desbloqueiaEdt;
begin
  inherited;
  self.edt_marca.Enabled := True;
end;

procedure Tform_cadastro_marcas.limpaEdt;
begin
  inherited;
  self.edt_marca.Clear;
  self.edt_data_cadastro.Clear;
  self.edt_data_ult_alt.Clear;
end;

procedure Tform_cadastro_marcas.sair;
begin
  inherited;
end;

procedure Tform_cadastro_marcas.salvar;
begin
  inherited;
  if validaFormulario then
  begin
    aMarca.setCodigo(StrToInt(self.edt_codigo.Text));
    aMarca.setMarca(self.edt_marca.Text);
//    aMarca.setDataCad(Date);
//    aMarca.setUltAlt(Date);
    aMarca.setCodUsu(StrToInt(self.edt_cod_usuario.Text));
    if self.btn_botao_salvar.Caption = 'Salvar' then
    begin
      if (aMarca.getCodigo = 0) then
      begin
        if (aCtrlMarca.VerificaExiste(aMarca.getMarca)) then
        // verifica se existe Marca quando � incluir
        begin
          ShowMessage('J� existe uma Marca ' + aMarca.getMarca +
            ' cadastrada!');
          edt_marca.SetFocus;
          Exit;
        end;
      end
      else
      begin
        if not(NomeMarca = aMarca.getMarca) then
          if (aCtrlMarca.VerificaExiste(aMarca.getMarca)) then
          // se mudou verifica se j� existe Marca com o nome
          begin
            aCtrlMarca.SetPosicao(aMarca.getCodigo);
            ShowMessage('J� existe uma Marca ' + aMarca.getMarca +
              ' cadastrada!');
            edt_marca.SetFocus;
            Exit;
          end;
      end;
      aCtrlMarca.salvar(aMarca.clone);
    end
    else if aCtrlMarca.ValidaExclusao(aMarca.clone) then
      aCtrlMarca.excluir(aMarca.clone)
    else
      ShowMessage
        ('A Marca est� vinculada a uma ou mais Roupas, n�o pode ser exclu�da!');

    self.sair;
  end;
end;

function Tform_cadastro_marcas.validaFormulario: Boolean;
begin
  Result := False;
  if self.edt_marca.Text = '' then
  begin
    MessageDlg('O campo Marca � obrigat�rio!', MtInformation, [MbOK], 0);
    edt_marca.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
