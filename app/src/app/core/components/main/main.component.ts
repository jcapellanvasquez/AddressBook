import {Component, OnInit} from '@angular/core';
import {Menu} from "primeng/menu";
import {MenuItem} from "primeng/api";

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  public items: MenuItem[] = [
    {label: 'Home', icon: 'pi pi-fw pi-home', routerLink: 'home'},
    {label: 'Clients', icon: 'pi pi-fw pi-user-plus', routerLink: 'client'},
  ]

  constructor() {
  }

  ngOnInit(): void {
  }

}
