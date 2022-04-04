import { Component, OnInit } from '@angular/core';
import {ClientService} from "../services/client.service";
import {DialogService} from "primeng/dynamicdialog";
import {AddressModalComponent} from "../address-modal/address-modal.component";
import {MessageService} from "primeng/api";

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css'],
})
export class FormComponent implements OnInit {

  constructor(public clientSrv: ClientService,
              public dialogSrv: DialogService) { }

  ngOnInit(): void {
  }

  openAddressModal() {
    this.dialogSrv.open(AddressModalComponent, {
      header: 'Add address',
      width: '50%'
    })
  }
}
