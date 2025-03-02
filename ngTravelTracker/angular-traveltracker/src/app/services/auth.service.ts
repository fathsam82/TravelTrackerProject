import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { User } from '../models/user';
import { catchError, Observable, tap, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  
  private url = environment.baseUrl;
  
  //HttpClient is injected into AuthService via the constructor to be used to make
  //HTTP requsts such as GET, POST, PUT AND DELETE
  constructor(private http: HttpClient) { }

  // FUNCTION
  // register(user: User): Observable<User> {
  //   return this.http.post<User>(this.url + 'register', user).pipe(
  //     catchError((err: any) => {
  //       console.log(err);
  //       return throwError(() => new Error('AuthService.register(): error registering user.'));
  //     })

  //   )

  // }

  //UPDATED FUNCTION
  //Returns an Observable<User>, asynchronously sends the user data and expects
  //a response of type User.
  //In other words =>
  // User parameter represents data being sent to backend
  // Observable works asynchronously to represent the HTTP request that executes
  // in the background when .subscribe() is called in the register.component.ts file
  //Better logging with tap()
  //Uses template literals & utilizes centralized error handling making function
  //cleaner, less redundant and more maintainable
  register(user: User): Observable<User> {
    return this.http.post<User>(`${this.url}/register`, user).pipe(
      tap((response) => console.log('User registered:', response)),
      catchError((err) => this.handleError('Register')(err))
    );
  }
  
  //Centralized error handling function
  private handleError(operation: string) {
  return(error: any): Observable<never> => {
    console.error('${operation} failed:', error);
    return throwError(() => new Error('${operation} failed. Please try again'));
  };
}
}
