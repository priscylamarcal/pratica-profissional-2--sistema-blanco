unit uCadastro_Compras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.Buttons, Vcl.StdCtrls,
  campoEdit, Vcl.ExtCtrls, Vcl.Mask, MaskEdit1, Vcl.ComCtrls, uCompras, uCtrlCompras,
  uConsulta_Fornecedores, uConsulta_CondicoesPagamentos, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, uConsulta_Variacoes_Roupas, uVariacoesRoupas,
  uRoupas, uCtrlRoupas, uProdutoCompras, uConsulta_Roupas, uParcelasCompras, uParcelas, uCondicoesPagamentos;

type
  Tform_cadastro_compras = class(Tform_cadastro_pai)
    lbl_titulo_dados_gerais: TLabel;
    data_emissao_nota: TDateTimePicker;
    data_chegada_nota: TDateTimePicker;
    lbl_modelo: TLabel;
    lbl_serie: TLabel;
    lbl_num_nota: TLabel;
    lbl_data_emissao: TLabel;
    lbl_data_chegada: TLabel;
    edt_num_modelo: PriTEdit;
    edt_num_serie: PriTEdit;
    edt_num_nota: PriTEdit;
    edt_cod_fornecedor: PriTEdit;
    lbl_codigo_fornecedor: TLabel;
    lbl_cidade: TLabel;
    edt_pesquisar_fornecedor: PriTEdit;
    pnl_adicionar_cidade: TPanel;
    btn_adicionar_cidade: TSpeedButton;
    lbl_titulo_roupas: TLabel;
    pnl_adicionar_produto: TPanel;
    btn_adicionar_produto: TSpeedButton;
    edt_produto: PriTEdit;
    edt_cod_produto: PriTEdit;
    edt_unidade_medida: PriTEdit;
    edt_quant_produto: PriTEdit;
    edt_valor_unitario: PriTEdit;
    edt_valor_total: PriTEdit;
    lbl_cod_produto: TLabel;
    lbl_roupa: TLabel;
    lbl_unidade_medida: TLabel;
    lbl_valor_total: TLabel;
    lbl_desconto: TLabel;
    lbl_valor_unitario: TLabel;
    lbl_quantidade: TLabel;
    pbl_limpar_grid: TPanel;
    btn_limpar_grid: TSpeedButton;
    pnl_remover_item: TPanel;
    btn_remover_item: TSpeedButton;
    pnl_botao_alterar_item: TPanel;
    btn_botao_alterar_item: TSpeedButton;
    pnl_adicionar_contato: TPanel;
    btn_adicionar_contato: TSpeedButton;
    lbl_titulo_total: TLabel;
    edt_total_quantidade: PriTEdit;
    edt_total_desconto: PriTEdit;
    edt_total_valor_total: PriTEdit;
    lbl_total_quantidade: TLabel;
    lbl_total_desconto: TLabel;
    lbl_total_valor_total: TLabel;
    lbl_titulo_financeiro: TLabel;
    pnl_btn_condicao_pagamento: TPanel;
    btn_bot�o_pesquisar_condicao_pagamento: TSpeedButton;
    edt_codigo_condicao_pagamento: PriTEdit;
    lbl_codigo_condicao_pagamento: TLabel;
    edt_condicao_pagamento: TLabel;
    edit_condicao_pagamento: PriTEdit;
    lbl_frete: TLabel;
    edt_frete: PriTEdit;
    edt_seguro: PriTEdit;
    lbl_seguro: TLabel;
    lbl_outras_despesas: TLabel;
    edt_outras_despesas: PriTEdit;
    lbl_titulo_obs: TLabel;
    memo_obs: TMemo;
    lbl_codigo_roupa: TLabel;
    edt_codigo_roupa: PriTEdit;
    edt_Desconto: PriTEdit;
    DsProdutoCompra: TDataSource;
    dset_produtoCompra: TClientDataSet;
    list_view_produtos: TDBGrid;
    dset_produtoCompraUNIDADE_MEDIDA: TStringField;
    dset_produtoCompraQTD: TIntegerField;
    dset_produtoCompraVALOR_UNITARIO: TCurrencyField;
    dset_produtoCompraDESCONTO: TCurrencyField;
    dset_produtoCompraVALOR_TOTAL: TCurrencyField;
    dset_produtoCompraID_VARIACAO: TIntegerField;
    dset_produtoCompraID_ROUPA: TIntegerField;
    dset_produtoCompraROUPA: TStringField;
    dset_produtoCompraNUMERO_PRODUTO: TIntegerField;
    edt_tamanho: PriTEdit;
    lbl_tamanho: TLabel;
    dset_produtoGrid: TClientDataSet;
    dset_produtoGridProduto: TStringField;
    dset_produtoGridUnidadeMedida: TStringField;
    dset_produtoGridquantidade: TIntegerField;
    dset_produtoGridValorUnitario: TCurrencyField;
    dset_produtoGridDesconto: TCurrencyField;
    dset_produtoGridValorTotal: TCurrencyField;
    ds_Parcelas: TDataSource;
    Grid_Condicoes_pagamento: TDBGrid;
    dset_ParcelasCompras: TClientDataSet;
    dset_ParcelasComprasNumero_parcela: TIntegerField;
    dset_ParcelasComprasvalor: TCurrencyField;
    dset_ParcelasComprasdata_vencimento: TDateTimeField;
    edt_cor: PriTEdit;
    lbl_cor: TLabel;
    pnl_gerar_parcelas: TPanel;
    btn_gerarParcelas: TSpeedButton;
    lbl_outros_valores: TLabel;

    procedure btn_limpar_gridClick(Sender: TObject);

    procedure btn_adicionar_contatoMouseEnter( Sender: TObject);
    procedure btn_adicionar_contatoMouseLeave( Sender: TObject);
    procedure edt_descontoChange(Sender: TObject);
    procedure btn_bot�o_pesquisar_condicao_pagamentoClick(Sender: TObject);
    procedure btn_adicionar_cidadeClick(Sender: TObject);
    procedure btn_adicionar_produtoClick(Sender: TObject);
    procedure btn_adicionar_contatoClick(Sender: TObject);
    procedure btn_botao_alterar_itemClick(Sender: TObject);
    procedure btn_remover_itemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_quant_produtoChange(Sender: TObject);
    procedure edt_valor_unitarioChange(Sender: TObject);
