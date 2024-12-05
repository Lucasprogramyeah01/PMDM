import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListaVehiculosComponent } from './components/lista-vehiculos/lista-vehiculos.component';
import { PeopleListComponent } from './components/people-list/people-list.component';
import { PageNotFoundComponent } from './shared/page-not-found/page-not-found.component';

const routes: Routes = [
  { path: 'vehicles', component: ListaVehiculosComponent },
  { path: 'people', component: PeopleListComponent },
  { path: '', redirectTo: '/vehicles', pathMatch: 'full' },
  { path:'**', component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
