import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  //1 - Property binding. (One way)
  valoracion = 5;
  imgURL = 'https://jofer.pro/wp-content/uploads/2019/06/jofer-logo-empresas-eroski.png'

  //2- Event binding. (One way)
  showUserInfo() {
    alert(`Nombre del usuario: ${this.nombre}`);
  }

  //3- Two way data binding.
  nombre = 'Miguel';
}
