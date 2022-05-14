function getLatitudeLongitude() {
    var cep = $('#CEP').val();

    $.ajax({
        url: "/api/GetLatLong",
        data: { CEP: cep },
        success: function (data) {
            if (data == undefined) {
                console.log('Ocorreu um erro ao requisitar a latitude e longitude!')
                return;
            }

            $("#Latitude").val(data.latitude);
            $("#Longitude").val(data.longitude);
        },
        error: function () {
            console.log('Ocorreu um erro ao requisitar a latitude e longitude!')
            $("#msgErroLatLong").removeAttr("hidden");
        }
    })
}