using Web_Application.Models;

namespace Web_Application.DAO
{
    public class LogWebDAO : GenericDAO<LogWebViewModel>
    {
        protected override void SetTabela() => Tabela = "LogWeb";
    }
}
