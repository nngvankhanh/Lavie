<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<nav class="navbar navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand fs-4" href="/home">Lavie</a>
        <!-- Light -->
        <div class="btn-group shadow-0">
            <button type="button" class="btn btn-light dropdown-toggle" data-mdb-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bars"></i> Danh mục sản phẩm
            </button>
            <ul class="dropdown-menu">
                <c:forEach var="category" items="${listC}">
                    <li><a class="dropdown-item" href="/shop?id=${category.id}">${category.name}</a></li>
                    <li><hr class="dropdown-divider" /></li>
                </c:forEach>
            </ul>
        </div>
        <form class="d-flex input-group w-50" action="/search" method="get">
            <input
                    type="search"
                    class="form-control rounded"
                    placeholder="Tìm kiếm"
                    aria-label="Search"
                    aria-describedby="search-addon" name="txtsearch" value="${txtsearch}"
            />
            <span class="input-group-text border-0" id="search-addon">
                <button type="submit" class="form-control rounded"><i class="fas fa-search"></i></button>
      </span>
        </form>
        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <!-- Icon -->
            <a class="text-reset me-3" href="#">
                <i class="fas fa-shopping-cart"></i>
                <span class="badge rounded-pill badge-notification bg-danger">${countCart}</span>
            </a>

            <!-- Notifications -->
            <div class="dropdown">
                <a
                        class="text-reset me-3 dropdown-toggle hidden-arrow"
                        href="#"
                        id="navbarDropdownMenuLink"
                        role="button"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                >
                    <i class="fas fa-bell"></i>
<%--                    <span class="badge rounded-pill badge-notification bg-danger">1</span>--%>
                </a>
                <ul
                        class="dropdown-menu dropdown-menu-end"
                        aria-labelledby="navbarDropdownMenuLink"
                >
                    <li>
                        <a class="dropdown-item" href="#">Some news</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">Another news</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </li>
                </ul>
            </div>
            <!-- Avatar -->
            <div class="dropdown">
                <a
                        class="dropdown-toggle d-flex align-items-center hidden-arrow"
                        href="#"
                        id="navbarDropdownMenuAvatar"
                        role="button"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                >
                    <img
                            src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
                            class="rounded-circle"
                            height="25"
                            alt="Black and White Portrait of a Man"
                            loading="lazy"
                    />
                </a>
                <ul
                        class="dropdown-menu dropdown-menu-end"
                        aria-labelledby="navbarDropdownMenuAvatar"
                >
                    <c:if test="${sessionScope.email != null}">
                        <li>
                            <a class="dropdown-item" href="#">${sessionScope.lastName} ${sessionScope.firstName}</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/product">Gian hàng</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/logout">Đăng xuất</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.email == null}">
                        <li>
                            <a class="dropdown-item" href="/login">Đăng nhập</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/register">Đăng ký</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- Right elements -->
    </div>
</nav>
<!--==============Giỏ hàng===============-->
<section class="h-100" style="background-color: #eee;">
    <div class="container h-100 py-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="fw-normal mb-0 text-black">Giỏ hàng</h3>
                    <div>
                        <p class="mb-0"><span class="text-muted">Bộ lọc:</span> <a href="#!" class="text-body">Giá <i
                                class="fas fa-angle-down mt-1"></i></a></p>
                    </div>
                </div>

                <c:forEach items="${listCart}" var="product">
                    <div class="card rounded-3 mb-4">
                        <div class="card-body p-4">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-md-2 col-lg-2 col-xl-2">
                                    <img
                                            src="${product.image}"
                                            class="img-fluid rounded-3" alt="Cotton T-shirt">
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <p class="lead fw-normal mb-2"><a href="/detail?id=${product.id}" style="text-decoration: none">${product.name}</a></p>
                                    <p><span class="text-muted">Size: </span>M <span class="text-muted">Color: </span>Grey</p>
                                    <input id="price${product.id}" min="0" name="quantity" value="${product.price}" type="number"
                                           class="form-control form-control-sm" hidden="hidden"/>
                                    <c:set var="formattedAmount">
                                        <fmt:formatNumber type="currency" value="${product.price}" currencySymbol="₫" />
                                    </c:set>
                                    <!-- Hiển thị số tiền đã được định dạng -->
                                    <p><span class="text-muted">Giá: </span>${formattedAmount}</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex" >
                                    <button class="btn btn-link px-2" type="button"
                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown();myDown(${product.id},-1)">
                                        <i class="fas fa-minus"></i>
                                    </button>

                                    <input id="${product.id}" min="0" name="quantity" value="${product.quantity}" type="number" style="width: 60px;text-align: center"
                                           class="form-control form-control-sm" readonly/>

                                    <button class="btn btn-link px-2" type="button"
                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp();myUp(${product.id},+1)">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                    <c:set var="formattedsubPrice">
                                        <fmt:formatNumber type="currency" value="${product.subPrice}" currencySymbol="₫" />
                                    </c:set>
                                    <!-- Hiển thị số tiền đã được định dạng -->
                                    <h5 class="mb-0">${formattedsubPrice}</h5>
<%--                                    <h5 class="mb-0" class="total-price">=======</h5>--%>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="/deleteCart?id=${product.id}" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!--<div class="card mb-4">
                    <div class="card-body p-4 d-flex flex-row">
                        <div class="form-outline flex-fill">
                            <input type="text" id="form2" class="form-control form-control-lg" />
                            <label class="form-label" for="form1">Discound code</label>
                        </div>
                        <button type="button" class="btn btn-outline-warning btn-lg ms-3">Apply</button>
                    </div>
                </div>-->
                <form method="get" action="/checkout">
                    <div class="card">
                        <div class="card-body">
                            <button type="submit" class="btn btn-warning btn-block btn-lg">Thanh Toán</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
function myDown(idProduct){

    alert("idProduct "+idProduct);
    var xhttp = new XMLHttpRequest();

    var url = "/downQuantity";
    var data = "idProduct="+idProduct; // Chuỗi dữ liệu query

    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Xử lý kết quả từ phản hồi
            console.log(this.responseText);
        }
    };

    xhttp.open("GET", url + "?" + data, true);
    xhttp.send();
}
function myUp(idProduct){
    alert("idProduct "+idProduct);
    var xhttp = new XMLHttpRequest();

    var url = "/upQuantity";
    var data = "idProduct="+idProduct; // Chuỗi dữ liệu query

    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Xử lý kết quả từ phản hồi
            console.log(this.responseText);
        }
    };

    xhttp.open("GET", url + "?" + data, true);
    xhttp.send();

}
</script>--%>
<!-- Footer -->
<c:import url="footerpage.jsp"></c:import>
<!-- Footer -->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>