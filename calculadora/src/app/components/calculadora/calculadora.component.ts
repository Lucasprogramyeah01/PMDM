import { Component } from '@angular/core';

@Component({
  selector: 'app-calculadora',
  templateUrl: './calculadora.component.html',
  styleUrl: './calculadora.component.css'
})
export class CalculadoraComponent {
  
  numero1 = 0
  numero2 = 0;
  resultado = 0;

  suma = false;
  resta = false;

  simbolo = '#';

  digito1Listo = false;

  addNum(numero:number){
    if(this.digito1Listo){
      this.digito1Listo = false;
      return this.numero2 = numero;
    }else{
      this.digito1Listo = true;
      return this.numero1 = numero;
    }
  }

  sumar() {
    this.suma = true;
    this.resta = false;
    this.simboloOperacion();
  }

  restar() {
    this.resta = true;
    this.suma = false;
    this.simboloOperacion();
  }

  simboloOperacion(){
    if((this.suma==true && this.resta==false)){
      return this.simbolo='+';
    }else{
      if((this.suma==false && this.resta==true)){
        return this.simbolo='-';
      }else{
        return this.simbolo='#';
      }
    }
  }

  realizarOperacion(){
    switch(this.suma){
      case true:{
        return this.resultado = this.numero1 + this.numero2;
      }
      case false:{
        return this.resultado = this.numero1 - this.numero2;
      }
    }
  }

  reiniciarCalculadora(){
    this.numero1 = 0
    this.numero2 = 0;
    this.resultado = 0;

    this.suma = false;
    this.resta = false;

    this.simbolo = '#';

    this.digito1Listo = false;
  }

}
