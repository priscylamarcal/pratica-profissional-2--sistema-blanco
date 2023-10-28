unit uCtrlProdutosCompras;

interface

uses uController, uFilterSearch, uVariacoesRoupas,
    system.Generics.Collections, uCtrlVariacoesRoupas, uProdutoCompras, uDaoProdutosCompras, uCompras;

type ctrlProdutosCompras = class (Ctrl)
  private

  protected
    aDaoProdutosCompras : DaoProdutoCompra;
    aCtrlVariacoesRoupas : CtrlVariacoesRoupas;
  public
    constructor crieObj;                              override;
    destructor destrua_se;                            override;
    procedure setDM ( pDM : TObject );                override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    function salvarProdutoCompra ( lista: TObjectList<ProdutoCompra> ) : string;

    procedure setCtrlVariacoesRoupas ( pCtrl : ctrlVariacoesRoupas );
    function getCtrlVariacoesRoupas : ctrlVariacoesRoupas;

    function RetornaListaProdutoCompra(const ACompra: Compras): TObjectList<ProdutoCompra>;
    function DeleteListaProdutoCompra(const ACompra: Compras): Boolean;

end;

implementation

{ ctrlProdutosCompras }

function ctrlProdutosCompras.carregar(pObj: TObject): string;
var aFilter: TFilterSearch;
    tipoConsulta : TTipoConsulta;
    pChave : string;
    mVariacaoRoupa: VariacaoRoupa;
begin
  aDaoProdutosCompras.carregar( pObj );

  mVariacaoRoupa := ProdutoCompra( pObj ).getvariacoesRoupas;
  aCtrlVariacoesRoupas.pesquisar(aFilter, pChave);
end;

constructor ctrlProdutosCompras.crieObj;
begin
  aDaoProdutosCompras:= daoProdutoCompra.crieObj;
end;

function ctrlProdutosCompras.DeleteListaProdutoCompra(
  const ACompra: Compras): Boolean;
begin
  aDaoProdutosCompras.DeleteListaProdutoCompra(ACompra);
end;

destructor ctrlProdutosCompras.destrua_se;
begin
  aDaoProdutosCompras.destrua_se;
  inherited;
end;

function ctrlProdutosCompras.excluir(pObj: TObject): string;
begin

end;

function ctrlProdutosCompras.getCtrlVariacoesRoupas: ctrlVariacoesRoupas;
begin
   result := getCtrlVariacoesRoupas;
end;

function ctrlProdutosCompras.getDS: TObject;
begin
   Result:= aDaoProdutosCompras.getDS;
end;

function ctrlProdutosCompras.pesquisar(AFilter: TFilterSearch;
  pChave: string): string;
begin
   Result:= aDaoProdutosCompras.pesquisar(AFilter, pChave);
end;

function ctrlProdutosCompras.RetornaListaProdutoCompra(
  const ACompra: Compras): TObjectList<ProdutoCompra>;
begin
   Result := aDaoProdutosCompras.RetornaListaProdutoCompra(ACompra);
end;

function ctrlProdutosCompras.salvar(pObj: TObject): string;
begin
   aDaoProdutosCompras.salvar(pObj);
end;

function ctrlProdutosCompras.salvarProdutoCompra(
  lista: TObjectList<ProdutoCompra>): string;
begin
   aDaoProdutosCompras.salvarLista(lista);
end;

procedure ctrlProdutosCompras.setCtrlVariacoesRoupas(
  pCtrl: ctrlVariacoesRoupas);
begin
  aCtrlVariacoesRoupas:= pCtrl;
end;

procedure ctrlProdutosCompras.setDM(pDM: TObject);
begin
  inherited;
  aDaoProdutosCompras.setDM(pDM);
end;

end.
