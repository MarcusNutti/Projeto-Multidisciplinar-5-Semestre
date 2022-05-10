using Microsoft.AspNetCore.Mvc;
using System;
using System.Reflection;
using Web_Application.DAO;
using Web_Application.Enum;
using Web_Application.Models;
using Web_Application.Services;

namespace Web_Application.Controllers
{
    public class DispositivoController : GenericController<DispositivoViewModel>
    {
        public override IActionResult Index()
        {
            try
            {
                var lista = (DAO as DispositivoDAO).ListComBairro();
                return View(NomeViewIndex, lista);
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        protected override void SetAutenticationRequirements()
        {
            AutenticationRequired = true;
            MinumumLevelRequired = EnumTipoUsuario.Tecnico;
        }

        protected override void SetDAO() => DAO = new DispositivoDAO();

        protected override void SetIdGenerationConfig() => GeraProximoId = true;

        protected override void PreencheDadosParaView(string Operacao, DispositivoViewModel model)
        {
            var daoBairro = new BairroDAO();
            ViewBag.ListaBairros = daoBairro.List();

            base.PreencheDadosParaView(Operacao, model);
        }
    }
}
