unit uFormaPagamento;

interface

uses uPai;

type FormasPagamentos = class( Pai )
  private
  protected
    formaPagamento : string[80];
  public
    constructor crieObj;
    destructor destrua_se;
    procedure setFormaPagamento ( pFormaPagamento : string );
    function getFormaPagamento : string;
    function clone : FormasPagamentos;
    procedure limparDados;
end;

implementation

{ FormaPagamento }

constructor FormasPagamentos.crieObj;
begin
  inherited;
  self.limparDados;
end;

destructor FormasPagamentos.destrua_se;
begin

end;

function FormasPagamentos.getFormaPagamento: string;
begin
  Result:= formaPagamento;
end;

procedure FormasPagamentos.limparDados;
begin
  inherited;
  formaPagamento:= '';
end;

procedure FormasPagamentos.setFormaPagamento(pFormaPagamento: string);
begin
  formaPagamento:= pFormaPagamento;
end;

function FormasPagamentos.clone: FormasPagamentos;
begin
  Result:= FormasPagamentos.crieObj;
  Result.setCodigo(codigo);
  Result.setFormaPagamento( formaPagamento );
  Result.setDataCad(dataCad);
  Result.setUltAlt(ultAlt);
  Result.setCodUsu(codUsu);
end;

end.
