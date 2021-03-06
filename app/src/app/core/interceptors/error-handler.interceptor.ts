import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor, HttpErrorResponse
} from '@angular/common/http';
import {catchError, Observable, of} from 'rxjs';
import {AppMessageService} from "../services/app-message.service";
import {Router} from "@angular/router";

@Injectable()
export class ErrorHandlerInterceptor implements HttpInterceptor {

  constructor(private appMsgSrv: AppMessageService, public roter: Router) {
  }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request).pipe(catchError(event => {
      if (event instanceof HttpErrorResponse) {
        switch (event.status) {
          case 403:
            this.appMsgSrv.sendMsg({severity: 'warn', summary: 'Session timeout'})
            this.roter.navigate(['/login'])
            localStorage.clear()
            break;
          case 0:
          case 404:
          case 500:
            this.appMsgSrv.sendMsg({severity: 'error', summary: 'Something went wrong with the server', detail: event.message})
            this.roter.navigate(['/login'])
            localStorage.clear()
            break
          default:
        }
      }
      return of(event)
    }));
  }
}
