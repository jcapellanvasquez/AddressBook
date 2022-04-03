package com.example.addcressbook.config;

import com.example.addcressbook.exceptions.ResourceNotFound;
import com.example.addcressbook.exceptions.UserAuthenticationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class HandlerException extends ResponseEntityExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    protected ResponseEntity<Object> handlerException(Exception ex, WebRequest req) {
        return handleExceptionInternal(
                ex,
                ex.getMessage(),
                new HttpHeaders(),
                HttpStatus.INTERNAL_SERVER_ERROR,
                req);
    }

    @ExceptionHandler(value = ResourceNotFound.class)
    protected ResponseEntity<Object> handlerResourceNotFoundException(Exception ex, WebRequest req) {
        return handleExceptionInternal(
                ex,
                ex.getMessage(),
                new HttpHeaders(),
                HttpStatus.NOT_FOUND,
                req);
    }

    @ExceptionHandler(value = UserAuthenticationException.class)
    protected ResponseEntity<Object> handlerUserAuthenticationException(Exception ex, WebRequest req) {
        return handleExceptionInternal(
                ex,
                ex.getMessage(),
                new HttpHeaders(),
                HttpStatus.NOT_FOUND,
                req);
    }
}
