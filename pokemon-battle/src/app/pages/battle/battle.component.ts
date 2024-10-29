import { Component } from '@angular/core';

@Component({
  selector: 'app-battle',
  templateUrl: './battle.component.html',
  styleUrl: './battle.component.css'
})
export class BattleComponent {

  //TURN possibles values: 1, 2
  pokemonTurn = 1;
  pokemonPlayer1Id = 23;
  pokemonPlayer2Id = 120;
  lifePokemon1 = 100;
  lifePokemon2 = 100;

  applyDamage(damage: number){      //En la mayoría de casos, el parámetro lleva por nombre "$event".
    if(this.pokemonTurn == 1){
      //Apply damage to Pokemon 2.

      this.pokemonTurn = 2;
    }else{
      //Apply damage to Pokemon 1.

      this.pokemonTurn = 1;
    }
  }

}
