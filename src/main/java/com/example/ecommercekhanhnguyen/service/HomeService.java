package com.example.ecommercekhanhnguyen.service;

import com.example.ecommercekhanhnguyen.dao.*;
import com.example.ecommercekhanhnguyen.dto.CartDto;
import com.example.ecommercekhanhnguyen.dto.HistoryDto;
import com.example.ecommercekhanhnguyen.dto.OrderDto;
import com.example.ecommercekhanhnguyen.entity.Category;
import com.example.ecommercekhanhnguyen.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

public class HomeService {
    CategoryDao listCategory = new CategoryDao();
    ProductDao listProduct = new ProductDao();
    List<Category> listC = null;
    List<Product> listP = null;

    public void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        CartDao cartDao = new CartDao();
        int countCart = 0;
        ProductDao productDao = new ProductDao();
        List<Product> listFiveProduct = productDao.getRandomFiveProduct();
        List<Product> listTenProduct = productDao.getRandomTenProduct();
        if(idUser != null){
            countCart = cartDao.getCountCart(idUser);
        }
        listC = listCategory.getAllCategory();
        listP = listProduct.getAllProduct();
        request.setAttribute("listC",listC);
        request.setAttribute("listP",listP);
        request.setAttribute("listFiveProduct",listFiveProduct);
        request.setAttribute("listTenProduct",listTenProduct);
        request.setAttribute("countCart",countCart);
        request.getRequestDispatcher("\\WEB-INF\\home.jsp").forward(request,response);
    }

    public void showShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        CartDao cartDao = new CartDao();
        int idCategory = Integer.parseInt(request.getParameter("id"));
        int countCart = 0;
        listC = listCategory.getAllCategory();
        listP = listProduct. getAllProductByIdCategory(idCategory);
        if(idUser != null){
            countCart = cartDao.getCountCart(idUser);
        }
        request.setAttribute("listC",listC);
        request.setAttribute("listP",listP);
        request.setAttribute("idC",idCategory);
        request.setAttribute("countCart",countCart);
        request.getRequestDispatcher("\\WEB-INF\\shop.jsp").forward(request,response);
    }

    public void sortProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        String idIncrease = request.getParameter("increase");
        String idReduce = request.getParameter("reduce");
        listC = listCategory.getAllCategory();
        request.setAttribute("listC",listC);
        int countCart = 0;
        CartDao cartDao = new CartDao();
        if(idIncrease != null){
            listP = listProduct.getAllProductByIdCategoryPriceIncrease(idIncrease);//tăng
            request.setAttribute("listP",listP);
            request.setAttribute("idC",idIncrease);
            if(idUser != null){
                countCart = cartDao.getCountCart(idUser);
            }
            request.setAttribute("countCart",countCart);
            request.getRequestDispatcher("\\WEB-INF\\shop.jsp").forward(request,response);
        }else if(idReduce != null){
            listP = listProduct.getAllProductByIdCategoryPriceReduce(idReduce);//giảm
            request.setAttribute("listP",listP);
            request.setAttribute("idC",idReduce);
            if(idUser != null){
                countCart = cartDao.getCountCart(idUser);
            }
            request.setAttribute("countCart",countCart);
            request.getRequestDispatcher("\\WEB-INF\\shop.jsp").forward(request,response);
        }else if(idIncrease == null && idReduce == null){
            response.sendRedirect("/home");
        }
    }
    public void showDetailProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        ProductDao productDao = new ProductDao();
        CategoryDao categoryDao = new CategoryDao();
        CartDao cartDao = new CartDao();
        int idProduct = Integer.parseInt(request.getParameter("id"));
        int countCart = 0;
        Product product = productDao.getProductById(idProduct);
        List<Category> listC = categoryDao.getAllCategory();
        List<Product> listP = productDao.getAllProduct();
        List<Product> listFiveProduct = productDao.getRandomFiveProduct();
        List<Product> listTwentyProduct = productDao.getRandomTwentyProduct();
        if(idUser != null){
            countCart = cartDao.getCountCart(idUser);
        }
        request.setAttribute("product",product);
        request.setAttribute("listC",listC);
        request.setAttribute("listP",listP);
        request.setAttribute("listFiveProduct",listFiveProduct);
        request.setAttribute("listTwentyProduct",listTwentyProduct);
        request.setAttribute("countCart",countCart);
        request.getRequestDispatcher("\\WEB-INF\\detail.jsp").forward(request,response);
    }
    public void addProductOnCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        int idProduct = Integer.parseInt(request.getParameter("id"));
        ProductDao productDao = new ProductDao();
        CategoryDao categoryDao = new CategoryDao();
        CartDao cartDao = new CartDao();
        List<Category> listC = categoryDao.getAllCategory();
        List<Product> listP = productDao.getAllProduct();
        Product product = productDao.getProductById(idProduct);
        if (idUser != null) {
            cartDao.insertProductOnCart(product,idUser);
            int countCart = cartDao.getCountCart(idUser);
            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);
            request.setAttribute("product", product);
            request.setAttribute("countCart", countCart);
            request.getRequestDispatcher("\\WEB-INF\\detail.jsp").forward(request, response);
        }else {
            response.sendRedirect("/login");
        }
    }
    public void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        if(idUser != null){
            CartDao cartDao = new CartDao();
            CategoryDao categoryDao = new CategoryDao();
            List<Category> listC = categoryDao.getAllCategory();
            List<CartDto> listCart = cartDao.getAllProductDistinctOnCartById(idUser);
            int countCart = cartDao.getCountCart(idUser);
            int sumPrice = cartDao.getSumTotalPrice(idUser);
            request.setAttribute("listC",listC);
            request.setAttribute("listCart",listCart);
            request.setAttribute("countCart",countCart);
            request.setAttribute("sumPrice",sumPrice);
            request.getRequestDispatcher("\\WEB-INF\\cart.jsp").forward(request,response);
        }else{
            response.sendRedirect("/login");
        }
    }
    public void deleteProductCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        int idProduct = Integer.parseInt(request.getParameter("id"));
        CartDao cartDao = new CartDao();
        CategoryDao categoryDao = new CategoryDao();
        cartDao.deleteProductSameCart(idProduct);
        List<CartDto> listCart = null;
        int countCart = 0;
        int sumPrice = 0;
        if(idUser != null){
            listCart = cartDao.getAllProductDistinctOnCartById(idUser);
            countCart = cartDao.getCountCart(idUser);
            sumPrice = cartDao.getSumTotalPrice(idUser);
        }
        List<Category> listC = categoryDao.getAllCategory();
        request.setAttribute("listC",listC);
        request.setAttribute("listCart",listCart);
        request.setAttribute("countCart",countCart);
        request.setAttribute("sumPrice",sumPrice);
        request.getRequestDispatcher("\\WEB-INF\\cart.jsp").forward(request,response);
    }
    public void showCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        CartDao cartDao = new CartDao();
        CategoryDao categoryDao = new CategoryDao();
        int countCart = 0;
        countCart = cartDao.getCountCart(idUser);
        if(idUser != null && countCart >0){
            List<CartDto> listCart = cartDao.getAllProductDistinctOnCartById(idUser);
            int sumPrice = cartDao.getSumTotalPrice(idUser);
            List<Category> listC = categoryDao.getAllCategory();
            request.setAttribute("listC",listC);
            request.setAttribute("listCart",listCart);
            request.setAttribute("countCart",countCart);
            request.setAttribute("sumPrice",sumPrice);
            request.getRequestDispatcher("\\WEB-INF\\checkout.jsp").forward(request,response);
        }else {
            response.sendRedirect("/home");
        }
    }
    public void showOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        CartDao cartDao = new CartDao();
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();//lấy thời gian hiện tại
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aaa");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Pattern phoneP = Pattern.compile("^(84|0[3|5|7|8|9])+([0-9]{8})\\b$");
        String detail = request.getParameter("detail");
        String dateTime = sdf.format(date);
        if(idUser != null){
            if(phoneP.matcher(phone).find()){
                int countCart = cartDao.getCountCart(idUser);
                int sumPrice = cartDao.getSumTotalPrice(idUser);
                int total = sumPrice + 20000;//cộng đi phí giao hàng
                request.setAttribute("countCart",countCart);
                request.setAttribute("sumPrice",sumPrice);
                request.setAttribute("total",total);
                request.setAttribute("dateTime",dateTime);
                request.setAttribute("address",address);
                request.setAttribute("phone",phone);
                request.setAttribute("detail",detail);
                cartDao.deleteAllCartById(idUser);
                request.getRequestDispatcher("\\WEB-INF\\order.jsp").forward(request,response);
            }else{
                int countCart = cartDao.getCountCart(idUser);
                int sumPrice = cartDao.getSumTotalPrice(idUser);
                int total = sumPrice - 20000;//trừ đi phí giao hàng
                request.setAttribute("countCart",countCart);
                request.setAttribute("sumPrice",sumPrice);
                request.setAttribute("total",total);
                request.setAttribute("address",address);
                request.setAttribute("phone",phone);
                request.setAttribute("result","Số điện thoại không chính xác");
                request.getRequestDispatcher("\\WEB-INF\\checkout.jsp").forward(request,response);
            }
        }
    }
    public void saveCart(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        OrderDao orderDao = new OrderDao();
        List<OrderDto> orderDtos = orderDao.getProductCart(idUser);
        orderDao.insertOrder(orderDtos);
    }
    public static String generateCode() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {//lấy 6 ký tự
            int index = random.nextInt(characters.length());
            char randomChar = characters.charAt(index);
            sb.append(randomChar);
        }
        return sb.toString();
    }
    public static String generateDate() {
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();//lấy thời gian hiện tại
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aaa");
        String dateTime = sdf.format(date);//ngày giờ
        return dateTime;
    }
    public void showHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        OrderDao orderDao = new OrderDao();
        if(idUser != null){
            List<HistoryDto> listOrder = orderDao.getAllOrder(idUser);
            request.setAttribute("order" , listOrder);
            request.getRequestDispatcher("\\WEB-INF\\history.jsp").forward(request,response);
        }else{
         response.sendRedirect("/login");
        }
    }

  /*  public void upQuantity(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        String idProduct = request.getParameter("idProduct");
        CartDao cartDao = new CartDao();
        Cart product = cartDao.getProductCartById(idProduct,idUser);
        cartDao.insertProductOnCarts(product,idUser);
    }
    public void downQuantity(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String idUser = (String) session.getAttribute("id");
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        CartDao cartDao = new CartDao();
        cartDao.deleteProductSameCart(idProduct);
    }*/

}
