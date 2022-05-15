using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;
using Dummy_Sensor.Attributes;

namespace Dummy_Sensor.Models
{
    public class BairroViewModel : BaseDatabaseModel
    {
        [DatabaseProperty]
        public string Descricao { get; set; }

        [DatabaseProperty]
        public double Latitude { get; set; }

        [DatabaseProperty]
        public double Longitude { get; set; }

        [DatabaseProperty]
        public string CEP { get; set; }
    }
}
