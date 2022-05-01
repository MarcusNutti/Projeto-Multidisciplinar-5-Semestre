using System.ComponentModel.DataAnnotations;
using Web_Application.Attributes;
using Web_Application.Enum;

namespace Web_Application.Models
{
    public class LogWebViewModel : BaseDatabaseModel
    {
        [DatabaseProperty]
        public DateTime DataGeracao { get; set; }

        [DatabaseProperty]
        public string Mensagem { get; set; }

        [DatabaseProperty]
        public string? Callstack { get; set; }

        [DatabaseProperty]
        public EnumTipoLog TipoOperacao { get; set; }

        [DatabaseProperty]
        public string? Detalhes { get; set; }
    }
}
