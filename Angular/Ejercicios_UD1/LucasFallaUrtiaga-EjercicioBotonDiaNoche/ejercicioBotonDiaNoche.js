$(document).ready(function(){

    $(document).on("click", "#btn-noche", function(){
        $("body").addClass("night");
        $("nav").addClass("bg-black");
        $("a").addClass("text-light");
        $("#btn-noche").addClass("bg-light", "text-dark");
        $("#btn-dia").addClass("bg-black");
        $("#solecito").addClass("text-light");
        $("span").addClass("text-light");
    })

    $(document).on("click", "#btn-dia", function(){
        $("body").removeClass("night");
        $("nav").removeClass("bg-black");
        $("a").removeClass("text-light");
        $("#btn-noche").removeClass("bg-light", "text-dark");
        $("#btn-dia").removeClass("bg-black");
        $("#solecito").removeClass("text-light");
        $("span").removeClass("text-light");
    })
})