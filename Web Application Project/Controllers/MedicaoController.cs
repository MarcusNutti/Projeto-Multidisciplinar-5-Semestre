using Microsoft.AspNetCore.Mvc;
using System;
using System.Reflection;
using Web_Application.DAO;
using Web_Application.Enum;
using Web_Application.Models;
using Web_Application.Services;

namespace Web_Application.Controllers
{
    public class MedicaoController : GenericController<MedicaoViewModel>
    {
        protected override void SetAutenticationRequirements()
        {
            AutenticationRequired = true;
            MinumumLevelRequired = EnumTipoUsuario.Tecnico;
        }

        protected override void SetDAO() => DAO = new MedicaoDAO();

        protected override void SetIdGenerationConfig() => GeraProximoId = true;
    }
}
