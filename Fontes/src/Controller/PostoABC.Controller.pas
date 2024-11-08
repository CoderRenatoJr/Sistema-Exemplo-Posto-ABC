unit PostoABC.Controller;

interface

uses
  PostoABC.Controller.Interfaces,
  PostoABC.Model.Services.Interfaces;

type
  TController = class(TInterfacedObject, iController)
  private
    FServices: iModelServicesFactory;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;

    function Services: iModelServicesFactory;

  end;

implementation

{ TController }

uses
  PostoABC.Model.Services.Factory;

constructor TController.Create;
begin
  FServices := TModelServicesFactory.New;
end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Services: iModelServicesFactory;
begin
  Result := FServices;
end;

end.
