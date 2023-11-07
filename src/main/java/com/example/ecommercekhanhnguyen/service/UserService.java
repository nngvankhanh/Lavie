package com.example.ecommercekhanhnguyen.service;

import com.example.ecommercekhanhnguyen.dao.UserDao;
import com.example.ecommercekhanhnguyen.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;

public class UserService{

    public void registerUser(HttpServletRequest request, HttpServletResponse response){
        try{
            UserDao userDao = new UserDao();
            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            String email = request.getParameter("email");
            Pattern emailP = Pattern.compile("^(.+)@(.+)$");
            /*Mật khẩu phải chứa ít nhất một chữ số [0-9].
                    Mật khẩu phải chứa ít nhất một ký tự Latinh viết thường [az].
                    Mật khẩu phải chứa ít nhất một ký tự Latinh viết hoa [AZ].
                    Mật khẩu phải chứa ít nhất một ký tự đặc biệt như ! @ # & ( ).
                    Mật khẩu phải có độ dài ít nhất là 6 ký tự và tối đa là 8 ký tự.*/
            String password = request.getParameter("password");
            Pattern passP = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{6,16}$");
            String confirm_password = request.getParameter("cpassword");
            if(emailP.matcher(email).find() && passP.matcher(password).find() && password.equals(confirm_password)){
                User user = new User(firstName,lastName,email,password);
                userDao.insertUser(user);
                response.sendRedirect("/home");
            }else{
                request.setAttribute("messE",(emailP.matcher(email).find()) ? "":"nhập lại email");
                request.setAttribute("messP",(passP.matcher(password).find())?"":"nhập lại password");
                request.setAttribute("messCP",password.equals(confirm_password) ? "" : "password không chính xác");
                request.setAttribute("rsF",firstName);
                request.setAttribute("rsL",lastName);
                request.setAttribute("rsE",email);
                request.setAttribute("rsP",password);
                request.setAttribute("rsCP",confirm_password);
                request.getRequestDispatcher("\\WEB-INF\\register.jsp").forward(request,response);
            }

        }catch (Exception e){
        }
    }
    public void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session = request.getSession();
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           User user = UserDao.getInforUser(email,password);
           if(user == null){
               request.setAttribute("mess", "Nhập lại email hoặc password");
               request.setAttribute("email", email);
               request.getRequestDispatcher("\\WEB-INF\\login.jsp").forward(request, response);
           }else {
               if(password.equals(user.getPassword()) && email.equals(user.getEmail())){
                   String id = String.valueOf(user.getId());
                   String firstName = user.getFirstName();
                   String lastName = user.getLastName();
                   session.setAttribute("id",id);
                   session.setAttribute("email",email);
                   session.setAttribute("firstName",firstName);
                   session.setAttribute("lastName",lastName);
                   response.sendRedirect("/home");
               }else{
                   request.setAttribute("mess", "Nhập lại email hoặc password");
                   request.setAttribute("email", email);
                   request.getRequestDispatcher("\\WEB-INF\\login.jsp").forward(request, response);
               }
           }
    }
    public void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("id");
        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("email");
        response.sendRedirect("/home");
    }
}
