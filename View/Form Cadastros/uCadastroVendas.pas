unit uCadastroVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.Buttons, Vcl.StdCtrls,
  campoEdit, Vcl.ExtCtrls, Vcl.ComCtrls, uCadastroProdutoVendas;

type
  Tform_cadastro_vendas = class(Tform_cadastro_pai)
    lbl_titulo_dados_gerais: TLabel;
    lbl_modelo: TLabel;
    edt_num_modelo: PriTEdit;
    pnl_adicionar_produto: TPanel;
    btn_adicionar_produto: TSpeedButton;
    edt_produto: PriTEdit;
    edt_cod_produto: PriTEdit;
    lbl_cod_produto: TLabel;
    lbl_roupa: TLabel;
    lbl_data_chegada: TLabel;
    data_chegada_nota: TDateTimePicker;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    PriTEdit1: PriTEdit;
    PriTEdit2: PriTEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnl_btn_condicao_pagamento: TPanel;
    btn_botão_pesquisar_condicao_pagamento: TSpeedButton;
    edit_condicao_pagamento: PriTEdit;
    edt_codigo_condicao_pagamento: PriTEdit;
    lbl_codigo_condicao_pagamento: TLabel;
    edt_condicao_pagamento: TLabel;
    ListView_condicao_pagamento: TListView;
    lbl_titulo_financeiro: TLabel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    PriTEdit3: PriTEdit;
    PriTEdit4: PriTEdit;
    Label3: TLabel;
    Label4: TLabel;
    ListView1: TListView;
    Label5: TLabel;
    lbl_unidade_medida: TLabel;
    edt_unidade_medida: PriTEdit;
    edt_codigo_roupa: PriTEdit;
    lbl_codigo_roupa: TLabel;
    pnl_adicionar_contato: TPanel;
    btn_adicionar_contato: TSpeedButton;
    pnl_remover_item: TPanel;
    btn_remover_item: TSpeedButton;
    procedure btn_adicionar_contatoClick(Sender: TObject);
  private
    { Private declarations }
    aConsultaProdutosAdd : Tform_cadastro_add_roupa_venda;
  public
    { Public declarations }
  end;

var
  form_cadastro_vendas: Tform_cadastro_vendas;

implementation

{$R *.dfm}


procedure Tform_cadastro_vendas.btn_adicionar_contatoClick(Sender: TObject);
begin
  inherited;
  aConsultaProdutosAdd:= Tform_cadastro_add_roupa_venda.Create(self);
  aConsultaProdutosAdd.show;
end;

end.
