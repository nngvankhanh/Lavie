<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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

<section class="vh-100" style="background-color: #35558a;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100 text-center">
            <div class="col">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-light btn-lg" data-mdb-toggle="modal"
                        data-mdb-target="#exampleModal">
                    <i class="fas fa-info me-2"></i> Chi tiết thông tin
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header border-bottom-0">
                                <button type="button" class="btn-close" data-mdb-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-start text-black p-4">
                                <h5 class="modal-title text-uppercase "
                                    id="exampleModalLabel">${sessionScope.lastName} ${sessionScope.firstName}</h5>
                                <p class="text-muted mb-0">${dateTime}</p>
                                <p class="text-muted mb-0">Địa chỉ: ${address}</p>
                                <p class="text-muted mb-0">SĐT: ${phone}</p>
                                <p class="text-muted mb-0">Thông tin: ${detail}</p>
                                <h4 class="mb-5" style="color: #35558a;">Cảm ơn bạn đã đặt hàng</h4>
                                <p class="mb-0" style="color: #35558a;">Chi tiết hóa đơn</p>
                                <hr class="mt-2 mb-4"
                                    style="height: 0; background-color: transparent; opacity: .75; border-top: 2px dashed #9e9e9e;">

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold mb-0">Tổng quan đơn hàng(Số lượng:${countCart})</p>
                                    <c:set var="formattedsumPrice">
                                        <fmt:formatNumber type="currency" value="${sumPrice}" currencySymbol="₫" />
                                    </c:set>
                                    <!-- Hiển thị số tiền đã được định dạng -->
                                    <p class="text-muted mb-0">${formattedsumPrice}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="small mb-0">Phí giao hàng</p>
                                    <c:set var="formattedship">
                                        <fmt:formatNumber type="currency" value="20000.0" currencySymbol="₫" />
                                    </c:set>
                                    <!-- Hiển thị số tiền đã được định dạng -->
                                    <p class="small mb-0">${formattedship}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="fw-bold">Tổng cộng</p>
                                    <c:set var="formattedtotal">
                                        <fmt:formatNumber type="currency" value="${total}" currencySymbol="₫" />
                                    </c:set>
                                    <!-- Hiển thị số tiền đã được định dạng -->
                                    <p class="fw-bold" style="color: #35558a;">${formattedtotal}</p>
                                </div>

                            </div>
                            <div class="modal-footer d-flex justify-content-center border-top-0 py-4">
                                <a class="btn btn-primary btn-lg mb-1" style="background-color: #35558a;" href="/home">
                                    QUAY VỀ TRANG CHỦ
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<script>
</script>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>