$(document).ready(function(){

    //AGREGAR PÁRRAFOS
    $(document).on("click", "#btn-add-paragraph", function(){
        $("#content").append("<p class=\"a\">Lorem Ipsum</p>", "<button class=\"btn-delete-paragraph\">Borrar párrafo</button>")
    })

    //BORRAR PÁRRAFOS
    $(document).on("click", ".btn-delete-paragraph", function(){
        $(this).parent().remove()
    })

})