unit PostoABC.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type
  iModelDAO<T> = interface
    ['{3D7F170F-042E-4EC6-9865-AA1CF4D81B5C}']
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

  iModelDAOFactory<T> = interface
    ['{F96C29EB-831A-45CD-9242-1916BCEB26A2}']
    function DAO: iModelDAO<T>;
  end;

implementation

end.
