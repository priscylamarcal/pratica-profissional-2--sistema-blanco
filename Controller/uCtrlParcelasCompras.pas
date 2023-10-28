unit uCtrlParcelasCompras;

interface

uses uController, uFilterSearch, uCondicoesPagamentos,
    system.Generics.Collections, uCtrlCondicoesPagamentos, uParcelasCompras, uDaoParcelasCompras, uCompras;

type ctrlParcelaCompra = class (Ctrl)
  private

  protected
    aDaoParcelasCompras : daoParcelaCompra;
    aCtrlCondicoesPagamentos : CtrlCondicoesPagamentos;
  public
    constructor crieObj;                              override;
    destructor destrua_se;                            override;
    procedure setDM ( pDM : TObject );                override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    function salvarParcelasCompras ( lista: TObjectList<ParcelaCompra> ) : string;

    procedure setCtrlCondicoesPagamentos ( pCtrl : ctrlCondicoesPagamentos );
    function getCtrlCondicoesPagamentos : ctrlCondicoesPagamentos;

    function RetornaListaParcelaCompra(const ACompra: Compras): TObjectList<ParcelaCompra>;
    function DeleteListaParcelaCompra(const ACompra: Compras): Boolean;

end;

implementation

{ ctrlProdutosCompras }

function ctrlParcelaCompra.carregar(pObj: TObject): string;
var aFilter: TFilterSearch;
    tipoConsulta : TTipoConsulta;
    pChave : string;
    mCondicaoPagamento: CondicoesPagamentos;
begin
  aDaoParcelasCompras.carregar( pObj );

  mCondicaoPagamento := ParcelaCompra( pObj ).getCondicaoPagamento;
  aCtrlCondicoesPagamentos.pesquisar(aFilter, pChave);
end;

constructor ctrlParcelaCompra.crieObj;
begin
  aDaoParcelasCompras := daoParcelaCompra.crieObj;
end;

function ctrlParcelaCompra.DeleteListaParcelaCompra(
  const ACompra: Compras): Boolean;
begin
  aDaoParcelasCompras.DeleteListaParcelaCompra(ACompra);
end;

destructor ctrlParcelaCompra.destrua_se;
begin
  aDaoParcelasCompras.destrua_se;
  inherited;
end;

function ctrlParcelaCompra.excluir(pObj: TObject): string;
begin

end;

function ctrlParcelaCompra.getCtrlCondicoesPagamentos: ctrlCondicoesPagamentos;
begin
   result := getCtrlCondicoesPagamentos;
end;

function ctrlParcelaCompra.getDS: TObject;
begin
  Result:= aDaoParcelasCompras.getDS;
end;

function ctrlParcelaCompra.pesquisar(AFilter: TFilterSearch;
  pChave: string): string;
begin
   Result:= aDaoParcelasCompras.pesquisar(AFilter, pChave);
end;

function ctrlParcelaCompra.RetornaListaParcelaCompra(
  const ACompra: Compras): TObjectList<ParcelaCompra>;
begin
   Result := aDaoParcelasCompras.RetornaListaParcelaCompra(ACompra);
end;

function ctrlParcelaCompra.salvar(pObj: TObject): string;
begin
   aDaoParcelasCompras.salvar(pObj);
end;

function ctrlParcelaCompra.salvarParcelasCompras(
  lista: TObjectList<ParcelaCompra>): string;
begin
   aDaoParcelasCompras.salvarLista(lista);
end;

procedure ctrlParcelaCompra.setCtrlCondicoesPagamentos(
  pCtrl: ctrlCondicoesPagamentos);
begin
  aCtrlCondicoesPagamentos:= pCtrl;
end;

procedure ctrlParcelaCompra.setDM(pDM: TObject);
begin
  inherited;
  aDaoParcelasCompras.setDM(pDM);
end;

end.

