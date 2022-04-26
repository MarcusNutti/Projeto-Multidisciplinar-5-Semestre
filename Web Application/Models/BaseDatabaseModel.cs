using System.Data;
using System.Data.SqlClient;

namespace Web_Application.Models
{
    /// <summary>
    /// Interface utilizada por todos os Models que são armazenados em banco de dados. 
    /// </summary>
    public abstract class BaseDatabaseModel
    {
        public int Id { get; set; }
    }
}
