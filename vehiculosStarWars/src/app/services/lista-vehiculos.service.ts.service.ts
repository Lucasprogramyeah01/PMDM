import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Vehiculo } from '../interfaces/listaVehiculos.interfaces';

@Injectable({
  providedIn: 'root'
})
export class ListaVehiculosService {

  constructor(private http: HttpClient) {}

  getListaVehiculos(): Observable<Vehiculo[]>{
    return this.http.get<Vehiculo[]>('http://localhost:3000/listaVehiculos');
  }

}
