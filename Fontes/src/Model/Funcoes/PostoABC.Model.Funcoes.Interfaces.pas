unit PostoABC.Model.Funcoes.Interfaces;

interface

type
  iModelFuncoesGerais = interface
    ['{54037A7C-4277-4C61-8C4A-613AC3B8EAE9}']
    function ValidaData(const AData: string): Boolean;
    function CalculaImposto(const AValor, AImposto: Double): Double;
    function StringToFloat(const AValue: string): Double;

  end;

implementation

end.
