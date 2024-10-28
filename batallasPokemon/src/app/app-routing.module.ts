import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PokemonBattleComponent } from './components/pokemon-battle/pokemon-battle.component';

const routes: Routes = [
  {path: 'pokemonBattle', component: PokemonBattleComponent},
  {path: '', redirectTo: '/pokemonBattle', pathMatch: 'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
