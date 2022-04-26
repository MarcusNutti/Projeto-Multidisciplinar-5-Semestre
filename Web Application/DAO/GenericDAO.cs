using System.Data;
using System.Data.SqlClient;
using Web_Application.Models;

namespace Web_Application.DAO
{
    public abstract class PadraoDAO<T> where T : BaseDatabaseModel
    {
        public PadraoDAO()
        {
            SetTabela();
        }

        protected string Tabela { get; set; }
        protected abstract SqlParameter[] CriaParametros(T model);
        protected abstract T MontaModel(DataRow registro);
        protected abstract void SetTabela();

        public virtual void Insert(T model)
        {
            var procedureName = ConstantesComuns.PROC_INSERT + Tabela;
            HelperDAO.ExecutaProc(procedureName, CriaParametros(model));
        }

        public virtual void Update(T model)
        {
            var procedureName = ConstantesComuns.PROC_UPDATE + Tabela;
            HelperDAO.ExecutaProc(procedureName, CriaParametros(model));
        }

        public virtual void Delete(int id)
        {
            var parameter = new SqlParameter[]
            {
                new SqlParameter("id", id),
            };

            var procedureName = ConstantesComuns.PROC_DELETE + Tabela;
            HelperDAO.ExecutaProc(procedureName, parameter);
        }

        public virtual T Consulta(int id)
        {
            var parameter = new SqlParameter[]
            {
                new SqlParameter("id", id),
            };

            var procedureName = ConstantesComuns.PROC_SELECT + Tabela;
            var tabela = HelperDAO.ExecutaProcSelect(procedureName, parameter);

            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }

        public virtual List<T> List()
        {
            var parameter = new SqlParameter[]
            {
                new SqlParameter("tabela", Tabela),
            };

            var procedureName = ConstantesComuns.PROC_LIST + Tabela;
            var tabela = HelperDAO.ExecutaProcSelect(procedureName, parameter);
            List<T> lista = new List<T>();

            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }

        public virtual int ProximoId()
        {
            throw new NotImplementedException();
            //    var p = new SqlParameter[]
            //    {
            //        new SqlParameter("tabela", Tabela)
            //    };
            //    var tabela = HelperDAO.ExecutaProcSelect("spProximoId", p);
            //    return Convert.ToInt32(tabela.Rows[0][0]);
        }
    }
}
