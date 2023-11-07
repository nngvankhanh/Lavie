package com.example.ecommercekhanhnguyen.controller;

import com.example.ecommercekhanhnguyen.service.HomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeController", value ={"/home","/index","","/shop","/sortProduct"
        ,"/detail","/addCart","/cart","/deleteCart","/checkout","/order","/dropCart"
        ,"/bill","/upQuantity","/downQuantity","/history"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        HomeService homeService = new HomeService();
        switch (action){
            case "":
            case "/home":
                homeService.showHome(request,response);
                break;
            case "/shop":
                homeService.showShop(request,response);
                break;
            case "/sortProduct":
                homeService.sortProduct(request,response);
                break;
            case "/detail":
                homeService.showDetailProduct(request,response);
                break;
            case "/addCart":
                homeService.addProductOnCart(request,response);
                break;
            case "/cart":
                homeService.showCart(request,response);
                break;
            case "/deleteCart":
                homeService.deleteProductCart(request,response);
                break;
            case "/checkout":
                homeService.showCheckout(request,response);
                break;
            case "/order":
                homeService.saveCart(request,response);
                homeService.showOrder(request,response);
                break;
            case "/bill":
                break;
            case "/history":
                homeService.showHistory(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getServletPath();
            switch (action){
            }
    }
}
