import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'changeName'
})
export class changeNamePipe implements PipeTransform {

  transform(pokemonName: string): string {
    return '¡AUCH!';
  }

}
