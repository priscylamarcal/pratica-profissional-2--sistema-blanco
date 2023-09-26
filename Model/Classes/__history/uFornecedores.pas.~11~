unit uFornecedores;

interface

uses uPessoas, uCondicoesPagamentos;

type
  Fornecedores = class(Pessoas)
  private
  protected
    umaCondicao: CondicoesPagamentos;
    tipo_forn: string[20];
    data: TDateTime;
    obs: string[250];
  public
    constructor crieObj;
    destructor destrua_se;

    procedure setaCondicao(pCondicao: CondicoesPagamentos);
    procedure setTipoForn(pTipoForn: string);
    procedure setData(pData: TDateTime);
    procedure setObs ( pObs : string );

    function getaCondicao: CondicoesPagamentos;
    function getTipoForn: string;
    function getData: TDateTime;
    function getObs: string;
    function clone : Fornecedores;
    procedure limparDados;
end;
implementation

{ Fornecedores }
constructor Fornecedores.crieObj;
begin
  inherited;
  umaCondicao:= CondicoesPagamentos.crieObj;
  Self.LimparDados;
end;

destructor Fornecedores.destrua_se;
begin
  umaCondicao.destrua_se;
end;

function Fornecedores.getaCondicao: CondicoesPagamentos;
begin
  Result := umaCondicao;
end;

function Fornecedores.getData: TDateTime;
begin
  Result := data;
end;

function Fornecedores.getObs: string;
begin
  Result:= obs;
end;

function Fornecedores.getTipoForn: string;
begin
  Result := tipo_forn;
end;
procedure Fornecedores.limparDados;
begin
  inherited;
  umaCondicao.LimparDados;
end;

procedure Fornecedores.setaCondicao(pCondicao: CondicoesPagamentos);
begin
  umaCondicao := pCondicao;
end;

procedure Fornecedores.setData(pData: TDateTime);
begin
  data := pData;
end;

procedure Fornecedores.setObs(pObs: string);
begin
  obs:= pObs;
end;

procedure Fornecedores.setTipoForn(pTipoForn: string);
begin
  tipo_forn := pTipoForn;
end;

function Fornecedores.clone: Fornecedores;
begin
  Result := Fornecedores.crieObj;
  Result.setCodigo(codigo);
  Result.setDataCad(dataCad);
  Result.setUltAlt(ultAlt);
  Result.setCodUsu(codUsu);
  Result.setNomeRazaoSocial(nome_razao_social);
  Result.setApelidoFantasia(apelido_fantasia);
  Result.setEndereco(endereco);
  Result.setNumero(numero);
  Result.setComplemento(complemento);
  Result.setBairro(bairro);
  Result.setCep(cep);
  Result.setaCidade(umaCidade.clone);
  Result.setoContato(umContato.clone);
  Result.setContatoAux1(contato_aux1);
  Result.setContatoAux2(contato_aux2);
  Result.setCnpjCpf(cnpj_cpf);
  Result.setIeRg(ie_rg);
  Result.setaCondicao(umaCondicao.clone);
  Result.setTipoForn(tipo_forn);
  Result.setData(data);
  Result.setObs(obs);
end;

end.
