import {Injectable} from '@angular/core';
import {environment} from "../../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Address, Client} from "../../../core/models";
import {AbstractControl, FormArray, FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Message, MessageService} from "primeng/api";
import {LoginService} from "../../auth/services/login.service";
import {combineAll, delay, switchMap, tap} from "rxjs";
import {ActivatedRoute, ActivatedRouteSnapshot, Route, Router} from "@angular/router";

@Injectable()
export class ClientService {
  public url = environment.apiUrl;
  public form: FormGroup;
  public addressForm: FormGroup;
  public _addressList: Address[] = [];
  public isLoading = false;
  private isEditing = false;


  constructor(public http: HttpClient,
              private fb: FormBuilder,
              public loginSrv: LoginService,
              public msgSrv: MessageService,
              private router: Router) {
    this.form = this.fb.group({
      id: [''],
      name: ['', Validators.required],
      email: ['', [Validators.email, Validators.required]],
      user: [''],
    })

    this.addressForm = this.fb.group({
      id: [''],
      active: [true],
      address: ['', Validators.required],
      address1: [''],
      state: ['', Validators.required],
      zip: ['', Validators.required],
      city: ['', Validators.required],
    })
  }

  public getClients() {
    return this.http.get<Client[]>(`${this.url}/client`)
  }

  public getClient(id: number) {
    this.isLoading = true;
    return this.http
      .get<Client>(`${this.url}/client/${id}`)
      .pipe(
        delay(250),
        tap(client => this.setClient(client))
      )
  }

  public saveClient() {
    if (this.form.valid && this._addressList.length > 0) {
      const data: Client = {
        ...this.form.getRawValue(),
        addressList: this._addressList,
        user: {...this.loginSrv.getUserFromToken()}
      }
      this.isLoading = true;
      this.http.post<Client>(`${this.url}/client`, data)
        .pipe(delay(250))
        .subscribe(data => {
          if (this.isEditing) {
            this.getClient(data.id).subscribe()
          } else {
            this.form.reset()
            this._addressList.length = 0;
          }
          this.showSuccessMsg()
        }, error => this.isLoading = false, () => this.isLoading = false)
    } else {
      this.form.markAllAsTouched()
    }
  }

  deleteClient(id: number) {
      console.log('remove')
  }

  showSuccessMsg() {
    this.msgSrv.add({severity: 'success', summary: 'Registration success', detail: '', key: 'toast'})
  }

  public setClient(client: Client) {
    this.isEditing = true;
    this.addressList = client.addressList;
    this.form.patchValue({
      id: client.id,
      name: client.name,
      email: client.email
    })
  }

  public saveAddress() {
    this.addressList.push({...this.addressForm.getRawValue()})
    this.addressForm.reset()
  }

  get name() {
    return this.form.get('name')
  }

  get email() {
    return this.form.get('email')
  }

  get addressList() {
    return this._addressList
  }

  set addressList(list: Address[]) {
    this._addressList = list;
  }

  get address() {
    return this.addressForm.get('address')
  }

  get address1() {
    return this.addressForm.get('address1')
  }

  get state() {
    return this.addressForm.get('state')
  }


  get zip() {
    return this.addressForm.get('zip')
  }

  get city() {
    return this.addressForm.get('city')
  }

  removeAddress(index: number) {
    this.addressList[index].active = false;
  }
}
