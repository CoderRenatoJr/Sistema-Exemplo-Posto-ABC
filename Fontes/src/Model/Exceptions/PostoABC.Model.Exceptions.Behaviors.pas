unit PostoABC.Model.Exceptions.Behaviors;

interface

uses
  System.SysUtils,
  System.UITypes,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TModelExceptionsBehaviors = class
  private
    procedure BehaviorException(Sender: TObject; E: Exception);

  public
    constructor Create;
    destructor Destroy; override;

  end;

var
  ModelBehaviors: TModelExceptionsBehaviors;

implementation

{ TModelExceptionsBehaviors }

uses PostoABC.Model.Exceptions.Types;

procedure TModelExceptionsBehaviors.BehaviorException(Sender: TObject; E: Exception);
begin
  if ((E is TExceptionBombaNaoSelecionada) or
      (E is TExceptionQtdeLitrosNaoInformada) or
      (E is TExceptionValorNaoInformada)) then
    MessageDlg(E.Message, TMsgDlgType.mtWarning, [mbOK], 0)
  else
    MessageDlg(E.Message, TMsgDlgType.mtError, [mbOK], 0);
end;

constructor TModelExceptionsBehaviors.Create;
begin
  Application.OnException := BehaviorException;
end;

destructor TModelExceptionsBehaviors.Destroy;
begin

  inherited;
end;

initialization

ModelBehaviors := TModelExceptionsBehaviors.Create;

finalization

ModelBehaviors.Free;

end.
