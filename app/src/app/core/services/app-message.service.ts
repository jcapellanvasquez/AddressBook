import { Injectable } from '@angular/core';
import {BehaviorSubject, Subject} from "rxjs";
import {Message} from "primeng/api";

@Injectable({
  providedIn: 'root'
})
export class AppMessageService {
  public message$: BehaviorSubject<Message> = new BehaviorSubject<Message>({});

  constructor() { }
  public sendMsg(msg: Message) {
    this.message$.next(msg)
  }
}