//    procedure btn_gerarParcelasClick(Sender: TObject);
    procedure edt_freteChange(Sender: TObject);
    procedure edt_seguroChange(Sender: TObject);
    procedure edt_outras_despesasChange(Sender: TObject);
    procedure btn_gerarParcelasMouseEnter(Sender: TObject);
    procedure btn_gerarParcelasMouseLeave(Sender: TObject);
    procedure btn_gerarParcelasClick(Sender: TObject);
  private
    { Private declarations }
    aCompra: Compras;
    aVariacaoRoupa: VariacaoRoupa;
    aRoupa: Roupas;
    aCtrlCompras: CtrlCompras;
    aConsultaFornecedores : Tform_consulta_fornecedores;
    aConsultaCondicaoPagamento: Tform_consulta_Condicoes_pagamentos;
    aConsultaVariacoesRoupas: Tform_consulta_Variacoes_Roupas;
    aConsultaRoupas: TForm_consulta_Roupas;
    Alterar: boolean;
  public
    { Public declarations }
    procedure conhecaObj ( pCtrl, pObj : TObject );  override;
    procedure salvar;         override;
    procedure sair;           override;
    procedure limpaEdt;       override;
    procedure carregaEdt;     override;
    procedure bloqueiaEdt;    override;
    procedure desbloqueiaEdt; override;
    function validaFormulario : Boolean; override;

    procedure setFrmConsultaFornecedores ( pConsulta : TObject );
    procedure setFrmConsultaCondicaoPagamento ( pConsulta : TObject );
    procedure setFrmConsultaVariacoesRoupas (pConsulta: TObject );
    procedure setFrmConsultaRoupas (pConsulta: TObject );

    procedure adicionarItens(pEdit: boolean);
    procedure limparItens;
    procedure AlterarItem;
    procedure ExcluirItem;
    procedure bloquearItens(pBloq: boolean);
    procedure atualizarValores;
    procedure populaGrid;
    procedure gerarParcelas;
  end;

var
  form_cadastro_compras: Tform_cadastro_compras;

implementation

{$R *.dfm}

{ Tform_cadastro_compras }

procedure Tform_cadastro_compras.adicionarItens(pEdit: boolean);
var i: integer;
    //aux: boolean;
  function validaItens: Boolean;
  begin
    result := false;

    if (Self.edt_cod_produto.Text = '') or (Self.edt_produto.text = '') then
    begin
      MessageDlg( 'Selecione a Roupa!', MtInformation, [ MbOK ], 0 );
      Exit;
    end;

    if (Self.edt_quant_produto.text = '') or (StrToInt(Self.edt_quant_produto.text) <= 0) then
    begin
      MessageDlg( 'Insira a quantidade da Roupa!', MtInformation, [ MbOK ], 0 );
      edt_quant_produto.SetFocus;
      Exit;
    end;

    if (Self.edt_valor_unitario.Text = '') or (StrToInt(Self.edt_valor_unitario.text) <= 0) then
    begin
      MessageDlg( 'Insira o valor unitario da roupa!', MtInformation, [ MbOK ], 0 );
      Self.edt_valor_unitario.setFocus;
      Exit;
    end;

//    if (Self.edt_Desconto.Text = '') or (StrToInt(Self.edt_Desconto.text) <= 0) then
//    begin
//      MessageDlg( 'Insira o valor do desconto da roupa!', MtInformation, [ MbOK ], 0 );
//      Self.edt_Desconto.setFocus;
//      Exit;
//    end;

    if StrToCurr(edt_valor_total.Text) <= 0 then
    begin
      MessageDlg( 'Insira o valor Valido para o item!', MtInformation, [ MbOK ], 0 );
      Self.edt_valor_total.setFocus;
      Exit;
    end;

    result := true;
  end;

begin
   if validaItens then
   begin
//      if pEdit then
//      begin
//        dset_produtoCompra.Edit;
//        dset_produtoCompraNUMERO_PRODUTO.AsInteger := dset_produtoCompra.RecNo;
//      end
//      else
//      begin
        dset_produtoCompra.Append;
        dset_produtoCompraNUMERO_PRODUTO.AsInteger := dset_produtoCompra.RecordCount + 1;
//      end;

      dset_produtoCompraUNIDADE_MEDIDA.AsString := edt_unidade_medida.Text;
      dset_produtoCompraQTD.AsInteger := StrToInt(edt_quant_produto.text);
      dset_produtoCompraVALOR_UNITARIO.AsCurrency := StrToCurr(edt_valor_unitario.text);
      dset_produtoCompraDESCONTO.AsCurrency := StrToCurr(edt_Desconto.text);
      dset_produtoCompraVALOR_TOTAL.AsCurrency := StrToCurr(edt_valor_total.text);
      dset_produtoCompraID_VARIACAO.AsInteger := AVariacaoRoupa.getaNumeroVariacao;
      dset_produtoCompraID_Roupa.AsInteger := AVariacaoRoupa.getaCodRoupa;
      dset_produtoCompraROUPA.AsString := edt_produto.Text;
      dset_produtoCompra.Post;

      populaGrid;

      limparItens;
      atualizarValores;
   end
