<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/05/2023
  Time: 3:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lavie</title>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
            rel="stylesheet"
    />
</head>
<body>
<div class="container" style="width: 400px; padding-top: 200px">
    <form action="/register" method="post">
        <!-- 2 column grid layout with text inputs for the first and last names -->
        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <input type="text" id="form3Example1" class="form-control" name="fname" value="${rsF}"/>
                    <label class="form-label" for="form3Example1" >Tên</label>
                </div>
            </div>
            <div class="col">
                <div class="form-outline">
                    <input type="text" id="form3Example2" class="form-control" name="lname" value="${rsL}"/>
                    <label class="form-label" for="form3Example2">Họ</label>
                </div>
            </div>
        </div>

        <!-- Email input -->
        <div  style="color: red">${messE}</div>
        <div class="form-outline mb-4">
            <input type="email" id="form3Example3" class="form-control" name="email" value="${rsE}"/>
            <label class="form-label" for="form3Example3">Địa chỉ email</label>
        </div>

        <!-- Password input -->
        <div  style="color: red">${messP}</div>
        <div class="form-outline mb-4">
            <input type="password" id="form3Example4" class="form-control" name="password"/>
            <label class="form-label" for="form3Example4">Mật khẩu</label>
        </div>

        <!-- Confinm password input -->
        <div  style="color: red">${messCP}</div>
        <div class="form-outline mb-4">
            <input type="password" id="form3Example5" class="form-control" name="cpassword"/>
            <label class="form-label" for="form3Example4">Xác nhận lại mật khẩu</label>
        </div>

        <!-- Checkbox -->
       <%-- <div class="form-check d-flex justify-content-center mb-4">
            <input class="form-check-input" type="checkbox" value="" id="form2Example33" checked />
            <label class="form-check-label" for="form2Example33">
                Theo giỏi bản tin của chúng tôi
            </label>
        </div>--%>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Đăng Ký</button>

        <!-- Register buttons -->
        <div class="text-center">
            <p>Hoặc đăng nhập với:</p>
            <button type="button" class="btn btn-secondary btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-secondary btn-floating mx-1">
                <i class="fab fa-google"></i>
            </button>

            <button type="button" class="btn btn-secondary btn-floating mx-1">
                <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-secondary btn-floating mx-1">
                <i class="fab fa-github"></i>
            </button>
        </div>
    </form>
</div>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>