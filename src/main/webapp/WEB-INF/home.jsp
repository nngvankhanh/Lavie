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
<%--                    <span class="badge rounded-pill badge-notification bg-danger">1</span>--%>
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
<!-- Jumbotron -->
<div
        class="bg-image text-center shadow-1-strong   text-white"
        style="background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/003.webp')"
>
    <h1 class="mb-1 h2">Jumbotron</h1>

    <p>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellendus praesentium
        labore accusamus sequi, voluptate debitis tenetur in deleniti possimus modi voluptatum
        neque maiores dolorem unde? Aut dolorum quod excepturi fugit.
    </p>
</div>
<!-- Jumbotron -->
<div class="row justify-content-center p-3">
    <div class="col-4">
        <!-- Carousel wrapper -->
        <div id="carouselBasicExample" class="carousel slide carousel-fade" data-mdb-ride="carousel" style="width: 510px">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button
                        type="button"
                        data-mdb-target="#carouselBasicExample"
                        data-mdb-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                ></button>
                <button
                        type="button"
                        data-mdb-target="#carouselBasicExample"
                        data-mdb-slide-to="1"
                        aria-label="Slide 2"
                ></button>
                <button
                        type="button"
                        data-mdb-target="#carouselBasicExample"
                        data-mdb-slide-to="2"
                        aria-label="Slide 3"
                ></button>
            </div>

            <!-- Inner -->
            <div class="carousel-inner">
                <!-- Single item -->
                <div class="carousel-item active">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(15).webp" class="d-block w-100" alt="Sunset Over the City"/>
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                    </div>
                </div>

                <!-- Single item -->
                <div class="carousel-item">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(22).webp" class="d-block w-100" alt="Canyon at Nigh"/>
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>

                <!-- Single item -->
                <div class="carousel-item">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(23).webp" class="d-block w-100" alt="Cliff Above a Stormy Sea"/>
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                    </div>
                </div>
            </div>
            <!-- Inner -->

            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- Carousel wrapper -->
    </div>
    <div class="col-4">
        <div class="mb-1 float-end"><img src="https://down-vn.img.susercontent.com/file/vn-50009109-1225d2cd655fd25a83f6f62f3c8451d9" style="width: 470px; height: 110px"></div>
        <div class="mb-1 float-end"><img src="https://down-vn.img.susercontent.com/file/vn-50009109-1225d2cd655fd25a83f6f62f3c8451d9" style="width: 470px; height: 110px"></div>
    </div>
</div>
<div>
    <section class="text-center mb-1 p-3">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
                <i class="fas fa-cubes fa-3x text-primary mb-4"></i>
                <h5 class="text-primary fw-bold mb-3">Chất lượng</h5>
                <h6 class="fw-normal mb-0">100%</h6>
                <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
            </div>

            <div class="col-lg-3 col-md-6 mb-5 mb-md-5 mb-lg-0 position-relative">
                <i class="fas fa-right-left fa-3x text-primary mb-4"></i>
                <h5 class="text-primary fw-bold mb-3">7 ngày</h5>
                <h6 class="fw-normal mb-0">Hoàn trả</h6>
                <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
            </div>

            <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                <i class="fas fa-car-side fa-3x text-primary mb-4"></i>
                <h5 class="text-primary fw-bold mb-3">Vận chuyển</h5>
                <h6 class="fw-normal mb-0">Miển phí giao hàng</h6>
                <div class="vr vr-blurry position-absolute my-0 h-100 d-none d-md-block top-0 end-0"></div>
            </div>

            <div class="col-lg-3 col-md-6 mb-5 mb-md-0 position-relative">
                <i class="fas fa-phone fa-3x text-primary mb-4"></i>
                <h5 class="text-primary fw-bold mb-3">24/7</h5>
                <h6 class="fw-normal mb-0">Hổ trợ</h6>
            </div>
        </div>
    </section>
</div>
<!--===============Tìm kiếm hàng đầu======================-->
<div class="container border p-2 " style="margin-bottom:20px ">
    <h4 class="">Tìm kiếm hàng đầu</h4>
    <div class="row row-cols-2 row-cols-lg-5 g-0 g-lg-3">
        <c:forEach var="p" items="${listFiveProduct}" >
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
                        <div style="color: red;text-align: right;padding-top: 10px;vertical-align: bottom" >${formattedAmount}</div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--================Sản phẩm nổi bật=====================-->
<div class="container border p-2 " style="margin-bottom:20px ">
    <h4 class="">Sản phẩm nổi bật</h4>
    <div class="row row-cols-2 row-cols-lg-5 g-0 g-lg-3">
        <c:forEach var="p" items="${listTenProduct}" >
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
<!--===========Gợi ý sản phẩm==============-->
<div class="container border p-2">
    <h4 class="">Gợi ý sản phẩm</h4>
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
<!--=====================================-->
<c:import url="footerpage.jsp"></c:import>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>