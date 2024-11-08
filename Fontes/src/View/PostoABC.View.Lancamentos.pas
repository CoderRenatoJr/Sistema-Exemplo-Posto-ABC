unit PostoABC.View.Lancamentos;

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
  PostoABC.View.Consulta,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList, Vcl.StdCtrls;

type
  TViewLancamento = class(TViewConsulta)
    tabDados: TTabSheet;
    pnlBotoesCrud: TPanel;
    ActionList: TActionList;
    pnlDados: TPanel;
    pnlDadosBotoes: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnVisualizar: TButton;
    actInserir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actVisualizar: TAction;
    actFinalizar: TAction;
    actCancelar: TAction;
    btnCancelar: TButton;
    btnFinalizar: TButton;
    procedure actInserirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
  type
    TStatusType = (sNenhum, sInserindo, sAlterando, sExcluir, sVisualizando);

  var
    FStatus: TStatusType;

  procedure HabilitaCampos(const AEnabled: Boolean); virtual;

  private

  public

  end;

var
  ViewLancamento: TViewLancamento;

implementation

{$R *.dfm}

procedure TViewLancamento.actAlterarExecute(Sender: TObject);
begin
  inherited;
  FStatus := TStatusType.sAlterando;
  PageControl.ActivePage := tabDados;
end;

procedure TViewLancamento.actCancelarExecute(Sender: TObject);
begin
  inherited;
  HabilitaCampos(True);
  btnFinalizar.Visible := True;
  FStatus := TStatusType.sNenhum;
  PageControl.ActivePage := tabConsulta;
end;

procedure TViewLancamento.actExcluirExecute(Sender: TObject);
begin
  inherited;
  FStatus := TStatusType.sExcluir;
end;

procedure TViewLancamento.actFinalizarExecute(Sender: TObject);
begin
  inherited;
  FStatus := TStatusType.sNenhum;
  PageControl.ActivePage := tabConsulta;
end;

procedure TViewLancamento.actInserirExecute(Sender: TObject);
begin
  inherited;
  FStatus := TStatusType.sInserindo;
  PageControl.ActivePage := tabDados;
end;

procedure TViewLancamento.actVisualizarExecute(Sender: TObject);
begin
  inherited;
  HabilitaCampos(False);
  btnFinalizar.Visible := False;
  FStatus := TStatusType.sVisualizando;
  PageControl.ActivePage := tabDados;
end;

procedure TViewLancamento.FormCreate(Sender: TObject);
begin
  inherited;
  FStatus := TStatusType.sNenhum;
  PageControl.ActivePage := tabConsulta;
end;

procedure TViewLancamento.HabilitaCampos(const AEnabled: Boolean);
begin

end;

end.
