unit uDaoMarcas;
interface
uses uFilterSearch, uMarcas, uDAO;
type daoMarcas = class( DAO )
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
    function VerificaExiste(aChave:string):Boolean;
    function ValidaExclusao(pObj : TObject):Boolean; override;
end;
implementation
uses
  System.SysUtils;
{ daoMarcas }
function daoMarcas.carregar(pObj: TObject): string;
var mMarca : Marcas;
begin
  mMarca:= Marcas( pObj );
  mMarca.setCodigo( aDM.QMarcas.FieldByName('CODMARCA').Value );
  mMarca.setMarca( aDM.QMarcas.FieldByName('MARCA').AsString );
  mMarca.setDataCad( aDM.QMarcas.FieldByName('DATACAD').AsDateTime );
  mMarca.setUltAlt( aDM.QMarcas.FieldByName('ULTALT').AsDateTime );
end;
constructor daoMarcas.crieObj;
begin
  inherited;
end;
function daoMarcas.excluir(pObj: TObject): string;
var
  mMarca : Marcas;
begin
  aDM.Transacao.StartTransaction;
  try
    mMarca  := Marcas(pObj);
    aDM.QMarcas.Locate('CODMarca', mMarca.getCodigo, []);
    aDM.QMarcas.Delete;
    aDM.Transacao.Commit;
//    Result := 'Pa�s exclu�do com sucesso!';
  except
    aDM.Transacao.Rollback;
    Result := '';
  end;
end;
function daoMarcas.getDS: TObject;
begin
  Result:= aDM.DSMarcas;
end;
function daoMarcas.pesquisar(AFilter: TFilterSearch; pChave: string): string;
var msql : string;
begin
    msql:= 'SELECT * FROM MARCAS';
    case AFilter.TipoConsulta of
     TpCCodigo:
     begin
       msql:= 'SELECT * FROM MARCAS WHERE CODMARCA =' + IntToStr( AFilter.Codigo );
     end;
     TpCParam:
     begin
       msql:= ( 'SELECT * FROM MARCAS WHERE MARCA LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
     end;
     TpCTODOS:
     begin
       msql:= 'SELECT * FROM MARCAS ORDER BY CODMARCA';
     end;
    end;
    aDM.QMarcas.Active:= false;
    aDM.QMarcas.SQL.Text:=msql;
    aDM.QMarcas.Open;
    result:= '';
end;
function daoMarcas.salvar(pObj: TObject): string;
var mMarca : Marcas;
begin
  mMarca:= Marcas( pObj );
  aDM.Transacao.StartTransaction;
  try
    if mMarca.getCodigo = 0 then
    begin
       aDM.QMarcas.Insert;
       aDM.QMarcas.FieldByName('DATACAD').AsDateTime:= now;
    end
    else
       aDM.QMarcas.Edit;
    aDM.QMarcas.FieldByName('CODMARCA').AsInteger:= mMarca.getCodigo;
    aDM.QMarcas.FieldByName('MARCA').AsString:= mMarca.getMarca;
    aDM.QMarcas.FieldByName('ULTALT').AsDateTime:= now;
    aDM.QMarcas.Post;
    aDM.Transacao.Commit;
  except
    aDM.Transacao.Rollback;
  end;
end;
procedure daoMarcas.setPosicao(acodigo: integer);
begin
  aDM.QMarcas.Locate('CODMARCA', aCodigo, []);
end;

function daoMarcas.ValidaExclusao(pObj: TObject): Boolean;
var
  mMarca : Marcas;
begin
  mMarca:= Marcas(pObj);
  Result := not(aDM.QRoupas.Locate('CODMARCA', mMarca.getCodigo, []));
end;

function daoMarcas.VerificaExiste(aChave: string): Boolean;
begin
  Result := aDM.QMarcas.Locate('MARCA', aChave, []);
end;

end.