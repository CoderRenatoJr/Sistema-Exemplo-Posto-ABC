inherited ViewConsulta: TViewConsulta
  Caption = 'ViewConsulta'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 8
    ExplicitTop = 129
    ExplicitWidth = 784
    ExplicitHeight = 535
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 784
      Height = 661
      ActivePage = tabConsulta
      Align = alClient
      TabOrder = 0
      object tabConsulta: TTabSheet
        Caption = 'Consulta'
        TabVisible = False
        object DBGridConsulta: TDBGrid
          Left = 0
          Top = 0
          Width = 776
          Height = 651
          Align = alClient
          DataSource = DtSrc
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
  end
end
