unit uParcelas;
interface
uses Classes,
     SysUtils,
     uPai,
     uFormaPagamento;
type Parcela = class (Pai)
  private
  protected
     dias         : integer;
     parcelas     : integer;
     porcentagem  : currency;
     umaFormaPgto : FormasPagamentos;
     codCondPgto  : integer;
  public
     constructor crieObj;
     destructor destrua_se;
     procedure setDias ( pDias : integer );
     procedure setParcelas ( pParcelas : integer );
     procedure setPorcentagem ( pPorcentagem : currency );
     procedure setaFormaPgto ( paFormaPgto : FormasPagamentos );
     procedure setCodCondPgto ( pCodCondPgto : integer );
     function getDias : integer;
     function getParcelas : integer;
     function getPorcentagem : currency;
     function getaFormaPgto : FormasPagamentos;
     function getCodCondPgto : integer;
     function clone : Parcela;
     procedure limparDados;
end;
implementation
{ Parcelas }
function Parcela.clone: Parcela;
begin
  Result:= Parcela.crieObj;
  Result.setCodigo(codigo);
  Result.setDias(dias);
  Result.setParcelas(parcelas);
  Result.setPorcentagem(porcentagem);
  Result.setaFormaPgto(umaFormaPgto.clone);
  Result.setCodCondPgto( codCondPgto );
  Result.setDataCad(dataCad);
  Result.setUltAlt(ultAlt);
  Result.setCodUsu(codUsu);
end;
constructor Parcela.crieObj;
begin
  inherited;
  umaFormaPgto:= FormasPagamentos.crieObj;
  limparDados;
end;
destructor Parcela.destrua_se;
begin
  umaFormaPgto.destrua_se;
end;
function Parcela.getaFormaPgto: FormasPagamentos;
begin
  Result:= umaFormaPgto;
end;
function Parcela.getCodCondPgto: integer;
begin
  Result:= codCondPgto;
end;
function Parcela.getDias: integer;
begin
  Result:= dias;
end;
function Parcela.getParcelas: integer;
begin
  Result:= parcelas;
end;
function Parcela.getPorcentagem: currency;
begin
  Result:= porcentagem;
end;
procedure Parcela.limparDados;
begin
  inherited;
  codCondPgto:= 0;
  dias:= 0;
  parcelas:= 0;
  porcentagem:= 0;
  umaFormaPgto.limparDados;
end;

procedure Parcela.setaFormaPgto(paFormaPgto: FormasPagamentos);
begin
  umaFormaPgto:= paFormaPgto;
end;
procedure Parcela.setCodCondPgto(pCodCondPgto: integer);
begin
  codCondPgto:= pCodCondPgto;
end;
procedure Parcela.setDias(pDias: integer);
begin
  dias:= pDias;
end;
procedure Parcela.setParcelas(pParcelas: integer);
begin
  parcelas:= pParcelas;
end;
procedure Parcela.setPorcentagem(pPorcentagem: currency);
begin
  porcentagem:= pPorcentagem;
end;
end.
