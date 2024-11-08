unit PostoABC.View.Lancamentos.Abastecimento;

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
  PostoABC.View.Lancamentos,
  Data.DB,
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Mask;

type
  TViewLancamentoAbastecimento = class(TViewLancamento)
    Label1: TLabel;
    dtpDataLancamento: TDateTimePicker;
    Label2: TLabel;
    lcbCodigoBomba: TDBLookupComboBox;
    DtSrcBomba: TDataSource;
    Label3: TLabel;
    edtQtdeLitros: TDBEdit;
    Label4: TLabel;
    edtValor: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  protected
    procedure HabilitaCampos(const AEnabled: Boolean); override;

  private const
    CPorcImposto = 13;

    procedure SalvaDadosObject;

  public

  end;

var
  ViewLancamentoAbastecimento: TViewLancamentoAbastecimento;

implementation

{$R *.dfm}

procedure TViewLancamentoAbastecimento.actAlterarExecute(Sender: TObject);
begin
  FController.Services.ConsultaBomba.Open('', 'BCM_CODIGO');

  dtpDataLancamento.Date := FController.Services.LancamentoAbastecimento.DAO.CurrentObject.Data;

  inherited;
end;

procedure TViewLancamentoAbastecimento.actCancelarExecute(Sender: TObject);
begin
  inherited;
  FController.Services.LancamentoAbastecimento.DAO.Cancel.OpenWhere('', 'ABA_CODIGO');
  FController.Services.ConsultaBomba.Close;
end;

procedure TViewLancamentoAbastecimento.actExcluirExecute(Sender: TObject);
begin
  inherited;
  FController.Services.LancamentoAbastecimento.DAO.Delete.Open;
  FStatus := TStatusType.sNenhum;
end;

procedure TViewLancamentoAbastecimento.actFinalizarExecute(Sender: TObject);
begin
  SalvaDadosObject;

  if not FController.Services.LancamentoAbastecimento.ValidateRequiredFields then
    Exit;

  if FStatus = TStatusType.sInserindo then
    FController.Services.LancamentoAbastecimento.DAO.Insert
  else if FStatus = TStatusType.sAlterando then
    FController.Services.LancamentoAbastecimento.DAO.Update;

  FController.Services.LancamentoAbastecimento.Open('', 'ABA_CODIGO');
  FController.Services.ConsultaBomba.Close;
  inherited;
end;

procedure TViewLancamentoAbastecimento.actInserirExecute(Sender: TObject);
begin
  dtpDataLancamento.Date := Now;

  FController.Services.LancamentoAbastecimento.DAO
    .NewObject;

  FController.Services.ConsultaBomba.Open('', 'BCM_CODIGO');

  inherited;
end;

procedure TViewLancamentoAbastecimento.actVisualizarExecute(Sender: TObject);
begin
  FController.Services.ConsultaBomba.Open('', 'BCM_CODIGO');

  dtpDataLancamento.Date := FController.Services.LancamentoAbastecimento.DAO.CurrentObject.Data;

  inherited;
end;

procedure TViewLancamentoAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ViewLancamentoAbastecimento := nil;
end;

procedure TViewLancamentoAbastecimento.FormShow(Sender: TObject);
begin
  inherited;
  FController.Services.LancamentoAbastecimento
    .DataSource(DtSrc)
    .Open('', 'ABA_CODIGO');

  FController.Services.ConsultaBomba
    .DataSource(DtSrcBomba);
end;

procedure TViewLancamentoAbastecimento.HabilitaCampos(const AEnabled: Boolean);
begin
  inherited;
  dtpDataLancamento.Enabled := AEnabled;
  lcbCodigoBomba.Enabled := AEnabled;
  edtQtdeLitros.Enabled := AEnabled;
  edtValor.Enabled := AEnabled;
end;

procedure TViewLancamentoAbastecimento.SalvaDadosObject;
var
  LValor, LValorTotal: Double;
begin
  with FController.Services.LancamentoAbastecimento.DAO do
  begin
    if FStatus = TStatusType.sInserindo then
      CurrentObject.Codigo(NextID);

    LValor := FFuncoesGerais.StringToFloat(edtValor.Text);
    LValorTotal := FFuncoesGerais.CalculaImposto(LValor, CPorcImposto);

    CurrentObject
      .Data(dtpDataLancamento.Date)
      .CodigoBomba(DataSet.FieldByName('ABA_BCM_CODIGO').AsInteger)
      .QtdeLitros(FFuncoesGerais.StringToFloat(edtQtdeLitros.Text))
      .Valor(LValor)
      .Imposto(CPorcImposto)
      .ValorTotal(LValorTotal);
  end;
end;

end.