end;

procedure Tform_cadastro_compras.AlterarItem;
var pos: integer;
begin
   if dset_produtoCompra.RecordCount > 0 then
   begin
      if Alterar then
      begin

        edt_unidade_medida.Text := dset_produtoCompraUNIDADE_MEDIDA.AsString;
        edt_quant_produto.text := IntToStr(dset_produtoCompraQTD.AsInteger);
        edt_valor_unitario.text := CurrToStr(dset_produtoCompraVALOR_UNITARIO.AsCurrency);
        edt_Desconto.text := CurrToStr(dset_produtoCompraDESCONTO.AsCurrency);
        edt_valor_total.text := CurrToStr(dset_produtoCompraVALOR_TOTAL.AsCurrency);
        AVariacaoRoupa.setNumeroVariacao(dset_produtoCompraID_VARIACAO.AsInteger);
        AVariacaoRoupa.setCodRoupa(dset_produtoCompraID_Roupa.AsInteger);
        //aVariacaoRoupa.getaTamanho.setSiglaTamanho(dset_produtoCompraSIGLA_TAMANHO.AsString);
        ARoupa.setCodigo(dset_produtoCompraID_Roupa.AsInteger);
        //edt_codigo_roupa.Text := dset_produtoCompraCOD_ROUPA.AsString;
        edt_produto.Text := dset_produtoCompraROUPA.AsString;
        //edt_tamanho.Text := dset_produtoCompraSIGLA_TAMANHO.AsString;
        edt_cod_produto.Text := IntToStr(dset_produtoCompraID_ROUPA.asInteger);

        alterar := false;
      end
      else
      begin
        pos := dset_produtoCompraNUMERO_PRODUTO.asInteger;
        dset_produtoCompra.Locate('NUMERO_PRODUTO', pos, []);
        adicionarItens(true);
        alterar := true;
      end;
      bloquearItens(alterar);
   end
   else
     MessageDlg( 'Lista de varia��es est� vazia!', MtInformation, [ MbOK ], 0 );
end;

procedure Tform_cadastro_compras.atualizarValores;
var i: integer;
begin
  edt_total_quantidade.Text := '0';
  edt_total_desconto.Text := '0';
  edt_total_valor_total.Text := '0';
  dset_produtoGrid.first;
  for I := 0 to dset_produtoGrid.RecordCount - 1 do
  begin
    edt_total_quantidade.Text := IntToStr(StrToInt(edt_total_quantidade.Text) + dset_produtoGridquantidade.AsInteger);
    edt_total_desconto.Text := CurrToStr(StrToCurr(edt_total_desconto.Text) + dset_produtoGridDesconto.AsCurrency);
    edt_total_valor_total.Text := CurrToStr(StrToCurr(edt_total_valor_total.Text) + dset_produtoGridValorTotal.AsCurrency);;
    dset_produtoGrid.Next;
  end;

end;

procedure Tform_cadastro_compras.bloquearItens(pBloq: boolean);
begin
  btn_limpar_grid.Enabled := pBloq;
  btn_adicionar_contato.Enabled := pBloq;
  btn_remover_item.Enabled := pBloq;
  list_view_produtos.Enabled := pBloq;
  btn_adicionar_produto.Enabled := pBloq;
  btn_bot�o_pesquisar_condicao_pagamento.Enabled := pBloq;
  btn_gerarParcelas.Enabled := pBloq;
end;

procedure Tform_cadastro_compras.bloqueiaEdt;
begin
  edt_num_modelo.enabled := False;
  edt_num_serie.enabled := False;
  edt_num_nota.enabled := False;
  data_emissao_nota.enabled := False;
  data_chegada_nota.enabled := False;
  edt_cod_fornecedor.Enabled:= false;
  edt_pesquisar_fornecedor.Enabled:= false;
  edt_cod_produto.Enabled:= false;
  edt_produto.Enabled:= false;
  edt_codigo.enabled := False;
  btn_adicionar_cidade.enabled := False;
  edt_quant_produto.enabled := False;
  edt_valor_unitario.enabled := False;
  edt_total_quantidade.enabled := False;
  edt_desconto.enabled := False;
  edt_valor_total.enabled := False;
  list_view_produtos.enabled := False;
  btn_limpar_grid.enabled := False;
  btn_adicionar_contato.enabled := False;
  //btn_botao_alterar_item.enabled := False;
  btn_remover_item.enabled := False;
  edt_total_quantidade.enabled := False;
  edt_total_desconto.enabled := False;
  edt_total_valor_total.enabled := False;
  edt_frete.enabled := False;
  edt_seguro.enabled := False;
  edt_outras_despesas.enabled := False;
  edt_codigo_condicao_pagamento.Enabled:= false;
  edit_condicao_pagamento.Enabled:= false;
  btn_bot�o_pesquisar_condicao_pagamento.enabled := False;
  btn_gerarParcelas.Enabled := false;
  Grid_Condicoes_pagamento.enabled := False;
  memo_obs.enabled := False;
  btn_adicionar_produto.Enabled := false;
end;

procedure Tform_cadastro_compras.carregaEdt;
var mprodutoCompra: ProdutoCompra;
    Roupa: Roupas;
    mParcelaCompra: ParcelaCompra;
