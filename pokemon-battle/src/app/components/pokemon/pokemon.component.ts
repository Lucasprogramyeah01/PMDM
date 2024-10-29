import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { PokemonService } from '../../services/pokemon.service';
import { PokemonResponse } from '../../models/pokemon.interface';

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrl: './pokemon.component.css'
})
export class PokemonComponent implements OnInit{

  @Input() pokemonId: number | undefined;
  pokemon: PokemonResponse | undefined;
  @Input() life: number = 100;
  @Output() onAttackDone = new EventEmitter<number>();
  @Input() isMyTurn: boolean = false;

  constructor(private pokemonService: PokemonService){}
  
  ngOnInit(): void {
    this.pokemonService.getPokemon(this.pokemonId!).subscribe(respuesta => {
      this.pokemon = respuesta;
    })
  }

  doAttack(){
    var damage = Math.floor(Math.random() * (30 - 10) + 10);
    this.onAttackDone.emit(damage);
  }

}
