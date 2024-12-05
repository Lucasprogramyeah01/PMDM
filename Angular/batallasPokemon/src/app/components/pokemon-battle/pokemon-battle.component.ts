import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-pokemon-battle',
  templateUrl: './pokemon-battle.component.html',
  styleUrl: './pokemon-battle.component.css'
})
export class PokemonBattleComponent{
  
  // TURN possible values: 1, 2
  pokemonTurn: number = 1;
  pokemonPlayer1Id: number = 1;
  pokemonPlayer2Id: number = 4;
  lifePokemon1: number = 100;
  lifePokemon2: number = 100;

  getPokemonId1(id: number){
    this.pokemonPlayer1Id = id;
    return this.pokemonPlayer1Id;
  }

  getPokemonId2(id: number){
    this.pokemonPlayer2Id = id;
    return this.pokemonPlayer2Id;
  }

  applyDamage(damage: number) {
    if (this.pokemonTurn == 1) {
      // Apply damage to Pokemon 2
      this.lifePokemon2 -= damage;
      this.pokemonTurn = 2;
    } else {
      // Apply damage to Pokemon 1
      this.lifePokemon1 -= damage;
      this.pokemonTurn = 1;
    }
  }
  
}
