inherited ViewLancamentoAbastecimento: TViewLancamentoAbastecimento
  Caption = 'ViewLancamentoAbastecimento'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 20
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited PageControl: TPageControl
      inherited tabConsulta: TTabSheet
        inherited pnlBotoesCrud: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited tabDados: TTabSheet
        inherited pnlDados: TPanel
          StyleElements = [seFont, seClient, seBorder]
          object Label1: TLabel [0]
            Left = 8
            Top = 8
            Width = 33
            Height = 20
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel [1]
            Left = 8
            Top = 63
            Width = 124
            Height = 20
            Caption = 'C'#243'digo da Bomba'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel [2]
            Left = 8
            Top = 118
            Width = 82
            Height = 20
            Caption = 'Qtde. Litros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel [3]
            Left = 8
            Top = 173
            Width = 36
            Height = 20
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inherited pnlDadosBotoes: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
          object dtpDataLancamento: TDateTimePicker
            Left = 8
            Top = 29
            Width = 161
            Height = 28
            Date = 45602.000000000000000000
            Time = 0.889919374996679800
            TabOrder = 1
          end
          object lcbCodigoBomba: TDBLookupComboBox
            Left = 8
            Top = 84
            Width = 217
            Height = 28
            DataField = 'ABA_BCM_CODIGO'
            DataSource = DtSrc
            KeyField = 'BCM_CODIGO'
            ListField = 'DESCRICAO'
            ListSource = DtSrcBomba
            TabOrder = 2
          end
          object edtQtdeLitros: TDBEdit
            Left = 8
            Top = 139
            Width = 161
            Height = 28
            DataField = 'ABA_LITROS'
            DataSource = DtSrc
            TabOrder = 3
          end
          object edtValor: TDBEdit
            Left = 8
            Top = 194
            Width = 161
            Height = 28
            DataField = 'ABA_VALOR'
            DataSource = DtSrc
            TabOrder = 4
          end
        end
      end
    end
  end
  object DtSrcBomba: TDataSource
    Left = 40
    Top = 80
  end
end
