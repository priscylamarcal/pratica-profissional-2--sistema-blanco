unit uConsulta_Compras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, campoEdit, ComboBox, Vcl.ExtCtrls,
  uCadastro_Compras, uCompras, uCtrlCompras, uFilterSearch;

type
  Tform_consulta_compras = class(Tform_consulta_pai)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oCadastroCompra: Tform_cadastro_compras;
    aCompra: Compras;
    aCtrlCompra: ctrlCompras;
  public
    { Public declarations }
    procedure novo; override;
    procedure alterar; override;
    procedure excluir; override;
    procedure sair; override;
    procedure pesquisar; override;
    procedure conhecaObj(pCtrl: TObject; pObj: TObject); override;
    procedure setFrmCadastro(pObj: TObject); override;
    procedure tipoFiltro; override;
  end;

var
  form_consulta_compras: Tform_consulta_compras;

implementation

{$R *.dfm}

procedure Tform_consulta_compras.alterar;
var
  form: Tform_cadastro_compras;
begin
  inherited;
  oCadastroCompra.limpaEdt;
  aCtrlCompra.carregar( aCompra );
  oCadastroCompra.conhecaObj( aCtrlCompra, aCompra );
  oCadastroCompra.Caption:= 'Alteração de Compra';
  oCadastroCompra.bloqueiaEdt;
  oCadastroCompra.btn_botao_salvar.Enabled := false;
  oCadastroCompra.ShowModal;
  if form.salvou then
    Self.pesquisar;
  inherited;
end;

procedure Tform_consulta_compras.conhecaObj(pCtrl, pObj: TObject);
begin
  inherited;
  aCompra := Compras(pObj);
  aCtrlCompra := ctrlCompras(pCtrl);
  Self.DBGrid.DataSource := TDataSource(aCtrlCompra.getDS);
end;

procedure Tform_consulta_compras.excluir;
var
  mCaption: string;
  form: Tform_cadastro_compras;
begin
  inherited;
  aCtrlCompra.carregar(aCompra);
  mCaption := oCadastroCompra.btn_botao_salvar.Caption;
  oCadastroCompra.btn_botao_salvar.Caption := 'Excluir';
  oCadastroCompra.conhecaObj(aCtrlCompra, aCompra);
  oCadastroCompra.Caption := 'Exclusão de Compra';
  oCadastroCompra.bloqueiaEdt;
  // oCadastroCompra.bloqueaiaBtnPesquisa;
  oCadastroCompra.ShowModal;
  oCadastroCompra.btn_botao_salvar.Caption := mCaption;
  oCadastroCompra.desbloqueiaEdt;
  // oCadastroCompra.desbloqueiaBtnPesquisa;
  if form.salvou then
    Self.pesquisar;
  inherited;
end;

procedure Tform_consulta_compras.FormShow(Sender: TObject);
begin
  inherited;
  combobox_tipo_filtro.ItemIndex := 3;
  edt_pesquisa.Clear;
  Self.pesquisar;
  inherited;
end;

procedure Tform_consulta_compras.novo;
var
  form: Tform_cadastro_compras;
begin
  inherited;
  aCompra.limparDados;
  oCadastroCompra.conhecaObj(aCtrlCompra, aCompra);
  oCadastroCompra.limpaEdt;
  oCadastroCompra.desbloqueiaEdt;
  oCadastroCompra.Caption := 'Cadastro de Compra';
  oCadastroCompra.ShowModal;
  if form.salvou then
    Self.pesquisar;
  inherited;
end;

procedure Tform_consulta_compras.pesquisar;
var
  vFilter: TFilterSearch;
  pchave: string;
begin
  inherited;
  vFilter := TFilterSearch.Create;
  try
    Try
      case combobox_tipo_filtro.ItemIndex of
        0: // modelo
          begin

          end;
        1: // série
          begin

          end;
        2: // número
          begin

          end;
        3: // todos
          begin

          end;
      end;
    finally
      aCtrlCompra.pesquisar(vFilter, pchave);
      vFilter.Free;
    end;
  Except
    // on e: exception do
    // ShowMessage(e.ClassName +'asdfasdfasdf');
  End;
end;

procedure Tform_consulta_compras.sair;
begin
  inherited;
end;

procedure Tform_consulta_compras.setFrmCadastro(pObj: TObject);
var
  form: Tform_cadastro_compras;
begin
  inherited;
  oCadastroCompra := Tform_cadastro_compras(pObj);
  if form.salvou then
    Self.pesquisar;
  inherited;
end;

procedure Tform_consulta_compras.tipoFiltro;
begin
  inherited;
  case combobox_tipo_filtro.ItemIndex of
    0: // modelo
      begin
        edt_pesquisa.TextHint := 'DIGITE AQUI PARA CONSULTAR POR MODELO!';
        edt_pesquisa.NumbersOnly := false;
        edt_pesquisa.Enabled := true;
        edt_pesquisa.Clear;
      end;
    1: // série
      begin
        edt_pesquisa.TextHint := 'DIGITE AQUI PARA CONSULTAR POR SÉRIE!';
        edt_pesquisa.NumbersOnly := false;
        edt_pesquisa.Enabled := true;
        edt_pesquisa.Clear;
      end;
    2: // número
      begin
        edt_pesquisa.TextHint := 'DIGITE AQUI PARA CONSULTAR POR NÚMERO!';
        edt_pesquisa.NumbersOnly := false;
        edt_pesquisa.Enabled := true;
        edt_pesquisa.Clear;
      end;
    3: // todos
      begin
        edt_pesquisa.NumbersOnly := false;
        edt_pesquisa.Enabled := false;
        edt_pesquisa.Clear;
      end;
  end;
end;

end.
