package com.example.ecommercekhanhnguyen.entity;

public class Cart {
    private int id;
    private int idProduct;
    private int idUser;
    private String name;
    private String image;
    private double price;

    public Cart() {
    }

    public Cart(int id, int idProduct, int idUser, String name, String image, double price) {
        this.id = id;
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.name = name;
        this.image = image;
        this.price = price;
    }

    public Cart(int idProduct, int idUser, String name, String image, double price) {
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.name = name;
        this.image = image;
        this.price = price;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
