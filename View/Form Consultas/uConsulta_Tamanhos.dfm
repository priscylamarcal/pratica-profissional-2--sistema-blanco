inherited form_consulta_tamanhos: Tform_consulta_tamanhos
  Caption = 'Consulta de Tamanhos'
  ClientHeight = 588
  ExplicitWidth = 1316
  TextHeight = 13
  inherited pnl_fundo: TPanel
    Height = 588
    inherited pnl_topo: TPanel
      inherited pnl_dentro_topo: TPanel
        Width = 1296
        inherited combobox_tipo_filtro: TComboBox1
          ItemIndex = 2
          Items.Strings = (
            'C'#211'DIGO'
            'SIGLA'
            'TODOS')
        end
      end
    end
    inherited pnl_bottom: TPanel
      Top = 520
    end
    inherited pnl_db_grid: TPanel
      Height = 431
    end
  end
end
