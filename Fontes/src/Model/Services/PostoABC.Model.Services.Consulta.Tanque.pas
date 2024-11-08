unit PostoABC.Model.Services.Consulta.Tanque;

interface

uses
  Data.DB,
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Connection.Interfaces,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Entity.Consulta.Tanque;

type
  TModelServicesConsultaTanque = class(TInterfacedObject, iModelServicesConsultaTanque, iModelServices)
  private
    [weak]
    FConnection: iModelConnection;
    FDaoTanque: iModelDAO<TEntityConsultaTanque>;

  public
    constructor Create(AConnection: iModelConnection);
    destructor Destroy; override;
    class function New(AConnection: iModelConnection): iModelServicesConsultaTanque;

    function ValidateRequiredFields: Boolean;
    function DataSource(ADataSource: TDataSource): iModelServices;
    function Open(const AWhere: string = ''; const AOrderBy: string = ''): iModelServices;
    function Close: iModelServices;

  end;

implementation

{ TModelServicesConsultaTanque }

uses
  PostoABC.Model.DAO.Factory;

function TModelServicesConsultaTanque.Close: iModelServices;
begin
  Result := Self;
  FDaoTanque.Close;
end;

constructor TModelServicesConsultaTanque.Create(AConnection: iModelConnection);
begin
  FConnection := AConnection;
  FDaoTanque := TModelDAOFactory<TEntityConsultaTanque>.New(FConnection).DAO;
end;

function TModelServicesConsultaTanque.DataSource(ADataSource: TDataSource): iModelServices;
begin
  Result := Self;
  FDaoTanque.DataSource(ADataSource);
end;

destructor TModelServicesConsultaTanque.Destroy;
begin

  inherited;
end;

class function TModelServicesConsultaTanque.New(AConnection: iModelConnection): iModelServicesConsultaTanque;
begin
  Result := Self.Create(AConnection);
end;

function TModelServicesConsultaTanque.Open(const AWhere, AOrderBy: string): iModelServices;
begin
  Result := Self;
  FDaoTanque.OpenWhere(AWhere, AOrderBy);
end;

function TModelServicesConsultaTanque.ValidateRequiredFields: Boolean;
begin
  Result := True;
end;

end.
