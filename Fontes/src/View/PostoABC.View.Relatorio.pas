unit PostoABC.View.Relatorio;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  PostoABC.View.Base,
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.ExtCtrls,
  RLReport;

type
  TViewRelatorio = class(TViewBase)
    pnlBotoes: TPanel;
    btnVisualizarRelatorio: TButton;
    ActionList: TActionList;
    actVisualizar: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewRelatorio: TViewRelatorio;

implementation

{$R *.dfm}

end.
