import {Component, OnInit} from '@angular/core';
import {Menu} from "primeng/menu";
import {MenuItem} from "primeng/api";
import {Router} from "@angular/router";
import {AppMessageService} from "../../services/app-message.service";

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  public items: MenuItem[] = [
    {label: 'Home', icon: 'pi pi-fw pi-home', routerLink: 'home'},
    {label: 'Clients', icon: 'pi pi-fw pi-user-plus', routerLink: 'client'},
    {
      label: 'Logout', icon: 'pi pi-fw pi-fw pi-power-off', command: event => {
        localStorage.clear()
        this.router.navigate(['/login'])
        this.msgSrv.sendMsg({severity: 'info', summary: 'Session closed'})
      }
    },
  ]

  constructor(private router: Router, private msgSrv: AppMessageService) {

  }

  ngOnInit(): void {
  }

}