begin
  edt_num_modelo.text := aCompra.getModelo;
  edt_num_serie.text := aCompra.getSerie;
  edt_num_nota.text := aCompra.getnumNota;
  data_emissao_nota.Date := aCompra.getDataEmissao;
  data_chegada_nota.Date := aCompra.getDataChegada;
  edt_codigo.text := IntToStr(aCompra.getCodigo);
  edt_total_quantidade.text := IntToStr(aCompra.getQtdTotalRoupa);
  edt_valor_total.text := CurrToStr(aCompra.getQtdTotalRoupa);
  edt_total_desconto.text := CurrToStr(aCompra.getQtdTotalDesconto);
  edt_frete.text := CurrToStr(aCompra.getFrete);
  edt_seguro.text := CurrToStr(aCompra.getSeguro);
  edt_outras_despesas.text := CurrToStr(aCompra.getOutrasDespesas);
  memo_obs.Text := aCompra.getObservacao;

  edt_cod_fornecedor.Text := IntToStr(aCompra.getUmFornecedor.getCodigo);
  edt_pesquisar_fornecedor.Text := aCompra.getUmFornecedor.getNomeRazaoSocial;

  edt_codigo_condicao_pagamento.Text := inttostr(aCompra.getUmaCondicaoPagamento.getCodigo);
  edit_condicao_pagamento.Text := aCompra.getUmaCondicaoPagamento.getCondicao;

  Roupa := Roupas.crieObj;
  dset_produtoCompra.EmptyDataSet;
  for mProdutoCompra in aCompra.getlistaProdutos do
  begin
    dset_produtoCompra.Append;
    Roupa.setCodigo(mProdutoCompra.getvariacoesRoupas.getaCodRoupa);
    aCtrlCompras.recuperarRoupa(Roupa);
    dset_produtoCompra.FieldByName('Unidade_Medida').AsString   := Roupa.getUnidadeMedida;
    dset_produtoCompra.FieldByName('qtd').AsInteger             := mProdutoCompra.getQtd;
    dset_produtoCompra.FieldByName('VALOR_UNITARIO').AsCurrency := mProdutoCompra.getvalorUnitario;
    dset_produtoCompra.FieldByName('DESCONTO').AsCurrency       := mProdutoCompra.getDesconto;
    dset_produtoCompra.FieldByName('VALOR_TOTAL').AsCurrency    := mProdutoCompra.getValorTotal;
    dset_produtoCompra.FieldByName('ID_VARIACAO').AsiNTEGER    := mProdutoCompra.getvariacoesRoupas.getaNumeroVariacao;
    dset_produtoCompra.FieldByName('ID_ROUPA').AsiNTEGER    := mProdutoCompra.getvariacoesRoupaS.getaCodRoupa;
    dset_produtoCompra.FieldByName('ROUPA').AsString    := Roupa.getDescricao;
    dset_produtoCompra.FieldByName('NUMERO_PRODUTO').AsiNTEGER    := mProdutoCompra.getnumeroProduto;
    dset_produtoCompra.Post;

    populaGrid;
  end;
  dset_produtoCompra.First;
  dset_produtoCompra.EnableControls;
  Roupa.destrua_se;

  dset_ParcelasCompras.EmptyDataSet;
  for mParcelaCompra in aCompra.getlistaParcelas do
  begin
    dset_ParcelasCompras.Append;
    dset_ParcelasCompras.FieldByName('Numero_parcela').AsInteger   := mParcelaCompra.getaNumeroParcela;
    dset_ParcelasCompras.FieldByName('data_vencimento').AsDateTime   := mParcelaCompra.getdataVencimento;
    dset_ParcelasCompras.FieldByName('valor').AsCurrency   := mParcelaCompra.getValorParcela;
    dset_ParcelasCompras.Post;
  end;
  dset_produtoCompra.EnableControls;
end;

procedure Tform_cadastro_compras.conhecaObj(pCtrl, pObj: TObject);
begin
  inherited;
  aCompra := Compras( pObj );
  aCtrlCompras:= ctrlCompras( pCtrl );

  aRoupa := Roupas.crieObj;
  aVariacaoRoupa := VariacaoRoupa.crieObj;

  self.limpaEdt;
  self.carregaEdt;
end;

procedure Tform_cadastro_compras.desbloqueiaEdt;
begin
  edt_num_modelo.enabled := True;
  edt_num_serie.enabled := True;
  edt_num_nota.enabled := True;
  data_emissao_nota.enabled := True;
  data_chegada_nota.enabled := True;
  edt_cod_fornecedor.Enabled:= True;
  edt_pesquisar_fornecedor.Enabled:= True;
  edt_cod_produto.Enabled:= True;
  edt_produto.Enabled:= True;
  edt_codigo.enabled := True;
  btn_adicionar_cidade.enabled := True;
  edt_quant_produto.enabled := True;
  edt_valor_unitario.enabled := True;
  edt_desconto.enabled := True;
  list_view_produtos.enabled := True;
  btn_limpar_grid.enabled := True;
  btn_adicionar_contato.enabled := True;
  //btn_botao_alterar_item.enabled := True;
  btn_remover_item.enabled := True;
  edt_total_quantidade.enabled := True;
  edt_total_desconto.enabled := True;
  edt_total_valor_total.enabled := True;
  edt_frete.enabled := True;
  edt_seguro.enabled := True;
  edt_outras_despesas.enabled := True;
  edt_codigo_condicao_pagamento.Enabled:= True;
  edit_condicao_pagamento.Enabled:= True;
  btn_bot�o_pesquisar_condicao_pagamento.enabled := True;
  btn_gerarParcelas.Enabled := True;
  Grid_Condicoes_pagamento.enabled := True;
  memo_obs.enabled := True;
  btn_adicionar_produto.Enabled := true;
end;

procedure Tform_cadastro_compras.edt_descontoChange(Sender: TObject);
begin
  if edt_desconto.Text = '' then
    edt_desconto.Text := '0';
  edt_Valor_total.text := CurrToStr(StrToInt(edt_quant_produto.Text) * StrToCurr(edt_valor_unitario.text) - StrToCurr(edt_Desconto.text));
end;


