unit PostoABC.Model.Ini;

interface

uses
  System.SysUtils,
  Vcl.Dialogs,
  Vcl.Forms,
  IniFiles,
  PostoABC.Model.Ini.Interfaces;

type
  TModelIni = class(TInterfacedObject, iModelIni)
  private
    FUserName: string;
    FPassword: string;
    FPath: string;

    procedure LerIni;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelIni;

    function UserName: string;
    function Password: string;
    function Path: string;

  end;

implementation

{ TModelIni }

constructor TModelIni.Create;
begin
  LerIni;
end;

destructor TModelIni.Destroy;
begin

  inherited;
end;

procedure TModelIni.LerIni;
var
  LIni: TMemIniFile;
begin
  try
    if not FileExists('database.ini') then
      raise Exception.Create('Não existe o arquivo de conexão a Base de Dados!');

    LIni := TMemIniFile.Create('database.ini');

    try
      FUserName := LIni.ReadString('database', 'UserName', '');
      FPassword := LIni.ReadString('database', 'Password', '');
      FPath := LIni.ReadString('database', 'Path', '');
    finally
      LIni.Free;
    end;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Application.Terminate;
    end;
  end;
end;

class function TModelIni.New: iModelIni;
begin
  Result := Self.Create;
end;

function TModelIni.Password: string;
begin
  Result := FPassword;
end;

function TModelIni.Path: string;
begin
  Result := FPath;
end;

function TModelIni.UserName: string;
begin
  Result := FUserName;
end;

end.
