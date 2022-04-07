import {Component, OnInit} from '@angular/core';
import {delay, Observable} from "rxjs";
import {Client} from "../../../core/models";
import {ClientService} from "../services/client.service";

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  public clients: Client[] = []
  public isLoading = false;

  constructor(public clientSrv: ClientService) {
  }

  ngOnInit(): void {
    this.isLoading= true;
    this.clientSrv.getClients().pipe(delay(500)).subscribe(data => {
      this.clients = data
      this.isLoading = false;
    })
  }


}
