package com.example.addcressbook.controllers;

import com.example.addcressbook.entities.Client;
import com.example.addcressbook.exceptions.ResourceNotFound;
import com.example.addcressbook.repositories.ClientRepository;
import com.example.addcressbook.services.ClientService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

@RestController
@RequestMapping("client")
public class ClientController {

    final ClientService clientSrv;

    ClientController(ClientService clientSrv) {
        this.clientSrv = clientSrv;
    }

    @GetMapping("")
    public ResponseEntity<List<Client>> findAll() {
        return this.clientSrv.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Client> find(@PathVariable Integer id) throws ResourceNotFound {
        return this.clientSrv.find(id);
    }

    @PostMapping
    public ResponseEntity<Client> save(@RequestBody Client client) {
        return this.clientSrv.save(client);
    }

    @PutMapping
    public ResponseEntity<Client> update(@RequestBody Client client) {
        return this.clientSrv.save(client);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        return this.clientSrv.delete(id);
    }
}
