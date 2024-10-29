import { Component, EventEmitter, Input, OnInit, Output, SimpleChanges } from '@angular/core';
import { PokemonResponse } from '../../models/pokemon.interfaces';
import { PokemonService } from '../../services/pokemon.service';
import { AnimationOptions } from 'ngx-lottie';

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrl: './pokemon.component.css'
})
export class PokemonComponent implements OnInit{
  
  options: AnimationOptions = {
    path: '/assets/explosion.json',
  };

  optionsGameOver: AnimationOptions = {
    path: '/assets/gameOver.json',
  };

  @Input() pokemonId: number | undefined;
  pokemon: PokemonResponse | undefined;
  @Input() life: number = 100;
  @Output() onAttackDone = new EventEmitter<number>();
  @Input() isMyTurn: boolean = false;
  showAnimation: boolean = false;
  gameOver: boolean = false;

  constructor(private pokemonService: PokemonService){}

  ngOnInit(): void {
    this.pokemonService.getPokemon(this.pokemonId!).subscribe(respuesta => {
      this.pokemon = respuesta;
    });
  }

  ngOnChanges(changes: SimpleChanges): void {
    if(changes['pokemonId'] && changes['pokemonId'].currentValue !== undefined){
      this.ngOnInit();
    }

    if (changes['life']) {
      if (changes['life'].firstChange == false) {
        this.showAnimation = true;
        setTimeout(() => {
          this.showAnimation = false;
        }, 500);
      }

      if (this.life <= 0 && this.isMyTurn == true){
        this.gameOver = true;
      }
    }
  }

  getProgressBarColor(): string {
    if (this.life == 100) {
      return 'primary';
    }else if (this.life >= 75){
      return 'success';
    } else if (this.life >= 25) {
      return 'warning';
    } else {
      return 'danger';
    }
  }

  doAttack() {
    var damage = Math.floor(Math.random() * (30 - 10) + 10);
    this.onAttackDone.emit(damage);
  }

}
