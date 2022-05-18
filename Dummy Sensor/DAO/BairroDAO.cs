using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dummy_Sensor.Models;

namespace Dummy_Sensor.DAO
{
    public class BairroDAO : GenericDAO<BairroViewModel>
    {
        protected override void SetTabela() => Tabela = "Bairros";
    }
}
