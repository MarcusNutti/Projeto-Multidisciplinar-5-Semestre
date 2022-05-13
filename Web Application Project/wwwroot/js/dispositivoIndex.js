function searchDispositivo() {
    var searchId = $('#searchId').val();
    var searchDescricao = $('#searchDescricao').val();
    var searchBairro = $('#searchBairro').val();

    $.ajax({
        url: "api/searchDispositivo",
        data: { searchId: searchId, searchDescricao: searchDescricao, searchBairro: searchBairro },
        success: function (data) {
            $('#dados').html(data);
        }
    })
}