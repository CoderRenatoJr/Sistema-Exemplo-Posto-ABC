unit PostoABC.Model.ORM.Attributes;

interface

uses
  System.Classes,
  System.SysUtils,
  Data.DB;

type
  TRestrictionType = (rNone, rRequired, rReadOnly);

  TTable = class(TCustomAttribute)
  private
    FTableName: string;
    FPrimaryKey: string;
    FAlias: string;

  public
    constructor Create(ATableName, APrimaryKey, AAlias: string);

    property TableName: string read FTableName;
    property PrimaryKey: string read FPrimaryKey;
    property Alias: string read FAlias;

  end;

  TLeftJoin = class(TCustomAttribute)
  private
    FTableName: string;
    FOn: string;
    FAlias: string;

  public
    constructor Create(ATableName, AAlias, AOn: string);

    property TableName: string read FTableName;
    property Alias: string read FAlias;
    property &On: string read FOn;

  end;

  TColumn = class(TCustomAttribute)
  private
    FColumnName: string;
    FFieldType: TFieldType;
    FRestriction: TRestrictionType;
    FAliasTable: string;
    FAliasField: string;

  public
    constructor Create(AColumnName: string; AFieldType: TFieldType; ARestriction: TRestrictionType; AAliasTable: string = ''); overload;
    constructor Create(AExpressionColumn: string; AFieldType: TFieldType; AAliasField: string = ''); overload;

    property ColumnName: string read FColumnName;
    property FieldType: TFieldType read FFieldType;
    property Restriction: TRestrictionType read FRestriction;
    property AliasTable: string read FAliasTable;
    property AliasField: string read FAliasField;

  end;

  TColumnOptions = class(TCustomAttribute)
  private
    FDisplayName: string;
    FFormatMask: string;

  public
    constructor Create(ADisplayName, AFormatMask: string);

    property DisplayName: string read FDisplayName;
    property FormatMask: string read FFormatMask;

  end;

  TGenId = class(TCustomAttribute)
  private
    FGenId: string;

  public
    constructor Create(AGenId: string);

    property GenId: string read FGenId;

  end;

implementation

{ TTable }

constructor TTable.Create(ATableName, APrimaryKey, AAlias: string);
begin
  FTableName := ATableName;
  FPrimaryKey := APrimaryKey;
  FAlias := AAlias;
end;

{ TColumn }

constructor TColumn.Create(AColumnName: string; AFieldType: TFieldType; ARestriction: TRestrictionType; AAliasTable: string);
begin
  FColumnName := AColumnName;
  FFieldType := AFieldType;
  FRestriction := ARestriction;
  FAliasTable := AAliasTable;
  FAliasField := EmptyStr;
end;

constructor TColumn.Create(AExpressionColumn: string; AFieldType: TFieldType; AAliasField: string);
begin
  FColumnName := AExpressionColumn;
  FFieldType := AFieldType;
  FRestriction := TRestrictionType.rReadOnly;
  FAliasTable := EmptyStr;
  FAliasField := AAliasField;
end;

{ TColumnOptions }

constructor TColumnOptions.Create(ADisplayName, AFormatMask: string);
begin
  FDisplayName := ADisplayName;
  FFormatMask := AFormatMask;
end;

{ TGenId }

constructor TGenId.Create(AGenId: string);
begin
  FGenId := AGenId;
end;

{ TLeftJoin }

constructor TLeftJoin.Create(ATableName, AAlias, AOn: string);
begin
  FTableName := ATableName;
  FAlias := AAlias;
  FOn := AOn;
end;

end.
