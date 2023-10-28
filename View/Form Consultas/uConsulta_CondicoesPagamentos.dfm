inherited form_consulta_condicoes_pagamentos: Tform_consulta_condicoes_pagamentos
  Caption = 'Consulta de Condi'#231#245'es de Pagamentos'
  ClientWidth = 1308
  TextHeight = 13
  inherited pnl_fundo: TPanel
    Width = 1308
    inherited pnl_topo: TPanel
      inherited pnl_dentro_topo: TPanel
        Width = 1300
        inherited combobox_tipo_filtro: TComboBox1
          Left = 32
          Width = 169
          ItemIndex = 2
          Items.Strings = (
            'C'#211'DIGO'
            'CONDI'#199#195'O PAGAMENTO'
            'TODOS')
          ExplicitLeft = 32
          ExplicitWidth = 169
        end
      end
    end
    inherited pnl_bottom: TPanel
      Width = 1308
    end
    inherited pnl_db_grid: TPanel
      Width = 1308
    end
  end
end
