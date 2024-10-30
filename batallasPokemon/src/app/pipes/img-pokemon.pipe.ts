import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'imgPokemon'
})
export class ImgPokemonPipe implements PipeTransform {

  transform(pokemonId: number): string {
    return `pokemonId!.sprites.front_default`;
  }

}