procedure Tform_cadastro_compras.edt_freteChange(Sender: TObject);
begin
  inherited;
  if edt_Frete.Text = '' then
    edt_Frete.Text := '0';
end;

procedure Tform_cadastro_compras.edt_outras_despesasChange(Sender: TObject);
begin
  inherited;
  if edt_outras_despesas.Text = '' then
    edt_outras_despesas.Text := '0';
end;

procedure Tform_cadastro_compras.edt_quant_produtoChange(Sender: TObject);
begin
  inherited;
  if edt_quant_produto.Text = '' then
    edt_quant_produto.Text := '0';
  edt_Valor_total.text := CurrToStr(StrToInt(edt_quant_produto.Text) * StrToCurr(edt_valor_unitario.text) - StrToCurr(edt_Desconto.text));
end;

procedure Tform_cadastro_compras.edt_seguroChange(Sender: TObject);
begin
  inherited;
  if edt_seguro.Text = '' then
    edt_seguro.Text := '0';
end;

procedure Tform_cadastro_compras.edt_valor_unitarioChange(Sender: TObject);
begin
  inherited;
  if edt_valor_unitario.Text = '' then
    edt_valor_unitario.Text := '0';
  edt_Valor_total.text := CurrToStr(StrToInt(edt_quant_produto.Text) * StrToCurr(edt_valor_unitario.text) - StrToCurr(edt_Desconto.text));

end;

procedure Tform_cadastro_compras.ExcluirItem;
var i, j: integer;

begin
  if dset_produtoGrid.RecordCount > 0 then
  begin
    dset_produtoCompra.First;
    j := 0;
    while j <= dset_produtoCompra.RecordCount do
    begin
       if (dset_produtoGridProduto.AsString = dset_produtoCompraROUPA.AsString) and
       (dset_produtoCompraUNIDADE_MEDIDA.AsString = dset_produtoGridUnidadeMedida.AsString) then
       begin
          dset_produtoCompra.Delete;
       end
       else
          dset_produtoCompra.Next;
       j := j + 1;
    end;

    dset_produtoGrid.Delete;

    dset_produtoCompra.First;
    for I := 0 to dset_produtoCompra.RecordCount - 1 do
    begin
      dset_produtoCompra.edit;
      dset_produtoCompraNumero_Produto.AsInteger := I+1;
      dset_produtoCompra.post;
    end;
  end
  else
    MessageDlg( 'Lista de varia��es est� vazia!', MtInformation, [ MbOK ], 0 );
end;

procedure Tform_cadastro_compras.FormCreate(Sender: TObject);
begin
  inherited;
  if dset_produtoCompra.Active then
    dset_produtoCompra.Close;
  dset_produtoCompra.Open;
  dset_produtoCompra.EmptyDataSet;

  if dset_produtoGrid.Active then
    dset_produtoGrid.Close;
  dset_produtoGrid.Open;
  dset_produtoGrid.EmptyDataSet;

  if dset_ParcelasCompras.Active then
    dset_ParcelasCompras.Close;
  dset_ParcelasCompras.Open;
  dset_ParcelasCompras.EmptyDataSet;
end;

procedure Tform_cadastro_compras.gerarParcelas;
var aParcela: Parcela;
begin
  if (edit_condicao_pagamento.Text <> '') and (aCompra.getumaCondicaopagamento.getCodigo > 0) then
  begin
    if not dset_produtoGrid.IsEmpty then
    begin
      for aparcela in aCompra.getumaCondicaopagamento.getListaParcelas do
      begin
         dset_ParcelasCompras.Append;
         dset_ParcelasComprasNumero_Parcela.AsInteger := dset_ParcelasCompras.RecordCount + 1;
         dset_ParcelasComprasValor.AsCurrency :=
          (StrtoCurr(edt_total_valor_total.Text) + StrtoCurr(edt_frete.Text) +
          StrtoCurr(edt_seguro.Text) + StrtoCurr(edt_outras_despesas.Text)) * aParcela.getPorcentagem / 100;
         dset_ParcelasComprasdata_vencimento.AsDateTime := now + Aparcela.getDias;
         dset_ParcelasCompras.Post;
      end;
      bloquearItens(False);
    end
    else
      MessageDlg( 'Insira produtos para gerar as parcelas!', MtInformation, [ MbOK ], 0 );
  end
  else
    MessageDlg( 'Selecione a condi��o de pagamento', MtInformation, [ MbOK ], 0 );


end;

procedure Tform_cadastro_compras.limpaEdt;
begin
  edt_num_modelo.clear;
  edt_num_serie.clear;
  edt_num_nota.clear;
  data_emissao_nota.Date := now;
  data_chegada_nota.Date := now;
  edt_codigo.clear;
  edt_quant_produto.text := '0';
  edt_valor_unitario.text := '0';
  edt_total_quantidade.text := '0';
  edt_desconto.text := '0';
  edt_valor_total.text := '0';
  edt_pesquisar_fornecedor.Text := '';
  edt_cod_fornecedor.Text := '';
  edt_codigo_condicao_pagamento.Text := '';
  edit_condicao_pagamento.Text := '';
//  list_view_produtos.Clear;
  edt_total_valor_total.text := '0';
  edt_frete.text := '0';
  edt_seguro.text := '0';
  edt_outras_despesas.text := '0';
//  Grid_Condicoes_pagamento.Clear;
  memo_obs.clear;
  Alterar := true;
  Self.dset_produtoCompra.EmptyDataSet;
  Self.dset_produtoGrid.EmptyDataSet;
  self.dset_ParcelasCompras.EmptyDataSet;
  edt_cod_produto.Clear;
  edt_produto.Clear;
  edt_unidade_medida.Clear;
  edt_codigo_roupa.Clear;
  edt_tamanho.Clear;
  self.bloquearItens(True);
  Self.desbloqueiaEdt;
