unit PostoABC.Model.Funcoes.Gerais.Tests;

interface

uses
  DUnitX.TestFramework,
  PostoABC.Model.Funcoes.Interfaces,
  PostoABC.Model.Funcoes.Gerais;

type
  [TestFixture]
  TModelFuncoesGeraisTests = class
  private
    FFuncoesGerais: iModelFuncoesGerais;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure ValidaDataTest;

    [Test]
    procedure StringToFloatTest;

    [Test]
    procedure CalculaImpostoTest;

  end;

implementation

procedure TModelFuncoesGeraisTests.CalculaImpostoTest;
begin
  Assert.AreEqual<Double>(56.5, FFuncoesGerais.CalculaImposto(50, 13));
end;

procedure TModelFuncoesGeraisTests.Setup;
begin
  FFuncoesGerais := TModelFuncoesGerais.New;
end;

procedure TModelFuncoesGeraisTests.StringToFloatTest;
begin
  Assert.AreEqual<Double>(FFuncoesGerais.StringToFloat('1.000,00'), 1000);
  Assert.AreEqual<Double>(FFuncoesGerais.StringToFloat('1.000'), 1000);
  Assert.AreEqual<Double>(FFuncoesGerais.StringToFloat('1000'), 1000);
end;

procedure TModelFuncoesGeraisTests.TearDown;
begin
end;

procedure TModelFuncoesGeraisTests.ValidaDataTest;
begin
  Assert.IsFalse(FFuncoesGerais.ValidaData('08/  /    '), 'Data valída.');
  Assert.IsFalse(FFuncoesGerais.ValidaData('  /  /    '), 'Data valída.');
  Assert.IsFalse(FFuncoesGerais.ValidaData('30/02/2024'), 'Data valída.');
  Assert.IsTrue(FFuncoesGerais.ValidaData('09/11/2024'), 'Data valída.');
end;

end.
