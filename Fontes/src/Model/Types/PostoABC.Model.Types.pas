unit PostoABC.Model.Types;

interface

type
  TFormularioType = (ftConsultaTanque, ftConsultaBomba, ftLancamentoAbastecimento, ftRelatorioAbastecimento);

  TFormularioHelper = record helper for TFormularioType
    function Caption: string;
  end;

implementation

{ TFormularioHelper }

function TFormularioHelper.Caption: string;
begin
  case Self of
    ftConsultaTanque: Result := 'Consulta de Tanques';
    ftConsultaBomba: Result := 'Consulta de Bombas de Combustíveis';
    ftLancamentoAbastecimento: Result := 'Lançamento de Abastecimento';
    ftRelatorioAbastecimento: Result := 'Relatório de Abastecimento';
  end;
end;

end.
