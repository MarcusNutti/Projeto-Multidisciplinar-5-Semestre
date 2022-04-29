﻿using System.Data;
using System.Data.SqlClient;
using Web_Application.Attributes;
using Web_Application.Models;

namespace Web_Application.DAO
{
    public abstract class GenericDAO<T> where T : BaseDatabaseModel
    {
        public GenericDAO()
        {
            SetTabela();
        }

        protected string Tabela { get; set; }

        protected abstract void SetTabela();

        protected virtual SqlParameter[] CriaParametros(T model)
        {
            // Pega todas as propriedades do tipo T
            var propriedades = typeof(T).GetProperties();
            var retorno = new List<SqlParameter>();

            foreach (var prop in propriedades)
            {
                // Verifica se a proprieda possui o atributo DatabaseProperty
                var utilizaPropNoBanco = prop.GetCustomAttributes(typeof(DatabasePropertyAttribute), true).Any();

                if (utilizaPropNoBanco)
                {
                    if (prop.GetValue(model) == null)
                        retorno.Add(new SqlParameter(prop.Name, DBNull.Value));
                    else
                        retorno.Add(new SqlParameter(prop.Name, prop.GetValue(model)));
                }
            }

            return retorno.ToArray();
        }
        protected virtual T MontaModel(DataRow registro)
        {
            var propriedades = typeof(T).GetProperties();
            var retorno = Activator.CreateInstance(typeof(T)) as T;

            foreach (var prop in propriedades)
            {
                var utilizaPropNoBanco = prop.GetCustomAttributes(typeof(DatabasePropertyAttribute), true).Any();

                if (utilizaPropNoBanco)
                    prop.SetValue(retorno, registro[prop.Name]);
            }

            return retorno;
        }

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
