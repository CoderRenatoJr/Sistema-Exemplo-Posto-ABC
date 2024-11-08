unit PostoABC.Model.DAO;

interface

uses
  System.SysUtils,
  System.StrUtils,
  Data.DB,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Connection.Interfaces;

type
  TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FQuery: iModelConnectionQuery;
    FObject: T;
    FRecNo: Integer;

    procedure CreateNewObject;
    procedure FreeObject;
    procedure ReloadObject;
    procedure InternalOpen(AWhere, AOrderBy: string);

  public
    constructor Create(ACustomConnection: TCustomConnection);
    destructor Destroy; override;
    class function New(ACustomConnection: TCustomConnection): iModelDAO<T>;

    function Open: iModelDAO<T>;
    function OpenWhere(AWhere: string; AOrderBy: string = ''): iModelDAO<T>;
    function OpenById(AId: Integer): iModelDAO<T>;
    function Close: iModelDAO<T>;
    function Insert: iModelDAO<T>;
    function Update: iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Cancel: iModelDAO<T>;
    function NextID: Integer;
    function NewObject: T;
    function CurrentObject: T;
    function DataSet: TDataSet;
    function DataSource(ADataSource: TDataSource): iModelDAO<T>;

  end;

implementation

uses
  PostoABC.Model.Connection.FireDAC.Query,
  PostoABC.Model.ORM.Generators,
  PostoABC.Model.ORM.DataSetBind;

{ TModelDAO<T> }

function TModelDAO<T>.Cancel: iModelDAO<T>;
begin
  Result := Self;
  FreeObject;
  FRecNo := -1;
  FQuery.DataSet.Cancel;
end;

function TModelDAO<T>.Close: iModelDAO<T>;
begin
  Result := Self;
  FreeObject;
  FRecNo := -1;
  FQuery.DataSet.Close;
end;

constructor TModelDAO<T>.Create(ACustomConnection: TCustomConnection);
begin
  FQuery := TModelConnectionQueryFireDAC.New(ACustomConnection);
end;

procedure TModelDAO<T>.CreateNewObject;
begin
  if Assigned(FObject) then
    FObject.Free;

  FObject := T.Create;
end;

function TModelDAO<T>.CurrentObject: T;
begin
  ReloadObject;
  Result := FObject;
end;

function TModelDAO<T>.DataSet: TDataSet;
begin
  Result := FQuery.DataSet;
end;

function TModelDAO<T>.DataSource(ADataSource: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  ADataSource.DataSet := FQuery.DataSet;;
end;

function TModelDAO<T>.Delete: iModelDAO<T>;
begin
  Result := Self;
  try
    ReloadObject;
    FQuery.ExecuteSQL(TSQLGenerator.GenerateDelete(FObject));
    FreeObject;
  except on E: Exception do
    raise Exception.Create('Erro ao excluir o registro.' + sLineBreak + E.Message);
  end;
end;

destructor TModelDAO<T>.Destroy;
begin
  if Assigned(FObject) then
    FObject.Free;

  inherited;
end;

procedure TModelDAO<T>.FreeObject;
begin
  if Assigned(FObject) then
    FObject.Free;

  FObject := nil;
end;

function TModelDAO<T>.Insert: iModelDAO<T>;
begin
  Result := Self;
  try
    FQuery.ExecuteSQL(TSQLGenerator.GenerateInsert(FObject));
  except on E: Exception do
    raise Exception.Create('Erro ao incluir o registro.' + sLineBreak + E.Message);
  end;
end;

procedure TModelDAO<T>.InternalOpen(AWhere, AOrderBy: string);
begin
  try
    CreateNewObject;
    FRecNo := 0;
    FQuery.Open(TSQLGenerator.GenerateSelect(FObject) +
      IfThen(not AWhere.Trim.IsEmpty, ' where ' + AWhere) +
      IfThen(not AOrderBy.Trim.IsEmpty, ' order by ' + AOrderBy));
    TDataSetBind.ColumnOptionToField(FQuery.DataSet, FObject);
    ReloadObject;
  except on E: Exception do
    raise Exception.Create('Erro ao consultar.' + sLineBreak + E.Message);
  end;
end;

class function TModelDAO<T>.New(ACustomConnection: TCustomConnection): iModelDAO<T>;
begin
  Result := Self.Create(ACustomConnection);
end;

function TModelDAO<T>.NewObject: T;
begin
  CreateNewObject;
  FQuery.DataSet.Append;
  FRecNo := -1;
  Result := FObject;
end;

function TModelDAO<T>.NextID: Integer;
begin
  Result := FQuery.ExecuteGenID(TSQLGenerator.GenerateGenId(FObject));
end;

function TModelDAO<T>.Open: iModelDAO<T>;
begin
  Result := Self;
  InternalOpen('', '');
end;

function TModelDAO<T>.OpenById(AId: Integer): iModelDAO<T>;
begin
  Result := Self;
  CreateNewObject;
  InternalOpen(TSQLGenerator.GetPrimaryKey(FObject) + ' = ' + IntToStr(AId), '');
end;

function TModelDAO<T>.OpenWhere(AWhere: string; AOrderBy: string = ''): iModelDAO<T>;
begin
  Result := Self;
  InternalOpen(AWhere, AOrderBy);
end;

procedure TModelDAO<T>.ReloadObject;
begin
  if FRecNo = -1 then
    Exit;

  if FQuery.DataSet.IsEmpty then
    Exit;

  if FRecNo <> FQuery.DataSet.RecNo then
  begin
    TDataSetBind.DataSetToObject(FQuery.DataSet, FObject);
    FRecNo := FQuery.DataSet.RecNo;
  end;
end;

function TModelDAO<T>.Update: iModelDAO<T>;
begin
  Result := Self;
  try
    FQuery.ExecuteSQL(TSQLGenerator.GenerateUpdate(FObject));
  except on E: Exception do
    raise Exception.Create('Erro ao alterar o registro.' + sLineBreak + E.Message);
  end;
end;

end.
