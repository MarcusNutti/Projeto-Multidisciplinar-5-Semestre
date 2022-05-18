﻿using System;

namespace Dummy_Sensor.Attributes
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DatabasePropertyAttribute : Attribute
    {
        /// <summary>
        /// Atributo utilizado para determinar se uma propriedade de uma model é utilizada
        /// no banco de dados.
        /// </summary>
        public DatabasePropertyAttribute() { }

    }
}
