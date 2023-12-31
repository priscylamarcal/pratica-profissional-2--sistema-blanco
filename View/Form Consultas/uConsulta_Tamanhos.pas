unit uConsulta_Tamanhos;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ComboBox, campoEdit, Vcl.Buttons, Vcl.ExtCtrls,
  uCadastroTamanhos, uConsulta_Marcas, uTamanhos, uCtrlTamanhos, uFilterSearch;
type
  Tform_consulta_tamanhos = class(Tform_consulta_pai)
    procedure spb_botao_pesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    oCadastroTamanhos : Tform_cadastro_tamanhos;
    oTamanho : Tamanhos;
    aCtrlTamanhos : ctrlTamanhos;
  public
    { Public declarations }
    procedure novo;                                           override;
    procedure alterar;                                        override;
    procedure excluir;                                        override;
    procedure sair;                                           override;
    procedure pesquisar;                                      override;
    procedure conhecaObj ( pCtrl : TObject; pObj : TObject ); override;
    procedure setFrmCadastro ( pObj : TObject );                  override;
    procedure tipoFiltro;                                     override;
  end;
var
  form_consulta_tamanhos: Tform_consulta_tamanhos;
implementation
{$R *.dfm}
{ Tform_consulta_tamanhos }
procedure Tform_consulta_tamanhos.alterar;
begin
  inherited;
  aCtrlTamanhos.carregar( oTamanho );
  oCadastroTamanhos.conhecaObj( aCtrlTamanhos, oTamanho );
  oCadastroTamanhos.Caption:= 'Altera��o de Tamanho';
  oCadastroTamanhos.ShowModal;
end;
procedure Tform_consulta_tamanhos.conhecaObj(pCtrl, pObj: TObject);
begin
  inherited;
  oTamanho:= Tamanhos( pObj );
  aCtrlTamanhos:= ctrlTamanhos( pCtrl );
  self.DBGrid.DataSource:= TDataSource( aCtrlTamanhos.getDS );
end;
procedure Tform_consulta_tamanhos.excluir;
var mCaption: string;
begin
  inherited;
  aCtrlTamanhos.carregar(oTamanho);
  mCaption := oCadastroTamanhos.btn_botao_salvar.caption;
  oCadastroTamanhos.btn_botao_salvar.caption := 'Excluir';
  oCadastroTamanhos.conhecaObj( aCtrlTamanhos, oTamanho );
  oCadastroTamanhos.Caption:= 'Exclus�o de Cargo';
  oCadastroTamanhos.bloqueiaEdt;
  oCadastroTamanhos.ShowModal;
  oCadastroTamanhos.btn_botao_salvar.caption := mCaption;
  oCadastroTamanhos.desbloqueiaEdt;
end;
procedure Tform_consulta_tamanhos.FormShow(Sender: TObject);
begin
  inherited;
  combobox_tipo_filtro.ItemIndex:= 2;
  edt_pesquisa.Clear;
  self.pesquisar;   inherited;
end;
procedure Tform_consulta_tamanhos.novo;
var form : Tform_cadastro_tamanhos;
begin
  inherited;
  oTamanho.limparDados;
  oCadastroTamanhos.conhecaObj( aCtrlTamanhos, oTamanho );
  oCadastroTamanhos.limpaEdt;
  oCadastroTamanhos.Caption:= 'Cadastror de Tamanho';
  oCadastroTamanhos.ShowModal;
  if form.salvou then
    Self.pesquisar;      inherited;
end;
procedure Tform_consulta_tamanhos.pesquisar;
var vFilter : TFilterSearch;
    pchave : string;
begin
  //inherited;
  VFilter   := TFilterSearch.Create;
  try
    Try
     case combobox_tipo_filtro.ItemIndex of
      0:
        begin
          if edt_pesquisa.Text = '' then
          begin
            MessageDlg( 'Campo do filtro n�o pode ser vazio!', MtInformation, [ MbOK ], 0 );
            edt_pesquisa.SetFocus;
           Exit;
          end;
          vFilter.TipoConsulta:= TpCCodigo;
          vFilter.Codigo:= StrToInt(edt_pesquisa.Text);
        end;
    1:
        begin
          if Length( edt_pesquisa.Text ) < 3 then
          begin
            MessageDlg( 'Digite ao menos 3 caracteres para consulta!', MtInformation, [ MbOK ], 0 );
            edt_pesquisa.SetFocus;
            Exit;
          end;
          VFilter.TipoConsulta := TpCParam;
          VFilter.Parametro    := Uppercase( edt_pesquisa.Text );
        end;
      2:
        begin
          VFilter.TipoConsulta := TpCTODOS;
        end;
    end;
  finally
    aCtrlTamanhos.pesquisar(VFilter, pchave);
    VFilter.Free;
  end;
    Except
//    on e: exception do
//    ShowMessage(e.ClassName +'asdfasdfasdf');
    End;
end;
procedure Tform_consulta_tamanhos.sair;
var mTamanho : Tamanhos;
begin
  if self.btn_botao_sair.Caption = 'Selecionar' then
  begin
    mTamanho:= Tamanhos.crieObj;
    aCtrlTamanhos.carregar( TObject( mTamanho ) );
    oTamanho.setCodigo( mTamanho.getCodigo );
    oTamanho.setSiglaTamanho( mTamanho.getSiglaTamanho );
    inherited sair;
  end
  else
    inherited Sair;
end;
procedure Tform_consulta_tamanhos.setFrmCadastro(pObj: TObject);
var form : Tform_cadastro_tamanhos;
begin
  inherited;
  oCadastroTamanhos := Tform_cadastro_tamanhos( pObj );
  if form.salvou then
     self.pesquisar; inherited;
end;
procedure Tform_consulta_tamanhos.spb_botao_pesquisarClick(Sender: TObject);
begin
  pesquisar;
  inherited;
end;
procedure Tform_consulta_tamanhos.tipoFiltro;
begin
  inherited;
  case combobox_tipo_filtro.ItemIndex of
    0:  //c�digo
      begin
        edt_pesquisa.TextHint:= 'DIGITE AQUI PARA CONSULTAR POR C�DIGO!';
        edt_pesquisa.NumbersOnly:= true;
        edt_pesquisa.Enabled:= true;
        edt_pesquisa.Clear;
      end;
    1:  //sigla
      begin
        edt_pesquisa.TextHint:= 'DIGITE AQUI PARA CONSULTAR POR SIGLA!';
        edt_pesquisa.NumbersOnly:= false;
        edt_pesquisa.Enabled:= true;
        edt_pesquisa.Clear;
      end;
    2: //todos
      begin
        edt_pesquisa.NumbersOnly:= false;
        edt_pesquisa.Enabled:= false;
        edt_pesquisa.Clear;
      end;
  end;
end;
end.
