unit PostoABC.View.Principal;

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
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  PostoABC.View.Factory.Interfaces,
  PostoABC.Model.Types;

type
  TViewPrincipal = class(TForm)
    ActionListMenuLateral: TActionList;
    actConsultaTanque: TAction;
    actConsultaBombaCombustivel: TAction;
    actLancamentoAbastecimento: TAction;
    actRelatorioAbastecimento: TAction;
    pnlMenuLateral: TPanel;
    CategoryButtons1: TCategoryButtons;
    pnlTopo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure actConsultaTanqueExecute(Sender: TObject);
    procedure actConsultaBombaCombustivelExecute(Sender: TObject);
    procedure actLancamentoAbastecimentoExecute(Sender: TObject);
    procedure actRelatorioAbastecimentoExecute(Sender: TObject);
  private
    FViewFactory: iViewFactory;

  public

  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  PostoABC.View.Factory;

procedure TViewPrincipal.actConsultaBombaCombustivelExecute(Sender: TObject);
begin
  FViewFactory.CreateShowForm(TFormularioType.ftConsultaBomba);
  Self.Cascade;
end;

procedure TViewPrincipal.actConsultaTanqueExecute(Sender: TObject);
begin
  FViewFactory.CreateShowForm(TFormularioType.ftConsultaTanque);
  Self.Cascade;
end;

procedure TViewPrincipal.actLancamentoAbastecimentoExecute(Sender: TObject);
begin
  FViewFactory.CreateShowForm(TFormularioType.ftLancamentoAbastecimento);
  Self.Cascade;
end;

procedure TViewPrincipal.actRelatorioAbastecimentoExecute(Sender: TObject);
begin
  FViewFactory.CreateShowForm(TFormularioType.ftRelatorioAbastecimento);
  Self.Cascade;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FViewFactory := TViewFactory.New(Self);
end;

end.
