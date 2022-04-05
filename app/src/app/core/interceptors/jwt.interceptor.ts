import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import {LoginService} from "../../features/auth/services/login.service";
import {TOKEN_HEADER_KEY} from "../models/TOKEN_HEADER_KEY";

@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private loginSrv: LoginService) {}

  intercept(req: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const token = this.loginSrv.getToken()
    if (token) {
      const clone = req.clone(
        {headers: req.headers.set(TOKEN_HEADER_KEY, 'Bearer ' + token)}
      );
      return next.handle(clone);
    }
    return next.handle(req);
  }
}
