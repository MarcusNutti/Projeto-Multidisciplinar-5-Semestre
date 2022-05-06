using System.Data;
using System.Data.SqlClient;
using Web_Application.Attributes;

namespace Web_Application.Models
{
    /// <summary>
    /// Classe utilizada por todos os Models que são armazenados em banco de dados. 
    /// </summary>
    public abstract class BaseDatabaseModel
    {
        [DatabaseProperty]
        public int Id { get; set; }
    }
}