end;

procedure Tform_cadastro_compras.limparItens;
begin
   edt_cod_produto.Clear;
   edt_produto.Clear;
   edt_unidade_medida.Clear;
   edt_codigo_roupa.Clear;
   edt_tamanho.Clear;
   edt_quant_produto.Clear;
   edt_valor_unitario.Clear;
   edt_Desconto.Clear;
   edt_valor_total.Clear;
   aRoupa.limparDados;
   AVariacaoRoupa.limparDados;
end;

procedure Tform_cadastro_compras.populaGrid;
var aux: boolean;
    i: integer;
begin
  aux := False;

      dset_produtoGrid.First;
      for I := 0 to dset_produtoGrid.RecordCount do
      begin
         if (dset_produtoGridProduto.AsString = dset_produtoCompraROUPA.AsString)
          and (dset_produtoGridUnidadeMedida.AsString = dset_produtoCompraUnidade_Medida.AsString) then
         begin
            dset_produtoGrid.Edit;
            dset_produtoGridquantidade.AsInteger := dset_produtoCompraQTD.AsInteger + dset_produtoGridquantidade.AsInteger;
            dset_produtoGridDesconto.AsCurrency := dset_produtoCompraDESCONTO.AsCurrency + dset_produtoGridDesconto.AsCurrency;
            dset_produtoGridValorTotal.AsCurrency := dset_produtoGridValorTotal.AsCurrency + dset_produtoCompraVALOR_TOTAL.AsCurrency;
            dset_produtoGrid.Post;
            aux := True;
            break;
         end;
         dset_produtoGrid.next;
      end;

      if not aux then
      begin
        dset_produtoGrid.Append;
        dset_produtoGridUnidadeMedida.AsString := dset_produtoCompraUNIDADE_MEDIDA.AsString;
        dset_produtoGridquantidade.AsInteger := dset_produtoCompraQTD.AsInteger;
        dset_produtoGridDesconto.AsCurrency := dset_produtoCompraDESCONTO.AsCurrency;
        dset_produtoGridValorTotal.AsCurrency := dset_produtoCompraVALOR_TOTAL.AsCurrency;
        dset_produtoGridProduto.asString := dset_produtoCompraROUPA.AsString;
        dset_produtoGridValorUnitario.AsCurrency := dset_produtoCompraVALOR_UNITARIO.AsCurrency;
        dset_produtoGrid.Post;
      end;
end;

procedure Tform_cadastro_compras.sair;
begin
  inherited;

end;

procedure Tform_cadastro_compras.salvar;
var RetornoOperacao: string;
    produto: produtoCompra;
    Parcela: ParcelaCompra;
begin
  inherited;
  if validaFormulario then
  begin
    //aCompra.setCodigo( StrToInt ( self.edt_codigo.Text ) );

    aCompra.setmodelo( self.edt_num_modelo.Text  );
    aCompra.setserie( self.edt_num_serie.Text  );
    aCompra.setNumNota( self.edt_num_nota.Text  );
    aCompra.setDataEmissao( self.data_emissao_nota.date  );
    aCompra.setDataChegada( self.data_chegada_nota.date  );

    aCompra.getumFornecedor.setCodigo( StrToInt ( self.edt_cod_fornecedor.Text ) );
    aCompra.getumFornecedor.setNomeRazaoSocial( self.edt_pesquisar_fornecedor.Text );

    aCompra.setQtdTotalRoupa( strtoint(edt_total_quantidade.text));
    aCompra.setQtdTotalDesconto( strtoCurr(edt_total_quantidade.text));
    aCompra.setTotalValor( strtoCurr(edt_total_valor_total.text));

    aCompra.setFrete( strtoCurr(edt_frete.text));
    aCompra.setSeguro( strtoCurr(edt_Seguro.text));
    aCompra.setOutrasDespesas( strtoCurr(edt_outras_despesas.text));

    aCompra.getUmaCondicaoPagamento.setCodigo(strtoint(edt_codigo_condicao_pagamento.text));
    aCompra.getUmaCondicaoPagamento.setCondicao(edit_condicao_pagamento.text);

    aCompra.setObservacao( self.memo_obs.Text );
    aCompra.setCodUsu( StrToInt ( Self.edt_cod_usuario.Text ) );

    dset_produtoCompra.DisableControls;
    aCompra.getlistaProdutos.Clear;
      try
        dset_produtoCompra.First;
        while not(dset_produtoCompra.Eof) do
          begin
            Produto := ProdutoCompra.crieObj;
            with Produto, dset_produtoCompra do
              begin

                SetQtd(dset_produtoCompraQTD.AsInteger);
                SetValorUnitario(dset_produtoCompraVALOR_UNITARIO.AsCurrency);
                SetDesconto(dset_produtoCompraDESCONTO.AsCurrency);
                SetValorTotal(dset_produtoCompraVALOR_TOTAL.AsCurrency);
                getVariacoesRoupas.SetNumeroVariacao(dset_produtoCompraID_VARIACAO.AsInteger);
                getVariacoesRoupas.setCodRoupa(dset_produtoCompraID_Roupa.AsInteger);
                //getVariacoesRoupas.getaTamanho.setSiglaTamanho(dset_produtoCompraSIGLA_TAMANHO.AsString);
                //getVariacoesRoupas.setcodigoVariacao(dset_produtoCompraCOD_ROUPA.AsString);
                SetModelo(aCompra.getmodelo);
                Setserie(aCompra.getSerie);
                SetNum_Nota(aCompra.getNumNota);
                getFornecedor.setCodigo(aCompra.getumFornecedor.getCodigo);
                setNumeroProduto(dset_produtoCompraNUMERO_PRODUTO.AsInteger);

              end;
            aCompra.getlistaProdutos.Add(Produto);
            dset_produtoCompra.Next;
          end;
      finally
        dset_produtoCompra.EnableControls;
      end;

    dset_ParcelasCompras.DisableControls;
    aCompra.getlistaParcelas.Clear;
      try
        dset_ParcelasCompras.First;
        while not(dset_ParcelasCompras.Eof) do
          begin
            Parcela := ParcelaCompra.crieObj;
            with Parcela,  dset_ParcelasCompras do
              begin

                SetNumeroParcela(dset_ParcelasComprasNumero_parcela.AsInteger);
                SetDataVencimento(dset_ParcelasComprasData_vencimento.AsDateTime);
                SetValorParcela(dset_ParcelasComprasValor.AsCurrency);
                getCondicaoPagamento.SetCodigo(aCompra.getUmaCondicaoPagamento.getCodigo);
                getCondicaoPagamento.setCondicao(aCompra.getUmaCondicaoPagamento.getCondicao);

                SetModelo(aCompra.getmodelo);
                Setserie(aCompra.getSerie);
                SetNum_Nota(aCompra.getNumNota);
                getFornecedor.setCodigo(aCompra.getumFornecedor.getCodigo);

              end;
            aCompra.getlistaParcelas.Add(Parcela);
            dset_ParcelasCompras.Next;
          end;
      finally
        dset_ParcelasCompras.EnableControls;
      end;

    if Self.btn_botao_salvar.Caption = 'Salvar' then // INCLUIR-ALTERAR
    begin
