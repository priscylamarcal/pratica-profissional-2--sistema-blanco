unit uCores;

interface

uses uPai;

type Cores = class(Pai)
  private
  protected
    cor : string[80];
  public
    constructor crieObj;
    destructor destrua_se;
    procedure setCor ( pCor : string );
    function getCor : string;
    function clone : Cores;
    procedure limparDados;
end;

implementation

{ Cores }

constructor Cores.crieObj;
begin
  inherited;
  self.limparDados;
end;

destructor Cores.destrua_se;
begin

end;

function Cores.getCor: string;
begin
  Result:= cor;
end;

procedure Cores.limparDados;
begin
  inherited;
  cor:= '';
end;

procedure Cores.setCor(pCor: string);
begin
  cor:= pCor;
end;

function Cores.clone: Cores;
begin
  Result:= Cores.crieObj;
  Result.setCor( cor );
  Result.setCodigo( codigo );
  Result.setDataCad( dataCad );
  Result.setUltAlt( ultAlt );
  Result.setCodUsu( codUsu );
end;

end.
