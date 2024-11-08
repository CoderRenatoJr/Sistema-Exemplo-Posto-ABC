unit PostoABC.View.Consulta.Bomba;

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
  TViewConsultaBomba = class(TViewConsulta)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewConsultaBomba: TViewConsultaBomba;

implementation

{$R *.dfm}

procedure TViewConsultaBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ViewConsultaBomba := nil;
end;

procedure TViewConsultaBomba.FormShow(Sender: TObject);
begin
  inherited;
  FController
    .Services
      .ConsultaBomba
        .DataSource(DtSrc)
        .Open('', 'BCM_CODIGO');
end;

end.
