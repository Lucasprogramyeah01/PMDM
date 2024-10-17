import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-barra-progreso',
  templateUrl: './barra-progreso.component.html',
  styleUrl: './barra-progreso.component.css'
})
export class BarraProgresoComponent {

  @Input() porcentaje = 12;

  getProgressColor(): string {
    if(this.porcentaje <= 25){
      return 'danger';
    }else{
      if(this.porcentaje>25 && this.porcentaje<=50){
        return 'warning';
      }else{
        if(this.porcentaje>50 && this.porcentaje<=75){
          return 'primary';
        }else{
          if(this.porcentaje>75 && this.porcentaje<=99){
            return 'success';
          }else{
            return 'dark';
          }
        }
      }
    }
  }
}
