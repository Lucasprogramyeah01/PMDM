import { Component, Input, OnInit, SimpleChanges } from '@angular/core';
import { PokemonResponse } from '../../models/pokemon.interfaces';
import { PokemonService } from '../../services/pokemon.service';

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrl: './pokemon.component.css'
})
export class PokemonComponent implements OnInit{
  
  @Input() idObtenido: number | undefined;

  pokemon: PokemonResponse | undefined;

  constructor(private pokemonService: PokemonService){}

  ngOnInit(): void {
    this.pokemonService.getPokemon(this.idObtenido!).subscribe(respuesta => {
      this.pokemon = respuesta;
    });
  }

  ngOnChanges(changes: SimpleChanges): void {
    if(changes['idObtenido'] && changes['idObtenido'].currentValue !== undefined){
      this.ngOnInit();
    }
  }

  atacarOponente(){

  }

}
