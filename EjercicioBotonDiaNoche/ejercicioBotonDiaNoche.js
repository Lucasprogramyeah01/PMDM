$(document).ready(function(){

    $(document).on("click", "#btn-noche", function(){
        $("body").addClass("night");
    })

    $(document).on("click", "#btn-dia", function(){
        $("body").removeClass("night");
    })

})