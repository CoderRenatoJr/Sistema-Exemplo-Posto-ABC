unit PostoABC.Model.Services.Relatorio.Abastecimento;

interface

uses
  Data.DB,
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Connection.Interfaces,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Entity.Relatorio.Abastecimento;

type
  TModelServicesRelatorioAbastecimento = class(TInterfacedObject, iModelServicesRelatorioAbastecimento, iModelServices)
  private
    [weak]
    FConnection: iModelConnection;
    FDaoAbastecimento: iModelDAO<TEntityRelatorioAbastecimento>;

  public
    constructor Create(AConnection: iModelConnection);
    destructor Destroy; override;
    class function New(AConnection: iModelConnection): iModelServicesRelatorioAbastecimento;

    function ValidateRequiredFields: Boolean;
    function DataSource(ADataSource: TDataSource): iModelServices;
    function Open(const AWhere: string = ''; const AOrderBy: string = ''): iModelServices;
    function Close: iModelServices;

  end;

implementation

{ TModelServicesRelatorioAbastecimento }

uses
  PostoABC.Model.DAO.Factory;

function TModelServicesRelatorioAbastecimento.Close: iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.Close;
end;

constructor TModelServicesRelatorioAbastecimento.Create(AConnection: iModelConnection);
begin
  FConnection := AConnection;
  FDaoAbastecimento := TModelDAOFactory<TEntityRelatorioAbastecimento>.New(FConnection).DAO;
end;

function TModelServicesRelatorioAbastecimento.DataSource(ADataSource: TDataSource): iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.DataSource(ADataSource);
end;

destructor TModelServicesRelatorioAbastecimento.Destroy;
begin

  inherited;
end;

class function TModelServicesRelatorioAbastecimento.New(AConnection: iModelConnection): iModelServicesRelatorioAbastecimento;
begin
  Result := Self.Create(AConnection);
end;

function TModelServicesRelatorioAbastecimento.Open(const AWhere, AOrderBy: string): iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.OpenWhere(AWhere, AOrderBy);
end;

function TModelServicesRelatorioAbastecimento.ValidateRequiredFields: Boolean;
begin
  Result := False;
end;

end.
