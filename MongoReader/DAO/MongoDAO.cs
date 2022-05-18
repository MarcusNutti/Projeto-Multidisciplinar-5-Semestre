using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Text;

namespace MongoReader.DAO
{
    public class MedicaoMongoObject
    {
        public ObjectId _id { get; set; }
        public double idDispositivo { get; set; }
        public string data { get; set; }
        public double valorAgua { get; set; }
        public double valorNivel { get; set; }
    }

    public static class MongoDAO
    {
        private static IMongoCollection<BsonDocument> GetTabelaSensores()
        {
            string connectionString = "mongodb://127.0.0.1:27017";
            var client = new MongoClient(connectionString);
            var banco = client.GetDatabase("HelixDatabase");
            return banco.GetCollection<BsonDocument>("sensores");
        }

        public static List<MedicaoMongoObject> GetMedicoesUltimoMinuto()
        {
            var tabela = GetTabelaSensores();

            // Alterar o .ToString para o formato gerado no Helix 
            string horarioUltimoMinutoFormatado = DateTime.Now.AddMinutes(-1).ToString("dd/MM/yyyyTHH:mm:ss");

            var filtro = Builders<BsonDocument>.Filter.Gte("data", horarioUltimoMinutoFormatado);

            var registros = tabela.Find(filtro);

            var listaRetorno = new List<MedicaoMongoObject>();

            foreach (var registro in registros.ToList())
                listaRetorno.Add(BsonSerializer.Deserialize<MedicaoMongoObject>(registro));

            return listaRetorno;
        }
    }
}
