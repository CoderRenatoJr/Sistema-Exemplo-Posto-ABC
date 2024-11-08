unit PostoABC.Model.Entity.Consulta.Bomba;

interface

uses
  System.SysUtils,
  Data.DB,
  PostoABC.Model.ORM.Attributes;

type
  [TTable('BOMBA_COMBUSTIVEL', 'BCM_CODIGO', 'BCM')]
  [TGenId('GEN_BOMBACOMBUSTIVEL')]
  [TLeftJoin('TANQUE', 'TAN', 'TAN.TAN_CODIGO = BCM.BCM_TAN_CODIGO')]
  TEntityConsultaBomba = class
  private
    FBCM_CODIGO: Integer;
    FBCM_TAN_CODIGO: Integer;
    FBCM_DESCRICAO: string;
    FDESCRICAO_BOMBA: string;

  public
    [TColumn('BCM_CODIGO', TFieldType.ftInteger, TRestrictionType.rRequired)]
    [TColumnOptions('Código', '')]
    property BCM_CODIGO: Integer read FBCM_CODIGO write FBCM_CODIGO;
    [TColumn('BCM_TAN_CODIGO', TFieldType.ftInteger, TRestrictionType.rRequired)]
    property BCM_TAN_CODIGO: Integer read FBCM_TAN_CODIGO write FBCM_TAN_CODIGO;
    [TColumn('BCM_DESCRICAO', TFieldType.ftString, TRestrictionType.rRequired)]
    property BCM_DESCRICAO: string read FBCM_DESCRICAO write FBCM_DESCRICAO;
    [TColumn('(cast((BCM_DESCRICAO || ' + #39 + ' - ' + #39 + ' || TAN_DESCRICAO) as varchar(100)))', TFieldType.ftString, 'DESCRICAO')]
    [TColumnOptions('Descrição', '')]
    property DESCRICAO_BOMBA: string read FDESCRICAO_BOMBA write FDESCRICAO_BOMBA;

  end;

implementation

end.
