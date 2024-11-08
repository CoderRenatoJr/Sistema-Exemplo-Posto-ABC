unit PostoABC.Model.ORM.Generators;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.RTTI,
  System.TypInfo,
  System.Classes,
  System.StrUtils,
  Data.DB;

type
  TSQLGenerator = class
  private
    class function GetFieldValue(AObject: TObject; ARttiProp: TRttiProperty; AFieldType: TFieldType): string;

  public
    class function GenerateSelect(AObject: TObject): string;
    class function GenerateInsert(AObject: TObject): string;
    class function GenerateUpdate(AObject: TObject): string;
    class function GenerateDelete(AObject: TObject): string;
    class function GenerateGenId(AObject: TObject): string;

    class function GetPrimaryKey(AObject: TObject): string;

  end;

implementation

uses
  PostoABC.Model.ORM.Attributes;

{ TSQLGenerator }

class function TSQLGenerator.GenerateSelect(AObject: TObject): string;
const
  CSQL = 'select %s from %s %s %s';
  CLeftJoin = 'left outer join %s %s on %s';
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LLeftJoinAttribute: TLeftJoin;  
  LCustomAttributes: TCustomAttribute;

  LTableName: string;
  LAlias: string;
  LLeftJoin: string;
  LColumn: string;
  LColumns: TStringList;
begin
  LRttiContext := TRttiContext.Create;
  LColumns := TStringList.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
    begin
      LTableName := LRttiType.GetAttribute<TTable>.TableName;
      LAlias := LRttiType.GetAttribute<TTable>.Alias;
    end;

    LLeftJoin := '';

    for LCustomAttributes in LRttiType.GetAttributes do
    begin
      if LCustomAttributes is TLeftJoin then
      begin
        LLeftJoinAttribute := TLeftJoin(LCustomAttributes);
        LLeftJoin := LLeftJoin + Format(CLeftJoin, [LLeftJoinAttribute.TableName, LLeftJoinAttribute.Alias, LLeftJoinAttribute.On]) + ' ';
      end;
    end;

    for LRttiProp in LRttiType.GetProperties do
    begin
      LColumn := EmptyStr;

      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        if not LRttiProp.GetAttribute<TColumn>.AliasTable.Trim.IsEmpty then
          LColumn := LRttiProp.GetAttribute<TColumn>.AliasTable.Trim + '.'
        else
          LColumn := LAlias + '.';

        if not LRttiProp.GetAttribute<TColumn>.AliasField.Trim.IsEmpty then
          LColumn := LRttiProp.GetAttribute<TColumn>.ColumnName + ' as ' + LRttiProp.GetAttribute<TColumn>.AliasField.Trim
        else
          LColumn := LColumn + LRttiProp.GetAttribute<TColumn>.ColumnName;

        LColumns.Add(LColumn)
      end;
    end;

    Result := Format(CSQL, [StringReplace(LColumns.CommaText, '"', '', [rfReplaceAll]), LTableName, LAlias, LLeftJoin]);
  finally
    LRttiContext.Free;
    FreeAndNil(LColumns);
  end;
end;

class function TSQLGenerator.GenerateGenId(AObject: TObject): string;
const
  CSQL = 'select gen_id(%s, 1) from RDB$DATABASE';
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
begin
  LRttiContext := TRttiContext.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
      Result := Format(CSQL, [LRttiType.GetAttribute<TGenId>.GenId]);
  finally
    LRttiContext.Free;
  end;
end;

class function TSQLGenerator.GenerateInsert(AObject: TObject): string;
const
  CSQL = 'insert into %s (%s) values (%s)';
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LColumnAttribute: TColumn;

  LTableName: string;
  LColumns: TStringList;
  LColumnValues: TStringList;
begin
  LRttiContext := TRttiContext.Create;
  LColumns := TStringList.Create;
  LColumnValues := TStringList.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
      LTableName := LRttiType.GetAttribute<TTable>.TableName;

    for LRttiProp in LRttiType.GetProperties do
    begin
      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        LColumnAttribute := LRttiProp.GetAttribute<TColumn>;

        if LColumnAttribute.Restriction = TRestrictionType.rReadOnly then
          Continue;

        LColumns.Add(LColumnAttribute.ColumnName);
        LColumnValues.Add(GetFieldValue(AObject, LRttiProp, LColumnAttribute.FieldType));
      end;
    end;

    Result := Format(CSQL, [LTableName, LColumns.CommaText, StringReplace(LColumnValues.CommaText, '"', '', [rfReplaceAll])]);
  finally
    LRttiContext.Free;
    FreeAndNil(LColumns);
    FreeAndNil(LColumnValues);
  end;
