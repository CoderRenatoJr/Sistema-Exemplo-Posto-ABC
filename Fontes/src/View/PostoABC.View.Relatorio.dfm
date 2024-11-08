inherited ViewRelatorio: TViewRelatorio
  Caption = 'ViewRelatorio'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 20
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object pnlBotoes: TPanel
      Left = 0
      Top = 630
      Width = 784
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      object btnVisualizarRelatorio: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 200
        Height = 35
        Action = actVisualizar
        Align = alLeft
        TabOrder = 0
      end
    end
  end
  object ActionList: TActionList
    Left = 104
    Top = 16
    object actVisualizar: TAction
      Caption = 'Visualizar Relat'#243'rio'
    end
  end
end
