package com.example.ecommercekhanhnguyen.controller;

import com.example.ecommercekhanhnguyen.service.UserService;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(urlPatterns = {"/login","/register","/logout"})
public class UserController extends HttpServlet {
    UserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action){
            case "/register":
                   userService.registerUser(request,response);
                break;
            case "/login":
                   userService.loginUser(request,response);
                break;
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String action = request.getServletPath();
        switch (action){
            case "/login":
                    request.getRequestDispatcher("\\WEB-INF\\login.jsp").forward(request,response);
                break;
            case "/register":
                    request.getRequestDispatcher("\\WEB-INF\\register.jsp").forward(request,response);
                break;
            case "/logout":
                userService.logoutUser(request,response);
                break;
        }
    }
}