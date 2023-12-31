unit uDaoCargos;
interface
uses uDAO,
     uFilterSearch,
     uCargos,
     uDepartamentos;
type daoCargos = class( DAO )
  private
  protected
  public
    constructor crieObj;                              override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    procedure setPosicao( acodigo : integer );
    function VerificaExiste(oCargo:Cargos):Boolean;
    function ValidaExclusao(pObj : TObject):Boolean; override;
end;
implementation
uses
  System.SysUtils;
{ daoCargos }
function daoCargos.carregar(pObj: TObject): string;
var mCargo : Cargos; mDepartamento : Departamentos;
begin
  mCargo:= Cargos( pObj );
  mDepartamento:= mCargo.getoDepartamento;
  mCargo.setCodigo( aDM.QCargos.FieldByName('CODCARGO').Value );
  mCargo.setCargo( aDM.QCargos.FieldByName('CARGO').AsString );
  mDepartamento.setCodigo( aDM.QCargos.FieldByName('CODDEPARTAMENTO').Value );
  mCargo.setDataCad( aDM.QCargos.FieldByName('DATACAD').AsDateTime );
  mCargo.setUltAlt( aDM.QCargos.FieldByName('ULTALT').AsDateTime );
end;
constructor daoCargos.crieObj;
begin
  inherited;
end;
function daoCargos.excluir(pObj: TObject): string;
var
  mCargo : Cargos;
begin
  aDM.Transacao.StartTransaction;
  try
    mCargo  := Cargos(pObj);
    aDM.QCargos.Locate('CODCargo', mCargo.getCodigo, []);
    aDM.QCargos.Delete;
    aDM.Transacao.Commit;
//    Result := 'Pa�s exclu�do com sucesso!';
  except
    aDM.Transacao.Rollback;
    Result := '';
  end;
end;
function daoCargos.getDS: TObject;
begin
  Result:= aDM.DSCargos;
end;
function daoCargos.pesquisar(AFilter: TFilterSearch; pChave: string): string;
var msql : string;
begin
    msql:= 'SELECT * FROM CARGOS';
    case AFilter.TipoConsulta of
     TpCCodigo:
     begin
       msql:= 'SELECT * FROM CARGOS WHERE CODCARGO =' + IntToStr( AFilter.Codigo );
     end;
     TpCParam:
     begin
       msql:= ( 'SELECT * FROM CARGOS WHERE CARGO LIKE  ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
     end;
     TpCTODOS:
     begin
       msql:= 'SELECT * FROM CARGOS ORDER BY CODCARGO';
     end;
    end;
    aDM.QCargos.Active:= false;
    aDM.QCargos.SQL.Text:=msql;
    aDM.QCargos.Open;
    result:= '';
end;
function daoCargos.salvar(pObj: TObject): string;
var mCargo : Cargos; mDepartamento : Departamentos;
begin
  mCargo:= Cargos( pObj );
  mDepartamento:= mCargo.getoDepartamento;
  aDM.Transacao.StartTransaction;
  try
    if mCargo.getCodigo = 0 then
    begin
       aDM.QCargos.Insert;
       aDM.QCargos.FieldByName('DATACAD').AsDateTime:= now;
    end
    else
       aDM.QCargos.Edit;
    aDM.QCargos.FieldByName('CODCARGO').AsInteger:= mCargo.getCodigo;
    aDM.QCargos.FieldByName('CARGO').AsString:= mCargo.getCargo;
    aDM.QCargos.FieldByName('CODDEPARTAMENTO').AsInteger:= mDepartamento.getCodigo;
    aDM.QCargos.FieldByName('ULTALT').AsDateTime:= now;
    aDM.QCargos.Post;
    aDM.Transacao.Commit;
  except
    aDM.Transacao.Rollback;
  end;
end;
procedure daoCargos.setPosicao(acodigo: integer);
begin
  aDM.QCargos.Locate('CODCARGO', aCodigo, []);
end;

function daoCargos.ValidaExclusao(pObj: TObject): Boolean;
var
  mCargo : Cargos;
begin
  mCargo:= Cargos(pObj);
  Result := not(aDM.QFuncionarios.Locate('CODCARGO', mCargo.getCodigo, []));
end;

function daoCargos.VerificaExiste(oCargo: Cargos): Boolean;
begin
  if aDM.QCargos.Locate('CARGO', oCargo.getCargo, []) then
    result :=  ((oCargo.getCargo = aDM.QCargos.FieldByName('CARGO').asString)
      and (oCargo.getoDepartamento.getCodigo = aDM.QCargos.FieldByName('CODDEPARTAMENTO').asInteger))
  else
    result := false;
end;

end.
