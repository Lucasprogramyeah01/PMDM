$(document).ready(function(){

    $.ajax({
        url:"https://swapi.dev/api/people",
        method: "GET",
    }).done(function(data){
        /*Lo que se programa dentro de de está función será ejecutado 
        cuando se haya resuelto la petición asíncrona, es decir, cuando 
        llegue la respuesta del servidor.*/

        debugger;

        /*JSON.parse() toma como entrada el texto en JSON que me llega
        del servidor y lo convierte a un objeto.*/
        let json = JSON.parse(data)

        debugger;
    }); 

})