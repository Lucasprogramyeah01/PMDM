import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Vehiculo, VehiculoListResponse } from '../interfaces/listaVehiculos.interfaces';
import { PeopleListResponse } from '../interfaces/people-list.interfaces';

@Injectable({
  providedIn: 'root'
})
export class PeopleListService {

  constructor(private http: HttpClient) {}

  getPeopleList(): Observable<PeopleListResponse>{
    return this.http.get<PeopleListResponse>('https://swapi.dev/api/people');
  }

}