//        if (aCtrlCompras.VerificaExiste(aCompra)) then
//        // verifica se existe pais quando � incluir
//        begin
//          ShowMessage('J� existe uma Compra com o mesmo numero, serie, modelo e fornecedor cadastrado!');
//          Exit;
//        end;
        RetornoOperacao := aCtrlCompras.salvar(aCompra.clone);
    end
    else // EXCLUIR
    begin
      if aCtrlCompras.ValidaExclusao(aCompra) then
        RetornoOperacao := aCtrlCompras.excluir(aCompra.clone)
      else
        ShowMessage
          ('A compra n�o pode ser exclu�da!');
    end;
    salvou := RetornoOperacao = '';

    self.sair;
  end;
end;

procedure Tform_cadastro_compras.setFrmConsultaCondicaoPagamento(
  pConsulta: TObject);
begin
  aConsultaCondicaoPagamento := Tform_consulta_Condicoes_pagamentos( pConsulta );
end;

procedure Tform_cadastro_compras.setFrmConsultaFornecedores(pConsulta: TObject);
begin
  aConsultaFornecedores:= Tform_consulta_fornecedores( pConsulta );
end;

procedure Tform_cadastro_compras.setFrmConsultaRoupas(pConsulta: TObject);
begin
  aConsultaRoupas := TForm_consulta_Roupas( pConsulta );
end;

procedure Tform_cadastro_compras.setFrmConsultaVariacoesRoupas(
  pConsulta: TObject);
begin
  aConsultaVariacoesRoupas := TForm_consulta_variacoes_Roupas( pConsulta );
end;

