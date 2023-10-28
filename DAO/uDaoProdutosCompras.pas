unit uDaoProdutosCompras;

interface

uses uDAO,
  uFilterSearch, uProdutoCompras, uVariacoesRoupas,

  System.Generics.Collections, System.SysUtils, uFornecedores, uCompras;

type
  daoProdutoCompra = class(DAO)
  private

  protected
  public
    constructor crieObj; override;
    function getDS: TObject; override;
    function pesquisar(AFilter: TFilterSearch; pChave: string): string;
      override;
    function salvar(pObj: TObject): string; override;
    function excluir(pObj: TObject): string; override;
    function carregar(pObj: TObject): string; override;
    function salvarLista(lista: TObjectList<ProdutoCompra>): string;
    function carregarLista(lista: TObjectList<ProdutoCompra>): string;

    function RetornaListaProdutoCompra(const ACompra: Compras) : TObjectList<ProdutoCompra>;
    function DeleteListaProdutoCompra(const ACompra: Compras): Boolean;
  end;

implementation
uses
  FireDAC.Comp.Client;
{ daoVariacoesRoupas }

function daoProdutoCompra.carregar(pObj: TObject): string;
var
  mProdutoCompra: ProdutoCompra;
begin
  mProdutoCompra := ProdutoCompra(pObj);

  mProdutoCompra.setNumeroProduto(aDM.QProdutosCompras.FieldByName('NUMERO_PRODUTO').AsInteger);

  mProdutoCompra.getVariacoesRoupas.setNumeroVariacao
    (aDM.QProdutosCompras.FieldByName('NUMERO_VARIACAO').AsInteger);

  mProdutoCompra.getVariacoesRoupas.setcodRoupa
    (aDM.QProdutosCompras.FieldByName('COD_ROUPA').AsInteger);

  mProdutoCompra.getFornecedor.setCodigo(aDM.QProdutosCompras.FieldByName('COD_FORNECEDOR').AsInteger);

  mProdutoCompra.setqtd((aDM.QProdutosCompras.FieldByName('QTD').AsInteger));
  mProdutoCompra.setValorUnitario((aDM.QProdutosCompras.FieldByName('VALOR_UNITARIO').AsCurrency));
  mProdutoCompra.setDesconto((aDM.QProdutosCompras.FieldByName('DESCONTO').AsCurrency));
  mProdutoCompra.setValorTotal((aDM.QProdutosCompras.FieldByName('VALOR_TOTAL').AsCurrency));

  mProdutoCompra.setModelo((aDM.QProdutosCompras.FieldByName('MODELO').AsString));
  mProdutoCompra.setserie((aDM.QProdutosCompras.FieldByName('serie').AsString));
  mProdutoCompra.setNum_Nota((aDM.QProdutosCompras.FieldByName('NUMERO').AsString));

end;

function daoProdutoCompra.RetornaListaProdutoCompra(const ACompra: Compras)
  : TObjectList<ProdutoCompra>;
var
  AProdutoCompra: ProdutoCompra;
  AQuery  : TFDQuery;
begin
  Result := nil;
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection  := adm.Conexao;
    AQuery.Transaction := aDM.Transacao;

    if (AQuery.Active) then
     AQuery.Close;
    AQuery.SQL.Clear;

    AQuery.SQL.Add('SELECT * FROM PRODUTOS_COMPRAS');
    AQuery.SQL.Add('WHERE MODELO = :MODELO AND SERIE = :SERIE AND NUMERO = :NUMERO ');
    AQuery.SQL.Add('AND COD_FORNECEDOR = :COD_FORNECEDOR ');
    AQuery.ParamByName('MODELO').AsString := aCompra.getModelo;
    AQuery.ParamByName('SERIE').AsString := ACompra.getSerie;
    AQuery.ParamByName('NUMERO').AsString := aCompra.getNumNota;
    AQuery.ParamByName('COD_FORNECEDOR').AsInteger := aCompra.getUmFornecedor.getCodigo;
    AQuery.Open;

    AQuery.First;

    Result := TObjectList<ProdutoCompra>.Create;
    while not(AQuery.Eof) do
    begin
      AProdutoCompra := ProdutoCompra.crieObj;

      with AProdutoCompra, AQuery do
      begin

        setNumeroProduto(FieldByName('NUMERO_PRODUTO').AsInteger);

        getVariacoesRoupas.setNumeroVariacao
          (FieldByName('NUMERO_VARIACAO').AsInteger);

        getVariacoesRoupas.setcodRoupa
          (FieldByName('COD_ROUPA').AsInteger);

        getFornecedor.setCodigo(FieldByName('COD_FORNECEDOR').AsInteger);

        setqtd(FieldByName('QTD').AsInteger);
        setValorUnitario(FieldByName('VALOR_UNITARIO').AsCurrency);
        setDesconto(FieldByName('DESCONTO').AsCurrency);
        setValorTotal(FieldByName('VALOR_TOTAL').AsCurrency);

        setModelo(FieldByName('MODELO').AsString);
        setserie(FieldByName('serie').AsString);
        setNum_Nota(FieldByName('NUMERO').AsString);

      end;

      Result.Add(AProdutoCompra);
      AQuery.Next;
    end;

    AQuery.Close;
  finally
    FreeAndNil(AQuery);
  end;
