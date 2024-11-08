inherited ViewLancamento: TViewLancamento
  Caption = 'ViewLancamento'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 20
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 784
    ExplicitHeight = 671
    inherited PageControl: TPageControl
      ActivePage = tabDados
      ExplicitWidth = 784
      ExplicitHeight = 671
      inherited tabConsulta: TTabSheet
        inherited DBGridConsulta: TDBGrid
          Height = 620
        end
        object pnlBotoesCrud: TPanel
          Left = 0
          Top = 620
          Width = 776
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          object btnInserir: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 100
            Height = 35
            Action = actInserir
            Align = alLeft
            TabOrder = 0
          end
          object btnAlterar: TButton
            AlignWithMargins = True
            Left = 109
            Top = 3
            Width = 100
            Height = 35
            Action = actAlterar
            Align = alLeft
            TabOrder = 1
          end
          object btnExcluir: TButton
            AlignWithMargins = True
            Left = 215
            Top = 3
            Width = 100
            Height = 35
            Action = actExcluir
            Align = alLeft
            TabOrder = 2
          end
          object btnVisualizar: TButton
            AlignWithMargins = True
            Left = 321
            Top = 3
            Width = 100
            Height = 35
            Action = actVisualizar
            Align = alLeft
            TabOrder = 3
          end
        end
      end
      object tabDados: TTabSheet
        Caption = 'Dados'
        ImageIndex = 1
        TabVisible = False
        object pnlDados: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 661
          Align = alClient
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object pnlDadosBotoes: TPanel
            Left = 0
            Top = 620
            Width = 776
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnCancelar: TButton
              AlignWithMargins = True
              Left = 109
              Top = 3
              Width = 100
              Height = 35
              Action = actCancelar
              Align = alLeft
              TabOrder = 0
            end
            object btnFinalizar: TButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 100
              Height = 35
              Action = actFinalizar
              Align = alLeft
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 96
    Top = 16
    object actInserir: TAction
      Caption = 'Inserir'
      OnExecute = actInserirExecute
    end
    object actAlterar: TAction
      Caption = 'Alterar'
      OnExecute = actAlterarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      OnExecute = actExcluirExecute
    end
    object actVisualizar: TAction
      Caption = 'Visualizar'
      OnExecute = actVisualizarExecute
    end
    object actFinalizar: TAction
      Caption = 'Finalizar'
      OnExecute = actFinalizarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelarExecute
    end
  end
end
