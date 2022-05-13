function searchBairro() {
    var searchId = $('#searchId').val();
    var searchDescricao = $('#searchDescricao').val();
    var searchCEP = $('#searchCEP').val();

    $.ajax({
        url: "api/searchBairro",
        data: { searchId: searchId, searchDescricao: searchDescricao, searchCEP: searchCEP },
        success: function (data) {
            $('#dados').html(data);
        }
    })
}