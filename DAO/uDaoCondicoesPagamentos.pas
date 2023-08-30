unit uDaoCondicoesPagamentos;
interface
uses uDAO, uFilterSearch, uCondicoesPagamentos, uFormaPagamento,
System.Generics.Collections, uParcelas;
type daoCondicoesPagamentos = class ( DAO )
  private
    function RetornaCodInserido:Integer;
  protected
  public
    constructor crieObj;                              override;
    function getDS : TObject;                         override;
    function pesquisar ( AFilter: TFilterSearch; pChave : string ): string; override;
    function salvar ( pObj : TObject ) : string;      override;
    function excluir ( pObj : TObject ) : string;     override;
    function carregar ( pObj : TObject ) : string;    override;
    procedure setPosicao( acodigo : integer );
end;
implementation
uses
  System.SysUtils, Vcl.ComCtrls,
  uDaoParcelas, Data.DB,   FireDAC.Comp.Client;
{ daoCondicoesPagamentos }
function daoCondicoesPagamentos.carregar(pObj: TObject): string;
var mForma : FormasPagamentos; mCondicao : CondicoesPagamentos;
begin
  mCondicao:= CondicoesPagamentos( pObj );
  mForma:= mCondicao.getaFormaPgto;
  mCondicao.setCodigo( aDM.QCondicoes.FieldByName('CODCONDICAO').Value );
  mCondicao.setCondicao( aDM.QCondicoes.FieldByName('CONDICAO').AsString );
  mCondicao.setJuros( aDM.QCondicoes.FieldByName('JUROS').AsFloat );
  mCondicao.setMulta( aDM.QCondicoes.FieldByName('MULTA').AsFloat );
  mCondicao.setDesconto( aDM.QCondicoes.FieldByName('DESCONTO').AsFloat );
  mCondicao.setDataCad( aDM.QCondicoes.FieldByName('DATACAD').AsDateTime );
  mCondicao.setUltAlt( aDM.QCondicoes.FieldByName('ULTALT').AsDateTime );
end;
constructor daoCondicoesPagamentos.crieObj;
begin
  inherited;
end;
function daoCondicoesPagamentos.excluir(pObj: TObject): string;
begin
  if aDM.QCondicoes.Active then
    aDM.QCondicoes.Close;
  adm.QCondicoes.SQL.Clear;
  if not aDM.Conexao.InTransaction then
    aDM.Transacao.StartTransaction;
  try
    aDM.QCondicoes.SQL.Add('delete from CONDICOES_PAGAMENTOS where CODCONDICAO = :CODCONDICAO');
    aDM.QCondicoes.ParamByName('CODCONDICAO').AsInteger := CondicoesPagamentos(pObj).getCodigo;
    aDM.QCondicoes.ExecSQL;
    aDM.Transacao.Commit;
    Result := 'S'
  except
    on e: Exception do
    begin
      raise Exception.Create('Erro:' + e.Message);
      Result := e.Message;
      aDM.Transacao.Rollback;
    end;
  end;
end;
function daoCondicoesPagamentos.getDS: TObject;
begin
  Result:= aDM.DSCondicoes;
end;
function daoCondicoesPagamentos.pesquisar(AFilter: TFilterSearch;
  pChave: string): string;
var msql : string;
begin
    msql:= 'SELECT * FROM CONDICOES_PAGAMENTOS';
    case AFilter.TipoConsulta of
     TpCCodigo:
     begin
       msql:= 'SELECT * FROM CONDICOES_PAGAMENTOS WHERE CODCONDICAO =' + IntToStr( AFilter.Codigo );
     end;
     TpCParam:
     begin
       msql:= ( 'SELECT * FROM CONDICOES_PAGAMENTOS WHERE CONDICAO LIKE  ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
     end;
     TpCTODOS:
     begin
       msql:= 'SELECT * FROM CONDICOES_PAGAMENTOS ORDER BY CODCONDICAO';
     end;
    end;
    aDM.QCondicoes.Active:= false;
    aDM.QCondicoes.SQL.Text:=msql;
    aDM.QCondicoes.Open;
    result:= '';
end;
function daoCondicoesPagamentos.RetornaCodInserido: Integer;
const
  SQL =//consulta que retorna qual a posição atual do generator da tabela
    'select gen_id(gen_condicoes_pagamentos, 0) as new_id from rdb$database';
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
function daoCondicoesPagamentos.salvar(pObj: TObject): string;
var
//  mForma : FormasPagamentos;
  mCondicao : CondicoesPagamentos;
 // item : TListItem;
 // lista : TListView;
begin
  mCondicao:= CondicoesPagamentos( pObj );
//  mForma:= mCondicao.getaFormaPgto;
  aDM.Transacao.StartTransaction;
  try
    if mCondicao.getCodigo = 0 then
    begin
      aDM.QCondicoes.Insert;
      aDM.QCondicoes.FieldByName('DATACAD').AsDateTime    := now;
    end
    else
      aDM.QCondicoes.Edit;
    aDM.QCondicoes.FieldByName('CODCONDICAO').AsInteger := mCondicao.getCodigo;
    aDM.QCondicoes.FieldByName('CONDICAO').AsString     := mCondicao.getCondicao;
    aDM.QCondicoes.FieldByName('ULTALT').AsDateTime     := now;
    aDM.QCondicoes.FieldByName('JUROS').AsFloat         := mCondicao.getJuros;
    aDM.QCondicoes.FieldByName('DESCONTO').AsFloat      := mCondicao.getDesconto;
    aDM.QCondicoes.FieldByName('MULTA').AsFloat         := mCondicao.getMulta;

    aDM.QCondicoes.Post;
    aDM.Transacao.Commit;
    Result:= 'SUCESSO' ;
    //pega o código do ultimo registro adicionado quando insere um novo registro
    if  mCondicao.getCodigo = 0 then
      mCondicao.setCodigo( Self.RetornaCodInserido);
  except
    Result:= '';
    aDM.Transacao.Rollback;
  end;
end;
procedure daoCondicoesPagamentos.setPosicao(acodigo: integer);
begin
  aDM.QCondicoes.Locate('CODCONDICAO', aCodigo, []);
end;

end.

