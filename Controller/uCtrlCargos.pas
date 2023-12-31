unit uCtrlCargos;
interface
uses uController, uCtrlDepartamentos, uDepartamentos, uDaoCargos, uCargos,
  uFilterSearch;
type ctrlCargos = class( Ctrl )
  private
  protected
    aDaoCargos : daoCargos;
    aCtrlDepartamentos : ctrlDepartamentos;
    oCargo : Cargos;
  public
    constructor crieObj;                              override;
    destructor destrua_se;                            override;
    procedure setDM ( pDM : TObject );                override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    procedure setCtrlDepartamentos ( pCtrl : ctrlDepartamentos );
    function getCtrlDepartamentos : ctrlDepartamentos;
    procedure setPosicao( acodigo : integer );
    function VerificaExiste(oCargo:Cargos):Boolean;
    function ValidaExclusao(pObj : TObject):Boolean; override;
end;
implementation
uses
  System.SysUtils;
{ ctrlCargos }
function ctrlCargos.carregar(pObj: TObject): string;
var mDepartamento : Departamentos; AFilter : TFilterSearch; pChave : string;
begin
  aDaoCargos.carregar( pObj );

  aCtrlDepartamentos.setPosicao(Cargos( pObj ).getoDepartamento.GetCodigo);
  mDepartamento:= Cargos( pObj ).getoDepartamento;
  aCtrlDepartamentos.carregar( TObject ( mDepartamento ) );
end;
constructor ctrlCargos.crieObj;
begin
  aDaoCargos:= daoCargos.crieObj;
end;
destructor ctrlCargos.destrua_se;
begin
  aDaoCargos.destrua_se;
end;
function ctrlCargos.excluir(pObj: TObject): string;
begin
  aDaoCargos.excluir(pObj);
end;
function ctrlCargos.getCtrlDepartamentos: ctrlDepartamentos;
begin
  Result:= aCtrlDepartamentos;
end;
function ctrlCargos.getDS: TObject;
begin
  Result:= aDaoCargos.getDS;
end;
function ctrlCargos.pesquisar(AFilter: TFilterSearch; pChave: string): string;
begin
  Result:= aDaoCargos.pesquisar( AFilter, pChave );
end;
function ctrlCargos.salvar(pObj: TObject): string;
begin
  aDaoCargos.salvar( pObj );
end;
procedure ctrlCargos.setCtrlDepartamentos(pCtrl: ctrlDepartamentos);
begin
  aCtrlDepartamentos:= pCtrl;
end;
procedure ctrlCargos.setDM(pDM: TObject);
begin
  inherited;
  aDaoCargos.setDM( pDM );
end;
procedure ctrlCargos.setPosicao(acodigo: integer);
begin
  aDaoCargos.setPosicao(aCodigo);
end;

function ctrlCargos.ValidaExclusao(pObj: TObject): Boolean;
begin
  result := aDaoCargos.ValidaExclusao(pObj);
end;

function ctrlCargos.VerificaExiste(oCargo: Cargos): Boolean;
begin
  Result := aDaoCargos.VerificaExiste(oCargo);
end;

end.
