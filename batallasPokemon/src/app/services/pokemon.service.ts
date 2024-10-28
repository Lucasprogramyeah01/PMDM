import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PokemonListResponse } from '../models/pokemon-list.interfaces';
import { PokemonResponse } from '../models/pokemon.interfaces';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient) { }

  getPokemonList(): Observable<PokemonListResponse>{
    return this.http.get<PokemonListResponse>('https://pokeapi.co/api/v2/pokemon/');
  }

  getPokemon(id: number | undefined): Observable<PokemonResponse>{
    return this.http.get<PokemonResponse>(`https://pokeapi.co/api/v2/pokemon/${id}/`);
  }
  
}
