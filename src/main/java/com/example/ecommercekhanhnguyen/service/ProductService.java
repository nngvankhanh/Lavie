package com.example.ecommercekhanhnguyen.service;

import com.example.ecommercekhanhnguyen.dao.CategoryDao;
import com.example.ecommercekhanhnguyen.dao.ProductDao;
import com.example.ecommercekhanhnguyen.entity.Category;
import com.example.ecommercekhanhnguyen.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ProductService {
    public void showProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.getAllProduct();
        request.setAttribute("products",products);
        request.getRequestDispatcher("\\WEB-INF\\managerProduct.jsp").forward(request,response);
    }
    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("select"));
        String description = request.getParameter("description");
        Product product = new Product(categoryId,name,image,price,description,quantity);
        ProductDao productDao = new ProductDao();
        productDao.insertProduct(product);
    }
    public void deleteProduct(HttpServletRequest request, HttpServletResponse response){
        String idProduct = request.getParameter("idProduct");
        ProductDao productDao = new ProductDao();
        productDao.deleteProduct(idProduct);
    }
    public void showPagingProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index = request.getParameter("index");
        if(index == null){
            index = "1";
        }
        CategoryDao listCategory = new CategoryDao();
        List<Category> listC = listCategory.getAllCategory();
        ProductDao productDao = new ProductDao();
        int count = productDao.getCountProduct();//46
        List<Product> listProduct = productDao.getPagingProduct(Integer.parseInt(index));
        int endPage = count/5;
        if(count % 5 != 0){
            endPage++;
        }
        request.setAttribute("listC",listC);
        request.setAttribute("products",listProduct);
        request.setAttribute("endPage",endPage);
        request.setAttribute("index",index);
        request.getRequestDispatcher("\\WEB-INF\\managerProduct.jsp").forward(request,response);
    }
    public void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idProduct = request.getParameter("idProduct");
        ProductDao productDao = new ProductDao();
        Product product = productDao.getProductById(Integer.parseInt(idProduct));
//        PrintWriter out = response.getWriter();
        CategoryDao listCategory = new CategoryDao();
        List<Category> listC = listCategory.getAllCategory();
        request.setAttribute("listC",listC);
        request.setAttribute("product",product);
        request.getRequestDispatcher("\\WEB-INF\\updateProduct.jsp").forward(request,response);
    }
    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Double price = Double.valueOf(request.getParameter("price"));
        int idCategory = Integer.parseInt(request.getParameter("select"));
        String description = request.getParameter("description");
        Product product = new Product(id,idCategory,name,image,price,description,quantity);
        ProductDao productDao = new ProductDao();
        productDao.updateProduct(product);
        response.sendRedirect("/pagingProduct");
    }
}
