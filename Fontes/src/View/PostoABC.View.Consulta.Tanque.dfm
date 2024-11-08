inherited ViewConsultaTanque: TViewConsultaTanque
  Caption = 'ViewConsultaTanque'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 784
    ExplicitHeight = 661
    inherited PageControl: TPageControl
      ExplicitWidth = 784
      ExplicitHeight = 661
    end
  end
end
