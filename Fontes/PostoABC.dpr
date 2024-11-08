program PostoABC;

uses
  Vcl.Forms,
  PostoABC.View.Principal in 'src\View\PostoABC.View.Principal.pas' {ViewPrincipal},
  PostoABC.Model.Connection.Factory in 'src\Model\Connection\PostoABC.Model.Connection.Factory.pas',
  PostoABC.Model.Connection.FireDAC.Connection in 'src\Model\Connection\FireDAC\PostoABC.Model.Connection.FireDAC.Connection.pas',
  PostoABC.Model.Connection.Interfaces in 'src\Model\Connection\PostoABC.Model.Connection.Interfaces.pas',
  PostoABC.Model.DAO.Interfaces in 'src\Model\DAO\PostoABC.Model.DAO.Interfaces.pas',
  PostoABC.Model.DAO in 'src\Model\DAO\PostoABC.Model.DAO.pas',
  PostoABC.Model.Ini.Interfaces in 'src\Model\Ini\PostoABC.Model.Ini.Interfaces.pas',
  PostoABC.Model.Ini in 'src\Model\Ini\PostoABC.Model.Ini.pas',
  PostoABC.Model.ORM.Attributes in 'src\Model\ORM\PostoABC.Model.ORM.Attributes.pas',
  PostoABC.Model.ORM.DataSetBind in 'src\Model\ORM\PostoABC.Model.ORM.DataSetBind.pas',
  PostoABC.Model.ORM.Generators in 'src\Model\ORM\PostoABC.Model.ORM.Generators.pas',
  PostoABC.Model.Connection.FireDAC.Query in 'src\Model\Connection\FireDAC\PostoABC.Model.Connection.FireDAC.Query.pas',
  PostoABC.View.Base in 'src\View\PostoABC.View.Base.pas' {ViewBase},
  PostoABC.Model.Types in 'src\Model\Types\PostoABC.Model.Types.pas',
  PostoABC.Controller.Interfaces in 'src\Controller\PostoABC.Controller.Interfaces.pas',
  PostoABC.Controller in 'src\Controller\PostoABC.Controller.pas',
  PostoABC.View.Factory.Interfaces in 'src\View\PostoABC.View.Factory.Interfaces.pas',
  PostoABC.View.Factory in 'src\View\PostoABC.View.Factory.pas',
  PostoABC.View.Consulta in 'src\View\PostoABC.View.Consulta.pas' {ViewConsulta},
  PostoABC.View.Lancamentos in 'src\View\PostoABC.View.Lancamentos.pas' {ViewLancamento},
  PostoABC.View.Consulta.Tanque in 'src\View\PostoABC.View.Consulta.Tanque.pas' {ViewConsultaTanque},
  PostoABC.View.Consulta.Bomba in 'src\View\PostoABC.View.Consulta.Bomba.pas' {ViewConsultaBomba},
  PostoABC.Model.Entity.Consulta.Tanque in 'src\Model\Entity\Consulta\PostoABC.Model.Entity.Consulta.Tanque.pas',
  PostoABC.Model.Services.Interfaces in 'src\Model\Services\PostoABC.Model.Services.Interfaces.pas',
  PostoABC.Model.Services.Consulta.Tanque in 'src\Model\Services\PostoABC.Model.Services.Consulta.Tanque.pas',
  PostoABC.Model.DAO.Factory in 'src\Model\DAO\PostoABC.Model.DAO.Factory.pas',
  PostoABC.Model.Services.Factory in 'src\Model\Services\PostoABC.Model.Services.Factory.pas',
  PostoABC.Model.Services.Consulta.Bomba in 'src\Model\Services\PostoABC.Model.Services.Consulta.Bomba.pas',
  PostoABC.Model.Entity.Consulta.Bomba in 'src\Model\Entity\Consulta\PostoABC.Model.Entity.Consulta.Bomba.pas',
  PostoABC.View.Lancamentos.Abastecimento in 'src\View\PostoABC.View.Lancamentos.Abastecimento.pas' {ViewLancamentoAbastecimento},
  PostoABC.Model.Entity.Lancamento.Abastecimento in 'src\Model\Entity\Lancamento\PostoABC.Model.Entity.Lancamento.Abastecimento.pas',
  PostoABC.Model.Services.Lancamento.Abastecimento in 'src\Model\Services\PostoABC.Model.Services.Lancamento.Abastecimento.pas',
  PostoABC.Model.Exceptions.Types in 'src\Model\Exceptions\PostoABC.Model.Exceptions.Types.pas',
  PostoABC.Model.Exceptions.Behaviors in 'src\Model\Exceptions\PostoABC.Model.Exceptions.Behaviors.pas',
  PostoABC.View.Relatorio in 'src\View\PostoABC.View.Relatorio.pas' {ViewRelatorio},
  PostoABC.View.Relatorio.Abastecimento in 'src\View\PostoABC.View.Relatorio.Abastecimento.pas' {ViewRelatorioAbastecimento},
  PostoABC.Model.Entity.Relatorio.Abastecimento in 'src\Model\Entity\Relatorio\PostoABC.Model.Entity.Relatorio.Abastecimento.pas',
  PostoABC.Model.Funcoes.Interfaces in 'src\Model\Funcoes\PostoABC.Model.Funcoes.Interfaces.pas',
  PostoABC.Model.Funcoes.Gerais in 'src\Model\Funcoes\PostoABC.Model.Funcoes.Gerais.pas',
  PostoABC.Model.Services.Relatorio.Abastecimento in 'src\Model\Services\PostoABC.Model.Services.Relatorio.Abastecimento.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
