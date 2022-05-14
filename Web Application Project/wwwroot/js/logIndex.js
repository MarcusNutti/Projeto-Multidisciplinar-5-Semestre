function searchLog() {
    var searchType = $('#searchType').val();
    var searchDataInicial = $('#searchDataInicial').val();
    var searchDataFinal = $('#searchDataFinal').val() + 'T23:59:59';

    $.ajax({
        url: "api/searchLog",
        data: { searchType: searchType, searchDataInicial: searchDataInicial, searchDataFinal: searchDataFinal },
        success: function (data) {
            $('#dados').html(data);
        }
    })
}