end;

class function TSQLGenerator.GenerateUpdate(AObject: TObject): string;
const
  CSQL = 'update %s %s set %s where %s';
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LTableAttribute: TTable;
  LColumnAttribute: TColumn;

  LTableName: string;
  LAlias: string;
  LPkField: string;
  LWhere: string;
  LColumnValue: string;
  LUpdateFields: string;
  LColumnsValues: TStringList;
  I: Integer;
begin
  LRttiContext := TRttiContext.Create;
  LColumnsValues := TStringList.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
    begin
      LTableAttribute := LRttiType.GetAttribute<TTable>;
      LTableName := AnsiUpperCase(LTableAttribute.TableName);
      LAlias := LTableAttribute.Alias;
      LPkField := LTableAttribute.PrimaryKey;
    end;

    LWhere := '';

    for LRttiProp in LRttiType.GetProperties do
    begin
      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        LColumnAttribute := LRttiProp.GetAttribute<TColumn>;

        if LColumnAttribute.Restriction = TRestrictionType.rReadOnly then
          Continue;

        LColumnValue := GetFieldValue(AObject, LRttiProp, LColumnAttribute.FieldType);

        if SameText(LPkField, LColumnAttribute.ColumnName) then
          LWhere := LAlias + '.' + LPkField + ' = ' + LColumnValue
        else
          LColumnsValues.Add(LAlias + '.' + LColumnAttribute.ColumnName + ' = ' + LColumnValue);
      end;
    end;

    for I := 0 to LColumnsValues.Count - 1 do
    begin
      if ((LColumnsValues.Count = 1) or (LColumnsValues.Count - 1 = I)) then
        LUpdateFields := LUpdateFields + LColumnsValues[I]
      else
        LUpdateFields := LUpdateFields + LColumnsValues[I] + ', ';
    end;

    Result := Format(CSQL, [LTableName, LAlias, LUpdateFields, LWhere]);
  finally
    LRttiContext.Free;
    FreeAndNil(LColumnsValues);
  end;
end;

class function TSQLGenerator.GenerateDelete(AObject: TObject): string;
const
  CSQL = 'delete from %s %s where %s';
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LTableAttribute: TTable;
  LColumnAttribute: TColumn;

  LTableName: string;
  LAlias: string;
  LPkField: string;
  LWhere: string;
begin
  LRttiContext := TRttiContext.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
    begin
      LTableAttribute := LRttiType.GetAttribute<TTable>;
      LTableName := AnsiUpperCase(LTableAttribute.TableName);
      LAlias := LTableAttribute.Alias;
      LPkField := LTableAttribute.PrimaryKey;
    end;

    LWhere := '';

    for LRttiProp in LRttiType.GetProperties do
    begin
      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        LColumnAttribute := LRttiProp.GetAttribute<TColumn>;

        if SameText(LPkField, LColumnAttribute.ColumnName) then
          LWhere := LAlias + '.' + LPkField + ' = ' + GetFieldValue(AObject, LRttiProp, LColumnAttribute.FieldType);
      end;
    end;

    Result := Format(CSQL, [LTableName, LAlias, LWhere]);
  finally
    LRttiContext.Free;
  end;
end;

class function TSQLGenerator.GetFieldValue(AObject: TObject; ARttiProp: TRttiProperty; AFieldType: TFieldType): string;
begin
  case AFieldType of
    ftInteger:
      Result := ARttiProp.GetValue(AObject).ToString;
    ftFloat:
      Result := StringReplace(ARttiProp.GetValue(AObject).ToString, ',', '.', []);
    ftString:
      Result := QuotedStr(ARttiProp.GetValue(AObject).ToString);
    ftDate:
      Result := QuotedStr(FormatDateTime('dd.mm.yyyy', ARttiProp.GetValue(AObject).AsExtended));
    ftDateTime:
      Result := QuotedStr(FormatDateTime('dd.mm.yyyy hh:mm:ss', ARttiProp.GetValue(AObject).AsExtended));
  end;
end;

class function TSQLGenerator.GetPrimaryKey(AObject: TObject): string;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
begin
  LRttiContext := TRttiContext.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    if Assigned(LRttiType.GetAttribute(TTable)) then
      Result := LRttiType.GetAttribute<TTable>.PrimaryKey;
  finally
    LRttiContext.Free;
  end;
end;

end.
