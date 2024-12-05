import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rating',
  standalone: true,
  imports: [],
  templateUrl: './rating.component.html',
  styleUrl: './rating.component.css'
})
export class RatingComponent implements OnInit {
  valoracion = 6;
  ratingClass = 'red';
  
  ngOnInit(): void {
    this.calcRating();
  }
  
  calcRating() {
    this.ratingClass = this.valoracion < 5 ? 'red' : 'green';
  }

}
