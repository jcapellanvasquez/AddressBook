package com.example.addcressbook.repositories;


import com.example.addcressbook.entities.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends CrudRepository<Client, Integer> {
    List<Client> findAllByActiveTrue();
    Client findClientByActiveTrueAndId(Integer id);

    @Query(value = "select nextval('public.clients_id_seq')", nativeQuery = true)
    public Integer getNextPk();
}
