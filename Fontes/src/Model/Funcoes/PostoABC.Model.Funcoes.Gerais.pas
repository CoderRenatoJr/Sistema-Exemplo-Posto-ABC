unit PostoABC.Model.Funcoes.Gerais;

interface

uses
  System.SysUtils,
  System.DateUtils,
  PostoABC.Model.Funcoes.Interfaces;

type
  TModelFuncoesGerais = class(TInterfacedObject, iModelFuncoesGerais)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelFuncoesGerais;

    function ValidaData(const AData: string): Boolean;
    function CalculaImposto(const AValor, AImposto: Double): Double;
    function StringToFloat(const AValue: string): Double;

  end;

implementation

{ TModelFuncoesGerais }

function TModelFuncoesGerais.CalculaImposto(const AValor, AImposto: Double): Double;
begin
  Result := (AValor + ((AValor * AImposto) / 100));
end;

constructor TModelFuncoesGerais.Create;
begin

end;

destructor TModelFuncoesGerais.Destroy;
begin

  inherited;
end;

class function TModelFuncoesGerais.New: iModelFuncoesGerais;
begin
  Result := Self.Create;
end;

function TModelFuncoesGerais.StringToFloat(const AValue: string): Double;
var
  LValor: Double;
  LValorString: string;
begin
  LValorString := StringReplace(AValue, '.', '', [rfReplaceAll]);
  if not TryStrToFloat(LValorString, LValor) then
    LValor := 0;
  Result := LValor;
end;

function TModelFuncoesGerais.ValidaData(const AData: string): Boolean;
var
  LData: TDateTime;
  LAno, LMes, LDia: Word;
begin
  Result := False;

  if TryStrToDate(AData, LData) then
  begin
    DecodeDate(LData, LAno, LMes, LDia);
    Result := IsValidDate(LAno, LMes, LDia);
  end;
end;

end.
