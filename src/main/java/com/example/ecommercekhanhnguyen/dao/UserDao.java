package com.example.ecommercekhanhnguyen.dao;

import com.example.ecommercekhanhnguyen.connection.JdbcConnection;
import com.example.ecommercekhanhnguyen.entity.User;

import java.sql.*;


public class UserDao{
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    private static final String INSERT_USER = "INSERT INTO USER(FIRST_NAME,LAST_NAME,EMAIL,PASSWORD) VALUES (?,?,?,?);";
    private static final String SELECT_USER = "SELECT * FROM USER WHERE EMAIL=? && PASSWORD=?";
    public void insertUser(User user){
            try{
                conn = JdbcConnection.getConnection();//KẾT NÓI
                ps = conn.prepareStatement(INSERT_USER);//THÊM VÀO DB
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getPassword());
                ps.executeUpdate();//CẬP NHẬT DÙNG CÁI NÀY MỚI LƯU XUỐNG DB ĐƯỢC
                conn.close();
                ps.close();
            }catch (Exception e){
            }
    }
    public static User getInforUser(String email,String password){
        try{
            conn = JdbcConnection.getConnection();
            ps= conn.prepareStatement(SELECT_USER);
            ps.setString(1,email);
            ps.setString(2,password);
            rs = ps.executeQuery();//
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID_USER"));
                String firstname = rs.getString("FIRST_NAME");
                String lastname = rs.getString("LAST_NAME");
                String emails = rs.getString("EMAIL");
                String passwords = rs.getString("PASSWORD");
                return new User(id,firstname,lastname,emails,passwords);//bỏ vào entity
            }
        }catch (Exception e){
        }
        return null;
    }
}
