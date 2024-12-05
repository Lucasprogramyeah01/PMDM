import { Component, OnInit } from '@angular/core';
import { Character } from '../../interfaces/people-list.interfaces';
import { PeopleListService } from '../../services/people-list.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrl: './people-list.component.css'
})
export class PeopleListComponent implements OnInit{

  peopleList: Character[] = [];

  imagen : string = 'https://starwars-visualguide.com/assets/img/characters/';

  constructor(private peopleListService: PeopleListService){}
  
  ngOnInit(): void {
    this.peopleListService.getPeopleList().subscribe(respuesta => {
      this.peopleList = respuesta.results;
    });
  }

  getCharacterImage(url:string): string {
    let idCharacter = url.split("/")[5];

    return this.imagen+'/'+idCharacter+'.jpg';
  }

}
