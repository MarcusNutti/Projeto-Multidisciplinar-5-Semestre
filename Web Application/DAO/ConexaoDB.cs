using System.Data.SqlClient;

namespace Web_Application.DAO
{
    public class ConexaoDB
    {
        public static SqlConnection GetDbConnection()
        {
            string connectionString = "data source=LOCALHOST; database=TrabalhoMultidisciplinar; user id=sa; password=123456";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            return connection;
        }
    }
}
