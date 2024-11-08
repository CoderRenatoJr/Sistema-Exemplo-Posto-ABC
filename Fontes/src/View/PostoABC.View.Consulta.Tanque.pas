unit PostoABC.View.Consulta.Tanque;

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
  Vcl.ExtCtrls;

type
  TViewConsultaTanque = class(TViewConsulta)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewConsultaTanque: TViewConsultaTanque;

implementation

{$R *.dfm}

procedure TViewConsultaTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ViewConsultaTanque := nil;
end;

procedure TViewConsultaTanque.FormShow(Sender: TObject);
begin
  inherited;
  FController
    .Services
      .ConsultaTanque
        .DataSource(DtSrc)
        .Open();
end;

end.
