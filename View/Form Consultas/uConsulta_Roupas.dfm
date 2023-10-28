inherited form_consulta_roupas: Tform_consulta_roupas
  Caption = 'Consulta de Roupas'
  TextHeight = 13
  inherited pnl_fundo: TPanel
    inherited pnl_topo: TPanel
      Width = 1308
      inherited pnl_dentro_topo: TPanel
        Width = 1284
        ExplicitWidth = 1280
        inherited combobox_tipo_filtro: TComboBox1
          ItemIndex = 2
          Items.Strings = (
            'C'#211'DIGO'
            'ROUPA'
            'TODOS')
        end
      end
    end
    inherited pnl_db_grid: TPanel
      inherited ScrollBox1: TScrollBox
        ExplicitHeight = 430
      end
    end
  end
end
