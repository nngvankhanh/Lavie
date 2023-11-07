package com.example.ecommercekhanhnguyen.dao;

import com.example.ecommercekhanhnguyen.connection.JdbcConnection;
import com.example.ecommercekhanhnguyen.dto.CartDto;
import com.example.ecommercekhanhnguyen.dto.OrderDto;
import com.example.ecommercekhanhnguyen.entity.Cart;
import com.example.ecommercekhanhnguyen.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    public static final String INSERT_PRODUCT_CART = "INSERT INTO CART(ID_PRODUCT,ID_USER,NAME_PRODUCT,IMAGE_PRODUCT,PRICE_PRODUCT) VALUES(?,?,?,?,?)";
    public static final String  SELECT_ALL_PRODUCT_CART = "SELECT ID_PRODUCT,NAME_PRODUCT,IMAGE_PRODUCT,PRICE_PRODUCT," +
            "COUNT(ID_PRODUCT),SUM(PRICE_PRODUCT) FROM CART WHERE ID_USER = ? GROUP BY ID_PRODUCT,NAME_PRODUCT,IMAGE_PRODUCT,PRICE_PRODUCT,PRICE_PRODUCT;";
    public static final String  SELECT_COUNT_PRODUCT_CART = "SELECT COUNT(ID_CART) FROM CART WHERE ID_USER = ?;";
    public static final String  SELECT_SUM_PRICE_CART = "SELECT SUM(PRICE_PRODUCT) FROM CART WHERE ID_PRODUCT && ID_USER = ?;";
    public static final String  DELETE_PRODUCT_SAME_CART = "DELETE FROM CART WHERE ID_CART && ID_PRODUCT = ?";
    public static final String  DELETE_CART = "DELETE FROM CART WHERE ID_USER = ?";

    public int getCountCart(String idUser){
        int count = 0;
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_COUNT_PRODUCT_CART);
            ps.setString(1,idUser);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
            conn.close();
            ps.close();
            rs.close();
            return count;
        }catch (Exception e){
        }
        return count;
    }
    public void insertProductOnCart(Product product,String idUser) {
        try {
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(INSERT_PRODUCT_CART);
            ps.setInt(1, product.getId());
            ps.setString(2, idUser);
            ps.setString(3, product.getName());
            ps.setString(4, product.getImage());
            ps.setDouble(5, product.getPrice());
            ps.executeUpdate();
            conn.close();
            ps.close();
        } catch (Exception e) {
        }
    }
   /* public void insertProductOnCarts(Cart product,String idUser) {
        try {
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(INSERT_PRODUCT_CART);
            ps.setInt(1, product.getId());
            ps.setString(2, idUser);
            ps.setString(3, product.getName());
            ps.setString(4, product.getImage());
            ps.setDouble(5, product.getPrice());
            ps.executeUpdate();
            conn.close();
            ps.close();
        } catch (Exception e) {
        }
    }*/

    public int getSumTotalPrice(String idUser){
        int sum = 0;
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_SUM_PRICE_CART);
            ps.setString(1,idUser);
            rs = ps.executeQuery();
            while (rs.next()){
                sum = rs.getInt(1);
            }
            conn.close();
            ps.close();
            rs.close();
            return sum;
        }catch (Exception e){
        }
        return sum;
    }
    public List<CartDto> getAllProductDistinctOnCartById(String idUser){//lấy
        try{
            List<CartDto> listCart = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_PRODUCT_CART);
            ps.setString(1,idUser);
            rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                Double price = rs.getDouble(4);
                int quantity = rs.getInt(5);
                double subPrice = rs.getDouble(6);
                listCart.add(new CartDto(id,name,image,price,quantity,subPrice));
            }
            conn.close();
            ps.close();
            rs.close();
            return listCart;
        }catch (Exception e){
        }
        return null;
    }
    public void deleteProductSameCart(int idProduct){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(DELETE_PRODUCT_SAME_CART);
            ps.setInt(1,idProduct);
            ps.executeUpdate();
            conn.close();
            ps.close();
        }catch (Exception e){
        }
    }
    public void deleteAllCartById(String id){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(DELETE_CART);
            ps.setString(1,id);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
}
