import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Root } from '../interfaces/character-list-component.interface';

@Injectable({
  providedIn: 'root'
})
export class CharacterService {

  constructor(private http: HttpClient) { }

  getListaPersonajes(): Observable<Root>{
    return this.http.get<Root>('https://rickandmortyapi.com/api/character');
  }

}