end;

function daoProdutoCompra.carregarLista(lista: TObjectList<ProdutoCompra>): string;
begin

end;

constructor daoProdutoCompra.crieObj;
begin
  inherited;
end;

function daoProdutoCompra.DeleteListaProdutoCompra(const ACompra: Compras): Boolean;
begin
  if (aDM.QProdutosCompras.Active) then
    aDM.QProdutosCompras.Close;

  if not aDM.Conexao.InTransaction then
    aDM.Transacao.StartTransaction;
  try
    aDM.QProdutosCompras.SQL.Clear;
    aDM.QProdutosCompras.SQL.Add('DELETE FROM PRODUTOS_COMPRAS WHERE MODELO = :MODELO AND SERIE = :SERIE AND NUMERO = :NUMERO ');
    aDM.QProdutosCompras.SQL.Add('AND COD_FORNECEDOR = :COD_FORNECEDOR ');
    aDM.QProdutosCompras.ParamByName('MODELO').AsString := aCompra.getModelo;
    aDM.QProdutosCompras.ParamByName('SERIE').AsString := ACompra.getSerie;
    aDM.QProdutosCompras.ParamByName('NUMERO').AsString := aCompra.getNumNota;
    aDM.QProdutosCompras.ParamByName('COD_FORNECEDOR').AsInteger := aCompra.getUmFornecedor.getCodigo;
    aDM.QProdutosCompras.ExecSQL;

    Result := (aDM.QProdutosCompras.RowsAffected > 0);

    aDM.Transacao.Commit;
  except
    on e: Exception do
    begin
      raise Exception.Create('Erro:' + e.Message);
      Result := False;
      aDM.Transacao.Rollback;
    end;
  end;
end;

function daoProdutoCompra.excluir(pObj: TObject): string;
begin
  aDM.Conexao.StartTransaction;

  aDM.QProdutosCompras.SQL.Clear;
  aDM.QProdutosCompras.SQL.Add
    ('DELETE FROM PRODUTOS_COMPRAS WHERE MODELO = :MODELO AND SERIE = :SERIE AND NUMERO = :NUMERO ');
  aDM.QProdutosCompras.SQL.Add('AND COD_FORNECEDOR = :COD_FORNECEDOR ');
  aDM.QProdutosCompras.ParamByName('MODELO').AsString := Compras(pObj).getModelo;
  aDM.QProdutosCompras.ParamByName('SERIE').AsString := Compras(pObj).getSerie;
  aDM.QProdutosCompras.ParamByName('NUMERO').AsString := Compras(pObj).getNumNota;
  aDM.QProdutosCompras.ParamByName('COD_FORNECEDOR').AsInteger := Compras(pObj).getUmFornecedor.getCodigo;
  aDM.QProdutosCompras.ExecSQL;

  try
    aDM.Conexao.Commit;
    Result := 'SUCESSO';
  except
    aDM.Conexao.Rollback;
    Result := 'ERRO';
  end;
end;

function daoProdutoCompra.getDS: TObject;
begin
  Result := aDM.DSProdutosCompras;
end;

