package com.example.ecommercekhanhnguyen.dto;

public class HistoryDto {
    private int id;
    private int idUser;
    private int idProduct;
    private String code;
    private String name;
    private int quantity;
    private double subPrice;
    private String date;

    public HistoryDto() {
    }

    public HistoryDto(int idUser, int idProduct, String code, String name, int quantity, double subPrice, String date) {
        this.idUser = idUser;
        this.idProduct = idProduct;
        this.code = code;
        this.name = name;
        this.quantity = quantity;
        this.subPrice = subPrice;
        this.date = date;
    }

    public HistoryDto(String code, String name, String date, int quantity, double subPrice) {
        this.code = code;
        this.name = name;
        this.quantity = quantity;
        this.subPrice = subPrice;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubPrice() {
        return subPrice;
    }

    public void setSubPrice(double subPrice) {
        this.subPrice = subPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
