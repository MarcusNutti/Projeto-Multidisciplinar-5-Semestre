using Microsoft.AspNetCore.Mvc;
using System;
using System.Net.Http;
using System.Reflection;
using Web_Application.DAO;
using Web_Application.Enum;
using Web_Application.Models;
using Web_Application.Services;

namespace Web_Application.Controllers
{
    public class BairroController : GenericController<BairroViewModel>
    {

        protected override void SetAutenticationRequirements()
        {
            AutenticationRequired = true;
            MinumumLevelRequired = EnumTipoUsuario.Tecnico;
        }
        protected override void SetIdGenerationConfig() => GeraProximoId = true;
        protected override void SetDAO() => DAO = new BairroDAO();

        [HttpGet("api/SearchBairro")]
        public IActionResult SearchBairro(string searchId, string searchDescricao, string searchCEP)
        {
            try
            {
                var resultadoBusca = (DAO as BairroDAO).Search(searchId, searchDescricao, searchCEP);

                return PartialView("pvGrid", resultadoBusca);
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        [HttpGet("api/GetLatLong")]
        public IActionResult GetLatLong(string CEP)
        {
            try
            {
                using (var httpClient = new HttpClient())
                {
                    var url = $"https://maps.googleapis.com/maps/api/geocode/json?address={CEP}&key={APIKeys.GOOGLE_API_KEY}";

                    var response = httpClient.GetAsync
                }
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return null;
            }
        }
    }
}
