import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ClientRoutingModule } from './client-routing.module';
import { ListComponent } from './list/list.component';
import {SharedModule} from "../../shared/shared.module";
import {ClientService} from "./services/client.service";
import {HttpClientModule} from "@angular/common/http";


@NgModule({
  declarations: [
    ListComponent
  ],
  imports: [
    CommonModule,
    ClientRoutingModule,
    SharedModule,
  ],
  providers: [ClientService]
})
export class ClientModule { }
