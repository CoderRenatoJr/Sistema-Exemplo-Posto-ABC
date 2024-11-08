unit PostoABC.Model.ORM.DataSetBind;

interface

uses
  System.SysUtils,
  System.RTTI,
  System.TypInfo,
  System.Classes,
  System.Variants,
  Data.DB;

type
  TDataSetBind = class
    class procedure DataSetToObject(ADataSet: TDataSet; AObject: TObject);
    class procedure ColumnOptionToField(ADataSet: TDataSet; AObject: TObject);
    class procedure ValidateRequiredFields(ADataSet: TDataSet);
  end;

implementation

uses
  PostoABC.Model.ORM.Attributes;

{ TDataSetBind }

class procedure TDataSetBind.ColumnOptionToField(ADataSet: TDataSet; AObject: TObject);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LFieldName: string;
begin
  if ADataSet.Fields.Count <= 0 then
    Exit;

  LRttiContext := TRttiContext.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    for LRttiProp in LRttiType.GetProperties do
    begin
      LFieldName := EmptyStr;
      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        if not LRttiProp.GetAttribute<TColumn>.AliasField.Trim.IsEmpty then
          LFieldName := LRttiProp.GetAttribute<TColumn>.AliasField
        else
          LFieldName := LRttiProp.GetAttribute<TColumn>.ColumnName;
      end;

      if LFieldName.Trim.IsEmpty then
        Continue;

      ADataSet.FieldByName(LFieldName).Required := (LRttiProp.GetAttribute<TColumn>.Restriction = TRestrictionType.rRequired);

      if not Assigned(LRttiProp.GetAttribute(TColumnOptions)) then
      begin
        ADataSet.FieldByName(LFieldName).Visible := False;
        Continue;
      end;

      ADataSet.FieldByName(LFieldName).DisplayLabel := LRttiProp.GetAttribute<TColumnOptions>.DisplayName;

      if LRttiProp.GetAttribute<TColumn>.FieldType = TFieldType.ftFloat then
        TFloatField(ADataSet.FieldByName(LFieldName)).DisplayFormat := LRttiProp.GetAttribute<TColumnOptions>.FormatMask;
    end;
  finally
    LRttiContext.Free;
  end;
end;

class procedure TDataSetBind.DataSetToObject(ADataSet: TDataSet; AObject: TObject);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiProp: TRttiProperty;
  LFieldType: TFieldType;
  LFieldName: string;
  LFieldValue: Variant;
  LValue: TValue;
begin
  if ADataSet.IsEmpty then
    Exit;

  LRttiContext := TRttiContext.Create;

  try
    LRttiType := LRttiContext.GetType(AObject.ClassType);

    for LRttiProp in LRttiType.GetProperties do
    begin
      LFieldType := TFieldType.ftUnknown;
      LFieldName := EmptyStr;

      if Assigned(LRttiProp.GetAttribute(TColumn)) then
      begin
        if not LRttiProp.GetAttribute<TColumn>.AliasField.Trim.IsEmpty then
          LFieldName := LRttiProp.GetAttribute<TColumn>.AliasField
        else
          LFieldName := LRttiProp.GetAttribute<TColumn>.ColumnName;
        LFieldType := LRttiProp.GetAttribute<TColumn>.FieldType;
      end;

      if LFieldName.Trim.IsEmpty then
        Continue;

      LFieldValue := ADataSet.FieldByName(LFieldName).Value;

      try
        if VarIsNull(LFieldValue) then
          LValue := TValue.Empty
        else
        begin
          case LFieldType of
            ftInteger, ftString:
              LValue := TValue.FromVariant(LFieldValue);
            ftFloat: begin
              if LRttiProp.PropertyType.Handle = TypeInfo(Single) then
                LValue := TValue.From<Single>(LFieldValue)
              else if LRttiProp.PropertyType.Handle = TypeInfo(Double) then
                LValue := TValue.From<Double>(LFieldValue)
              else if LRttiProp.PropertyType.Handle = TypeInfo(Extended) then
                LValue := TValue.From<Extended>(LFieldValue)
              else if LRttiProp.PropertyType.Handle = TypeInfo(Currency) then
                LValue := TValue.From<Currency>(LFieldValue);
            end;
            ftDateTime:
              LValue := TValue.From<TDateTime>(LFieldValue);
            ftDate:
              LValue := TValue.From<TDate>(LFieldValue);
          end;
        end;
      except on E: Exception do
        raise Exception.Create('Não foi possível recuperar o valor do campo [' + LFieldName + ']');
      end;

      LRttiProp.SetValue(TObject(AObject), LValue);
    end;
  finally
    LRttiContext.Free;
  end;
end;

class procedure TDataSetBind.ValidateRequiredFields(ADataSet: TDataSet);
var
  I: Integer;
begin
  if ADataSet.IsEmpty then
    Exit;

  for I := 0 to ADataSet.Fields.Count - 1 do
    if ((ADataSet.Fields[I].Required) and (ADataSet.Fields[I].IsNull)) then
      raise Exception.Create('O campo ' + QuotedStr(ADataSet.Fields[I].DisplayLabel) + ' é obrigatório! Preencha-o antes de continuar.');
end;

end.
