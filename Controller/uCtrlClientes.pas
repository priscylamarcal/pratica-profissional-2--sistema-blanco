unit uCtrlClientes;

interface

uses uController, uFilterSearch, uDaoClientes, uCtrlCidades,
  uCtrlCondicoesPagamentos, uCtrlFuncionarios, uCtrlTiposContatos, uClientes,
  uFuncionarios, uCtrlContatos;

type
  ctrlClientes = class(Ctrl)
  private
  protected
    aDaoClientes: daoClientes;
    aCtrlCidades: ctrlCidades;
    aCtrlTiposContatos: ctrlTiposContatos;
    aCtrlFuncionarios: ctrlFuncionarios;
    aCtrlCondicoes: ctrlCondicoesPagamentos;
    aCtrlContatos: ctrlContatos;
  public
    constructor crieObj; override;
    destructor destrua_se; override;
    procedure setDM(pDM: TObject); override;
    function getDS: TObject; override;
    function pesquisar(AFilter: TFilterSearch; pChave: string): string;
      override;
    function salvar(pObj: TObject): string; override;
    function excluir(pObj: TObject): string; override;
    function carregar(pObj: TObject): string; override;
    procedure setCtrlCidades(pCtrl: ctrlCidades);
    procedure setCtrlTiposContatos(pCtrl: ctrlTiposContatos);
    procedure setCtrlFuncionarios(pCtrl: ctrlFuncionarios);
    procedure setCtrlCondicoes(pCtrl: ctrlCondicoesPagamentos);
    procedure setCtrlContatos ( pCtrl : ctrlContatos );
    function getCtrlCidades: ctrlCidades;
    function getCtrlTiposContatos: ctrlTiposContatos;
    function getCtrlFuncionarios: ctrlFuncionarios;
    function getCtrlCondicoes: ctrlCondicoesPagamentos;
    procedure setPosicao(acodigo: integer);
    function VerificaExiste(oCliente: Clientes): Boolean;
  end;

implementation

uses
  uCidades, uTiposContatos, uCondicoesPagamentos;

{ ctrlClientes }
function ctrlClientes.carregar(pObj: TObject): string;
var
  mCliente: Clientes;
  mCidade: Cidades;
  //mContato: TiposContatos;
  mCondicao: CondicoesPagamentos;
  mFuncionario: Funcionarios;
  AFilter: TFilterSearch;
  pChave: string;
begin
  aDaoClientes.carregar(pObj);
  aCtrlCidades.setPosicao(Clientes(pObj).getaCidade.GetCodigo);
  mCidade := Clientes(pObj).getaCidade;
  aCtrlCidades.carregar(TObject(mCidade));
//  aCtrlTiposContatos.setPosicao(Clientes(pObj).getoContato.GetCodigo);
//  mContato := Clientes(pObj).getoContato;
//  aCtrlTiposContatos.carregar(TObject(mContato));
  aCtrlFuncionarios.setPosicao(Clientes(pObj).getoFuncionario.GetCodigo);
  mFuncionario := Clientes(pObj).getoFuncionario;
  aCtrlFuncionarios.carregar(TObject(mFuncionario));
  aCtrlCondicoes.setPosicao(Clientes(pObj).getaCondicao.GetCodigo);
  mCondicao := Clientes(pObj).getaCondicao;
  aCtrlCondicoes.carregar(TObject(mCondicao));
  Clientes(pObj).setListaContatos(aCtrlContatos.RetornaListaContatos
    (Clientes(pObj).getCodigo, 0));
end;

constructor ctrlClientes.crieObj;
begin
  aDaoClientes := daoClientes.crieObj;
end;

destructor ctrlClientes.destrua_se;
begin
  aDaoClientes.destrua_se;
end;

function ctrlClientes.excluir(pObj: TObject): string;
begin
  if aCtrlContatos.DeleteListaContatos(Funcionarios(pObj).getCodigo, 0) then
    result := aDaoClientes.excluir(pObj);
end;

function ctrlClientes.getCtrlCidades: ctrlCidades;
begin
  result := aCtrlCidades;
end;

function ctrlClientes.getCtrlCondicoes: ctrlCondicoesPagamentos;
begin
  result := aCtrlCondicoes;
end;

function ctrlClientes.getCtrlFuncionarios: ctrlFuncionarios;
begin
  result := aCtrlFuncionarios;
end;

function ctrlClientes.getCtrlTiposContatos: ctrlTiposContatos;
begin
  result := aCtrlTiposContatos;
end;

function ctrlClientes.getDS: TObject;
begin
  result := aDaoClientes.getDS;
end;

function ctrlClientes.pesquisar(AFilter: TFilterSearch; pChave: string): string;
begin
  result := aDaoClientes.pesquisar(AFilter, pChave);
end;

function ctrlClientes.salvar(pObj: TObject): string;
begin
  if aDaoClientes.salvar( pObj ) = 'SUCESSO' then
  begin
    aCtrlContatos.DeleteListaContatos(Clientes(pObj).getCodigo, 0);
    Clientes(pObj).setCodigoListaContatos;
    aCtrlContatos.salvarContato(Clientes(pObj).getListaContatos);
  end;
end;

procedure ctrlClientes.setCtrlCidades(pCtrl: ctrlCidades);
begin
  aCtrlCidades := pCtrl;
end;

procedure ctrlClientes.setCtrlCondicoes(pCtrl: ctrlCondicoesPagamentos);
begin
  aCtrlCondicoes := pCtrl;
end;

procedure ctrlClientes.setCtrlContatos(pCtrl: ctrlContatos);
begin
  aCtrlContatos := pCtrl;
end;

procedure ctrlClientes.setCtrlFuncionarios(pCtrl: ctrlFuncionarios);
begin
  aCtrlFuncionarios := pCtrl;
end;

procedure ctrlClientes.setCtrlTiposContatos(pCtrl: ctrlTiposContatos);
begin
  aCtrlTiposContatos := pCtrl;
end;

procedure ctrlClientes.setDM(pDM: TObject);
begin
  inherited;
  aDaoClientes.setDM(pDM);
end;

procedure ctrlClientes.setPosicao(acodigo: integer);
begin
  aDaoClientes.setPosicao(acodigo);
end;

function ctrlClientes.VerificaExiste(oCliente: Clientes): Boolean;
begin
  result := aDaoClientes.VerificaExiste(oCliente);
end;

end.
