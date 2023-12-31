unit uDaoRoupas;
interface
uses uDAO, uFilterSearch, uGruposRoupas, uMarcas, uCores, uTamanhos,
  uFornecedores, uColecoes, uRoupas, Vcl.ComCtrls,
 Data.DB,   FireDAC.Comp.Client;

type daoRoupas = class( DAO )
  private
    function RetornaCodInserido:Integer;
  protected
  public
    constructor crieObj;                              override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar (  pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    function recuperar(var pRoupa: Roupas) : boolean;

end;
implementation
uses
  System.SysUtils;
{ daoRoupas }
function daoRoupas.carregar(pObj: TObject): string;
var mRoupa : Roupas; mGrupoRoupa : GruposRoupas; mMarca : Marcas; mCor : Cores;
    mTamanho : Tamanhos; mFornecedor : Fornecedores; mColecao : Colecoes;
begin
  mRoupa:= Roupas( pObj );
  mGrupoRoupa:= mRoupa.getoGrupoRoupa;
  mMarca:= mRoupa.getaMarca;
  mCor:= mRoupa.getaCor;
  mTamanho:= mRoupa.getoTamanho;
  mFornecedor:= mRoupa.getoFornecedor;
  mColecao:= mRoupa.getaColecao;
  mRoupa.setCodigo( aDM.QRoupas.FieldByName('COD_ROUPA').Value );
  mRoupa.setDescricao( aDM.QRoupas.FieldByName('DESCRICAO_ROUPA').AsString );
  mRoupa.setCodBarra( aDM.QRoupas.FieldByName('COD_BARRA').AsString );
  mRoupa.setReferencia( aDM.QRoupas.FieldByName('REFERENCIA').AsString );
  mRoupa.setCustoUnitario( aDM.QRoupas.FieldByName('VALOR_CUSTO').AsFloat );
  mRoupa.setLucro( aDM.QRoupas.FieldByName('LUCRO').AsFloat );
  mRoupa.setValorVenda( aDM.QRoupas.FieldByName('VALOR_VENDA').AsFloat );
  mRoupa.setObs( aDM.QRoupas.FieldByName('OBS').AsString );
  mRoupa.setDataCad( aDM.QRoupas.FieldByName('DATACAD').AsDateTime );
  mRoupa.setUltAlt( aDM.QRoupas.FieldByName('ULTALT').AsDateTime );
  mRoupa.setCodUsu( aDM.QRoupas.FieldByName('CODUSU').Value );
  mRoupa.getoGrupoRoupa.setCodigo( aDM.QRoupas.FieldByName('CODGRUPOROUPA').Value );
  mRoupa.getoGrupoRoupa.setGrupoRoupa( aDM.QRoupas.FieldByName('GRUPO_ROUPA').AsString );
  mRoupa.getaMarca.setCodigo( aDM.QRoupas.FieldByName('CODMARCA').Value );
  mRoupa.getaMarca.setMarca( aDM.QRoupas.FieldByName('MARCA').AsString );
  mRoupa.getaCor.setCodigo( aDM.QRoupas.FieldByName('CODCOR').Value );
  mRoupa.getoTamanho.setCodigo( aDM.QRoupas.FieldByName('CODTAMANHO').Value );
  mRoupa.getoFornecedor.setCodigo( aDM.QRoupas.FieldByName('CODFORNECEDOR').Value );
  mRoupa.getoFornecedor.setNomeRazaoSocial( aDM.QRoupas.FieldByName('FORNECEDOR').AsString );
  mRoupa.getaColecao.setCodigo( aDM.QRoupas.FieldByName('CODCOLECAO').Value );
  mRoupa.getaColecao.setColecao( aDM.QRoupas.FieldByName('COLECAO').AsString );
  mRoupa.setUnidadeMedida( aDM.QRoupas.FieldByName('UNIDADE_MEDIDA').Value );
end;
constructor daoRoupas.crieObj;
begin
  inherited;
end;
function daoRoupas.excluir(pObj: TObject): string;
var
  mRoupa : Roupas;
begin
  aDM.Transacao.StartTransaction;
  try
    mRoupa  := Roupas(pObj);
    aDM.QRoupas.Locate('COD_Roupa', mRoupa.getCodigo, []);
    aDM.QRoupas.Delete;
    aDM.Transacao.Commit;
//    Result := 'Pa�s exclu�do com sucesso!';
  except
    aDM.Transacao.Rollback;
    Result := '';
  end;
end;
function daoRoupas.getDS: TObject;
begin
  Result:= aDM.DSRoupas;
end;
function daoRoupas.pesquisar(AFilter: TFilterSearch; pChave: string): string;
var msql : string;
begin
    msql:= 'SELECT * FROM ROUPAS';
    case AFilter.TipoConsulta of
     TpCCodigo:
     begin
       msql:= 'SELECT * FROM ROUPAS WHERE COD_ROUPA =' + IntToStr( AFilter.Codigo );
     end;
     TpCParam:
     begin
       msql:= ( 'SELECT * FROM ROUPAS WHERE DESCRICAO_ROUPA LIKE  ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
     end;
     TpCTODOS:
     begin
       msql:= 'SELECT * FROM ROUPAS ORDER BY COD_ROUPA';
     end;
    end;
    aDM.QRoupas.Active:= false;
    aDM.QRoupas.SQL.Text:=msql;
    aDM.QRoupas.Open;
    result:= '';
end;
function daoRoupas.recuperar(var pRoupa: Roupas): boolean;
var
  AQuery  : TFDQuery;
begin
  Result := false;
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection  := adm.Conexao;
    AQuery.Transaction := aDM.Transacao;

    if (AQuery.Active) then
     AQuery.Close;
    AQuery.SQL.Clear;

    AQuery.SQL.Add('SELECT * FROM ROUPAS');
    AQuery.SQL.Add('WHERE COD_ROUPA = :COD_ROUPA ');
    AQuery.ParamByName('COD_ROUPA').AsInteger := pRoupa.getCodigo;

    AQuery.Open;

    AQuery.First;

    while not(AQuery.Eof) do
    begin

      with pRoupa, AQuery do
      begin
        setCodigo( aDM.QRoupas.FieldByName('COD_ROUPA').Value );
        setDescricao( aDM.QRoupas.FieldByName('DESCRICAO_ROUPA').AsString );
        setCodBarra( aDM.QRoupas.FieldByName('COD_BARRA').AsString );
        setReferencia( aDM.QRoupas.FieldByName('REFERENCIA').AsString );
        setCustoUnitario( aDM.QRoupas.FieldByName('VALOR_CUSTO').AsFloat );
        setLucro( aDM.QRoupas.FieldByName('LUCRO').AsFloat );
        setValorVenda( aDM.QRoupas.FieldByName('VALOR_VENDA').AsFloat );
        setObs( aDM.QRoupas.FieldByName('OBS').AsString );
        setDataCad( aDM.QRoupas.FieldByName('DATACAD').AsDateTime );
        setUltAlt( aDM.QRoupas.FieldByName('ULTALT').AsDateTime );
        setCodUsu( aDM.QRoupas.FieldByName('CODUSU').Value );
        getoGrupoRoupa.setCodigo( aDM.QRoupas.FieldByName('CODGRUPOROUPA').Value );
        getoGrupoRoupa.setGrupoRoupa( aDM.QRoupas.FieldByName('GRUPO_ROUPA').AsString );
        getaMarca.setCodigo( aDM.QRoupas.FieldByName('CODMARCA').Value );
        getaMarca.setMarca( aDM.QRoupas.FieldByName('MARCA').AsString );
        getaCor.setCodigo( aDM.QRoupas.FieldByName('CODCOR').Value );
        getoTamanho.setCodigo( aDM.QRoupas.FieldByName('CODTAMANHO').Value );
        getoFornecedor.setCodigo( aDM.QRoupas.FieldByName('CODFORNECEDOR').Value );
        getoFornecedor.setNomeRazaoSocial( aDM.QRoupas.FieldByName('FORNECEDOR').AsString );
        getaColecao.setCodigo( aDM.QRoupas.FieldByName('CODCOLECAO').Value );
        getaColecao.setColecao( aDM.QRoupas.FieldByName('COLECAO').AsString );
        setUnidadeMedida( aDM.QRoupas.FieldByName('UNIDADE_MEDIDA').Value );
      end;

      Result := True;
      AQuery.Next;
    end;

    AQuery.Close;
  finally
    FreeAndNil(AQuery);
  end;
end;

function daoRoupas.RetornaCodInserido: Integer;
const
  SQL =//consulta que retorna qual a posi��o atual do generator da tabela
    'select gen_id(gen_Roupas, 0) as new_id from rdb$database';
var
  aQuery : TFDQuery;
begin
  aQuery := TFDQuery.Create(nil);
  try
    aQuery.Connection  := aDM.Conexao;
    aQuery.Transaction := aDM.Transacao;
    if aQuery.Active then
      aQuery.Close;
    aQuery.SQL.Clear;
    aQuery.SQL.Add(SQL);
    aQuery.Open;
    if not(aQuery.IsEmpty) then
      Result := aQuery.FieldByName('NEW_ID').AsInteger
    else
      Result := 0;
  finally
    FreeAndNil(aQuery);
  end;
end;

function daoRoupas.salvar( pObj: TObject): string;
var mRoupa : Roupas; mGrupoRoupa : GruposRoupas; mMarca : Marcas; mCor : Cores;
    mTamanho : Tamanhos; mFornecedor : Fornecedores; mColecao : Colecoes;
begin
  mRoupa:= Roupas( pObj );
  mGrupoRoupa:= mRoupa.getoGrupoRoupa;
  mMarca:= mRoupa.getaMarca;
  mCor:= mRoupa.getaCor;
  mTamanho:= mRoupa.getoTamanho;
  mFornecedor:= mRoupa.getoFornecedor;
  mColecao:= mRoupa.getaColecao;
  aDM.Transacao.StartTransaction;
  try
    if mRoupa.getCodigo = 0 then
    begin
       aDM.QRoupas.Insert;
       aDM.QRoupas.FieldByName('DATACAD').AsDateTime:= now;
    end
    else
       aDM.QRoupas.Edit;
    aDM.QRoupas.FieldByName('COD_ROUPA').AsInteger:= mRoupa.getCodigo;
    aDM.QRoupas.FieldByName('DESCRICAO_ROUPA').AsString:= mRoupa.getDescricao;
    aDM.QRoupas.FieldByName('COD_BARRA').AsString:= mRoupa.getCodBarra;
    aDM.QRoupas.FieldByName('REFERENCIA').AsString:= mRoupa.getReferencia;
    aDM.QRoupas.FieldByName('VALOR_CUSTO').AsFloat:= mRoupa.getCustoUnitario;
    aDM.QRoupas.FieldByName('LUCRO').AsFloat:= mRoupa.getLucro;
    aDM.QRoupas.FieldByName('VALOR_VENDA').AsFloat:= mRoupa.getValorVenda;
    aDM.QRoupas.FieldByName('OBS').AsString:= mRoupa.getObs;
    aDM.QRoupas.FieldByName('ULTALT').AsDateTime:= now;
    aDM.QRoupas.FieldByName('CODUSU').AsInteger:= mRoupa.getCodUsu;
    aDM.QRoupas.FieldByName('CODGRUPOROUPA').AsInteger := mGrupoRoupa.getCodigo;
    aDM.QRoupas.FieldByName('GRUPO_ROUPA').AsString := mGrupoRoupa.getGrupoRoupa;
    aDM.QRoupas.FieldByName('CODMARCA').AsInteger := mMarca.getCodigo;
    aDM.QRoupas.FieldByName('MARCA').AsString := mMarca.getMarca;
    aDM.QRoupas.FieldByName('CODCOR').AsInteger := mCor.getCodigo;
    aDM.QRoupas.FieldByName('CODTAMANHO').AsInteger := mTamanho.getCodigo;
    aDM.QRoupas.FieldByName('CODFORNECEDOR').AsInteger := mFornecedor.getCodigo;
    aDM.QRoupas.FieldByName('FORNECEDOR').AsString := mFornecedor.getNomeRazaoSocial;
    aDM.QRoupas.FieldByName('CODCOLECAO').AsInteger:= mColecao.getCodigo;
    aDM.QRoupas.FieldByName('COLECAO').AsString := mColecao.getColecao;
    aDM.QRoupas.FieldByName('UNIDADE_MEDIDA').AsString:= mRoupa.getUnidadeMedida;
    aDM.QRoupas.Post;
    aDM.Transacao.Commit;
    result := 'SUCESSO';
    if  mRoupa.getCodigo = 0 then
      mRoupa.setCodigo( Self.RetornaCodInserido);
  except
    aDM.Transacao.Rollback;
  end;
end;
end.
