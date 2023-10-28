unit uParcelasCompras;

interface
uses Classes,
     SysUtils,
     uPai,
     uCondicoesPagamentos,
     uFornecedores;

type ParcelaCompra = class

  private
  protected
	numeroParcela: integer;
  condicaoPagamento: CondicoesPagamentos;
	dataVencimento: TdateTime;
  ValorParcela: Currency;
  modelo: string;
  serie: string;
  num_nota: string;
  Fornecedor: Fornecedores;
  public
     constructor crieObj;
     destructor destrua_se;
     function getaNumeroParcela: integer;
     function getcondicaoPagamento: CondicoesPagamentos;
     function getdataVencimento: TdateTime;
     function getValorParcela: Currency;
     function getmodelo: string;
     function getserie: string;
     function getnum_nota: string;
     function getFornecedor: Fornecedores;

     procedure setNumeroParcela(pNumeroParcela: integer);
     procedure setcondicaoPagamento(pCondicaoPagamento: CondicoesPagamentos);
     procedure setdataVencimento(pdataVencimento: TdateTime);
     procedure setvalorParcela(pValorParcela: currency);
     procedure setmodelo(pModelo: string);
     procedure setserie(pSerie: string);
     procedure setnum_nota(pNum_Nota: string);
     procedure setFornecedor(pFornecedor: Fornecedores);

     function clone : ParcelaCompra;
     procedure limparDados;
end;
implementation

{ ParcelaCompra }

function ParcelaCompra.clone: ParcelaCompra;
begin
  Result:= ParcelaCompra.crieObj;

  Result.setNumeroParcela(NumeroParcela);
  Result.setcondicaoPagamento(CondicaoPagamento);
  Result.setdataVencimento(dataVencimento);
  Result.setvalorParcela(ValorParcela);
  result.setmodelo(Modelo);
  result.setserie(Serie);
  result.setnum_nota(Num_Nota);
  result.setFornecedor(Fornecedor);
end;

constructor ParcelaCompra.crieObj;
begin
  condicaoPagamento := condicoesPagamentos.crieObj;
  fornecedor := Fornecedores.crieObj;

  limparDados;
end;

destructor ParcelaCompra.destrua_se;
begin
  condicaoPagamento.destrua_se;
end;

function ParcelaCompra.getaNumeroParcela: integer;
begin
  result := NumeroParcela;
end;

function ParcelaCompra.getcondicaoPagamento: CondicoesPagamentos;
begin
  result := CondicaoPagamento;
end;

function ParcelaCompra.getdataVencimento: TdateTime;
begin
  result := dataVencimento;
end;

function ParcelaCompra.getFornecedor: Fornecedores;
begin
  result := Fornecedor;
end;

function ParcelaCompra.getmodelo: string;
begin
  result := Modelo;
end;

function ParcelaCompra.getnum_nota: string;
begin
  result := num_nota;
end;

function ParcelaCompra.getserie: string;
begin
  result := serie;
end;

function ParcelaCompra.getValorParcela: Currency;
begin
  result := ValorParcela;
end;

procedure ParcelaCompra.limparDados;
begin
  NumeroParcela := 0;
  CondicaoPagamento.limparDados;
  dataVencimento := 0;
  ValorParcela := 0;
  fornecedor.limparDados;
  num_nota := '';
  serie := '';
  modelo := '';
end;

procedure ParcelaCompra.setcondicaoPagamento(
  pCondicaoPagamento: CondicoesPagamentos);
begin
  condicaoPagamento := pCondicaoPagamento;
end;

procedure ParcelaCompra.setdataVencimento(pdataVencimento: TdateTime);
begin
  dataVencimento := pDataVencimento;
end;

procedure ParcelaCompra.setFornecedor(pFornecedor: Fornecedores);
begin
  fornecedor := pFornecedor;
end;

procedure ParcelaCompra.setmodelo(pModelo: string);
begin
  modelo := pModelo;
end;

procedure ParcelaCompra.setNumeroParcela(pNumeroParcela: integer);
begin
  NumeroParcela := pNumeroParcela;
end;

procedure ParcelaCompra.setnum_nota(pNum_Nota: string);
begin
  num_nota := pNum_nota;
end;

procedure ParcelaCompra.setserie(pSerie: string);
begin
  serie := pSerie;
end;

procedure ParcelaCompra.setvalorParcela(pValorParcela: currency);
begin
  ValorParcela := pValorParcela;
end;

end.
