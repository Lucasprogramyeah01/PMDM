import { Component, OnInit } from '@angular/core';
import { PokemonBattleService } from '../../services/pokemon-battle.service';
import { Pokemon } from '../../models/pokemon-list.interfaces';

@Component({
  selector: 'app-pokemon-battle',
  templateUrl: './pokemon-battle.component.html',
  styleUrl: './pokemon-battle.component.css'
})
export class PokemonBattleComponent implements OnInit{
  
  listaPokemon: Pokemon[] = [];

  constructor(private pokemonBattleService: PokemonBattleService){}

  ngOnInit(): void {
    this.pokemonBattleService.getPokemonList().subscribe(respuesta => {
      this.listaPokemon = respuesta.results;
    });
  }

}
