import { Injectable } from '@angular/core';
import {environment} from "../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Client} from "../../../core/models";

@Injectable()
export class ClientService {
  public url = environment.apiUrl;

  constructor(public http: HttpClient) { }

  public getClients() {
    return this.http.get<Client[]>(`${this.url}/client`)
  }
}
