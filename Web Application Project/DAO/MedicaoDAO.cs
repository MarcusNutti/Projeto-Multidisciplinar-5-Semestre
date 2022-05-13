using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Web_Application.Models;

namespace Web_Application.DAO
{
    public class MedicaoDAO : GenericDAO<MedicaoViewModel>
    {
        protected override void SetTabela() => Tabela = "Medicao";

        public List<MedicaoViewModel> Search(string dispositivoId, string dataInicial, string dataFinal)
        {
            var procedureName = ConstantesComuns.PROC_SEARCH + Tabela;

            var tabela = HelperDAO.ExecutaProcSelect(procedureName, new SqlParameter[]
            {
                new SqlParameter("DispositivoId", dispositivoId ?? ""),
                new SqlParameter("DataInicial", dataInicial ?? ""),
                new SqlParameter("DataFinal", dataFinal ?? "")
            });

            var lista = new List<MedicaoViewModel>();

            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
    }
}
