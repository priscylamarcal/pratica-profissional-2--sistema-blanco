inherited form_consulta_colecoes: Tform_consulta_colecoes
  Caption = 'Consulta de Cole'#231#245'es'
  ClientWidth = 1300
  ExplicitWidth = 1316
  TextHeight = 13
  inherited pnl_fundo: TPanel
    Width = 1300
    ExplicitHeight = 588
    inherited pnl_topo: TPanel
      inherited pnl_dentro_topo: TPanel
        Width = 1292
        ExplicitWidth = 1296
        inherited combobox_tipo_filtro: TComboBox1
          ItemIndex = 2
          Items.Strings = (
            'C'#211'DIGO'
            'COLE'#199#195'O'
            'TODOS')
        end
      end
    end
    inherited pnl_bottom: TPanel
      Width = 1300
    end
    inherited pnl_db_grid: TPanel
      Width = 1300
    end
  end
end
