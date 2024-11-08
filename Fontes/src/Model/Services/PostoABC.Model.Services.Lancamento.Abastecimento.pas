unit PostoABC.Model.Services.Lancamento.Abastecimento;

interface

uses
  System.SysUtils,
  Data.DB,
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Connection.Interfaces,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Entity.Lancamento.Abastecimento;

type
  TModelServicesLancamentoAbastecimento = class(TInterfacedObject, iModelServicesLancamentoAbastecimento, iModelServices)
  private
    [weak]
    FConnection: iModelConnection;
    FDaoAbastecimento: iModelDAO<TEntityLancamentoAbastecimento>;

  public
    constructor Create(AConnection: iModelConnection);
    destructor Destroy; override;
    class function New(AConnection: iModelConnection): iModelServicesLancamentoAbastecimento;

    function ValidateRequiredFields: Boolean;
    function DataSource(ADataSource: TDataSource): iModelServices;
    function Open(const AWhere: string = ''; const AOrderBy: string = ''): iModelServices;
    function Close: iModelServices;

    function DAO: iModelDAO<TEntityLancamentoAbastecimento>;

  end;

implementation

{ TModelServicesLancamentoAbastecimento }

uses
  PostoABC.Model.DAO.Factory,
  PostoABC.Model.Exceptions.Types;

function TModelServicesLancamentoAbastecimento.Close: iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.Close;
end;

constructor TModelServicesLancamentoAbastecimento.Create(AConnection: iModelConnection);
begin
  FConnection := AConnection;
  FDaoAbastecimento := TModelDAOFactory<TEntityLancamentoAbastecimento>.New(FConnection).DAO;
end;

function TModelServicesLancamentoAbastecimento.DAO: iModelDAO<TEntityLancamentoAbastecimento>;
begin
  Result := FDaoAbastecimento;
end;

function TModelServicesLancamentoAbastecimento.DataSource(ADataSource: TDataSource): iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.DataSource(ADataSource);
end;

destructor TModelServicesLancamentoAbastecimento.Destroy;
begin

  inherited;
end;

class function TModelServicesLancamentoAbastecimento.New(AConnection: iModelConnection): iModelServicesLancamentoAbastecimento;
begin
  Result := Self.Create(AConnection);
end;

function TModelServicesLancamentoAbastecimento.Open(const AWhere, AOrderBy: string): iModelServices;
begin
  Result := Self;
  FDaoAbastecimento.OpenWhere(AWhere, AOrderBy);
end;

function TModelServicesLancamentoAbastecimento.ValidateRequiredFields: Boolean;
begin
  if FDaoAbastecimento.CurrentObject.CodigoBomba <= 0 then
    raise TExceptionBombaNaoSelecionada.Create;

  if FDaoAbastecimento.CurrentObject.QtdeLitros <= 0 then
    raise TExceptionQtdeLitrosNaoInformada.Create;

  if FDaoAbastecimento.CurrentObject.Valor <= 0 then
    raise TExceptionValorNaoInformada.Create;

  Result := True;
end;

end.
