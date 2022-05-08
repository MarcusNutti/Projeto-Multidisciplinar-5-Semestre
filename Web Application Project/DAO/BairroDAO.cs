using Web_Application.Models;

namespace Web_Application.DAO
{
    public class BairroDAO : GenericDAO<BairroViewModel>
    {
        protected override void SetTabela() => Tabela = "Bairros";
    }
}
