unit PostoABC.Model.Entity.Consulta.Tanque;

interface

uses
  Data.DB,
  PostoABC.Model.ORM.Attributes;

type
  [TTable('TANQUE', 'TAN_CODIGO', 'TAN')]
  [TGenId('GEN_TANQUE')]
  TEntityConsultaTanque = class
  private
    FTAN_CODIGO: Integer;
    FTAN_DESCRICAO: string;

  public
    [TColumn('TAN_CODIGO', TFieldType.ftInteger, TRestrictionType.rRequired)]
    [TColumnOptions('Código', '')]
    property TAN_CODIGO: Integer read FTAN_CODIGO write FTAN_CODIGO;
    [TColumn('TAN_DESCRICAO', TFieldType.ftString, TRestrictionType.rRequired)]
    [TColumnOptions('Descrição', '')]
    property TAN_DESCRICAO: string read FTAN_DESCRICAO write FTAN_DESCRICAO;

  end;

implementation

end.
