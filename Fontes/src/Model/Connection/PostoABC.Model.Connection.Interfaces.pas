unit PostoABC.Model.Connection.Interfaces;

interface

uses
  Data.DB;

type
  iModelConnection = interface
    ['{6247CBBE-DD25-419F-8470-C33E4522DEAB}']
    function Connection: TCustomConnection;
  end;

  iModelConnectionQuery = interface
    ['{7308EE05-63F2-4EBB-9300-C45A8163F10D}']
    function DataSet: TDataSet;
    function Open(ASQL: string): iModelConnectionQuery;
    function ExecuteSQL(ASQL: string): iModelConnectionQuery;
    function ExecuteGenID(ASQL: string): Integer;

  end;

  iModelConnectionFactory = interface
    ['{E8D7ED53-F7C9-4508-AC39-E6F865B3B1D1}']
    function ModelConnection: iModelConnection;
  end;

implementation

end.
