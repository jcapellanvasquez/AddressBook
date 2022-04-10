import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {SessionGuard} from "./core/guards/session.guard";

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./features/features.module').then(m => m.FeaturesModule),
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
