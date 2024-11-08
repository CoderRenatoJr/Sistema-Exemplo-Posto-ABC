unit PostoABC.Model.Entity.Lancamento.Abastecimento;

interface

uses
  Data.DB,
  PostoABC.Model.ORM.Attributes;

type

  [TTable('ABASTECIMENTO', 'ABA_CODIGO', 'ABA')]
  [TGenId('GEN_ABASTECIMENTO')]
  TEntityLancamentoAbastecimento = class
  private
    FABA_CODIGO: Integer;
    FABA_DATA: TDate;
    FABA_BCM_CODIGO: Integer;
    FABA_VALOR: Double;
    FABA_LITROS: Double;
    FABA_IMPOSTO: Double;
    FABA_VALORTOTAL: Double;

  public
    [TColumn('ABA_CODIGO', TFieldType.ftInteger, TRestrictionType.rRequired)]
    [TColumnOptions('Código', '')]
    property ABA_CODIGO: Integer read FABA_CODIGO write FABA_CODIGO;

    [TColumn('ABA_DATA', TFieldType.ftDate, TRestrictionType.rRequired)]
    [TColumnOptions('Data', '')]
    property ABA_DATA: TDate read FABA_DATA write FABA_DATA;

    [TColumn('ABA_BCM_CODIGO', TFieldType.ftInteger, TRestrictionType.rRequired)]
    [TColumnOptions('Código da Bomba', '')]
    property ABA_BCM_CODIGO: Integer read FABA_BCM_CODIGO write FABA_BCM_CODIGO;

    [TColumn('ABA_LITROS', TFieldType.ftFloat, TRestrictionType.rRequired)]
    [TColumnOptions('Qtde. Litros', ',0.00000')]
    property ABA_LITROS: Double read FABA_LITROS write FABA_LITROS;

    [TColumn('ABA_VALOR', TFieldType.ftFloat, TRestrictionType.rRequired)]
    [TColumnOptions('Valor', ',0.00')]
    property ABA_VALOR: Double read FABA_VALOR write FABA_VALOR;

    [TColumn('ABA_IMPOSTO', TFieldType.ftFloat, TRestrictionType.rRequired)]
    [TColumnOptions('Porc. Imposto', ',0.00')]
    property ABA_IMPOSTO: Double read FABA_IMPOSTO write FABA_IMPOSTO;

    [TColumn('ABA_VALORTOTAL', TFieldType.ftFloat, TRestrictionType.rRequired)]
    [TColumnOptions('Valor Total', ',0.00')]
    property ABA_VALORTOTAL: Double read FABA_VALORTOTAL write FABA_VALORTOTAL;

    constructor Create;
    destructor Destroy; override;

    function Codigo(const AValue: Integer): TEntityLancamentoAbastecimento; overload;
    function Codigo: Integer; overload;
    function Data(const AValue: TDate): TEntityLancamentoAbastecimento; overload;
    function Data: TDate; overload;
    function CodigoBomba(const AValue: Integer): TEntityLancamentoAbastecimento; overload;
    function CodigoBomba: Integer; overload;
    function QtdeLitros(const AValue: Double): TEntityLancamentoAbastecimento; overload;
    function QtdeLitros: Double; overload;
    function Valor(const AValue: Double): TEntityLancamentoAbastecimento; overload;
    function Valor: Double; overload;
    function Imposto(const AValue: Double): TEntityLancamentoAbastecimento; overload;
    function Imposto: Double; overload;
    function ValorTotal(const AValue: Double): TEntityLancamentoAbastecimento; overload;
    function ValorTotal: Double; overload;

  end;

implementation

{ TEntityLancamentoAbastecimento }

constructor TEntityLancamentoAbastecimento.Create;
begin

end;

destructor TEntityLancamentoAbastecimento.Destroy;
begin

  inherited;
end;

function TEntityLancamentoAbastecimento.Codigo(const AValue: Integer): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_CODIGO := AValue;
end;

function TEntityLancamentoAbastecimento.Codigo: Integer;
begin
  Result := FABA_CODIGO;
end;

function TEntityLancamentoAbastecimento.Data(const AValue: TDate): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_DATA := AValue;
end;

function TEntityLancamentoAbastecimento.Data: TDate;
begin
  Result := FABA_DATA;
end;

function TEntityLancamentoAbastecimento.CodigoBomba(const AValue: Integer): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_BCM_CODIGO := AValue;
end;

function TEntityLancamentoAbastecimento.CodigoBomba: Integer;
begin
  Result := FABA_BCM_CODIGO;
end;

function TEntityLancamentoAbastecimento.Valor(const AValue: Double): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_VALOR := AValue;
end;

function TEntityLancamentoAbastecimento.Valor: Double;
begin
  Result := FABA_VALOR;
end;

function TEntityLancamentoAbastecimento.QtdeLitros(const AValue: Double): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_LITROS := AValue;
end;

function TEntityLancamentoAbastecimento.QtdeLitros: Double;
begin
  Result := FABA_LITROS;
end;

function TEntityLancamentoAbastecimento.Imposto(const AValue: Double): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_IMPOSTO := AValue;
end;

function TEntityLancamentoAbastecimento.Imposto: Double;
begin
  Result := FABA_IMPOSTO;
end;

function TEntityLancamentoAbastecimento.ValorTotal(const AValue: Double): TEntityLancamentoAbastecimento;
begin
  Result := Self;
  FABA_VALORTOTAL := AValue;
end;

function TEntityLancamentoAbastecimento.ValorTotal: Double;
begin
  Result := FABA_VALORTOTAL;
end;

end.
