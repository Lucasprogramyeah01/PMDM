import { Component, OnInit } from '@angular/core';
import { PokemonResponse } from '../../models/pokemon.interfaces';
import { PokemonService } from '../../services/pokemon.service';

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrl: './pokemon.component.css'
})
export class PokemonComponent implements OnInit{
  
  pokemon: PokemonResponse | undefined;

  constructor(private pokemonService: PokemonService){}

  ngOnInit(): void {
    this.pokemonService.getPokemon(this.pokemon!.id).subscribe(respuesta => {
      this.pokemon = respuesta;
    });
  }

}
