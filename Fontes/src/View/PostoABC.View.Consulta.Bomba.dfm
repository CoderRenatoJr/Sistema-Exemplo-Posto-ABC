inherited ViewConsultaBomba: TViewConsultaBomba
  Caption = 'ViewConsultaBomba'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 20
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 784
    ExplicitHeight = 671
    inherited PageControl: TPageControl
      ExplicitWidth = 784
      ExplicitHeight = 671
      inherited tabConsulta: TTabSheet
        inherited DBGridConsulta: TDBGrid
          Height = 661
        end
      end
    end
  end
end
