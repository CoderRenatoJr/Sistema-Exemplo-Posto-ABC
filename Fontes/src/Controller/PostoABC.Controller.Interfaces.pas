unit PostoABC.Controller.Interfaces;

interface

uses
  PostoABC.Model.Services.Interfaces;

type
  iController = interface
    ['{CFEE819F-EF75-4CDB-A631-1112B3C6E0CB}']
    function Services: iModelServicesFactory;

  end;

implementation

end.
