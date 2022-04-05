import { Component, OnInit } from '@angular/core';
import {AppMessageService} from "../../services/app-message.service";
import {MessageService} from "primeng/api";

@Component({
  selector: 'app-notification-handler',
  templateUrl: './notification-handler.component.html',
  styleUrls: ['./notification-handler.component.css'],
  providers: [MessageService]
})
export class NotificationHandlerComponent implements OnInit {

  constructor(private appMessage: AppMessageService, public msgSrv: MessageService) { }

  ngOnInit(): void {
    this.appMessage.message$.subscribe( message => {
      if (message) {
        this.msgSrv.add(message)
      }
    })
  }

}
