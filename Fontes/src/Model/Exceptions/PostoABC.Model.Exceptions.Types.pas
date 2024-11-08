unit PostoABC.Model.Exceptions.Types;

interface

uses
  System.SysUtils;

type
  TExceptionBombaNaoSelecionada = class(Exception)
    constructor Create;
  end;

  TExceptionQtdeLitrosNaoInformada = class(Exception)
    constructor Create;
  end;

  TExceptionValorNaoInformada = class(Exception)
    constructor Create;
  end;

implementation

{ TExceptionBombaNaoSelecionada }

constructor TExceptionBombaNaoSelecionada.Create;
begin
  inherited Create('Selecione uma Bomba de Combustivel!');
end;

{ TExceptionQtdeLitrosNaoInformada }

constructor TExceptionQtdeLitrosNaoInformada.Create;
begin
  inherited Create('É preciso informar a quantidade abastecida!');
end;

{ TExceptionValorNaoInformada }

constructor TExceptionValorNaoInformada.Create;
begin
  inherited Create('É preciso informar o valor do abastecimento!');
end;

end.
