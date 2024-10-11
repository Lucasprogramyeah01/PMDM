import { Component, OnInit } from '@angular/core';
import {MatButtonModule} from '@angular/material/button';

@Component({
  selector: 'app-homre',
  standalone: true,
  imports: [],
  templateUrl: './homre.component.html',
  styleUrl: './homre.component.css'
})

export class HomreComponent implements OnInit {

  name = '';
  lastName = '';
  age = 0;
  lifetime = 'young';

  ngOnInit(): void{
    this.name = 'Miguel';
    this.lastName = 'Campos';
    this.age = 40;

    if(this.age >= 30){
      this.lifetime = 'adult';
    }
  }

  calcBirthYear(){
    return 2024 - this.age;
  }

  showInfoDialog() {
    alert('No hay más info.');
  }
}



