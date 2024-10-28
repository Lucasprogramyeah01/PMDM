import { Component, Input, OnInit } from '@angular/core';
import { PokemonBattleService } from '../../services/pokemon-battle.service';
import { Pokemon } from '../../models/pokemon-list.interfaces';

@Component({
  selector: 'app-pokemon-battle',
  templateUrl: './pokemon-battle.component.html',
  styleUrl: './pokemon-battle.component.css'
})
export class PokemonBattleComponent implements OnInit{
  
  pokemonId1: number | undefined = 1;
  pokemonId2: number | undefined = 4;

  listaPokemon: Pokemon[] = [];

  constructor(private pokemonBattleService: PokemonBattleService){}

  ngOnInit(): void {
    this.pokemonBattleService.getPokemonList().subscribe(respuesta => {
      this.listaPokemon = respuesta.results;
    });
  }

  atacarOponente(IdPokeAtk: number | undefined, IdPokeDef: number | undefined){
  }

}
