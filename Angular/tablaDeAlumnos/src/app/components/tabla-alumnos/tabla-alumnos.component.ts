import { Component } from '@angular/core';

export interface Student{
  numAlumno: number;
  nombre: string;
  apellidos: string;
  NIF: string;
  edad: number;
  curso: string;
  visible: boolean;
}

const DATOS_ALUMNO: Student[] = [
  {numAlumno: 1, nombre: 'Laureano', apellidos: 'Cayena Barrenota', NIF: '28685366L', edad: 18, curso: '2ºBACH', visible: true},
  {numAlumno: 2, nombre: 'Alfonso María', apellidos: 'Pérez Filomena', NIF: '84826097G', edad: 15, curso: '3ºESO', visible: true},
  {numAlumno: 3, nombre: 'Carlos', apellidos: 'Clásico Andol', NIF: '35219598C', edad: 14, curso: '2ºESO', visible: true},
  {numAlumno: 4, nombre: 'Chindasvinto', apellidos: 'García Logroño', NIF: '05933265R', edad: 16, curso: '4ºESO', visible: true},
  {numAlumno: 5, nombre: 'Irene', apellidos: 'Flores Marín', NIF: '76254934K', edad: 18, curso: '2ºBACH', visible: true},
  {numAlumno: 6, nombre: 'Idoia', apellidos: 'Repollo Rebollo', NIF: '10047612Q', edad: 16, curso: '4ºESO', visible: true},
  {numAlumno: 7, nombre: 'Jauma', apellidos: 'Domènech Sánchez', NIF: '43108600E', edad: 17, curso: '1ºBACH', visible: true},
  {numAlumno: 8, nombre: 'Paula', apellidos: 'Ortiz Etxebarria', NIF: '13333721T', edad: 14, curso: '2ºESO', visible: true},
  {numAlumno: 9, nombre: 'Aitor', apellidos: 'Méndez Itaya', NIF: '85884894L', edad: 15, curso: '3ºESO', visible: true},
  {numAlumno: 10, nombre: 'Chu Hua', apellidos: 'Quenguan', NIF: '72354205T', edad: 15, curso: '3ºESO', visible: true},
];

@Component({
  selector: 'app-tabla-alumnos',
  templateUrl: './tabla-alumnos.component.html',
  styleUrl: './tabla-alumnos.component.css'
})
export class TablaAlumnosComponent {
  displayedColumns: string[] = ['numAlumno', 'nombre', 'apellidos', 'NIF', 'edad', 'curso'];
  dataSource = DATOS_ALUMNO;

  borrarColumna(columna:string, pulsado:boolean){
    if(pulsado){
      this.displayedColumns.push(columna);
    }else{
      this.displayedColumns == this.displayedColumns.filter(col => col != columna);
    }
  }
}
