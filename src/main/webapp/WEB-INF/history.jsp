<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
<div class="table-responsive">
    <table class="table table-dark">
        <tr>
            <th class="text-uppercase">STT</th>
            <th class="text-uppercase">Mã sản phẩm</th>
            <th class="text-uppercase">Tên sản phẩm</th>
            <th class="text-uppercase">Ngày đặt</th>
            <th class="text-uppercase">Số lượng</th>
            <th class="text-uppercase">Tổng tiền</th>
            <th class="text-uppercase">Tình trạng</th>
        </tr>
        <c:forEach items="${order}" var="h" varStatus="loop">
            <tr>
                <th scope="row">${loop.index + 1}</th>
                <td>${h.code}</td>
                <td>${h.name}</td>
                <td>${h.date}</td>
                <td>${h.quantity}</td>
                <c:set var="formattedsubPrice">
                    <fmt:formatNumber type="currency" value="${h.subPrice}" currencySymbol="₫" />
                </c:set>
                <!-- Hiển thị số tiền đã được định dạng -->
                <td>${formattedsubPrice}</td>
                <td>Đã giao hàng</td>
            </tr>
        </c:forEach>
    </table>
</div>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>
