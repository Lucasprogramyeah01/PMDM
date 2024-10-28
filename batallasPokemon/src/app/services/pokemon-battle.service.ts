import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PokemonListResponse } from '../models/pokemon-list.interfaces';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PokemonBattleService {

  constructor(private http: HttpClient) { }

  getPokemonList(): Observable<PokemonListResponse>{
    return this.http.get<PokemonListResponse>('https://pokeapi.co/api/v2/pokemon/');
  }
}
