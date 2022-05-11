using System;
using System.Data.SqlClient;
using Web_Application.Models;

namespace Web_Application.DAO
{
    public class MedicaoDAO : GenericDAO<MedicaoViewModel>
    {
        protected override void SetTabela() => Tabela = "Medicao";
    }
}
