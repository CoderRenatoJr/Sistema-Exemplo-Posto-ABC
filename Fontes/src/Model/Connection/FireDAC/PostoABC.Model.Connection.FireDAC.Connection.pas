unit PostoABC.Model.Connection.FireDAC.Connection;

interface

uses
  System.SysUtils,
  Vcl.Dialogs,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  PostoABC.Model.Connection.Interfaces,
  PostoABC.Model.Ini.Interfaces;

type
  TModelConnectionFireDAC = class(TInterfacedObject, iModelConnection)
  private
    FFDConnection: TFDConnection;
    FFDrive: TFDPhysFBDriverLink;
    FFDWaitCursor: TFDGUIxWaitCursor;

    procedure ConfiguraConexao;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnection;

    function Connection: TCustomConnection;

  end;

implementation

{ TModelConnectionFireDAC }

uses
  PostoABC.Model.Ini;

procedure TModelConnectionFireDAC.ConfiguraConexao;
var
  LModelIni: iModelIni;
begin
  LModelIni := TModelIni.New;

  try
    FFDrive.VendorLib := 'fbclient.dll';

    if ((LModelIni.UserName.Trim.IsEmpty) or
        (LModelIni.Password.Trim.IsEmpty)) then
      raise Exception.Create('Usuário/Senha da Base de Dados não definido!');

    if LModelIni.Path.Trim.IsEmpty then
      raise Exception.Create('Caminho da Base de Dados n]ao definido!');

    FFDConnection.Params.Clear;
    FFDConnection.DriverName := 'FB';
    FFDConnection.LoginPrompt := False;
    FFDConnection.Params.UserName := LModelIni.UserName;
    FFDConnection.Params.Password := LModelIni.Password;
    FFDConnection.Params.Database := LModelIni.Path;
    FFDConnection.Params.Add('CharacterSet-WIN1252');
    FFDConnection.Connected := True;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

function TModelConnectionFireDAC.Connection: TCustomConnection;
begin
  Result := FFDConnection;
end;

constructor TModelConnectionFireDAC.Create;
begin
  FFDConnection := TFDConnection.Create(nil);
  FFDrive := TFDPhysFBDriverLink.Create(FFDConnection);
  FFDWaitCursor := TFDGUIxWaitCursor.Create(FFDConnection);
  FFDrive.ThreadSafe := True;

  ConfiguraConexao;
end;

destructor TModelConnectionFireDAC.Destroy;
begin
  FFDWaitCursor.Free;
  FFDrive.Free;
  FFDConnection.Free;

  inherited;
end;

class function TModelConnectionFireDAC.New: iModelConnection;
begin
  Result := Self.Create;
end;

end.
