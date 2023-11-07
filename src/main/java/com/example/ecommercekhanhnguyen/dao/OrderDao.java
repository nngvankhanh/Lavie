package com.example.ecommercekhanhnguyen.dao;

import com.example.ecommercekhanhnguyen.connection.JdbcConnection;
import com.example.ecommercekhanhnguyen.dto.HistoryDto;
import com.example.ecommercekhanhnguyen.dto.OrderDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static com.example.ecommercekhanhnguyen.service.HomeService.generateCode;
import static com.example.ecommercekhanhnguyen.service.HomeService.generateDate;

public class OrderDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    public static final String SELECT_ALL_PRODUCT_CART_BY_ID = "SELECT COUNT(ID_PRODUCT), ID_PRODUCT, ID_USER, NAME_PRODUCT, SUM(PRICE_PRODUCT) FROM CART WHERE ID_USER = ? GROUP BY ID_PRODUCT, ID_USER, NAME_PRODUCT, IMAGE_PRODUCT, PRICE_PRODUCT; ";
    public static final String  INSERT_ORDER = "INSERT INTO `ORDER`(ID_USER,ID_PRODUCT,CODE_PRODUCT,NAME_PRODUCT,QUANTITY_PRODUCT,SUB_PRICE_PRODUCT,DATE_TIME) VALUES (?,?,?,?,?,?,?)";
    public static final String  SELECT_ALL_ORDER = "SELECT CODE_PRODUCT,NAME_PRODUCT, DATE_TIME, QUANTITY_PRODUCT, SUB_PRICE_PRODUCT FROM `ORDER`  WHERE ID_USER = ?;";
    /*public void setInsertOrder(){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(INSERT_BILL_BY_ID);
            ps.setInt(1, order.getIdUser());
            ps.setString(2, order.getAddress());
            ps.setString(3, order.getPhone());
            ps.setString(4, order.getDetail());
            ps.setString(5, order.getDate());
            ps.executeUpdate();
            conn.close();
            ps.close();
        }catch (Exception e){
        }
    }*/
    public List<OrderDto> getProductCart(String idUser){
        try{
            List<OrderDto> orderDtos = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_PRODUCT_CART_BY_ID);
            ps.setString(1,idUser);
            rs = ps.executeQuery();
            while(rs.next()){
                int quantity = rs.getInt(1);
                int IdProduct = rs.getInt(2);
                int IdUser = rs.getInt(3);
                String name = rs.getString(4);
                Double subPrice = rs.getDouble(5);
                orderDtos.add(new OrderDto(IdProduct,IdUser,quantity,name,subPrice));
            }
            conn.close();
            ps.close();
            rs.close();
            return orderDtos;
        }catch (Exception e){
        }
        return null;
    }
    public void insertOrder(List<OrderDto> orderDtos){
        try{
            conn = JdbcConnection.getConnection();
            for (OrderDto orderDto:orderDtos) {
                String dateTime = generateDate();
                String generatedCode = generateCode();
                ps = conn.prepareStatement(INSERT_ORDER);
                ps.setInt(1,orderDto.getIdUser());
                ps.setInt(2,orderDto.getIdProduct());
                ps.setString(3,generatedCode);
                ps.setString(4,orderDto.getName());
                ps.setInt(5,orderDto.getQuantity());
                ps.setDouble(6,orderDto.getSubPrice());
                ps.setString(7,dateTime);
                ps.executeUpdate();
            }
            conn.close();
            ps.close();
        }catch (Exception e){
        }
    }
    public List<HistoryDto> getAllOrder(String idUser){
        try{
            List<HistoryDto> list = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_ORDER);
            ps.setString(1,idUser);
            rs = ps.executeQuery();
            while(rs.next()){
                String code = rs.getString(1);
                String name = rs.getString(2);
                String date = rs.getString(3);
                int quantity = rs.getInt(4);
                double subPrice = rs.getDouble(5);
                list.add(new HistoryDto(code,name,date,quantity,subPrice));
            }
            conn.close();
            ps.close();
            rs.close();
            return list;
        }catch (Exception e){
        }
        return null;
    }
}
