package com.example.ecommercekhanhnguyen.controller;

import com.example.ecommercekhanhnguyen.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductController", value = {"/product","/deleteProduct","/pagingProduct","/updateProduct"})
public class ProductController extends HttpServlet {
    ProductService product = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch(action){
            case "/product":
            case "/pagingProduct":
                product.showPagingProduct(request,response);
                break;
            case "/updateProduct":
                product.showUpdateProduct(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch(action){
            case "/product":
                product.addProduct(request,response);
                break;
            case "/deleteProduct":
                product.deleteProduct(request,response);
                break;
            case "/updateProduct":
                product.updateProduct(request,response);
                break;
        }
    }
}
