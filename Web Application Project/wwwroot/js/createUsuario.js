function showImagePreview() {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("ImagemFile").files[0]);
    oFReader.onload = function (oFREvent) {
        document.getElementById("imgPreview").src = oFREvent.target.result;
    };
}