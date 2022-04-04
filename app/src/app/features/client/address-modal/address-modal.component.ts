import { Component, OnInit } from '@angular/core';
import {ClientService} from "../services/client.service";
import {Message} from "primeng/api";
import {DynamicDialogRef} from "primeng/dynamicdialog";

@Component({
  selector: 'app-address-modal',
  templateUrl: './address-modal.component.html',
  styleUrls: ['./address-modal.component.css']
})
export class AddressModalComponent implements OnInit {
  public msgs: Message[] = [];

  constructor(public clientSrv: ClientService, public modalRef: DynamicDialogRef) { }

  ngOnInit(): void {

  }

  public showMessage() {
    // this.msgs.length = 0;
    this.msgs = [{severity:'info', summary:'New Address added', detail:''}];
  }

  add() {
    if (this.clientSrv.addressForm.valid) {
      this.showMessage()
      this.clientSrv.saveAddress()
    } else {
      this.clientSrv.addressForm.markAllAsTouched()
    }
  }

  close() {
    this.modalRef.close()
  }

}
