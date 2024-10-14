import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { RatingComponent } from "./components/rating/rating.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RatingComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'angular-bootstrap';
}
