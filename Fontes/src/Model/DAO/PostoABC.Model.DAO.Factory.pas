unit PostoABC.Model.DAO.Factory;

interface

uses
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Connection.Interfaces;

type
  TModelDAOFactory<T: class, constructor> = class(TInterfacedObject, iModelDAOFactory<T>)
  private
    [weak]
    FConnection: iModelConnection;

  public
    constructor Create(AConnection: iModelConnection);
    destructor Destroy; override;
    class function New(AConnection: iModelConnection): iModelDAOFactory<T>;

    function DAO: iModelDAO<T>;

  end;

implementation

{ TModelDAOFactory<T> }

uses
  PostoABC.Model.DAO;

constructor TModelDAOFactory<T>.Create(AConnection: iModelConnection);
begin
  FConnection := AConnection;
end;

function TModelDAOFactory<T>.DAO: iModelDAO<T>;
begin
  Result := TModelDAO<T>.New(FConnection.Connection);
end;

destructor TModelDAOFactory<T>.Destroy;
begin

  inherited;
end;

class function TModelDAOFactory<T>.New(AConnection: iModelConnection): iModelDAOFactory<T>;
begin
  Result := Self.Create(AConnection);
end;

end.

