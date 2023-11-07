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
      <a class="text-reset me-3" href="/cart">
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
<%--          <span class="badge rounded-pill badge-notification bg-danger">1</span>--%>
        </a>
        <ul
                class="dropdown-menu dropdown-menu-end"
                aria-labelledby="navbarDropdownMenuLink"
        >
          <li>
            <a class="dropdown-item" href="/history">Lịch sử đặt hàng</a>
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
<div style="padding-top: 30px"></div>
<!--===========sản phẩm tìm kiếm==============-->
<div class="row">
  <div class="col-md-2">
    <form action="/sortProduct" method="get">
      <div class="container">
        <i class="fa fa-filter"></i>Bộ lọc tìm kiếm
        <ul class="list-group list-group-light list-group-small">
          <%--<div style="padding-top: 20px">Màu sắc</div>
          <li class="list-group-item">
            <!-- màu sắc -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
              <label class="form-check-label" for="flexCheckDefault1">Đỏ</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2"/>
              <label class="form-check-label" for="flexCheckChecked2">Vàng</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3" />
              <label class="form-check-label" for="flexCheckDefault3">Xanh lam</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked4"/>
              <label class="form-check-label" for="flexCheckChecked4">Hồng</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault5" />
              <label class="form-check-label" for="flexCheckDefault5">Trắng</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked6"/>
              <label class="form-check-label" for="flexCheckChecked6">Đen</label>
            </div>
          </li>
          <li class="list-group-item">
            <div style="padding-top: 20px">Kích thước</div>
            <!-- màu sắc -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault7" />
              <label class="form-check-label" for="flexCheckDefault7">Nhỏ nhất</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked8"/>
              <label class="form-check-label" for="flexCheckChecked8">Nhỏ vừa</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault9" />
              <label class="form-check-label" for="flexCheckDefault9">Trung bình</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked10"/>
              <label class="form-check-label" for="flexCheckChecked10">Hơi lớn</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault11" />
              <label class="form-check-label" for="flexCheckDefault11">Lớn nhất</label>
            </div>
          </li>
          <li class="list-group-item">
            <div style="padding-top: 20px">Giá bán</div>
            <!-- giá bán -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault12" />
              <label class="form-check-label" for="flexCheckDefault12">0 - 10.000</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked13"/>
              <label class="form-check-label" for="flexCheckChecked13">10.000 - 100.000</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault14" />
              <label class="form-check-label" for="flexCheckDefault14">100.000 - 1.000.000</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked15"/>
              <label class="form-check-label" for="flexCheckChecked15">1.000.000 - 10.000.000</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault16" />
              <label class="form-check-label" for="flexCheckDefault16">10.000.000 - 100.000.000</label>
            </div>
          </li>--%>
          <li class="list-group-item">
            <div style="padding-top: 20px">Sắp xếp theo giá</div>
            <!-- Sắp xếp theo giá -->
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="${idC}" id="flexCheckDefault17" name="increase" />
              <label class="form-check-label" for="flexCheckDefault17">Giá tăng dần</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="${idC}" id="flexCheckChecked18" name="reduce" />
              <label class="form-check-label" for="flexCheckChecked18">Giá giảm dần</label>
            </div>
          </li>
        </ul>
      </div>
      <button type="submit" class="btn btn-primary float-end">Tìm kiếm</button>
    </form>
  </div>
  <div class="col-md-10">
    <div class="container p-2">
      <div class="row row-cols-2 row-cols-lg-5 g-0 g-lg-3">
        <c:forEach var="p" items="${listP}">
          <div class="col">
            <div class="p-3 border ">
              <a class="card-line bg-image hover-overlay ripple" data-mdb-ripple-color="light" href="/detail?id=${p.id}" style="color: #5e5e5e">
                <img
                        src="${p.image}"
                        class="img-fluid rounded"
                        alt="Townhouses and Skyscrapers"
                />
                <div>${p.name}</div>
                <c:set var="formattedAmount">
                  <fmt:formatNumber type="currency" value="${p.price}" currencySymbol="₫" />
                </c:set>
                <!-- Hiển thị số tiền đã được định dạng -->
                <div style="color: red;text-align: right;padding-top: 10px;vertical-align: bottom">${formattedAmount}</div>
              </a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
<!--=====================================-->
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