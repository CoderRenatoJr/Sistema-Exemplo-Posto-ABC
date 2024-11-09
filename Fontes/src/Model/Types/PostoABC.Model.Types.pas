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
    ftConsultaBomba: Result := 'Consulta de Bombas de Combust�veis';
    ftLancamentoAbastecimento: Result := 'Lan�amento de Abastecimento';
    ftRelatorioAbastecimento: Result := 'Relat�rio de Abastecimento';
  end;
end;

end.
