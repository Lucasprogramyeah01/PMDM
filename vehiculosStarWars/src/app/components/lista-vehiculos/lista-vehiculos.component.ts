import { Component, OnInit } from '@angular/core';
import { Vehiculo } from '../../interfaces/listaVehiculos.interfaces';
import { ListaVehiculosService} from '../../services/lista-vehiculos.service.ts.service';

@Component({
  selector: 'app-lista-vehiculos',
  templateUrl: './lista-vehiculos.component.html',
  styleUrl: './lista-vehiculos.component.css'
})
export class ListaVehiculosComponent implements OnInit{

  listadoVehiculos: Vehiculo[] = [];

  imagen : string = 'https://starwars-visualguide.com/assets/img/vehicles/'

  constructor(private listaService: ListaVehiculosService){}

  ngOnInit(): void {
    this.listaService.getListaVehiculos().subscribe(respuesta => {
      this.listadoVehiculos = respuesta.results;
    });
  }

  getImagen(url:string): string {
    let id = url.split("/")[5];

    return this.imagen+'/'+id+'.jpg';
  }

  /*
  SE TENDRÍA QUE HACER ASÍ

  ngOnInit(): void {
    this.listaService.getListaVehiculos().subscribe(respuesta => {
      this.listadoVehiculos = respuesta.results;
    });
  }*/

}
