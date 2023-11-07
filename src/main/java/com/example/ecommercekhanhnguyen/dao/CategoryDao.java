package com.example.ecommercekhanhnguyen.dao;

import com.example.ecommercekhanhnguyen.connection.JdbcConnection;
import com.example.ecommercekhanhnguyen.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    private static final String INSERT_CATEGORY = "INSERT INTO (ID_CATEGORY,NAME_CATEGORY) VALUES (?,?);";
    private static final String SECLECT_BY_ID_CATEGORY = "SELECT * FROM CATEGORY WHERE ID_CATEGORY=?";
    private static final String SELECT_ALL_CATEGORY = "SELECT * FROM CATEGORY";
    public List<Category> getAllCategory(){
        try{
            List<Category> categoryList = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_CATEGORY);
            rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                categoryList.add(new Category(id,name));
            }
            conn.close();
            ps.close();
            rs.close();
            return categoryList;
        }catch (Exception e){
        }
        return null;
    }
    public Category getCategoryById(String id){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_ID_CATEGORY);
            ps.setString(1,id);
            rs = ps.executeQuery();
            int idCategory = rs.getInt(1);
            String name = rs.getString(2);
            conn.close();
            ps.close();
            rs.close();
            return new Category(idCategory,name);
        }catch (Exception e){
        }
        return null;
    }
}
