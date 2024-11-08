unit PostoABC.View.Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PostoABC.View.Base, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TViewConsulta = class(TViewBase)
    PageControl: TPageControl;
    tabConsulta: TTabSheet;
    DBGridConsulta: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewConsulta: TViewConsulta;

implementation

{$R *.dfm}

end.
