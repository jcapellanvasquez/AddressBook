package com.example.addcressbook.exceptions;

public class ResourceNotFound extends Exception{
    private String message;

    public ResourceNotFound(String message) {
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
