unit uCtrlFuncionarios;
interface
uses uController, uDaoFuncionarios, uFilterSearch, uCtrlCidades,
  uCtrlTiposContatos, uCtrlCargos, uCidades, uTiposContatos, uCargos,
  uFuncionarios;
type ctrlFuncionarios = class( Ctrl )
  private
  protected
    aDaoFuncionarios : daoFuncionarios;
    aCtrlCidades : ctrlCidades;
    aCtrlTiposContatos : ctrlTiposContatos;
    aCtrlCargos : ctrlCargos;
  public
    constructor crieObj;                              override;
    destructor destrua_se;                            override;
    procedure setDM ( pDM : TObject );                override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    procedure setCtrlCidades ( pCtrl : ctrlCidades );
    procedure setCtrlTiposContatos ( pCtrl : ctrlTiposContatos );
    procedure setCtrlCargos ( pCtrl : ctrlCargos );
    procedure setPosicao( acodigo : integer );
    function getCtrlCidades : ctrlCidades;
    function getCtrlTiposContatos : ctrlTiposContatos;
    function getCtrlCargos : ctrlCargos;

    function VerificaExiste(oFuncionario: Funcionarios):Boolean;
    function ValidaExclusao(pObj : TObject):Boolean; override;


end;
implementation
{ ctrlFuncionarios }
function ctrlFuncionarios.carregar(pObj: TObject): string;
var mCidade : Cidades; mContato : TiposContatos; mFuncionario : Funcionarios;
    AFilter : TFilterSearch; pchave : string; mCargo : Cargos;
begin
  aDaoFuncionarios.carregar( pObj );

  aCtrlCidades.setPosicao(Funcionarios( pObj ).getaCidade.GetCodigo);
  mCidade:= Funcionarios( pObj ).getaCidade;
  aCtrlCidades.carregar( TObject ( mCidade ) );

  aCtrlTiposContatos.setPosicao(Funcionarios( pObj ).getoContato.GetCodigo);
  mContato:= Funcionarios( pObj ).getoContato;
  aCtrlTiposContatos.carregar( TObject ( mContato ) );

  aCtrlCargos.setPosicao(Funcionarios( pObj ).getoCargo.GetCodigo);
  mCargo:= Funcionarios( pObj ).getoCargo;
  aCtrlCargos.carregar( TObject ( mCargo ) );
end;
constructor ctrlFuncionarios.crieObj;
begin
  aDaoFuncionarios:= daoFuncionarios.crieObj;
end;
destructor ctrlFuncionarios.destrua_se;
begin
  aDaoFuncionarios.destrua_se;
end;
function ctrlFuncionarios.excluir(pObj: TObject): string;
begin
  result := aDaoFuncionarios.excluir(pObj);
end;
function ctrlFuncionarios.getCtrlCargos: ctrlCargos;
begin
  Result:= aCtrlCargos;
end;
function ctrlFuncionarios.getCtrlCidades: ctrlCidades;
begin
  Result:= aCtrlCidades;
end;
function ctrlFuncionarios.getCtrlTiposContatos: ctrlTiposContatos;
begin
  Result:= aCtrlTiposContatos;
end;
function ctrlFuncionarios.getDS: TObject;
begin
  Result:= aDaoFuncionarios.getDS;
end;
function ctrlFuncionarios.pesquisar(AFilter: TFilterSearch;
  pChave: string): string;
begin
 Result := aDaoFuncionarios.Pesquisar( AFilter, pChave );
end;
function ctrlFuncionarios.salvar(pObj: TObject): string;
begin
  aDaoFuncionarios.salvar( pObj );
end;
procedure ctrlFuncionarios.setCtrlCargos(pCtrl: ctrlCargos);
begin
  aCtrlCargos:= pCtrl;
end;
procedure ctrlFuncionarios.setCtrlCidades(pCtrl: ctrlCidades);
begin
  aCtrlCidades:= pCtrl;
end;
procedure ctrlFuncionarios.setCtrlTiposContatos(pCtrl: ctrlTiposContatos);
begin
  aCtrlTiposContatos:= pCtrl;
end;
procedure ctrlFuncionarios.setDM(pDM: TObject);
begin
  inherited;
  aDaoFuncionarios.setDM( pDM );
end;
procedure ctrlFuncionarios.setPosicao(acodigo: integer);
begin
  aDaoFuncionarios.setPosicao(aCodigo);
end;

function ctrlFuncionarios.ValidaExclusao(pObj: TObject): Boolean;
begin
  result := aDaoFuncionarios.ValidaExclusao(pObj);
end;

function ctrlFuncionarios.VerificaExiste(oFuncionario: Funcionarios): Boolean;
begin
  result := aDaoFuncionarios.VerificaExiste(oFuncionario);
end;

end.
