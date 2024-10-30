import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  titulo = 'Bienvenido a la página de inicio';
  precio = 125.75;
  createdAt = '2021-05-24';
  porcentajeDeVida = 0.75;
}
