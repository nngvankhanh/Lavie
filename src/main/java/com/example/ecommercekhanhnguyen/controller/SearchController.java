package com.example.ecommercekhanhnguyen.controller;

import com.example.ecommercekhanhnguyen.dao.CartDao;
import com.example.ecommercekhanhnguyen.dao.CategoryDao;
import com.example.ecommercekhanhnguyen.dao.ProductDao;
import com.example.ecommercekhanhnguyen.entity.Category;
import com.example.ecommercekhanhnguyen.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        String txtSearch = request.getParameter("txtsearch");
        CategoryDao listCategory = new CategoryDao();
        ProductDao listProduct = new ProductDao();
        CartDao cartDao = new CartDao();
        int countCart = 0;
        if(idUser != null){
            countCart = cartDao.getCountCart(idUser);
        }
        List<Category> listC = listCategory.getAllCategory();
        List<Product> listP = listProduct.getProductByName(txtSearch);
        request.setAttribute("listC",listC);
        request.setAttribute("listP",listP);
        request.setAttribute("txtsearch",txtSearch);
        request.setAttribute("countCart",countCart);
        request.getRequestDispatcher("\\WEB-INF\\shop.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
