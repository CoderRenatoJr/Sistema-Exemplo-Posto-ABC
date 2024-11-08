unit PostoABC.Model.Entity.Relatorio.Abastecimento;

interface

uses
  Data.DB,
  PostoABC.Model.ORM.Attributes;

type
  [TTable('ABASTECIMENTO', 'ABA_CODIGO', 'ABA')]
  [TLeftJoin('BOMBA_COMBUSTIVEL', 'BCM', 'BCM.BCM_CODIGO = ABA.ABA_BCM_CODIGO')]
  [TLeftJoin('TANQUE', 'TAN', 'TAN.TAN_CODIGO = BCM.BCM_TAN_CODIGO')]
  TEntityRelatorioAbastecimento = class
  private
    FABA_CODIGO: Integer;
    FABA_DATA: TDate;
    FABA_LITROS: Double;
    FABA_VALOR: Double;
    FABA_IMPOSTO: Double;
    FABA_VALORTOTAL: Double;
    FDESCRICAO_BOMBA: string;

  public
    [TColumn('ABA_CODIGO', TFieldType.ftInteger, TRestrictionType.rReadOnly)]
    [TColumnOptions('Código', '')]
    property ABA_CODIGO: Integer read FABA_CODIGO write FABA_CODIGO;

    [TColumn('ABA_DATA', TFieldType.ftDate, TRestrictionType.rReadOnly)]
    [TColumnOptions('Data', '')]
    property ABA_DATA: TDate read FABA_DATA write FABA_DATA;

    [TColumn('ABA_LITROS', TFieldType.ftFloat, TRestrictionType.rReadOnly)]
    [TColumnOptions('Qtde. Litros', ',0.00000')]
    property ABA_LITROS: Double read FABA_LITROS write FABA_LITROS;

    [TColumn('ABA_VALOR', TFieldType.ftFloat, TRestrictionType.rReadOnly)]
    [TColumnOptions('Valor', ',0.00')]
    property ABA_VALOR: Double read FABA_VALOR write FABA_VALOR;

    [TColumn('ABA_IMPOSTO', TFieldType.ftFloat, TRestrictionType.rReadOnly)]
    [TColumnOptions('Porc. Imposto', ',0.00')]
    property ABA_IMPOSTO: Double read FABA_IMPOSTO write FABA_IMPOSTO;

    [TColumn('ABA_VALORTOTAL', TFieldType.ftFloat, TRestrictionType.rReadOnly)]
    [TColumnOptions('Valor Total', ',0.00')]
    property ABA_VALORTOTAL: Double read FABA_VALORTOTAL write FABA_VALORTOTAL;

    [TColumn('(cast((BCM_DESCRICAO || ' + #39 + ' - ' + #39 + ' || TAN_DESCRICAO) as varchar(100)))', TFieldType.ftString, 'DESCRICAO')]
    [TColumnOptions('Descrição', '')]
    property DESCRICAO_BOMBA: string read FDESCRICAO_BOMBA write FDESCRICAO_BOMBA;

  end;

implementation

end.
