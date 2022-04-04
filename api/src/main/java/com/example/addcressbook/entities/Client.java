package com.example.addcressbook.entities;

import javax.persistence.*;
import java.util.List;

@Table(name = "clients", schema = "public")
@Entity
public class Client {

    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO, generator = "public.clients_id_seq")
//    @SequenceGenerator(name = "public.clients_id_seq", sequenceName = "public.clients_id_seq", initialValue = 200)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "active")
    private Boolean active = true;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "client_id")
    private List<Address> addressList;

    public Client() {
    }

    public Client(Integer id, String name, String email, Boolean active, User user, List<Address> addressList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.active = active;
        this.user = user;
        this.addressList = addressList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
