using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using MongoReader.DAO;
using MongoReader.Models;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading;
using MongoReader.DAO;
using System.Globalization;

namespace MongoReader
{
    internal class Program
    {
        /*use HelixDatabase

          db.sensores.insert({ data: "17/05/2022", valorAgua: 10, valorNivel: 20, idDispositivo: 1 })
          db.sensores.insert({ data: "15/05/2022", valorAgua: 15, valorNivel: 28, idDispositivo: 1 })
         */
        static void Main(string[] args)
        {
            while (true)
            {
                try
                {
                    var ultimasMedicoes = MongoDAO.GetMedicoesUltimoMinuto();
                    var medicaoDAO = new MedicaoDAO();

                    foreach(var medicaoMongo in ultimasMedicoes)
                    {
                        var medicaoViewModel = MedicaoMongoToMedicaoViewModel(medicaoMongo);

                        medicaoDAO.Insert(medicaoViewModel);
                    }
                }
                catch (Exception erro)
                {

                }

                Thread.Sleep(60000);
            }
        }

        static MedicaoViewModel MedicaoMongoToMedicaoViewModel(MedicaoMongoObject medicaoMongo)
        {
            return new MedicaoViewModel
            {
                DataMedicao = DateTime.ParseExact(medicaoMongo.data, "dd/MM/yyyyTHH:mm:ss", CultureInfo.InvariantCulture),
                DispositivoId = Convert.ToInt32(medicaoMongo.idDispositivo),
                ValorChuva = Convert.ToDouble(medicaoMongo.valorAgua),
                ValorNivel = Convert.ToDouble(medicaoMongo.valorNivel)
            };
        }
    }
}
