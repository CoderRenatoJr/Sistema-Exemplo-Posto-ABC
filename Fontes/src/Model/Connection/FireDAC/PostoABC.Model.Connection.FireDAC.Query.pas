unit PostoABC.Model.Connection.FireDAC.Query;

interface

uses
  Data.DB,
  FireDac.Stan.Intf,
  FireDac.Stan.Option,
  FireDac.Stan.Error,
  FireDac.UI.Intf,
  FireDac.Phys.Intf,
  FireDac.Stan.Def,
  FireDac.Stan.Pool,
  FireDac.Stan.Async,
  FireDac.Phys,
  FireDac.VCLUI.Wait,
  FireDac.Stan.Param,
  FireDac.DatS,
  FireDac.DApt.Intf,
  FireDac.DApt,
  FireDac.Phys.FBDef,
  FireDac.Phys.IBBase,
  FireDac.Phys.FB,
  FireDac.Comp.DataSet,
  FireDac.Comp.Client,
  FireDac.Comp.UI,
  PostoABC.Model.Connection.Interfaces;

type
  TModelConnectionQueryFireDAC = class(TInterfacedObject, iModelConnectionQuery)
  private
    FFDConnection: TFDConnection;
    FFDQuery: TFDQuery;
    FFDQueryExecutor: TFDQuery;

    procedure CreateInternalQuery;

  public
    constructor Create(ACustomConnection: TCustomConnection);
    destructor Destroy; override;
    class function New(ACustomConnection: TCustomConnection): iModelConnectionQuery;

    function DataSet: TDataSet;
    function Open(ASQL: string): iModelConnectionQuery;
    function ExecuteSQL(ASQL: string): iModelConnectionQuery;
    function ExecuteGenID(ASQL: string): Integer;

  end;

implementation

{ TModelConnectionQueryFireDAC }

uses
  PostoABC.Model.ORM.DataSetBind;

constructor TModelConnectionQueryFireDAC.Create(ACustomConnection: TCustomConnection);
begin
  FFDConnection := TFDConnection(ACustomConnection);
  CreateInternalQuery;
end;

procedure TModelConnectionQueryFireDAC.CreateInternalQuery;
begin
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := TFDConnection(FFDConnection);
  FFDQueryExecutor := TFDQuery.Create(nil);
  FFDQueryExecutor.Connection := TFDConnection(FFDConnection);
end;

function TModelConnectionQueryFireDAC.DataSet: TDataSet;
begin
  Result := FFDQuery;
end;

destructor TModelConnectionQueryFireDAC.Destroy;
begin
  FFDQuery.Free;
  FFDQueryExecutor.Free;

  inherited;
end;

function TModelConnectionQueryFireDAC.ExecuteGenID(ASQL: string): Integer;
begin
  FFDQueryExecutor.SQL.Clear;
  FFDQueryExecutor.SQL.Add(ASQL);
  FFDQueryExecutor.Open();
  Result := FFDQueryExecutor.Fields[0].AsInteger;
end;

function TModelConnectionQueryFireDAC.ExecuteSQL(ASQL: string): iModelConnectionQuery;
begin
  Result := Self;
  FFDQueryExecutor.SQL.Clear;
  FFDQueryExecutor.SQL.Add(ASQL);
  FFDQueryExecutor.ExecSQL;
end;

class function TModelConnectionQueryFireDAC.New(ACustomConnection: TCustomConnection): iModelConnectionQuery;
begin
  Result := Self.Create(ACustomConnection);
end;

function TModelConnectionQueryFireDAC.Open(ASQL: string): iModelConnectionQuery;
begin
  Result := Self;
  FFDQuery.SQL.Clear;
  FFDQuery.SQL.Add(ASQL);
  FFDQuery.Open();
  FFDQuery.First;
end;

end.
