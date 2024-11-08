unit PostoABC.Model.Services.Factory;

interface

uses
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Connection.Interfaces;

type
  TModelServicesFactory = class(TInterfacedObject, iModelServicesFactory)
  private
    FConnection: iModelConnection;
    FServicesConsultaTanque: iModelServicesConsultaTanque;
    FServicesConsultaBomba: iModelServicesConsultaBomba;
    FLancamentoAbastecimento: iModelServicesLancamentoAbastecimento;
    FRelatorioAbastecimento: iModelServicesRelatorioAbastecimento;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesFactory;

    function ConsultaTanque: iModelServicesConsultaTanque;
    function ConsultaBomba: iModelServicesConsultaBomba;
    function LancamentoAbastecimento: iModelServicesLancamentoAbastecimento;
    function RelatorioAbastecimento: iModelServicesRelatorioAbastecimento;

  end;

implementation

{ TModelServicesFactory }

uses
  PostoABC.Model.Connection.Factory,
  PostoABC.Model.Services.Consulta.Tanque,
  PostoABC.Model.Services.Consulta.Bomba,
  PostoABC.Model.Services.Lancamento.Abastecimento,
  PostoABC.Model.Services.Relatorio.Abastecimento;

function TModelServicesFactory.ConsultaBomba: iModelServicesConsultaBomba;
begin
  if not Assigned(FServicesConsultaBomba) then
    FServicesConsultaBomba := TModelServicesConsultaBomba.New(FConnection);
  Result := FServicesConsultaBomba;
end;

function TModelServicesFactory.ConsultaTanque: iModelServicesConsultaTanque;
begin
  if not Assigned(FServicesConsultaTanque) then
    FServicesConsultaTanque := TModelServicesConsultaTanque.New(FConnection);
  Result := FServicesConsultaTanque;
end;

constructor TModelServicesFactory.Create;
begin
  FConnection := TModelConnectionFactory.GetIntance.ModelConnection;
end;

destructor TModelServicesFactory.Destroy;
begin

  inherited;
end;

function TModelServicesFactory.LancamentoAbastecimento: iModelServicesLancamentoAbastecimento;
begin
  if not Assigned(FLancamentoAbastecimento) then
    FLancamentoAbastecimento := TModelServicesLancamentoAbastecimento.New(FConnection);
  Result := FLancamentoAbastecimento;
end;

class function TModelServicesFactory.New: iModelServicesFactory;
begin
  Result := Self.Create;
end;

function TModelServicesFactory.RelatorioAbastecimento: iModelServicesRelatorioAbastecimento;
begin
  if not Assigned(FRelatorioAbastecimento) then
    FRelatorioAbastecimento := TModelServicesRelatorioAbastecimento.New(FConnection);
  Result := FRelatorioAbastecimento;
end;

end.
