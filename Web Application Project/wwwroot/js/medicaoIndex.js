function searchMedicao() {
    var searchDispositivoId = $('#searchDispositivoId').val();
    var searchDataInicial = $('#searchDataInicial').val();
    var searchDataFinal = $('#searchDataFinal').val();

    $.ajax({
        url: "api/searchMedicao",
        data: { searchDispositivoId: searchDispositivoId, searchDataInicial: searchDataInicial, searchDataFinal: searchDataFinal },
        success: function (data) {
            $('#dados').html(data);
        }
    })
}