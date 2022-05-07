using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace Web_Application.Services
{
    public static class SessionService
    {
        public static void SalvaCache<T>(HttpContext contexto, string chave , T valor)
        {
            var valorSerializado = JsonConvert.SerializeObject(valor);
            contexto.Session.SetString(chave, valorSerializado);
        }

        public static T RecuperaCache<T>(HttpContext contexto, string chave)
        {
            var valorEmCache = contexto.Session.GetString(chave);

            if (valorEmCache == null)
                return default(T);

            return JsonConvert.DeserializeObject<T>(valorEmCache);
        }
    }
}
