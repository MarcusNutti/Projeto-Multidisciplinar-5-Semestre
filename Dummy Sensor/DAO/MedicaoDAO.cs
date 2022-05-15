using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dummy_Sensor.Models;

namespace Dummy_Sensor.DAO
{
    public class MedicaoDAO : GenericDAO<MedicaoViewModel>
    {
        protected override void SetTabela() => Tabela = "Medicao";
    }
}
