$(document).ready(function () {
    setInterval(function () {
        AtualizaGraficos()
    }, 10000)
})

function AtualizaGraficos() {
    AtualizaGraficoNivelHoraAHoraDispositivo();
    AtualizaGraficoNivelDiaADiaDispositivo();
    AtualizaGraficoValorDeChuvaHoraAHoraDispositivo();
    AtualizaGraficoValorDeChuvaDiaADiaDispositivo();
}
function AtualizaGraficoNivelHoraAHoraDispositivo() {
    var dispositivoSelecionado = $('#dispositivoReferencia').val();

    $.ajax({
        url: "/api/GetWaterLevelFromLastDayMeasuresFromDispositivo",
        data: { dispositivoId: dispositivoSelecionado },
        success: function (dados) {

            var dataPoints = [];
            

            var result = dados;

            for (var i = 0; i < result.length; i++) {
                dataPoints.push({ label: result[i].label, y: result[i].y });
            }

            var chart = new CanvasJS.Chart("hourlyWaterLevelDeviceChart", {
                backgroundColor: "#ffffff",
                theme:"light2",
                animationEnabled: false,
                zoomEnabled: false,

                title: {
                    text: "Valor de Nível d'Água Medido Hora a Hora",
                    fontColor: "#000000",
                    fontSize: 25,
                    padding: 10,
                    margin: 15,
                    fontWeight: "bold"
                },
                axisY: {
                    title: "Valor de Nível",
                    suffix: "mm",
                    
                    
                },
                axisX: {
                    title: "Horário",
                    suffix: "h",
                    
                },
                data: [
                    {
                        type: "splineArea",
                        markerSize: 7,
                        color: "#2196f3",
                        dataPoints: dataPoints,
                    }
                ]
            });
            chart.render();
        }
    })
}

function AtualizaGraficoNivelDiaADiaDispositivo() {
    var dispositivoSelecionado = $('#dispositivoReferencia').val();

    $.ajax({
        url: "/api/GetWaterLevelFromLastMonthMeasuresFromDispositivo",
        data: { dispositivoId: dispositivoSelecionado },
        success: function (dados) {

            var dataPoints = [];

            var result = dados;

            for (var i = 0; i < result.length; i++) {
                dataPoints.push({ label: result[i].label, y: result[i].y });
            }

            var chart = new CanvasJS.Chart("dailyWaterLevelDeviceChart", {
                backgroundColor: "#ffffff",
                theme: "light2",
                animationEnabled: false,
                zoomEnabled: false,

                title: {
                    text: "Valor de Nível d'Água Medido Dia a Dia",
                    fontColor: "#000000",
                    fontSize: 25,
                    padding: 10,
                    margin: 15,
                    fontWeight: "bold"
                },
                axisY: {
                    title: "Valor de Nível",
                    suffix: "mm",
                },
                axisX: {
                    title: "Dia do Mês",
                },
                data: [
                    {
                        type: "splineArea",
                        markerSize: 7,
                        color: "#1976d2",
                        dataPoints: dataPoints,
                    }
                ]
            });
            chart.render();
        }
    })
}

function AtualizaGraficoValorDeChuvaHoraAHoraDispositivo() {
    var dispositivoSelecionado = $('#dispositivoReferencia').val();

    $.ajax({
        url: "/api/GetRainValueFromLastDayMeasuresFromDispositivo",
        data: { dispositivoId: dispositivoSelecionado },
        success: function (dados) {

            var dataPoints = [];

            var result = dados;

            for (var i = 0; i < result.length; i++) {
                dataPoints.push({ label: result[i].label, y: result[i].y });
            }

            var chart = new CanvasJS.Chart("hourlyRainValueDeviceChart", {
                backgroundColor: "#ffffff",
                theme: "light2",
                animationEnabled: false,
                zoomEnabled: false,

                title: {
                    text: "Valor de Qtd. Chuva Medido Hora a Hora",
                    fontColor: "#000000",
                    fontSize: 25,
                    padding: 10,
                    margin: 15,
                    fontWeight: "bold"
                },
                axisY: {
                    title: "Valor de Nível",
                    suffix: "mm",
                },
                axisX: {
                    title: "Horário",
                    suffix: "h",
                },
                data: [
                    {
                        type: "splineArea",
                        markerSize: 7,
                        color: "#2196f3",
                        dataPoints: dataPoints,
                    }
                ]
            });
            chart.render();
        }
    })
}

function AtualizaGraficoValorDeChuvaDiaADiaDispositivo() {
    var dispositivoSelecionado = $('#dispositivoReferencia').val();

    $.ajax({
        url: "/api/GetRainValueFromLastMonthMeasuresFromDispositivo",
        data: { dispositivoId: dispositivoSelecionado },
        success: function (dados) {

            var dataPoints = [];

            var result = dados;

            for (var i = 0; i < result.length; i++) {
                dataPoints.push({ label: result[i].label, y: result[i].y });
            }

            var chart = new CanvasJS.Chart("dailyRainValueDeviceChart", {
                backgroundColor: "#ffffff",
                theme: "light2",
                animationEnabled: false,
                zoomEnabled: false,

                title: {
                    text: "Valor de Qtd. Chuva Medido Dia a Dia",
                    fontColor: "#000000",
                    fontSize: 25,
                    padding: 10,
                    margin: 15,
                    fontWeight: "bold"
                },
                axisY: {
                    title: "Valor de Nível",
                    suffix: "mm",
                },
                axisX: {
                    title: "Dia do Mês",
                },
                data: [
                    {
                        type: "splineArea",
                        markerSize: 7,
                        color: "#1976d2",
                        dataPoints: dataPoints,
                    }
                ]
            });
            chart.render();
        }
    })
}