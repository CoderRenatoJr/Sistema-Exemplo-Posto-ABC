inherited ViewRelatorioAbastecimento: TViewRelatorioAbastecimento
  Caption = 'ViewRelatorioAbastecimento'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 20
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object Ordenação: TLabel [0]
      Left = 8
      Top = 97
      Width = 73
      Height = 20
      Caption = 'Ordena'#231#227'o'
    end
    inherited pnlBotoes: TPanel
      TabOrder = 2
      StyleElements = [seFont, seClient, seBorder]
    end
    object RLReport1: TRLReport
      Left = 53
      Top = 159
      Width = 794
      Height = 1123
      DataSource = DtSrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Visible = False
      BeforePrint = RLReport1BeforePrint
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 28
        BandType = btHeader
        object RLLabel2: TRLLabel
          Left = 210
          Top = 1
          Width = 298
          Height = 24
          Alignment = taCenter
          Caption = 'Relat'#243'rio de Abastecimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 66
        Width = 718
        Height = 18
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        object RLLabel3: TRLLabel
          Left = 1
          Top = 1
          Width = 65
          Height = 16
          AutoSize = False
          Caption = 'Per'#237'odo de:'
          Transparent = False
        end
        object rllblPeriodo: TRLLabel
          Left = 66
          Top = 1
          Width = 148
          Height = 16
          AutoSize = False
          Caption = '00/00/0000 a 00/00/0000'
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 220
          Top = 1
          Width = 122
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'P'#225'gina '
          Transparent = False
        end
        object RLSystemInfo3: TRLSystemInfo
          Left = 342
          Top = 1
          Width = 41
          Height = 16
          AutoSize = False
          Info = itPageNumber
          Text = ''
          Transparent = False
        end
        object RLSystemInfo4: TRLSystemInfo
          Left = 408
          Top = 1
          Width = 41
          Height = 16
          AutoSize = False
          Info = itLastPageNumber
          Text = ''
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 383
          Top = 1
          Width = 25
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'De '
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 456
          Top = 1
          Width = 100
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Impresso em:'
          Transparent = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 556
          Top = 1
          Width = 88
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Text = ''
          Transparent = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 644
          Top = 1
          Width = 70
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Info = itHour
          Text = ''
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 138
        Width = 718
        Height = 18
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLLabel1: TRLLabel
          Left = 1
          Top = 1
          Width = 135
          Height = 16
          Caption = #169' Sistema Posto ABC'
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 38
        Top = 84
        Width = 718
        Height = 54
        DataSource = DtSrc
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          BandType = btTitle
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          object RLLabel7: TRLLabel
            Left = 1
            Top = 1
            Width = 49
            Height = 16
            Caption = 'C'#243'digo'
          end
          object RLLabel8: TRLLabel
            Left = 56
            Top = 1
            Width = 78
            Height = 16
            Caption = 'Data Venda'
          end
          object RLLabel9: TRLLabel
            Left = 140
            Top = 1
            Width = 49
            Height = 16
            Caption = 'Bomba'
          end
          object RLLabel10: TRLLabel
            Left = 360
            Top = 1
            Width = 42
            Height = 16
            Caption = 'Litros'
          end
          object RLLabel11: TRLLabel
            Left = 449
            Top = 1
            Width = 58
            Height = 16
            Caption = 'Valor R$'
          end
          object RLLabel12: TRLLabel
            Left = 538
            Top = 1
            Width = 68
            Height = 16
            Caption = 'Imposto %'
          end
          object RLLabel13: TRLLabel
            Left = 612
            Top = 1
            Width = 103
            Height = 16
            Caption = 'Valor Total R$'
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 18
          Width = 718
          Height = 18
          BeforePrint = RLBand5BeforePrint
          object RLDBText1: TRLDBText
            Left = 1
            Top = 1
            Width = 89
            Height = 16
            DataField = 'ABA_CODIGO'
            DataSource = DtSrc
            Holder = RLLabel7
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 56
            Top = 1
            Width = 72
            Height = 16
            DataField = 'ABA_DATA'
            DataSource = DtSrc
            Holder = RLLabel8
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 140
            Top = 1
            Width = 80
            Height = 16
            DataField = 'DESCRICAO'
            DataSource = DtSrc
            Holder = RLLabel9
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 360
            Top = 1
            Width = 83
            Height = 16
            Alignment = taRightJustify
            DataField = 'ABA_LITROS'
            DataSource = DtSrc
            Text = ''
            BeforePrint = RLDBText4BeforePrint
          end
          object RLDBText5: TRLDBText
            Left = 450
            Top = 1
            Width = 82
            Height = 16
            Alignment = taRightJustify
            DataField = 'ABA_VALOR'
            DataSource = DtSrc
            Text = ''
            BeforePrint = RLDBText5BeforePrint
          end
          object RLDBText6: TRLDBText
            Left = 538
            Top = 1
            Width = 20
            Height = 16
            AutoSize = False
            DataField = 'ABA_IMPOSTO'
            DataSource = DtSrc
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 612
            Top = 1
            Width = 103
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'ABA_VALORTOTAL'
            DataSource = DtSrc
            Text = ''
            BeforePrint = RLDBText7BeforePrint
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 36
          Width = 718
          Height = 18
          BandType = btFooter
          object rllblTotalLitros: TRLLabel
            Left = 342
            Top = 0
            Width = 102
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.FixedTop = True
            Caption = '0,00000'
          end
          object rllblTotalValor: TRLLabel
            Left = 450
            Top = 0
            Width = 82
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.FixedTop = True
            Caption = '0,00'
          end
          object rllblTotalVendaTotal: TRLLabel
            Left = 612
            Top = 0
            Width = 103
            Height = 18
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.FixedTop = True
            Caption = '0,00'
          end
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 217
      Height = 81
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 25
        Width = 39
        Height = 20
        Caption = 'Inicial'
      end
      object Label2: TLabel
        Left = 111
        Top = 25
        Width = 31
        Height = 20
        Caption = 'Final'
      end
      object edtPeriodoInicial: TMaskEdit
        Left = 5
        Top = 46
        Width = 96
        Height = 28
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = edtPeriodoInicialExit
        OnKeyDown = edtPeriodoInicialKeyDown
      end
      object edtPeriodoFinal: TMaskEdit
        Left = 111
        Top = 46
        Width = 96
        Height = 28
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = edtPeriodoInicialExit
        OnKeyDown = edtPeriodoInicialKeyDown
      end
    end
    object cmbOrdenacao: TComboBox
      Left = 8
      Top = 118
      Width = 201
      Height = 27
      Style = csOwnerDrawFixed
      ItemHeight = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'Data de Venda'
      Items.Strings = (
        'Data de Venda'
        'Bomba de Combust'#237'vel'
        'Tanque de Combust'#237'vel')
    end
  end
  inherited ActionList: TActionList
    inherited actVisualizar: TAction
      OnExecute = actVisualizarExecute
    end
  end
end
