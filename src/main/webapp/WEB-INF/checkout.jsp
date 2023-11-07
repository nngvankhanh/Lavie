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
      <a class="text-reset me-3" href="/purchase">
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
          <span class="badge rounded-pill badge-notification bg-danger">1</span>
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
<!--==============phần thân ===============-->
<div style="padding-top: 60px"></div>
<div class="d-flex justify-content-center">
  <div class="p-2">
    <div style="width: 600px">
      <form action="/order" method="get">
        <!-- 2 column grid layout with text inputs for the first and last names -->
        <div class="row mb-4">
          <div class="col">
            <div class="form-outline">
              <input type="text" id="form6Example1" class="form-control" value="${sessionScope.firstName}" readonly/>
              <label class="form-label" for="form6Example1">Tên</label>
            </div>
          </div>
          <div class="col">
            <div class="form-outline">
              <input type="text" id="form6Example2" class="form-control" value="${sessionScope.lastName}" readonly/>
              <label class="form-label" for="form6Example2">Họ</label>
            </div>
          </div>
        </div>

        <!-- Text input -->
        <div class="form-outline mb-4">
          <input type="text" id="form6Example4" class="form-control" name="address" value="${address}" required/>
          <label class="form-label" for="form6Example4" >Địa chỉ</label>
        </div>

        <!-- Email input -->
        <div class="form-outline mb-4">
          <input type="email" id="form6Example5" class="form-control" value="${sessionScope.email}" readonly/>
          <label class="form-label" for="form6Example5">Tài khoản email</label>
        </div>
        <div class="mb-2" style="color: red">${result}</div>
        <!-- Number input -->
        <div class="form-outline mb-4">
          <input type="number" id="form6Example6" class="form-control" name="phone" value="${phone}" required/>
          <label class="form-label" for="form6Example6" >Số điện thoại</label>
        </div>

        <!-- Message input -->
        <div class="form-outline mb-4">
          <textarea class="form-control" id="form6Example7" rows="4" name="detail"></textarea>
          <label class="form-label" for="form6Example7" >Thêm thông tin chi tiết</label>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Đặt hàng</button>
      </form>
    </div>
  </div>
  <div class="p-2">
    <div class="card border shadow-0 mb-3" style="width: 500px">
      <div class="card-header bg-transparent h4">Tổng số đơn hàng</div>
      <c:forEach items="${listCart}" var="product">
      <div class="card-body d-flex justify-content-between">
        <div class="col-md-3 col-lg-3 col-xl-3">
          <h6 class="text-muted">${product.name}</h6>
        </div>
        <div>${product.quantity}</div>
        <c:set var="formattedsubPrice">
          <fmt:formatNumber type="currency" value="${product.subPrice}" currencySymbol="₫" />
        </c:set>
        <!-- Hiển thị số tiền đã được định dạng -->
        <div>${formattedsubPrice}</div>
      </div>
      </c:forEach>
      <div class="card-footer bg-transparent ">
        <div class="d-flex justify-content-between">
          <div>Tổng cộng</div>
          <c:set var="formattedsumPrice">
            <fmt:formatNumber type="currency" value="${sumPrice}" currencySymbol="₫" />
          </c:set>
          <!-- Hiển thị số tiền đã được định dạng -->
          <div>${formattedsumPrice}</div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted ">
  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
      <span>Get connected with us on social networks:</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-google"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-instagram"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-linkedin"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-github"></i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Company name
          </h6>
          <p>
            Here you can use rows and columns to organize your footer content. Lorem ipsum
            dolor sit amet, consectetur adipisicing elit.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
          <p>
            <a href="#!" class="text-reset">Angular</a>
          </p>
          <p>
            <a href="#!" class="text-reset">React</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Vue</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Laravel</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            info@example.com
          </p>
          <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
          <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>