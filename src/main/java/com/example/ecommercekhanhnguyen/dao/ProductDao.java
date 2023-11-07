package com.example.ecommercekhanhnguyen.dao;

import com.example.ecommercekhanhnguyen.connection.JdbcConnection;
import com.example.ecommercekhanhnguyen.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    private static final String INSERT_PRODUCT = "INSERT INTO PRODUCT(ID_CATEGORY,NAME_PRODUCT,IMAGE_PRODUCT,PRICE_PRODUCT,DESCRIPTION_PRODUCT,QUANTITY) VALUES (?,?,?,?,?,?);";
    private static final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE ID_PRODUCT = ?;";
    private static final String UPDATE_PRODUCT = "UPDATE PRODUCT SET ID_CATEGORY = ? , NAME_PRODUCT = ? , IMAGE_PRODUCT = ? , PRICE_PRODUCT = ? , DESCRIPTION_PRODUCT = ? , QUANTITY = ? WHERE ID_PRODUCT = ?;";
    private static final String RANDOM_FIVE_PRODUCT = "SELECT * FROM PRODUCT ORDER BY RAND() LIMIT 5;";
    private static final String RANDOM_TEN_PRODUCT = "SELECT * FROM PRODUCT ORDER BY RAND() LIMIT 10;";
    private static final String RANDOM_TWENTY_PRODUCT = "SELECT * FROM PRODUCT ORDER BY RAND() LIMIT 20;";
    private static final String SECLECT_BY_ID_CATEGORY_PRODUCT = "SELECT * FROM PRODUCT WHERE ID_CATEGORY=?;";
    private static final String SECLECT_BY_ID_PRODUCT = "SELECT * FROM PRODUCT AS P LEFT JOIN CATEGORY AS C  ON P.ID_CATEGORY = C.ID_CATEGORY WHERE ID_PRODUCT = ?;";
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM PRODUCT";
    private static final String SELECT_COUNT_PRODUCT = "SELECT COUNT(*) FROM PRODUCT";
    private static final String SECLECT_BY_ID_CATEGORY_PRODUCT_PRICE_REDUCE = "SELECT * FROM PRODUCT WHERE ID_CATEGORY=? ORDER BY PRICE_PRODUCT DESC;";
    private static final String SECLECT_BY_ID_CATEGORY_PRODUCT_PRICE_INCREASE = "SELECT * FROM PRODUCT WHERE ID_CATEGORY=? ORDER BY PRICE_PRODUCT;";
    private static final String SECLECT_BY_NAME_PRODUCT = "SELECT * FROM PRODUCT WHERE NAME_PRODUCT LIKE ?";
    private static final String SECLECT_NUMBER_PRODUCT = "SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT ID_PRODUCT ) DESC) AS STT FROM PRODUCT LIMIT 5 OFFSET ?;";

    public List<Product> getAllProduct(){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_ALL_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getAllProductByIdCategory(int id){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_ID_CATEGORY_PRODUCT);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getAllProductByIdCategoryPriceReduce(String id){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_ID_CATEGORY_PRODUCT_PRICE_REDUCE);
            ps.setString(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getAllProductByIdCategoryPriceIncrease(String id){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_ID_CATEGORY_PRODUCT_PRICE_INCREASE);
            ps.setString(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getProductByName(String txtSearch){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_NAME_PRODUCT);
            ps.setString(1,"%"+txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public Product getProductById(int idProduct){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_BY_ID_PRODUCT);
            ps.setInt(1,idProduct);
            rs = ps.executeQuery();
            while (rs.next()){
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                String nameCategory = rs.getString(9);
                return new Product(idProduct,idCategory,name,image,price,description,quantity,nameCategory);
            }
        }catch (Exception e){
        }
        return null;
    }
    public Product insertProduct(Product product){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(INSERT_PRODUCT);
            ps.setInt(1, product.getIdCategory());
            ps.setString(2, product.getName());
            ps.setString(3,product.getImage());
            ps.setDouble(4,product.getPrice());
            ps.setString(5,product.getDescription());
            ps.setInt(6,product.getQuantity());
            ps.executeUpdate();
            conn.close();
            ps.close();
        }catch(Exception e){
        }
        return null;
    }
    public void deleteProduct(String idProduct){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(DELETE_PRODUCT);
            ps.setString(1,idProduct);
            ps.executeUpdate();
            conn.close();
            ps.close();
        }catch (Exception e){
        }
    }
    public List<Product> getPagingProduct(int index){
        try{
            List<Product> products = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SECLECT_NUMBER_PRODUCT);
            ps.setInt(1,( index - 1 ) * 5);
            rs = ps.executeQuery();
            while(rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                int stt = rs.getInt(8);
                products.add(new Product(idProduct,idCategory,name,image,price,description,quantity,stt));
            }
            conn.close();
            ps.close();
            rs.close();
            return products;
        }catch (Exception e){
        }
        return  null;
    }
    public int getCountProduct(){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(SELECT_COUNT_PRODUCT);;
            rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt(1);
            }
            conn.close();
            ps.close();
            rs.close();
            return count;
        }catch (Exception e){
        }
        return 0;
    }
    public void updateProduct(Product product){
        try{
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(UPDATE_PRODUCT);
            ps.setInt(1,product.getIdCategory());
            ps.setString(2,product.getName());
            ps.setString(3,product.getImage());
            ps.setDouble(4,product.getPrice());
            ps.setString(5,product.getDescription());
            ps.setInt(6,product.getQuantity());
            ps.setInt(7,product.getId());
            ps.executeUpdate();
            conn.close();
            ps.close();
        }catch (Exception e){
        }
    }
    public List<Product> getRandomFiveProduct(){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(RANDOM_FIVE_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getRandomTenProduct(){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(RANDOM_TEN_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
    public List<Product> getRandomTwentyProduct(){
        try{
            List<Product> listProduct = new ArrayList<>();
            conn = JdbcConnection.getConnection();
            ps = conn.prepareStatement(RANDOM_TWENTY_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt(1);
                int idCategory = rs.getInt(2);
                String name = rs.getString(3);
                String image = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                int quantity = rs.getInt(7);
                listProduct.add(new Product(idProduct,idCategory,name,image,price,description,quantity));
            }
            conn.close();
            ps.close();
            rs.close();
            return listProduct;
        }catch (Exception e){
        }
        return null;
    }
}
