package com.example.addcressbook.services;

import com.example.addcressbook.entities.Client;
import com.example.addcressbook.exceptions.ResourceNotFound;
import com.example.addcressbook.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ClientService {
    final ClientRepository clientRep;

    ClientService(ClientRepository clientRep) {
        this.clientRep = clientRep;
    }

    public ResponseEntity<List<Client>> findAll() {
        List<Client> clients = this.clientRep.findAllByActiveTrue();
        return new ResponseEntity<List<Client>>(clients, HttpStatus.ACCEPTED);
    }

    public ResponseEntity<Client> find(Integer id) throws ResourceNotFound {
        Client client = this.clientRep.findClientByActiveTrueAndId(id);
        if (client == null) {
            throw new ResourceNotFound("Resource not found");
        }
        return new ResponseEntity<Client>(client, HttpStatus.ACCEPTED);
    }

    public ResponseEntity<Client> save(Client client) {
        Client client1 = this.clientRep.save(client);
        return new ResponseEntity<Client>(client1, HttpStatus.ACCEPTED);
    }

    public ResponseEntity<Client> update(Client client) {
        Client client1 = this.clientRep.save(client);
        return new ResponseEntity<Client>(client1, HttpStatus.ACCEPTED);
    }

    public ResponseEntity<Void> delete(Integer id) {
        Client client = this.clientRep.findClientByActiveTrueAndId(id);
        client.setActive(false);
        this.clientRep.save(client);
        return new ResponseEntity(HttpStatus.ACCEPTED);
    }
}
