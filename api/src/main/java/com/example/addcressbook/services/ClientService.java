package com.example.addcressbook.services;

import com.example.addcressbook.entities.Address;
import com.example.addcressbook.entities.Client;
import com.example.addcressbook.exceptions.ResourceNotFound;
import com.example.addcressbook.repositories.AddressRepository;
import com.example.addcressbook.repositories.ClientRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ClientService {
    final ClientRepository clientRep;
    final AddressRepository addressRep;

    ClientService(ClientRepository clientRep, AddressRepository addressRep) {
        this.clientRep = clientRep;
        this.addressRep = addressRep;
    }

    public ResponseEntity<List<Client>> findAll() {
        List<Client> clients = this.clientRep.findAllByActiveTrueOrderByIdDesc();
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
        client.setId(client.getId() == null ? this.clientRep.getNextPk() : client.getId());
        client.getAddressList().forEach(address -> {
            address.setClientId(client.getId());
            address.setUserId(client.getUser().getId());
            address.setAddress1(address.getAddress1() == null ? "" : address.getAddress1());
        });
        Client client1 = this.clientRep.saveAndFlush(client);
        return new ResponseEntity<Client>(client1, HttpStatus.ACCEPTED);
    }

    private void saveAddresses(Client client, List<Address> addressList) {
        this.addressRep.deleteAll(addressList);
        this.addressRep.saveAll(addressList);
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
