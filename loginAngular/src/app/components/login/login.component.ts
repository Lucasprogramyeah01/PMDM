import { Component, signal } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  nombreDeUsuario = '';
  contrasenha = '';

  mostrarDatos() {
    console.log('Email:', this.nombreDeUsuario);
    console.log('Contraseña:', this.contrasenha);
  }

  hide = signal(true);
  clickEvent(event: MouseEvent) {
    this.hide.set(!this.hide());
    event.stopPropagation();
  }
}
