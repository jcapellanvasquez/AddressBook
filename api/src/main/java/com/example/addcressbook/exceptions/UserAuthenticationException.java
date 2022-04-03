package com.example.addcressbook.exceptions;

public class UserAuthenticationException extends Exception{
    private String message;

    public UserAuthenticationException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
