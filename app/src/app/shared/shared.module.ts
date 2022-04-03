import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ButtonModule} from "primeng/button";
import {CardModule} from "primeng/card";
import {MenuModule} from "primeng/menu";
import {InputTextModule} from "primeng/inputtext";
import {TabMenuModule} from "primeng/tabmenu";
import {ToastModule} from "primeng/toast";



@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ButtonModule,
    CardModule,
    MenuModule,
    InputTextModule,
    TabMenuModule,
    ToastModule
  ],
  exports: [
    ButtonModule,
    CardModule,
    MenuModule,
    InputTextModule,
    TabMenuModule,
    ToastModule
  ]
})
export class SharedModule { }
