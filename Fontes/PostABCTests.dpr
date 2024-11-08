program PostABCTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  PostoABC.Model.Funcoes.Gerais in 'src\Model\Funcoes\PostoABC.Model.Funcoes.Gerais.pas',
  PostoABC.Model.Funcoes.Gerais.Tests in 'src\Model\Funcoes\PostoABC.Model.Funcoes.Gerais.Tests.pas',
  PostoABC.Model.Funcoes.Interfaces in 'src\Model\Funcoes\PostoABC.Model.Funcoes.Interfaces.pas',
  PostoABC.Model.Connection.Factory in 'src\Model\Connection\PostoABC.Model.Connection.Factory.pas',
  PostoABC.Model.Connection.Interfaces in 'src\Model\Connection\PostoABC.Model.Connection.Interfaces.pas',
  PostoABC.Model.Connection.FireDAC.Connection in 'src\Model\Connection\FireDAC\PostoABC.Model.Connection.FireDAC.Connection.pas',
  PostoABC.Model.Connection.FireDAC.Query in 'src\Model\Connection\FireDAC\PostoABC.Model.Connection.FireDAC.Query.pas',
  PostoABC.Model.DAO.Factory in 'src\Model\DAO\PostoABC.Model.DAO.Factory.pas',
  PostoABC.Model.DAO.Interfaces in 'src\Model\DAO\PostoABC.Model.DAO.Interfaces.pas',
  PostoABC.Model.DAO in 'src\Model\DAO\PostoABC.Model.DAO.pas',
  PostoABC.Model.Entity.Lancamento.Abastecimento in 'src\Model\Entity\Lancamento\PostoABC.Model.Entity.Lancamento.Abastecimento.pas',
  PostoABC.Model.Ini.Interfaces in 'src\Model\Ini\PostoABC.Model.Ini.Interfaces.pas',
  PostoABC.Model.Ini in 'src\Model\Ini\PostoABC.Model.Ini.pas',
  PostoABC.Model.ORM.Attributes in 'src\Model\ORM\PostoABC.Model.ORM.Attributes.pas',
  PostoABC.Model.ORM.DataSetBind in 'src\Model\ORM\PostoABC.Model.ORM.DataSetBind.pas',
  PostoABC.Model.ORM.Generators in 'src\Model\ORM\PostoABC.Model.ORM.Generators.pas',
  PostoABC.Model.Services.Interfaces in 'src\Model\Services\PostoABC.Model.Services.Interfaces.pas',
  PostoABC.Model.Services.Lancamento.Abastecimento in 'src\Model\Services\PostoABC.Model.Services.Lancamento.Abastecimento.pas',
  PostoABC.Model.Exceptions.Types in 'src\Model\Exceptions\PostoABC.Model.Exceptions.Types.pas',
  PostoABC.Model.Services.Lancamento.Abastecimento.Tests in 'src\Model\Services\PostoABC.Model.Services.Lancamento.Abastecimento.Tests.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := True;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
//    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
//    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
//    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
