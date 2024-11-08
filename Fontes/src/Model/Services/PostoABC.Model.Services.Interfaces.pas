unit PostoABC.Model.Services.Interfaces;

interface

uses
  Data.DB,
  PostoABC.Model.DAO.Interfaces,
  PostoABC.Model.Entity.Lancamento.Abastecimento;

type
  iModelServices = interface
    ['{3468E40D-F5AA-4A68-BC14-3CD8A5774738}']
    function ValidateRequiredFields: Boolean;
    function DataSource(ADataSource: TDataSource): iModelServices;
    function Open(const AWhere: string = ''; const AOrderBy: string = ''): iModelServices;
    function Close: iModelServices;

  end;

  iModelServicesConsultaTanque = interface(iModelServices)
    ['{C3D4EF69-C3A8-470F-838D-0EE424C79506}']
  end;

  iModelServicesConsultaBomba = interface(iModelServices)
    ['{71EE3147-1D54-4060-811F-37DB6C5209FB}']
  end;

  iModelServicesLancamentoAbastecimento = interface(iModelServices)
    ['{71EE3147-1D54-4060-811F-37DB6C5209FB}']
    function DAO: iModelDAO<TEntityLancamentoAbastecimento>;

  end;

  iModelServicesRelatorioAbastecimento = interface(iModelServices)
    ['{3344F4E1-0938-4F8C-A448-4BC3467F8E92}']
  end;

  iModelServicesFactory = interface
    ['{BB6D4964-092C-41F4-B06A-D2806786A475}']
    function ConsultaTanque: iModelServicesConsultaTanque;
    function ConsultaBomba: iModelServicesConsultaBomba;
    function LancamentoAbastecimento: iModelServicesLancamentoAbastecimento;
    function RelatorioAbastecimento: iModelServicesRelatorioAbastecimento;
  end;

implementation

end.
