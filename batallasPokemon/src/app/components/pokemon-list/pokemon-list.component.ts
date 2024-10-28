import { Component, OnInit } from '@angular/core';
import { Pokemon } from '../../models/pokemon-list.interfaces';
import { PokemonService } from '../../services/pokemon.service';

@Component({
  selector: 'app-pokemon-list',
  templateUrl: './pokemon-list.component.html',
  styleUrl: './pokemon-list.component.css'
})
export class PokemonListComponent implements OnInit {
  
  listaPokemon: Pokemon[] = []

  constructor(private listaService: PokemonService){}
  
  ngOnInit(): void {
    this.listaService.getPokemonList().subscribe(respuesta => {
      this.listaPokemon = respuesta.results;
    });
  }

}
