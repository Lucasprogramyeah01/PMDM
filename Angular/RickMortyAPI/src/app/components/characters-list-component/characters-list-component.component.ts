import { Component, OnInit } from '@angular/core';
import { Character } from '../../interfaces/character-list-component.interface';
import { CharacterService } from '../../services/character.service';

@Component({
  selector: 'app-characters-list-component',
  templateUrl: './characters-list-component.component.html',
  styleUrl: './characters-list-component.component.css'
})
export class CharactersListComponent implements OnInit{

  listadoPersonajes: Character[] = [];

  constructor(private listadoService: CharacterService){}

  ngOnInit(): void {
    this.listadoService.getListaPersonajes().subscribe(respuesta => {
      this.listadoPersonajes = respuesta.results;
    });
  }

}
