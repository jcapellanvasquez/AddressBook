import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainComponent } from './components/main/main.component';
import {RouterModule} from "@angular/router";
import {SharedModule} from "../shared/shared.module";
import {HTTP_INTERCEPTORS} from "@angular/common/http";
import {JwtInterceptor} from "./interceptors/jwt.interceptor";
import {LoginService} from "../features/auth/services/login.service";
import { NotificationHandlerComponent } from './components/notification-handler/notification-handler.component';



@NgModule({
  declarations: [
    MainComponent,
    NotificationHandlerComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule
  ],
  exports: [
    NotificationHandlerComponent
  ],
  providers: [
    LoginService,
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true,}
  ]
})
export class CoreModule { }
