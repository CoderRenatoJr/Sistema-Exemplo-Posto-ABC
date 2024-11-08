object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 720
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pnlMenuLateral: TPanel
    Left = 0
    Top = 10
    Width = 224
    Height = 710
    Align = alLeft
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object CategoryButtons1: TCategoryButtons
      Left = 0
      Top = 0
      Width = 224
      Height = 710
      Align = alClient
      BackgroundGradientColor = clWhite
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 35
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boBoldCaptions]
      Categories = <
        item
          Caption = 'Consulta'
          Color = clWhite
          Collapsed = False
          Items = <
            item
              Action = actConsultaTanque
              ImageIndex = 0
            end
            item
              Action = actConsultaBombaCombustivel
            end>
        end
        item
          Caption = 'Lan'#231'amentos'
          Color = clWhite
          Collapsed = False
          Items = <
            item
              Action = actLancamentoAbastecimento
            end>
        end
        item
          Caption = 'Relat'#243'rios'
          Color = clWhite
          Collapsed = False
          Items = <
            item
              Action = actRelatorioAbastecimento
            end>
        end>
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      RegularButtonColor = clWhite
      SelectedButtonColor = 15132390
      TabOrder = 0
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
  end
  object ActionListMenuLateral: TActionList
    Left = 888
    Top = 56
    object actConsultaTanque: TAction
      Category = 'Consultas'
      Caption = 'Tanques'
      OnExecute = actConsultaTanqueExecute
    end
    object actConsultaBombaCombustivel: TAction
      Category = 'Consultas'
      Caption = 'Bombas de Combust'#237'veis'
      OnExecute = actConsultaBombaCombustivelExecute
    end
    object actLancamentoAbastecimento: TAction
      Category = 'Lancamentos'
      Caption = 'Abastecimentos'
      OnExecute = actLancamentoAbastecimentoExecute
    end
    object actRelatorioAbastecimento: TAction
      Category = 'Relatorios'
      Caption = 'Abastecimento'
      OnExecute = actRelatorioAbastecimentoExecute
    end
  end
end
