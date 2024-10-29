import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PokemonResponse } from '../models/pokemon.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient) { }

  getPokemon(id: number): Observable<PokemonResponse>{
    return this.http.get<PokemonResponse>(`https://pokeapi.co/api/v2/pokemon/${id}/`);
  }

}
