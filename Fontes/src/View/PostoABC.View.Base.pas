unit PostoABC.View.Base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  PostoABC.Controller.Interfaces,
  PostoABC.Model.Types,
  PostoABC.Model.Funcoes.Interfaces;

type
  TViewBase = class(TForm)
    pnlPrincipal: TPanel;
    DtSrc: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    FController: iController;
    FFormularioType: TFormularioType;
    FFuncoesGerais: iModelFuncoesGerais;

  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AFormularioType: TFormularioType); reintroduce;

  end;

var
  ViewBase: TViewBase;

implementation

{$R *.dfm}

uses
  PostoABC.Controller,
  PostoABC.Model.Funcoes.Gerais;

{ TViewConsulta }

constructor TViewBase.Create(AOwner: TComponent; AFormularioType: TFormularioType);
begin
  inherited Create(AOwner);
  FController := TController.New;
  FFuncoesGerais := TModelFuncoesGerais.New;
  FFormularioType := AFormularioType;
  Caption := FFormularioType.Caption;
end;

procedure TViewBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TViewBase.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
