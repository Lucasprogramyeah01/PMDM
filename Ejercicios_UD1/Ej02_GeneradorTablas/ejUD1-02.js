$(document).ready(function(){

    let i = 1;
    let y = 1;

    //AGREGAR FILA
    $(document).on("click", "#btn-add-row", function(){
        $("#table").each(function(){
            $(`#table tbody`).append(`<tr><td id="${y}"><h4>Fila ${i}</h4><button id='btn-delete-row' class='btn btn-primary text-white m-1' style='width: auto'>-Eliminar fila</button><button id='btn-delete-col' class='btn btn-danger text-white m-1' style='width: auto'>-Eliminar columna</button></td></tr>`);
            i++;
        })
    })

    //AGREGAR FILA v2 (Versión más completa pero no funciona)
    /*$(document).on("click", "#btn-add-row", function(){

        let num = 0;

        $("#filaBase").next("th").each(function(){
            num++;
        });

        $("#table").each(function(){
            $("#table tbody").append(`<tr id="${i}"></tr>`);

            for(let x=1; x<=num; x++) {
                $("#table tr").append(`<td id="${y}"><h4>Fila ${i}</h4><button id='btn-delete-row' class='btn btn-primary text-white m-1' style='width: auto'>-Eliminar fila</button><button id='btn-delete-col' class='btn btn-danger text-white m-1' style='width: auto'>-Eliminar columna</button></td>`);
            }
                
        })

        i++;
        num = 0;
    })*/

    //ELIMINAR FILA
    $(document).on("click", "#btn-delete-row", function(){
        $(this).parent().parent().remove();
    })

    //AGREGAR COLUMNA
    $(document).on("click", "#btn-add-col", function(){
        $("#table").each(function(){
            $("#table tr").append("<td><h4>Tremendo</h4><button id='btn-delete-row' class='btn btn-primary text-white m-1' style='width: auto'>-Eliminar fila</button><button id='btn-delete-col' class='btn btn-danger text-white m-1' style='width: auto'>-Eliminar columna</button></td>");
            i++;
        })
    })

    //ELIMINAR COLUMNA (Tampoco funciona)
    $(document).on("click", "#btn-delete-col", function(){
        $("#"+y).remove();
    })

})