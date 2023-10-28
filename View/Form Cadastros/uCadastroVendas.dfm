inherited form_cadastro_vendas: Tform_cadastro_vendas
  Caption = 'Cadastro de Vendas'
  ClientHeight = 775
  ExplicitTop = -230
  ExplicitHeight = 814
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TPanel
    Height = 775
    ExplicitHeight = 775
    inherited ScrollBox1: TScrollBox
      Height = 775
      ExplicitHeight = 775
      inherited lbl_cod_usuario: TLabel
        Top = 877
        ExplicitTop = 673
      end
      inherited lbl_codigo: TLabel
        Left = 9
        Top = 34
        ExplicitLeft = 9
        ExplicitTop = 34
      end
      inherited lbl_data_cadastro: TLabel
        Top = 877
        ExplicitTop = 681
      end
      inherited lbl_data_ult_alt: TLabel
        Top = 877
        ExplicitTop = 673
      end
      object lbl_titulo_dados_gerais: TLabel [4]
        Left = 24
        Top = 8
        Width = 163
        Height = 18
        Caption = 'CADASTRO DE VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_modelo: TLabel [5]
        Left = 112
        Top = 34
        Width = 105
        Height = 16
        Caption = 'N'#250'mero do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_cod_produto: TLabel [6]
        Left = 8
        Top = 102
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_roupa: TLabel [7]
        Left = 112
        Top = 102
        Width = 39
        Height = 16
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_data_chegada: TLabel [8]
        Left = 264
        Top = 34
        Width = 84
        Height = 16
        Caption = 'Data de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel [9]
        Left = 112
        Top = 158
        Width = 131
        Height = 16
        Caption = 'Vendedor/Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel [10]
        Left = 8
        Top = 158
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_codigo_condicao_pagamento: TLabel [11]
        Left = 8
        Top = 598
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_titulo_financeiro: TLabel [12]
        Left = 24
        Top = 574
        Width = 99
        Height = 18
        Caption = 'FINANCEIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_condicao_pagamento: TLabel [13]
        Left = 112
        Top = 598
        Width = 156
        Height = 16
        Caption = 'Condi'#231#245'es de Pagamento *'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel [14]
        Left = 9
        Top = 242
        Width = 39
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel [15]
        Left = 26
        Top = 218
        Width = 119
        Height = 18
        Caption = 'ITENS DA NOTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel [16]
        Left = 112
        Top = 242
        Width = 50
        Height = 16
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_codigo_roupa: TLabel [17]
        Left = 707
        Top = 242
        Width = 90
        Height = 16
        Caption = 'Pre'#231'o de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl_unidade_medida: TLabel [18]
        Left = 569
        Top = 242
        Width = 65
        Height = 16
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      inherited edt_cod_usuario: PriTEdit
        Top = 892
        ExplicitTop = 892
      end
      inherited edt_codigo: PriTEdit
        Left = 9
        Top = 53
        ExplicitLeft = 9
        ExplicitTop = 53
      end
      inherited edt_data_cadastro: PriTEdit
        Top = 892
        ExplicitTop = 892
      end
      inherited edt_data_ult_alt: PriTEdit
        Top = 892
        ExplicitTop = 892
      end
      inherited pnl_bottom: TPanel
        Top = 916
        Width = 841
        ExplicitTop = 916
        ExplicitWidth = 841
        inherited pnl_botao_salvar: TPanel
          Left = 514
          ExplicitLeft = 514
        end
        inherited pnl_botao_cancelar: TPanel
          Left = 678
          ExplicitLeft = 678
        end
      end
      object edt_num_modelo: PriTEdit
        Left = 112
        Top = 53
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        MudarCor = clCream
      end
      object pnl_adicionar_produto: TPanel
        Left = 514
        Top = 122
        Width = 35
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object btn_adicionar_produto: TSpeedButton
          Left = 0
          Top = 0
          Width = 35
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA2A2A21D1D1D737373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101010000001D1D1DFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101
            01000000010101A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFD5D5D5929292919191A9
            A9A9EFEFEFFFFFFF9E9E9E0101010000000101019D9D9DFFFFFFFFFFFFFFFFFF
            D4D4D43232320000000000000000000000000C0C0C6868680505050000000101
            019D9D9DFFFFFFFFFFFFFFFFFFBABABA0707070D0D0D898989CACACAE0E0E0B2
            B2B24747470000000000000505059E9E9EFFFFFFFFFFFFFFFFFFF0F0F01C1C1C
            232323E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000686868FFFF
            FFFFFFFFFFFFFFFFFFFF7A7A7A010101C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF4747470C0C0CEFEFEFFFFFFFFFFFFFFFFFFF3F3F3F2A2A2A
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2000000A9A9
            A9FFFFFFFFFFFFFFFFFF0F0F0F585858FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE0E0E0000000919191FFFFFFFFFFFFFFFFFF262626424242
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA0000009292
            92FFFFFFFFFFFFFFFFFF5959590F0F0FF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF888888000000D5D5D5FFFFFFFFFFFFFFFFFFBCBCBC010101
            686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0C0C0C323232FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF676767000000676767F2F2F2FFFFFFFFFFFFFF
            FFFFBDBDBD1F1F1F070707D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
            6767670101010F0F0F4242425858582A2A2A0101011C1C1CBABABAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC5959592626260F0F0F3F
            3F3F7A7A7AF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ExplicitLeft = 8
          ExplicitTop = -8
        end
      end
      object edt_produto: PriTEdit
        Left = 112
        Top = 120
        Width = 389
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        MudarCor = clCream
      end
      object edt_cod_produto: PriTEdit
        Left = 9
        Top = 120
        Width = 80
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        MudarCor = clCream
      end
      object data_chegada_nota: TDateTimePicker
        Left = 264
        Top = 53
        Width = 103
        Height = 24
        Date = 44485.000000000000000000
        Time = 0.662260243057971800
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object Panel1: TPanel
        Left = 514
        Top = 178
        Width = 35
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 35
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA2A2A21D1D1D737373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101010000001D1D1DFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101
            01000000010101A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFD5D5D5929292919191A9
            A9A9EFEFEFFFFFFF9E9E9E0101010000000101019D9D9DFFFFFFFFFFFFFFFFFF
            D4D4D43232320000000000000000000000000C0C0C6868680505050000000101
            019D9D9DFFFFFFFFFFFFFFFFFFBABABA0707070D0D0D898989CACACAE0E0E0B2
            B2B24747470000000000000505059E9E9EFFFFFFFFFFFFFFFFFFF0F0F01C1C1C
            232323E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000686868FFFF
            FFFFFFFFFFFFFFFFFFFF7A7A7A010101C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF4747470C0C0CEFEFEFFFFFFFFFFFFFFFFFFF3F3F3F2A2A2A
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2000000A9A9
            A9FFFFFFFFFFFFFFFFFF0F0F0F585858FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE0E0E0000000919191FFFFFFFFFFFFFFFFFF262626424242
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA0000009292
            92FFFFFFFFFFFFFFFFFF5959590F0F0FF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF888888000000D5D5D5FFFFFFFFFFFFFFFFFFBCBCBC010101
            686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0C0C0C323232FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF676767000000676767F2F2F2FFFFFFFFFFFFFF
            FFFFBDBDBD1F1F1F070707D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
            6767670101010F0F0F4242425858582A2A2A0101011C1C1CBABABAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC5959592626260F0F0F3F
            3F3F7A7A7AF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ExplicitLeft = 8
          ExplicitTop = -8
        end
      end
      object pnl_btn_condicao_pagamento: TPanel
        Left = 514
        Top = 622
        Width = 35
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        object btn_botão_pesquisar_condicao_pagamento: TSpeedButton
          Left = 0
          Top = 0
          Width = 35
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA2A2A21D1D1D737373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101010000001D1D1DFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101
            01000000010101A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFD5D5D5929292919191A9
            A9A9EFEFEFFFFFFF9E9E9E0101010000000101019D9D9DFFFFFFFFFFFFFFFFFF
            D4D4D43232320000000000000000000000000C0C0C6868680505050000000101
            019D9D9DFFFFFFFFFFFFFFFFFFBABABA0707070D0D0D898989CACACAE0E0E0B2
            B2B24747470000000000000505059E9E9EFFFFFFFFFFFFFFFFFFF0F0F01C1C1C
            232323E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000686868FFFF
            FFFFFFFFFFFFFFFFFFFF7A7A7A010101C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF4747470C0C0CEFEFEFFFFFFFFFFFFFFFFFFF3F3F3F2A2A2A
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2000000A9A9
            A9FFFFFFFFFFFFFFFFFF0F0F0F585858FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE0E0E0000000919191FFFFFFFFFFFFFFFFFF262626424242
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA0000009292
            92FFFFFFFFFFFFFFFFFF5959590F0F0FF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF888888000000D5D5D5FFFFFFFFFFFFFFFFFFBCBCBC010101
            686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0C0C0C323232FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF676767000000676767F2F2F2FFFFFFFFFFFFFF
            FFFFBDBDBD1F1F1F070707D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
            6767670101010F0F0F4242425858582A2A2A0101011C1C1CBABABAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC5959592626260F0F0F3F
            3F3F7A7A7AF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ExplicitLeft = 8
          ExplicitTop = -8
        end
      end
      object ListView_condicao_pagamento: TListView
        Left = 8
        Top = 667
        Width = 820
        Height = 193
        Columns = <
          item
            Caption = 'N'#186' Parcela'
            Width = 100
          end
          item
            Caption = 'Data Vencimento'
            Width = 150
          end
          item
            Caption = 'Valor da Parcela'
            Width = 150
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 12
        TabStop = False
        ViewStyle = vsReport
      end
      object edt_codigo_condicao_pagamento: PriTEdit
        Left = 8
        Top = 620
        Width = 80
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 13
        MudarCor = clCream
      end
      object edit_condicao_pagamento: PriTEdit
        Left = 112
        Top = 620
        Width = 389
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        MudarCor = clCream
      end
      object Panel2: TPanel
        Left = 514
        Top = 266
        Width = 35
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        object SpeedButton2: TSpeedButton
          Left = 0
          Top = 0
          Width = 35
          Height = 22
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA2A2A21D1D1D737373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101010000001D1D1DFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9D0101
            01000000010101A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFD5D5D5929292919191A9
            A9A9EFEFEFFFFFFF9E9E9E0101010000000101019D9D9DFFFFFFFFFFFFFFFFFF
            D4D4D43232320000000000000000000000000C0C0C6868680505050000000101
            019D9D9DFFFFFFFFFFFFFFFFFFBABABA0707070D0D0D898989CACACAE0E0E0B2
            B2B24747470000000000000505059E9E9EFFFFFFFFFFFFFFFFFFF0F0F01C1C1C
            232323E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000686868FFFF
            FFFFFFFFFFFFFFFFFFFF7A7A7A010101C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF4747470C0C0CEFEFEFFFFFFFFFFFFFFFFFFF3F3F3F2A2A2A
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2000000A9A9
            A9FFFFFFFFFFFFFFFFFF0F0F0F585858FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFE0E0E0000000919191FFFFFFFFFFFFFFFFFF262626424242
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA0000009292
            92FFFFFFFFFFFFFFFFFF5959590F0F0FF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF888888000000D5D5D5FFFFFFFFFFFFFFFFFFBCBCBC010101
            686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0C0C0C323232FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF676767000000676767F2F2F2FFFFFFFFFFFFFF
            FFFFBDBDBD1F1F1F070707D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
            6767670101010F0F0F4242425858582A2A2A0101011C1C1CBABABAFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC5959592626260F0F0F3F
            3F3F7A7A7AF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ExplicitLeft = 8
          ExplicitTop = -8
        end
      end
      object ListView1: TListView
        Left = 8
        Top = 365
        Width = 820
        Height = 193
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 100
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 150
          end
          item
            Caption = 'Cor'
            Width = 150
          end
          item
            Caption = 'Tamanho'
            Width = 100
          end
          item
            Caption = 'Quantidade'
            Width = 120
          end
          item
            Caption = 'Pre'#231'o de Venda'
            Width = 120
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 16
        TabStop = False
        ViewStyle = vsReport
      end
      object PriTEdit1: PriTEdit
        Left = 112
        Top = 264
        Width = 389
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        MudarCor = clCream
      end
      object PriTEdit2: PriTEdit
        Left = 9
        Top = 264
        Width = 80
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 18
        MudarCor = clCream
      end
      object PriTEdit3: PriTEdit
        Left = 112
        Top = 180
        Width = 389
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        MudarCor = clCream
      end
      object PriTEdit4: PriTEdit
        Left = 9
        Top = 180
        Width = 80
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 20
        MudarCor = clCream
      end
      object edt_codigo_roupa: PriTEdit
        Left = 707
        Top = 264
        Width = 121
        Height = 24
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
        MudarCor = clCream
      end
      object edt_unidade_medida: PriTEdit
        Left = 568
        Top = 264
        Width = 121
        Height = 24
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
        MudarCor = clCream
      end
      object pnl_adicionar_contato: TPanel
        Left = 603
        Top = 304
        Width = 100
        Height = 40
        BevelOuter = bvNone
        Color = 4227072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 23
        object btn_adicionar_contato: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Adicionar'
          Flat = True
          OnClick = btn_adicionar_contatoClick
          ExplicitLeft = 16
        end
      end
      object pnl_remover_item: TPanel
        Left = 726
        Top = 304
        Width = 100
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Color = clRed
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 24
        object btn_remover_item: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 40
          Align = alClient
          Caption = 'Remover'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 8
        end
      end
    end
  end
end
