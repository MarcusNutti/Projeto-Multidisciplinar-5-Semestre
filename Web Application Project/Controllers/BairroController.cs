using Microsoft.AspNetCore.Mvc;
using Web_Application.DAO;
using Web_Application.Enum;
using Web_Application.Models;

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
    }
}