function Tform_cadastro_compras.validaFormulario: Boolean;
begin
  Result:= False;

  if Self.edt_num_modelo.Text = '' then
  begin
    MessageDlg( 'O campo Modelo � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_num_modelo.SetFocus;
    Exit;
  end;

  if Self.edt_num_serie.Text = '' then
  begin
    MessageDlg( 'O campo S�rie � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_num_serie.SetFocus;
    Exit;
  end;

  if Self.edt_num_nota.Text = '' then
  begin
    MessageDlg( 'O campo N�mero nota � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_num_nota.SetFocus;
    Exit;
  end;

  if (Self.data_emissao_nota.date > now) then
  begin
    MessageDlg( 'O campo Data Emiss�o � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    data_emissao_nota.SetFocus;
    Exit;
  end;

  if (Self.data_chegada_nota.date > now) then
  begin
    MessageDlg( 'O campo Data Chegada � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    data_emissao_nota.SetFocus;
    Exit;
  end;

  if Self.edt_pesquisar_fornecedor.Text = '' then
  begin
    MessageDlg( 'O campo Fornecedor � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_pesquisar_fornecedor.SetFocus;
    Exit;
  end;

//  if (Self.edt_total_quantidade.Text = '') or (StrToInt(Self.edt_total_quantidade.Text) <= 0) then
//  begin
//    MessageDlg( 'O campo Total quantidade � obrigat�rio!', MtInformation, [ MbOK ], 0 );
//    edt_total_quantidade.SetFocus;
//    Exit;
//  end;

//  if (Self.edt_total_desconto.Text = '') or (StrToCurr(Self.edt_total_desconto.Text) < 0) then
//  begin
//    MessageDlg( 'O campo Total desconto � obrigat�rio!', MtInformation, [ MbOK ], 0 );
//    edt_total_desconto.SetFocus;
//    Exit;
//  end;

//  if (Self.edt_total_valor_total.Text = '') or (StrToCurr(Self.edt_total_valor_total.Text) < 0) then
//  begin
//    MessageDlg( 'O campo Valor Total � obrigat�rio!', MtInformation, [ MbOK ], 0 );
//    edt_total_desconto.SetFocus;
//    Exit;
//  end;

  if (Self.edt_frete.Text = '') or (StrToCurr(Self.edt_frete.Text) < 0) then
  begin
    MessageDlg( 'O campo Frete � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_total_desconto.SetFocus;
    Exit;
  end;

  if (Self.edt_seguro.Text = '') or (StrToCurr(Self.edt_seguro.Text) < 0) then
  begin
    MessageDlg( 'O campo Frete � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_seguro.SetFocus;
    Exit;
  end;

  if (Self.edt_outras_despesas.Text = '') or (StrToCurr(Self.edt_outras_despesas.Text) < 0) then
  begin
    MessageDlg( 'O campo Outras despesas � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edt_outras_despesas.SetFocus;
    Exit;
  end;

  if (Self.edit_condicao_pagamento.Text = '') then
  begin
    MessageDlg( 'O campo Condi��o Pagamento � obrigat�rio!', MtInformation, [ MbOK ], 0 );
    edit_condicao_pagamento.SetFocus;
    Exit;
  end;

 Result:= true;
end;

procedure Tform_cadastro_compras.btn_limpar_gridClick(Sender: TObject);
begin
  inherited;
  if MessageDlg( 'Deseja apagar todos os registros?', MtConfirmation, [ MbYes, MbNo ], 0 ) = mrYes then
  begin
    dset_produtoCompra.EmptyDataSet;
    dset_produtoGrid.EmptyDataSet;
  end;
end;

procedure Tform_cadastro_compras.btn_remover_itemClick(Sender: TObject);
begin
  inherited;
  ExcluirItem;
end;

//procedure Tform_cadastro_compras.btn_gerarParcelasClick(Sender: TObject);
//begin
//  inherited;
//  gerarParcelas;
//end;

procedure Tform_cadastro_compras.btn_adicionar_cidadeClick(Sender: TObject);
  var aux : string;
begin
  inherited;
  aConsultaFornecedores.conhecaObj( aCtrlCompras.getCtrlFornecedores, aCompra.getumFornecedor );
  aux := aConsultaFornecedores.btn_botao_sair.Caption;
  aConsultaFornecedores.btn_botao_sair.Caption:= 'Selecionar';
  aConsultaFornecedores.ShowModal;
  aConsultaFornecedores.btn_botao_sair.Caption:= aux;

  self.edt_cod_fornecedor.Text:= IntToStr( aCompra.getumFornecedor.getCodigo );
  self.edt_pesquisar_fornecedor.Text:= aCompra.getumFornecedor.getnomerazaosocial;
end;

procedure Tform_cadastro_compras.btn_adicionar_contatoClick(Sender: TObject);
begin
  inherited;
  adicionarItens(false);
end;

procedure Tform_cadastro_compras.btn_adicionar_contatoMouseEnter(
  Sender: TObject);
begin
  btn_adicionar_contato.Font.Style:= [fsBold];
end;

procedure Tform_cadastro_compras.btn_adicionar_contatoMouseLeave(
  Sender: TObject);
begin
  btn_adicionar_contato.Font.Style:= [];
end;

procedure Tform_cadastro_compras.btn_adicionar_produtoClick(Sender: TObject);
var Btn: string;
begin
  inherited;
    //aConsultaRoupas.conhecaObj(aCtrlCompras.getCtrlRoupas, aRoupa);
    aConsultaVariacoesRoupas.conhecaObj( aCtrlCompras.getCtrlVariacoesRoupas, aCompra.getaVariacaoRoupa );
    Btn := aConsultaVariacoesRoupas.btn_botao_sair.Caption;
    aConsultaVariacoesRoupas.btn_botao_sair.Caption:= 'Selecionar';
    aConsultaVariacoesRoupas.ShowModal;
    aConsultaVariacoesRoupas.btn_botao_sair.Caption:= Btn;
    aVariacaoRoupa := aCompra.getaVariacaoRoupa;
    aRoupa.setCodigo(aVariacaoRoupa.getaCodRoupa);
    aCtrlCompras.RecuperarRoupa(aRoupa);

    self.edt_cod_produto.Text:= IntToStr( aRoupa.getCodigo );
    self.edt_produto.Text:= aRoupa.getDescricao;
    self.edt_unidade_medida.Text := aRoupa.getUnidadeMedida;
    self.edt_codigo_roupa.Text := aVariacaoRoupa.getacodigoVariacao;
    self.edt_tamanho.Text := aVariacaoRoupa.getaTamanho.getSiglaTamanho;
    self.edt_valor_unitario.Text := CurrToStr(aRoupa.getCustoUnitario);
    self.edt_cor.Text:= aVariacaoRoupa.getaCor.getCor;

end;

procedure Tform_cadastro_compras.btn_botao_alterar_itemClick(Sender: TObject);
begin
  inherited;
  AlterarItem;
end;

procedure Tform_cadastro_compras.btn_gerarParcelasClick(Sender: TObject);
begin
  inherited;
  gerarParcelas;
end;

procedure Tform_cadastro_compras.btn_gerarParcelasMouseEnter(
  Sender: TObject);
begin
  btn_gerarParcelas.Font.Style:= [fsBold];
end;

procedure Tform_cadastro_compras.btn_gerarParcelasMouseLeave(
  Sender: TObject);
begin
  btn_gerarParcelas.Font.Style:= [];
end;

procedure Tform_cadastro_compras.btn_bot�o_pesquisar_condicao_pagamentoClick(
  Sender: TObject);
  var aux : string;
begin
  inherited;
  aConsultaCondicaoPagamento.conhecaObj( aCtrlCompras.getCtrlCondicoesPagamentos, aCompra.getumaCondicaopagamento );
  aux := aConsultaCondicaoPagamento.btn_botao_sair.Caption;
  aConsultaCondicaoPagamento.btn_botao_sair.Caption:= 'Selecionar';
  aConsultaCondicaoPagamento.ShowModal;
  aConsultaCondicaoPagamento.btn_botao_sair.Caption:= aux;

  self.edt_codigo_condicao_pagamento.Text:= IntToStr( aCompra.getumaCondicaoPagamento.getCodigo );
  self.edit_condicao_pagamento.Text:= aCompra.getumaCondicaoPagamento.getCondicao;
end;

end.
