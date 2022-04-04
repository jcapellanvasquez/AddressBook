package com.example.addcressbook.entities;

import javax.persistence.*;

@Table(name= "addresses", schema = "public")
@Entity
public class Address {

    @Id
    @SequenceGenerator(name="addresses_id_seq", sequenceName = "addresses_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "addresses_id_seq")
    @Column(name="id")
    private Integer id;

    @Column(name="state")
    private String state;

    @Column(name="city")
    private String city;

    @Column(name="address")
    private String address;

    @Column(name="address1")
    private String address1;

    @Column(name="zip")
    private String zip;

    @Column(name ="client_id")
    private Integer clientId;

    @Column(name="active")
    private Boolean active;

    @Column(name="user_id")
    private Integer userId;

    public Address() {
    }

    public Address(Integer id, String state, String city, String address, String address1, String zip, Integer clientId, Boolean active, Integer userId) {
        this.id = id;
        this.state = state;
        this.city = city;
        this.address = address;
        this.address1 = address1;
        this.zip = zip;
        this.clientId = clientId;
        this.active = active;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
