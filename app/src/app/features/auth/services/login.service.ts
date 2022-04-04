import {Injectable} from '@angular/core';
import {environment} from "../../../../environments/environment";
import {Token, User, UserCredential} from "../../../core/models";
import {HttpClient} from "@angular/common/http";
import {Observable, tap} from "rxjs";
import {JwtHelperService} from "@auth0/angular-jwt";

const jwtHelper = new JwtHelperService();

@Injectable()
export class LoginService {
  private url = environment.apiUrl;

  constructor(private http: HttpClient) { }

  public auth(credential: UserCredential): Observable<Token> {
    return this.http.post<Token>(`${this.url}/login`, credential)
      .pipe(
        tap(data => {
          if (data.token) {
            this.storeToken(data)
          }
        })
      )
  }

  public storeToken(token: Token) {
    localStorage.setItem("token", token.token)
  }

  public getToken(): string | undefined {
    return localStorage.getItem("token") || undefined
  }

  public getUserFromToken(): User {
    return jwtHelper.decodeToken(this.getToken()).user;
  }
}
