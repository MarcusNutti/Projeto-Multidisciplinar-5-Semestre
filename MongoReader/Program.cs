using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Text.Json;

namespace MongoReader
{
    internal class Program
    {
        class Mock
        {
            public DateTime Data { get; set; }
            public double ValorAgua { get; set; }
            public double NivelAgua { get; set; }
        }

        static void Main(string[] args)
        {
            /*use HelixDatabase

              db.sensores.insert({ data: "17/05/2022", valorAgua: 10, valorNivel: 20 })
              db.sensores.insert({ data: "15/05/2022", valorAgua: 15, valorNivel: 28 })
             */

            MongoClient dbClient = new MongoClient("mongodb://127.0.0.1:27017");
            var dbList = dbClient.ListDatabases().ToList();

            var database = dbClient.GetDatabase("HelixDatabase");

            var tabela = database.GetCollection<BsonDocument>("sensores");

            var filtro = Builders<BsonDocument>.Filter.Eq("data", "17/05/2022");

            var registros = tabela.Find(filtro); // Esses registros estão no formato retardado (BSON, BSON)

            var teste = new List<Mock>();

            foreach(var bisao in registros.ToList())
            {
                teste.Add(JsonSerializer.Deserialize<Mock>(bisao.ToString()));
            }

            Console.WriteLine("Hello World!");
        }
    }
}
