import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {LoginService} from "../services/login.service";
import {UserCredential} from "../../../core/models";
import {delay, finalize, tap} from "rxjs";
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  public form: FormGroup;
  public isLoading: boolean = false;

  constructor(private fb: FormBuilder, private loginSrv: LoginService, private router: Router) {
    this.form = this.fb.group({
      username: ['', [Validators.required, Validators.minLength(3)]],
      password: ['', [Validators.required, Validators.minLength(3)]],
    });
  }

  ngOnInit(): void {
  }

  auth() {
    if (this.form.valid) {
      this.isLoading = true;
      const credentials: UserCredential = {...this.form.getRawValue()}
      this.loginSrv.auth(credentials)
        .pipe(
          delay(500)
        ).subscribe((data) => {
        this.isLoading = false
        if (data.token) {
          this.router.navigate(['/'])
        }
      })
    } else {
      this.username?.markAsDirty()
      this.password?.markAsDirty()
    }
  }

  get username() {
    return this.form.get("username")
  }

  get password() {
    return this.form.get("password")
  }
}
