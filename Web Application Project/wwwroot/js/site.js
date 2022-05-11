function DeleteConfirmation(controllerName, objectID) {
    Swal.fire({
        showCancelButton: true,
        cancelButtonText: `Não apagar`,
        title: "Você Tem Certeza?",
        text: "Uma vez deletada, você não conseguirá recuperar esse registro!",
        icon: 'warning',
    })
        .then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    text: "Deletado com Sucesso",
                    icon: "success",
                }).then(() => location.href = `${controllerName}/Delete?Id=${objectID}`);
            }
        });
}

function ReturnPage() { history.back(); }

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip()
})