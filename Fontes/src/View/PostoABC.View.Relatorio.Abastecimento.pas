unit PostoABC.View.Relatorio.Abastecimento;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  PostoABC.View.Relatorio,
  System.Actions,
  Vcl.ActnList,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  RLReport,
  Vcl.ComCtrls, Vcl.Mask;

type
  TViewRelatorioAbastecimento = class(TViewRelatorio)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RLReport1: TRLReport;
    Ordenação: TLabel;
    cmbOrdenacao: TComboBox;
    edtPeriodoInicial: TMaskEdit;
    edtPeriodoFinal: TMaskEdit;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    rllblPeriodo: TRLLabel;
    RLLabel4: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand4: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand5: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand6: TRLBand;
    rllblTotalLitros: TRLLabel;
    rllblTotalValor: TRLLabel;
    rllblTotalVendaTotal: TRLLabel;
    procedure actVisualizarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPeriodoInicialExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPeriodoInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText4BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
    procedure RLDBText7BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    procedure Filtra;
  public

  end;

var
  ViewRelatorioAbastecimento: TViewRelatorioAbastecimento;

implementation

{$R *.dfm}

procedure TViewRelatorioAbastecimento.actVisualizarExecute(Sender: TObject);
begin
  inherited;
  try
    Filtra;
    RLReport1.PreviewOptions.WindowState := wsMaximized;
    RLReport1.PreviewModal;
  finally
  end;
end;

procedure TViewRelatorioAbastecimento.edtPeriodoInicialExit(Sender: TObject);
var
  LMaskEdit: TMaskEdit absolute Sender;
begin
  inherited;

  if ((not SameText(LMaskEdit.Text, '  /  /    ')) and (not FFuncoesGerais.ValidaData(LMaskEdit.Text))) then
  begin
    ShowMessage('Data informada inválida!');
    LMaskEdit.SetFocus;
    LMaskEdit.Clear;  
  end;
end;

procedure TViewRelatorioAbastecimento.edtPeriodoInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);  
var
  LMaskEdit: TMaskEdit absolute Sender;
begin
  inherited;
  if ((Key = VK_BACK) and (LMaskEdit.Text = LMaskEdit.EditMask)) then
  begin
    LMaskEdit.Text := EmptyStr; 
    Key := 0;
  end;
end;

procedure TViewRelatorioAbastecimento.Filtra;
var
  LFiltro, LAnd, LOrder: string;
begin
  LAnd := EmptyStr;
  LFiltro := EmptyStr;

  if not SameText(edtPeriodoInicial.Text, '  /  /    ') then
  begin
    LFiltro := LFiltro + LAnd + ' ABA_DATA >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', StrToDate(edtPeriodoInicial.Text)));
    LAnd := ' and ';
  end;

  if not SameText(edtPeriodoFinal.Text, '  /  /    ') then
  begin
    LFiltro := LFiltro + LAnd + ' ABA_DATA <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', StrToDate(edtPeriodoFinal.Text)));
    LAnd := ' and ';
  end;

  case cmbOrdenacao.ItemIndex of
    0: LOrder := 'ABA_DATA';
    1: LOrder := 'ABA_BCM_CODIGO';
    2: LOrder := 'BCM_TAN_CODIGO';
  end;

  FController.Services.RelatorioAbastecimento.Open(LFiltro, LOrder);
end;

procedure TViewRelatorioAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ViewRelatorioAbastecimento := nil;
end;

procedure TViewRelatorioAbastecimento.FormCreate(Sender: TObject);
begin
  inherited;
  FController.Services.RelatorioAbastecimento.DataSource(DtSrc);
end;

procedure TViewRelatorioAbastecimento.FormShow(Sender: TObject);
begin
  inherited;
  edtPeriodoInicial.SetFocus;
end;

procedure TViewRelatorioAbastecimento.RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  if RLBand5.Color = clWhite then
    RLBand5.Color := cl3DLight
  else
    RLBand5.Color := clWhite;
end;

procedure TViewRelatorioAbastecimento.RLDBText4BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
var
  LTotal: Double;
begin
  inherited;
  LTotal := (FFuncoesGerais.StringToFloat(AText) + FFuncoesGerais.StringToFloat(rllblTotalLitros.Caption));
  rllblTotalLitros.Caption := FloatToStrF(LTotal, TFloatFormat.ffNumber, 18, 5);
end;

procedure TViewRelatorioAbastecimento.RLDBText5BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
var
  LTotal: Double;
begin
  inherited;
  LTotal := (FFuncoesGerais.StringToFloat(AText) + FFuncoesGerais.StringToFloat(rllblTotalValor.Caption));
  rllblTotalValor.Caption := FloatToStrF(LTotal, TFloatFormat.ffNumber, 18, 2);
end;

procedure TViewRelatorioAbastecimento.RLDBText7BeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
var
  LTotal: Double;
begin
  inherited;
  LTotal := (FFuncoesGerais.StringToFloat(AText) + FFuncoesGerais.StringToFloat(rllblTotalVendaTotal.Caption));
  rllblTotalVendaTotal.Caption := FloatToStrF(LTotal, TFloatFormat.ffNumber, 18, 2);
end;

procedure TViewRelatorioAbastecimento.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  rllblPeriodo.Caption := edtPeriodoInicial.Text + ' a ' + edtPeriodoFinal.Text;
end;

end.
