using Microsoft.AspNetCore.Http;
using System.Text.Json;

namespace Web_Application.Services
{
    public static class SessionService
    {
        public static void SalvaCache<T>(HttpContext contexto, string chave , T valor)
        {
            var valorSerializado = JsonSerializer.Serialize(valor);
            contexto.Session.SetString(chave, valorSerializado);
        }

        public static T RecuperaCache<T>(HttpContext contexto, string chave)
        {
            var valorEmCache = contexto.Session.GetString(chave);
            return JsonSerializer.Deserialize<T>(valorEmCache);
        }
    }
}
