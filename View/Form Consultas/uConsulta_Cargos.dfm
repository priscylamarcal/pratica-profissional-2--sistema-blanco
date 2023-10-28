inherited form_consulta_cargos: Tform_consulta_cargos
  Caption = 'Consulta de Cargos'
  ExplicitWidth = 1316
  ExplicitHeight = 625
  TextHeight = 13
  inherited pnl_fundo: TPanel
    inherited pnl_topo: TPanel
      inherited pnl_dentro_topo: TPanel
        Width = 1296
        inherited combobox_tipo_filtro: TComboBox1
          ItemIndex = 2
          Items.Strings = (
            'C'#211'DIGO'
            'CARGO'
            'TODOS')
        end
      end
    end
    inherited pnl_db_grid: TPanel
      inherited ScrollBox1: TScrollBox
        Width = 1304
        Height = 430
        inherited DBGrid: TDBGrid
          Width = 1304
          Height = 430
        end
      end
    end
  end
end
