$(document).ready(function(){

    //SELECTOR DE ETIQUETA
    $("h1").html("adiós mundo cruel");

    //SELECTOR DE ID (#)
    $("#page-title").html("Título Hola Mundo");

    //SELECTOR DE CLASE (.)
    $(".red", "h1").attr("style", "color:red");

//--------------------------------------------------------------------------------------------

    //EVENTO CLICK
    $(document).on("click", "#btn-clear", function(){
        $("h1").html("");
    })

    $(document).on("click", "#btn-restore", function(){
        $("#page-title").html("Título Hola Mundo");
    })

    $(document).on("click", "#add-yellow", function(){
        $("#page-title").addClass("yellow");
    })

    $(document).on("click", "#delete-yellow", function(){
        $("#page-title").removeClass("yellow");
    })

});