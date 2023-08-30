unit uCtrlTamanhos;
interface
uses uController, uFilterSearch, uDaoTamanhos;
type ctrlTamanhos = class( Ctrl )
  private
  protected
    aDaoTamanhos : daoTamanhos;
  public
    constructor crieObj;                              override;
    destructor destrua_se;                            override;
    procedure setDM ( pDM : TObject );                override;
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
{ ctrlTamanhos }
function ctrlTamanhos.carregar(pObj: TObject): string;
begin
  aDaoTamanhos.carregar( pObj );
end;
constructor ctrlTamanhos.crieObj;
begin
  aDaoTamanhos:= daoTamanhos.crieObj;
end;
destructor ctrlTamanhos.destrua_se;
begin
  aDaoTamanhos.destrua_se;
end;
function ctrlTamanhos.excluir(pObj: TObject): string;
begin
  aDaoTamanhos.excluir(pObj);
end;
function ctrlTamanhos.getDS: TObject;
begin
  Result:= aDaoTamanhos.getDS;
end;
function ctrlTamanhos.pesquisar(AFilter: TFilterSearch; pChave: string): string;
begin
  Result:= aDaoTamanhos.pesquisar( AFilter, pChave );
end;
function ctrlTamanhos.salvar(pObj: TObject): string;
begin
  aDaoTamanhos.salvar( pObj );
end;
procedure ctrlTamanhos.setDM(pDM: TObject);
begin
  inherited;
  aDaoTamanhos.setDM( pDM );
end;
procedure ctrlTamanhos.setPosicao(acodigo: integer);
begin
  aDaoTamanhos.setPosicao(aCodigo);
end;

function ctrlTamanhos.ValidaExclusao(pObj: TObject): Boolean;
begin
  result := aDaoTamanhos.ValidaExclusao(pObj);
end;

function ctrlTamanhos.VerificaExiste(aChave: string): Boolean;
begin
  Result := aDaoTamanhos.VerificaExiste(aChave);
end;

end.
