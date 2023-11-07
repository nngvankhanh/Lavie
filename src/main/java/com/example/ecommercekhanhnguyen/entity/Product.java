package com.example.ecommercekhanhnguyen.entity;

public class Product {
    private int id;
    private int idCategory;
    private String nameCategory;
    private String name;
    private String image;
    private double price;
    private String description;
    private int quantity;
    private int stt;

    public Product() {
    }

    public Product(int id, int idCategory, String name, String image, double price, String description, int quantity,int stt) {
        this.id = id;
        this.idCategory = idCategory;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.stt = stt;
    }
    public Product(int id, int idCategory, String name, String image, double price, String description, int quantity, String nameCategory) {
        this.id = id;
        this.idCategory = idCategory;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.nameCategory = nameCategory;
    }

    public Product(int id, int idCategory, String name, String image, double price, String description, int quantity) {
        this.id = id;
        this.idCategory = idCategory;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }
    public Product(int idCategory, String name, String image, double price, String description, int quantity) {
        this.idCategory = idCategory;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }
}
