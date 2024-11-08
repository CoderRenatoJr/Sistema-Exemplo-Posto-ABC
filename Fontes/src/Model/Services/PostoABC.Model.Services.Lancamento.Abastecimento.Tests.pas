unit PostoABC.Model.Services.Lancamento.Abastecimento.Tests;

interface

uses
  System.SysUtils,
  Data.DB,
  DUnitX.TestFramework,
  PostoABC.Model.Funcoes.Interfaces,
  PostoABC.Model.Funcoes.Gerais,
  PostoABC.Model.Services.Interfaces,
  PostoABC.Model.Services.Lancamento.Abastecimento,
  PostoABC.Model.Connection.Factory;

type
  [TestFixture]
  TModelServicesLancamentoAbastecimentoTests = class
  private
    FFuncoesGerais: iModelFuncoesGerais;
    FServicesLancamentoAbastecimento: iModelServicesLancamentoAbastecimento;
    FCodigo: Integer;

    procedure ReadTest;
    procedure CreateTest;
    procedure UpdateTest;
    procedure DeleteTest;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure CRUDTest;

  end;

implementation

procedure TModelServicesLancamentoAbastecimentoTests.CreateTest;
begin
  FCodigo := FServicesLancamentoAbastecimento.DAO.NextID;
  FServicesLancamentoAbastecimento.DAO.NewObject
    .Codigo(FCodigo)
    .Data(Now)
    .CodigoBomba(1)
    .QtdeLitros(50)
    .Valor(50)
    .Imposto(13)
    .ValorTotal(FFuncoesGerais.CalculaImposto(50, 13));
  FServicesLancamentoAbastecimento.DAO.Insert;
  FServicesLancamentoAbastecimento.DAO.OpenById(FCodigo);
  Assert.IsNotNull(FServicesLancamentoAbastecimento.DAO.CurrentObject, 'Não foi inserido o registro no Banco.');
end;

procedure TModelServicesLancamentoAbastecimentoTests.CRUDTest;
begin
  ReadTest;
  CreateTest;
  UpdateTest;
  DeleteTest;
end;

procedure TModelServicesLancamentoAbastecimentoTests.DeleteTest;
begin
  FServicesLancamentoAbastecimento.DAO.OpenById(FCodigo);
  FServicesLancamentoAbastecimento.DAO.Delete;
  Assert.IsNull(FServicesLancamentoAbastecimento.DAO.CurrentObject, 'O registro foi apagado do Banco mas o Object está instanciado.');
  FServicesLancamentoAbastecimento.DAO.OpenById(FCodigo);
  Assert.IsTrue(FServicesLancamentoAbastecimento.DAO.CurrentObject.Codigo <= 0, 'O registro foi não apagado do Banco.');
end;

procedure TModelServicesLancamentoAbastecimentoTests.ReadTest;
begin
  FServicesLancamentoAbastecimento.Open();

  if FServicesLancamentoAbastecimento.DAO.DataSet.IsEmpty then
    Assert.IsNull(FServicesLancamentoAbastecimento.DAO.CurrentObject, 'Não foram encontrados registros mas o CurrentObject está instanciado.')
  else
    Assert.IsNotNull(FServicesLancamentoAbastecimento.DAO.CurrentObject, 'Foram encontrados registros mas o CurrentObject está nulo.');
end;

procedure TModelServicesLancamentoAbastecimentoTests.Setup;
begin
  FFuncoesGerais := TModelFuncoesGerais.New;
  FServicesLancamentoAbastecimento := TModelServicesLancamentoAbastecimento.New(TModelConnectionFactory.GetIntance.ModelConnection);
end;

procedure TModelServicesLancamentoAbastecimentoTests.TearDown;
begin
end;

procedure TModelServicesLancamentoAbastecimentoTests.UpdateTest;
begin
  FServicesLancamentoAbastecimento.DAO.OpenById(FCodigo);
  Assert.IsNotNull(FServicesLancamentoAbastecimento.DAO.CurrentObject, 'Não foi encontrado o registro no Banco.');

  FServicesLancamentoAbastecimento.DAO.CurrentObject
    .Valor(100)
    .ValorTotal(FFuncoesGerais.CalculaImposto(100, 13));
  FServicesLancamentoAbastecimento.DAO.Update.OpenById(FCodigo);

  Assert.AreEqual<Double>(100, FServicesLancamentoAbastecimento.DAO.CurrentObject.Valor, 'Não foi alterado o registro no Banco.');
  Assert.AreEqual<Double>(FFuncoesGerais.CalculaImposto(100, 13), FServicesLancamentoAbastecimento.DAO.CurrentObject.ValorTotal, 'Não foi alterado o registro no Banco*.');

end;

end.
