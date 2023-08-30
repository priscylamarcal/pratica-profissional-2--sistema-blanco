unit uColecoes;

interface

uses uPai;

type Colecoes = class( Pai )
  private
  protected
     colecao : string[80];
  public
     constructor crieObj;
     destructor destrua_se;
     procedure setColecao ( pColecao : string );
     function getColecao : string;
     function clone : Colecoes;
     procedure limparDados;
end;

implementation

{ colecoes }

constructor Colecoes.crieObj;
begin
  inherited;
  self.limparDados;
end;

destructor Colecoes.destrua_se;
begin

end;

function Colecoes.getColecao: string;
begin
  Result:= colecao;
end;

procedure Colecoes.limparDados;
begin
  inherited;
  colecao := '';
end;

procedure Colecoes.setColecao(pColecao: string);
begin
  colecao:= pColecao;
end;

function Colecoes.clone: Colecoes;
begin
  Result:= Colecoes.crieObj;
  Result.setCodigo( codigo );
  Result.setColecao( colecao );
  Result.setDataCad( dataCad );
  Result.setUltAlt( ultAlt );
  Result.setCodUsu( codUsu );
end;

end.
