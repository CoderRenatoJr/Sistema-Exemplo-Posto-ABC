unit PostoABC.View.Factory;

interface

uses
  System.Classes,
  System.UITypes,
  PostoABC.View.Factory.Interfaces,
  PostoABC.Model.Types;

type
  TViewFactory = class(TInterfacedObject, iViewFactory)
  private
    FOwner: TComponent;

    procedure CreateShowFormConsultaTanque;
    procedure CreateShowFormConsultaBomba;
    procedure CreateShowFormLancamentoAbastecimento;
    procedure CreateShowFormRelatorioAbastecimento;

  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    class function New(AOwner: TComponent): iViewFactory;

    procedure CreateShowForm(AFormularioType: TFormularioType);

  end;

implementation

{ TViewFactory }

uses
  PostoABC.View.Consulta.Bomba,
  PostoABC.View.Consulta.Tanque,
  PostoABC.View.Lancamentos.Abastecimento,
  PostoABC.View.Relatorio.Abastecimento;

constructor TViewFactory.Create(AOwner: TComponent);
begin
  FOwner := AOwner;
end;

procedure TViewFactory.CreateShowForm(AFormularioType: TFormularioType);
begin
  case AFormularioType of
    ftConsultaTanque: CreateShowFormConsultaTanque;
    ftConsultaBomba: CreateShowFormConsultaBomba;
    ftLancamentoAbastecimento: CreateShowFormLancamentoAbastecimento;
    ftRelatorioAbastecimento: CreateShowFormRelatorioAbastecimento;
  end;
end;

procedure TViewFactory.CreateShowFormConsultaBomba;
begin
  if not Assigned(ViewConsultaBomba) then
    ViewConsultaBomba := TViewConsultaBomba.Create(FOwner, TFormularioType.ftConsultaBomba);
  ViewConsultaBomba.BringToFront;
end;

procedure TViewFactory.CreateShowFormConsultaTanque;
begin
  if not Assigned(ViewConsultaTanque) then
    ViewConsultaTanque := TViewConsultaTanque.Create(FOwner, TFormularioType.ftConsultaTanque);
  ViewConsultaTanque.BringToFront;
end;

procedure TViewFactory.CreateShowFormLancamentoAbastecimento;
begin
  if not Assigned(ViewLancamentoAbastecimento) then
    ViewLancamentoAbastecimento := TViewLancamentoAbastecimento.Create(FOwner, TFormularioType.ftLancamentoAbastecimento);
  ViewLancamentoAbastecimento.BringToFront;
end;

procedure TViewFactory.CreateShowFormRelatorioAbastecimento;
begin
  if not Assigned(ViewRelatorioAbastecimento) then
    ViewRelatorioAbastecimento := TViewRelatorioAbastecimento.Create(FOwner, TFormularioType.ftLancamentoAbastecimento);
  ViewRelatorioAbastecimento.BringToFront;
end;

destructor TViewFactory.Destroy;
begin

  inherited;
end;

class function TViewFactory.New(AOwner: TComponent): iViewFactory;
begin
  Result := Self.Create(AOwner);
end;

end.
