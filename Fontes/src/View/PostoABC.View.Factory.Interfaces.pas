unit PostoABC.View.Factory.Interfaces;

interface

uses
  PostoABC.Model.Types;

type
  iViewFactory = interface
    ['{607EEF73-EFCA-49A7-B195-6FC208A83D03}']
    procedure CreateShowForm(AFormularioType: TFormularioType);

  end;

implementation

end.
