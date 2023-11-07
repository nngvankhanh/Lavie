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
    <form action="/login" method="post">
        <!-- Wrong user-->
        <div style="color: red">${mess}</div>
        <!-- Email input -->
        <div class="form-outline mb-4">
            <input type="email" id="form2Example1" class="form-control" name="email" value="${email}"/>
            <label class="form-label" for="form2Example1">Địa chỉ email</label>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-4">
            <input type="password" id="form2Example2" class="form-control" name="password"/>
            <label class="form-label" for="form2Example2">Mật khẩu</label>
        </div>

        <!-- 2 column grid layout for inline styling -->
        <%--<div class="row mb-4">
            <div class="col d-flex justify-content-center">
                <!-- Checkbox -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="form2Example34" checked />
                    <label class="form-check-label" for="form2Example34"> Nhớ lần đăng nhập sau </label>
                </div>
            </div>

            <div class="col">
                <!-- Simple link -->
                <a href="/register">Quên mật khẩu?</a>
            </div>
        </div>--%>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Đăng nhập</button>

        <!-- Register buttons -->
        <div class="text-center">
            <p>Không nhớ tài khoản? <a href="/register">Đăng ký</a></p>
            <p>Hoặc đăng nhâp với:</p>
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