using System;
using System.Collections.Generic;
using System.Data;
using Web_Application.Models;

namespace Web_Application.DAO
{
    public class DispositivoDAO : GenericDAO<DispositivoViewModel>
    {
        protected override void SetTabela() => Tabela = "Dispositivos";

        public virtual List<DispositivoViewModel> ListComBairro()
        {
            var procedureName = "spSelecionaDispositivosComBairro";
            var tabela = HelperDAO.ExecutaProcSelect(procedureName, null);
            List<DispositivoViewModel> lista = new List<DispositivoViewModel>();

            foreach (DataRow registro in tabela.Rows)
            {
                var dispositivoComNomeDoBairro = MontaModel(registro);

                dispositivoComNomeDoBairro.NomeBairro = registro["NomeBairro"].ToString();

                lista.Add(dispositivoComNomeDoBairro);
            }

            return lista;
        }
    }
}
