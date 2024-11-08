unit PostoABC.Model.Connection.Factory;

interface

uses
  Data.DB,
  PostoABC.Model.Connection.Interfaces;

type
  TModelConnectionFactory = class(TInterfacedObject, iModelConnectionFactory)
  private
    class var FModelConnectionFactory: iModelConnectionFactory;
    var FModelConnection: iModelConnection;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnectionFactory;
    class function NewIntance: iModelConnectionFactory;
    class function GetIntance: iModelConnectionFactory;

    function ModelConnection: iModelConnection;

  end;

implementation

uses
  PostoABC.Model.Connection.FireDAC.Connection;

{ TModelConnectionFactory }

constructor TModelConnectionFactory.Create;
begin
  FModelConnection := TModelConnectionFireDAC.New;
end;

destructor TModelConnectionFactory.Destroy;
begin

  inherited;
end;

class function TModelConnectionFactory.GetIntance: iModelConnectionFactory;
begin
  Result := FModelConnectionFactory;
end;

function TModelConnectionFactory.ModelConnection: iModelConnection;
begin
  Result := FModelConnection;
end;

class function TModelConnectionFactory.New: iModelConnectionFactory;
begin
  if not Assigned(FModelConnectionFactory) then
    FModelConnectionFactory := Self.Create;
  Result := FModelConnectionFactory;
end;

class function TModelConnectionFactory.NewIntance: iModelConnectionFactory;
begin
  Result := Self.Create;
end;

initialization
TModelConnectionFactory.New;

end.
