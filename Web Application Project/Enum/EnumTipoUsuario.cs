using System;
using System.Text.Json.Serialization;

namespace Web_Application.Enum
{
    [Serializable]
    public enum EnumTipoUsuario
    {
        Padrao = 0,
        Tecnico = 1,
        Administrador = 2,
    }
}
