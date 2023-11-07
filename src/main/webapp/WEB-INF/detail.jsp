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
<!--==============thanh search===============-->
<div class="container p-4">
  <div class="row g-0">
    <div class="col-sm-6 col-md-5">
      <img
              src="${product.image}"
              class="img-thumbnail"
              alt="Hollywood Sign on The Hill"
      />
      <section class="text-center p-4">
        <div class="row">
          <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
            <a href="#">
              <img
                      src="${product.image}"
                      class="img-thumbnail"
                      alt="Hollywood Sign on The Hill"
              />
            </a>
          </div>

          <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
            <a href="#">
              <img
                      src="${product.image}"
                      class="img-thumbnail"
                      alt="Hollywood Sign on The Hill"
              />
            </a>
          </div>

          <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
            <a href="#">
              <img
                      src="${product.image}"
                      class="img-thumbnail"
                      alt="Hollywood Sign on The Hill"
              />
            </a>
          </div>

          <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
            <a href="#">
              <img
                      src="${product.image}"
                      class="img-thumbnail"
                      alt="Hollywood Sign on The Hill"
              />
            </a>
          </div>
        </div>
      </section>
    </div>
    <div class="col-6 col-md-7">
      <div class="p-4">
        <h4>${product.name}</h4>
        <c:set var="formattedAmount">
          <fmt:formatNumber type="currency" value="${product.price}" currencySymbol="₫" />
        </c:set>
        <h5 style="color: red;padding-top: 20px">${formattedAmount}</h5>
      </div>
      <div class="p-3">
        <table>
          <tr>
            <td>Vận chuyển:</td>
            <td><i class="fa fa-truck p-2"></i>Miển phí vận chuyển</td>
          </tr>
          <tr>
            <td>Số lượng:</td>
            <td>
              <label>${product.quantity} sản phẩm có sẵn</label>
            </td>
          </tr>
          <%--<tr>
            <td>Màu sắc:</td>
            <td>
              <input class="form-check-input" type="radio" name="color" value="red">Đỏ
              <input class="form-check-input" type="radio" name="color" value="yellow">Vàng
              <input class="form-check-input" type="radio" name="color" value="green">Xanh lục
              <input class="form-check-input" type="radio" name="color" value="blue">Xanh lam
              <input class="form-check-input" type="radio" name="color" value="pink">Hồng
              <input class="form-check-input" type="radio" name="color" value="black">Đen
            </td>
          </tr>
          <tr>
            <td>Kích thước:</td>
            <td>
              <input class="form-check-input" type="radio" name="size" value="X">X
              <input class="form-check-input" type="radio" name="size" value="XL">XL
              <input class="form-check-input" type="radio" name="size" value="L">L
              <input class="form-check-input" type="radio" name="size" value="S">S
              <input class="form-check-input" type="radio" name="size" value="M">M
              <input class="form-check-input" type="radio" name="size" value="XXL">XXL
            </td>
          </tr>--%>
        </table>
      </div>
      <div class=" p-4">
        <a href="/addCart?id=${product.id}" class="btn btn-primary">Thêm vào giỏ hàng</a>
        <a href="/cart" class="btn btn-primary">Trang giỏ hàng</a>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
  <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
    <li class="nav-item" role="presentation">
      <button
              class="nav-link active"
              id="home-tab0"
              data-mdb-toggle="tab"
              data-mdb-target="#home0"
              type="button"
              role="tab"
              aria-controls="home"
              aria-selected="true"
      >
        Mô tả sản phẩm
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button
              class="nav-link"
              id="profile-tab0"
              data-mdb-toggle="tab"
              data-mdb-target="#profile0"
              type="button"
              role="tab"
              aria-controls="profile"
              aria-selected="false"
      >
        Chi tiết sản phẩm
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button
              class="nav-link"
              id="contact-tab0"
              data-mdb-toggle="tab"
              data-mdb-target="#contact0"
              type="button"
              role="tab"
              aria-controls="contact"
              aria-selected="false"
      >
        Đánh giá
      </button>
    </li>
  </ul>
  <div class="tab-content"  id="myTabContent0">
    <div
            class="tab-pane fade show active "
            id="home0"
            role="tabpanel"
            aria-labelledby="home-tab0"
    >
            <pre style="font-family: Arial;overflow-x: hidden" class="text-break">
                ${product.description}
            </pre>
    </div>
    <div class="tab-pane fade container" id="profile0" role="tabpanel" aria-labelledby="profile-tab0">
      <dl class="row">
        <dt class="col-sm-3">Description lists</dt>
        <dd class="col-sm-9">A description list is perfect for defining terms.</dd>
        <dt class="col-sm-3">Euismod</dt>
        <dd class="col-sm-9">
          <p>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</p>
          <p>Donec id elit non mi porta gravida at eget metus.</p>
        </dd>
        <dt class="col-sm-3">Malesuada porta</dt>
        <dd class="col-sm-9">Etiam porta sem malesuada magna mollis euismod.</dd>
        <dt class="col-sm-3 text-truncate">Truncated term is truncated</dt>
        <dd class="col-sm-9">
          Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
        </dd>
        <dt class="col-sm-3">Nesting</dt>
        <dd class="col-sm-9">
          <dl class="row">
            <dt class="col-sm-4">Nested definition list</dt>
            <dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.</dd>
          </dl>
        </dd>
      </dl>
    </div>
    <div class="tab-pane fade" id="contact0" role="tabpanel" aria-labelledby="contact-tab0">
      <div class="d-flex flex-row mb-3 container">
        <div class="p-2">
          <div>
            <div class="d-flex align-items-center">
              <img
                      src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                      alt=""
                      style="width: 45px; height: 45px"
                      class="rounded-circle"
              />
              <div class="ms-3">
                <p class="fw-bold mb-1">John Doe</p>
                <p class="text-muted mb-0">john.doe@gmail.com</p>
              </div>
            </div>
          </div>
          <p style="padding-left: 60px">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc </p>
        </div>
        <div class="p-2 container" style="width: 400px">
          <form>
            <!-- Name input -->
            <div class="form-outline mb-4">
              <input type="text" id="form4Example1" class="form-control" />
              <label class="form-label" for="form4Example1">Name</label>
            </div>

            <!-- Email input -->
            <div class="form-outline mb-4">
              <input type="email" id="form4Example2" class="form-control" />
              <label class="form-label" for="form4Example2">Email address</label>
            </div>

            <!-- Message input -->
            <div class="form-outline mb-4">
              <textarea class="form-control" id="form4Example3" rows="4"></textarea>
              <label class="form-label" for="form4Example3">Message</label>
            </div>

            <!-- Checkbox -->
            <div class="form-check d-flex justify-content-center mb-4">
              <input class="form-check-input me-2" type="checkbox" value="" id="form4Example4" checked />
              <label class="form-check-label" for="form4Example4">
                Send me a copy of this message
              </label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Send</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!--===========Gợi ý sản phẩm==============-->
<div class="container border p-2">
  <h4 class="">Gợi ý sản phẩm</h4>
  <div class="row row-cols-2 row-cols-lg-5 g-0 g-lg-3">
    <c:forEach var="p" items="${listTwentyProduct}">
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
<!--=====================================-->
<!--==============chân tranng===============-->
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