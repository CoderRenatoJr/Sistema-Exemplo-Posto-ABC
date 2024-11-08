object ViewBase: TViewBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'ViewBase'
  ClientHeight = 671
  ClientWidth = 784
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 20
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 671
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
  end
  object DtSrc: TDataSource
    Left = 40
    Top = 16
  end
end
