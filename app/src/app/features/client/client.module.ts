import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ClientRoutingModule } from './client-routing.module';
import { ListComponent } from './list/list.component';
import {SharedModule} from "../../shared/shared.module";
import {ClientService} from "./services/client.service";
import {HttpClientModule} from "@angular/common/http";
import { FormComponent } from './form/form.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import { AddressModalComponent } from './address-modal/address-modal.component';
import {DialogService} from "primeng/dynamicdialog";
import {LoginService} from "../auth/services/login.service";
import {MessageService} from "primeng/api";


@NgModule({
  declarations: [
    ListComponent,
    FormComponent,
    AddressModalComponent
  ],
  imports: [
    CommonModule,
    ClientRoutingModule,
    SharedModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [ClientService, DialogService, LoginService, MessageService],
  entryComponents: [
    AddressModalComponent
  ]
})
export class ClientModule { }
