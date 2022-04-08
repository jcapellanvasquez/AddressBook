import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ButtonModule} from "primeng/button";
import {CardModule} from "primeng/card";
import {MenuModule} from "primeng/menu";
import {InputTextModule} from "primeng/inputtext";
import {TabMenuModule} from "primeng/tabmenu";
import {ToastModule} from "primeng/toast";
import {OrderListModule} from "primeng/orderlist";
import {HttpClient} from "@angular/common/http";
import {DataViewModule} from "primeng/dataview";
import {ChipModule} from "primeng/chip";
import {AvatarModule} from "primeng/avatar";
import {AvatarGroupModule} from "primeng/avatargroup";
import {MessageModule} from "primeng/message";
import {MessagesModule} from "primeng/messages";
import {ConfirmPopupModule} from "primeng/confirmpopup";
import {ConfirmationService} from "primeng/api";



@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ButtonModule,
    CardModule,
    MenuModule,
    InputTextModule,
    TabMenuModule,
    ToastModule,
    OrderListModule,
    DataViewModule,
    ChipModule,
    AvatarModule,
    AvatarGroupModule,
    MessageModule,
    MessagesModule,
    ConfirmPopupModule
  ],
  exports: [
    ButtonModule,
    CardModule,
    MenuModule,
    InputTextModule,
    TabMenuModule,
    ToastModule,
    OrderListModule,
    DataViewModule,
    ChipModule,
    AvatarModule,
    AvatarGroupModule,
    MessageModule,
    MessagesModule,
    ConfirmPopupModule
  ],
  providers: [ConfirmationService]
})
export class SharedModule { }