function daoProdutoCompra.pesquisar(AFilter: TFilterSearch; pChave: string): string;
var
  msql: string;
begin

  case AFilter.TipoConsulta of

//    TpCCodigo:
//      begin
//        msql := 'SELECT * FROM VariacoesRoupas WHERE COD =' + IntToStr(AFilter.Codigo);
//      end;

    // TpCParam:
    // begin
    // msql:= ( 'SELECT * FROM VariacoesRoupas WHERE ESTADO LIKE  ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
    // end;

    TpCTODOS:
      begin
        msql := 'SELECT * FROM PRODUTOS_COMPRAS';
      end;

  end;

  aDM.QProdutosCompras.Active   := False;
  aDM.QProdutosCompras.SQL.Text := msql;
  aDM.QProdutosCompras.Open;
  Result := '';
end;

function daoProdutoCompra.salvar(pObj: TObject): string;
var
  mProdutoCompra: ProdutoCompra;

begin
  mProdutoCompra := ProdutoCompra(pObj);

  if aDM.QProdutosCompras.Active then
    aDM.QProdutosCompras.Close;
  aDM.QProdutosCompras.SQL.Clear;

  if not(aDM.Conexao.InTransaction) then
    aDM.Transacao.StartTransaction;
  try
    aDM.QProdutosCompras.SQL.Add('insert into PRODUTOS_COMPRAS');
    aDM.QProdutosCompras.SQL.Add('(NUMERO_PRODUTO, QTD, NUMERO_VARIACAO, COD_ROUPA, VALOR_UNITARIO, DESCONTO, VALOR_TOTAL, MODELO, SERIE, NUMERO, COD_FORNECEDOR)');
    aDM.QProdutosCompras.SQL.Add('values');
    aDM.QProdutosCompras.SQL.Add('(:NUMERO_PRODUTO, :QTD, :NUMERO_VARIACAO, :COD_ROUPA, :VALOR_UNITARIO, :DESCONTO, :VALOR_TOTAL, :MODELO, :SERIE, :NUMERO, :COD_FORNECEDOR)');

    aDM.QProdutosCompras.ParamByName('NUMERO_PRODUTO').AsInteger  := mProdutoCompra.getNumeroProduto;
	  aDM.QProdutosCompras.ParamByName('QTD').AsInteger  := mProdutoCompra.getQtd;
	  aDM.QProdutosCompras.ParamByName('VALOR_UNITARIO').AsCurrency  := mProdutoCompra.getValorUnitario;
	  aDM.QProdutosCompras.ParamByName('DESCONTO').AsCurrency  := mProdutoCompra.getDesconto;
  	aDM.QProdutosCompras.ParamByName('VALOR_TOTAL').AsCurrency  := mProdutoCompra.getValorTotal;
	  aDM.QProdutosCompras.ParamByName('NUMERO_VARIACAO').AsInteger := mProdutoCompra.getvariacoesRoupas.getaNumeroVariacao;
	  aDM.QProdutosCompras.ParamByName('COD_ROUPA').AsInteger := mProdutoCompra.getvariacoesRoupas.getacodRoupa;
    aDM.QProdutosCompras.ParamByName('MODELO').AsString := mProdutoCompra.getmodelo;
    aDM.QProdutosCompras.ParamByName('SERIE').AsString := mProdutoCompra.getSerie;
    aDM.QProdutosCompras.ParamByName('numero').AsString := mProdutoCompra.getNum_Nota;
    aDM.QProdutosCompras.ParamByName('cod_fornecedor').AsInteger := mProdutoCompra.getFornecedor.getCodigo;


    aDM.QProdutosCompras.ExecSQL;

    aDM.Transacao.Commit;
    Result := 'S';
  except
    on e: Exception do
    begin
      raise Exception.Create('Erro: ' + e.Message);
      Result := e.Message;
      aDM.Transacao.Rollback;
    end;
  end;
end;

function daoProdutoCompra.salvarLista(lista: TObjectList<ProdutoCompra>): string;
var
  I: Integer;
  Obj: TObject;
  CodRoupa: Integer;
begin
  // Result := False;

  for I := 0 to lista.Count - 1 do
  begin
    Obj := lista[I];
    Result := Self.salvar(Obj);
  end;
end;

end.
