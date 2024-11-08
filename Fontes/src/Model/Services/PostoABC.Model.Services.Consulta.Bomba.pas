unit PostoABC.Model.Services.Consulta.Bomba;

interface

uses
  Data.DB,
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Connection.Interfaces,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Entity.Consulta.Bomba;

type
  TModelServicesConsultaBomba = class(TInterfacedObject, iModelServicesConsultaBomba, iModelServices)
  private
    [weak]
    FConnection: iModelConnection;
    FDaoBomba: iModelDAO<TEntityConsultaBomba>;

  public
    constructor Create(AConnection: iModelConnection);
    destructor Destroy; override;
    class function New(AConnection: iModelConnection): iModelServicesConsultaBomba;

    function ValidateRequiredFields: Boolean;
    function DataSource(ADataSource: TDataSource): iModelServices;
    function Open(const AWhere: string = ''; const AOrderBy: string = ''): iModelServices;
    function Close: iModelServices;

  end;

implementation

{ TModelServicesConsultaBomba }

uses
  PostoABC.Model.DAO.Factory;

function TModelServicesConsultaBomba.Close: iModelServices;
begin
  Result := SElf;
  FDaoBomba.Close;
end;

constructor TModelServicesConsultaBomba.Create(AConnection: iModelConnection);
begin
  FConnection := AConnection;
  FDaoBomba := TModelDAOFactory<TEntityConsultaBomba>.New(FConnection).DAO;
end;

function TModelServicesConsultaBomba.DataSource(ADataSource: TDataSource): iModelServices;
begin
  Result := Self;
  FDaoBomba.DataSource(ADataSource);
end;

destructor TModelServicesConsultaBomba.Destroy;
begin

  inherited;
end;

class function TModelServicesConsultaBomba.New(AConnection: iModelConnection): iModelServicesConsultaBomba;
begin
  Result := Self.Create(AConnection);
end;

function TModelServicesConsultaBomba.Open(const AWhere, AOrderBy: string): iModelServices;
begin
  Result := Self;
  FDaoBomba.OpenWhere(AWhere, AOrderBy);
end;

function TModelServicesConsultaBomba.ValidateRequiredFields: Boolean;
begin
  Result := True;
end;

end.
