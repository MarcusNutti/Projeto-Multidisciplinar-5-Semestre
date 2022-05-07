using Microsoft.AspNetCore.Http;
using System.IO;

namespace Web_Application.Services
{
    public static class ImagemService
    {
        public static byte[] ConvertImageToByte(IFormFile imagem)
        {
            if (imagem != null)
                using (var stream = new MemoryStream())
                {
                    imagem.CopyTo(stream);
                    return stream.ToArray();
                }
            else
                return null;
        }

    }
}
