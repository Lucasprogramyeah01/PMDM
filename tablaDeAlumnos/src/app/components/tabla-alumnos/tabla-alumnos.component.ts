import { Component } from '@angular/core';

export interface Student{
  numAlumno: number;
  nombre: string;
  apellidos: string;
  NIF: number;
  edad: number;
  cursoMatriculado: string;
}

const ELEMENT_DATA: Student[] = [];

@Component({
  selector: 'app-tabla-alumnos',
  templateUrl: './tabla-alumnos.component.html',
  styleUrl: './tabla-alumnos.component.css'
})
export class TablaAlumnosComponent {

}
