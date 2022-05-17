﻿using System;
using MongoReader.Attributes;

namespace MongoReader.Models
{
    public class MedicaoViewModel : BaseDatabaseModel
    {
        [DatabaseProperty]
        public int DispositivoId { get; set; }

        [DatabaseProperty]
        public DateTime DataMedicao { get; set; }

        [DatabaseProperty]
        public double? ValorChuva { get; set; }

        [DatabaseProperty]
        public double? ValorNivel { get; set; }
    }
}
