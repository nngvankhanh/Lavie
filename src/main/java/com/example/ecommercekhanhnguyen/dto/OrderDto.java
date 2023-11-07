package com.example.ecommercekhanhnguyen.dto;

public class OrderDto {
    private int id;
    private int idProduct;
    private int idUser;
    private int quantity;
    private String name;
    private double subPrice;

    public OrderDto() {
    }

    public OrderDto(int idProduct, int idUser, int quantity, String name, double subPrice) {
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.quantity = quantity;
        this.name = name;
        this.subPrice = subPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getSubPrice() {
        return subPrice;
    }

    public void setSubPrice(double subPrice) {
        this.subPrice = subPrice;
    }
}
