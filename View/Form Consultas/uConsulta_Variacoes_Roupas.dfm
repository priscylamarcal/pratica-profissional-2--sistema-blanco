inherited form_consulta_Variacoes_Roupas: Tform_consulta_Variacoes_Roupas
  Caption = 'Consulta das Varia'#231#245'es de Roupas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TPanel
    ExplicitWidth = 1308
    ExplicitHeight = 588
    inherited pnl_topo: TPanel
      ExplicitWidth = 1308
      inherited pnl_dentro_topo: TPanel
        Width = 1288
        ExplicitWidth = 1288
        inherited combobox_tipo_filtro: TComboBox1
          Enabled = False
        end
      end
    end
    inherited pnl_bottom: TPanel
      ExplicitTop = 520
      ExplicitWidth = 1308
      inherited pnl_botao_excluir: TPanel
        inherited btn_botao_excluir: TSpeedButton
          Enabled = False
        end
      end
      inherited pnl_botao_novo: TPanel
        inherited btn_botao_novo: TSpeedButton
          Enabled = False
        end
      end
      inherited pnl_botao_alterar: TPanel
        inherited btn_botao_alterar: TSpeedButton
          Enabled = False
        end
      end
    end
    inherited pnl_db_grid: TPanel
      ExplicitWidth = 1308
      ExplicitHeight = 431
      inherited ScrollBox1: TScrollBox
        ExplicitWidth = 1308
        ExplicitHeight = 431
      end
    end
  end
end
