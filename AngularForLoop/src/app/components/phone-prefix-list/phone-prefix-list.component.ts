import { Component } from '@angular/core';

export interface CountryPhone{
  nombre: string;
  flag: string;
  prefix: number[];
}

const COUNTRY_PREFIXES: CountryPhone[] = [
  {nombre: 'Spain', flag: 'spain/spain_640.png', prefix: [34]},
  {nombre: 'República Dominicana', flag: 'dominican_republic/dominican_republic_640.png', prefix: [809, 829, 849]},
]

@Component({
  selector: 'app-phone-prefix-list',
  templateUrl: './phone-prefix-list.component.html',
  styleUrl: './phone-prefix-list.component.css'
})
export class PhonePrefixListComponent {
  countryPhoneList = COUNTRY_PREFIXES;

  getFlagImage(flag:string){
    return ''
  }
}
