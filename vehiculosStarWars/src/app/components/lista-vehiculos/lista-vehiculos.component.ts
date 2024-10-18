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

  constructor(private listaService: ListaVehiculosService){}

  ngOnInit(): void {
    this.listaService.getListaVehiculos.subscribe(respuesta => {
      this.listadoCasas = respuesta;
    });
  }

}
