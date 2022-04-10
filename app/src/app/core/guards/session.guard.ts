import {Injectable} from '@angular/core';
import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree} from '@angular/router';
import {Observable} from 'rxjs';
import {LoginService} from "../../features/auth/services/login.service";

@Injectable()
export class SessionGuard implements CanActivate {

  constructor(private loginSrv: LoginService, private router: Router) {
  }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    const jwtToken = this.loginSrv.getToken()

    if (jwtToken && state.url === "/login") {
      // this.router.navigate(['home'])
      console.log("Go Home")
    } else if (!jwtToken && state.url !== "/login") {
      this.router.navigate(['login'])
      console.log("Go login")
    }
    return true;
  }

}
