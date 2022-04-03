package com.example.addcressbook.controllers;

import com.example.addcressbook.exceptions.UserAuthenticationException;
import com.example.addcressbook.models.UserCredential;
import com.example.addcressbook.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RequestMapping("login")
@RestController
public class LoginController {

    final UserService userSrv;

    LoginController(UserService userService) {
        this.userSrv = userService;
    }

    @PostMapping
    public ResponseEntity<Map> login(@RequestBody UserCredential userCredential) throws UserAuthenticationException {
        return this.userSrv.auth(userCredential);
    }
}
