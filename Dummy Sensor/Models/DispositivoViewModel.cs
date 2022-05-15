using System;
using System.ComponentModel.DataAnnotations;
using Dummy_Sensor.Attributes;

namespace Dummy_Sensor.Models
{
    public class DispositivoViewModel : BaseDatabaseModel
    {
        [DatabaseProperty]
        public string Descricao { get; set; }

        [DatabaseProperty]
        public int BairroId { get; set; }

        [DatabaseProperty]
        public DateTime DataAtualizacao { get; set; }

        [DatabaseProperty]
        public double MedicaoReferencia { get; set; }
    }
}
