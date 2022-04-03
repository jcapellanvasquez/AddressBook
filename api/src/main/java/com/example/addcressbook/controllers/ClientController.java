package com.example.addcressbook.controllers;

import com.example.addcressbook.entities.Client;
import com.example.addcressbook.repositories.ClientRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("client")
public class ClientController {

    final ClientRepository clientRep;

    ClientController(ClientRepository clientRep) {
        this.clientRep = clientRep;
    }

    @RequestMapping("")
    public ResponseEntity<List<Client>> findAll() {
        List<Client> clients = this.clientRep.findAllByActiveTrue();
        return new ResponseEntity<List<Client>>(clients, HttpStatus.ACCEPTED);
    }
}
