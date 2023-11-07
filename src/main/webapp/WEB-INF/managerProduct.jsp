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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container" style="width: 90%;padding-top: 60px">
    <!--    ========alerts=========-->
    <div class="row">
        <div class="col-md-4 display-6 fw-bold">Quản lý sản phẩm</div>
        <div class="col-md-4 offset-md-4">
            <button type="button" class="btn btn-primary float-end me-4"  data-mdb-toggle="modal" data-mdb-target="#exampleModal">Thêm sản phẩm</button>
        </div>
    </div>
    <!-- Modal -->
    <form id="myForm">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h3>
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Name input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="name" class="form-control" name="name" required/>
                            <label class="form-label" for="name">Tên sản phẩm</label>
                        </div>

                        <!-- image input -->
                        <div class="form-outline mb-4">
                            <input type="url" id="image" class="form-control" name="image" required/>
                            <label class="form-label" for="image">Đường dẫn hình ảnh</label>
                        </div>

                        <div class="row">
                            <div class="col order-first">
                                <!-- quantity input -->
                                <div class="form-outline mb-4">
                                    <input type="number" min="0" id="quantity" class="form-control" name="quantity" required/>
                                    <label class="form-label" for="quantity">Số lượng</label>
                                </div>
                            </div>
                            <div class="col">
                                <!-- price input -->
                                <div class="form-outline mb-4">
                                    <input type="number" min="0" id="price" class="form-control" name="price" required/>
                                    <label class="form-label" for="price">Giá bán</label>
                                </div>
                            </div>

                            <div class="col order-last">
                                <!-- Category input -->
                                <select class="form-control" id="select">
                                    <option disabled selected>Danh mục</option>
                                    <c:forEach items="${listC}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>

                        <div class="form-outline mb-4">
                            <textarea class="form-control" id="description" rows="4" name="description" required></textarea>
                            <label class="form-label" for="description">Mô tả sản phẩm</label>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Thoát</button>
                        <button type="submit" class="btn btn-primary" data-mdb-dismiss="modal">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
<%--    =======================--%>
    <div id="exampleModalnew"></div>
<%--    =======================--%>
    <!--    ==============-->
    <div style="background-color: #dcfffa">
        <table class="table text-lg fw-bold " style="vertical-align: middle">
            <thead>
            <tr>
                <th scope="col" style="width: 60px">Stt</th>
                <th scope="col" style="width: 200px">Hình ảnh</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Giá bán</th>
                <th scope="col" style="width: 240px">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <div id="content" class="row">
                <c:forEach items="${products}" var="product" >
                    <tr>
                        <th scope="row">${product.stt}</th>
                        <td>
                            <img
                                    src="${product.image}"
                                    class="img-fluid hover-shadow w-50 rounded"
                                    alt="Los Angeles Skyscrapers"
                            />
                        </td>
                        <td>${product.name}</td>
                        <td>${product.quantity}</td>
                        <c:set var="formattedprice">
                            <fmt:formatNumber type="currency" value="${product.price}" currencySymbol="₫" />
                        </c:set>
                        <!-- Hiển thị số tiền đã được định dạng -->
                        <td>${formattedprice}</td>
                        <td>
                            <a  type="button" class="btn btn-success" href="/updateProduct?idProduct=${product.id}" >Chỉnh sửa</a>
                            <button type="button" class="btn btn-danger" onclick="deleteProduct(${product.id})">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </div>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-4 display-6">
            <a class="btn btn-outline-primary" href="/home" data-mdb-ripple-color="dark"><i class="fas fa-angles-left me-2"></i>Quay về trang chủ</a>
        </div>
        <div class="col-md-4 offset-md-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">

                    <c:if test="${index > 1}">
                        <li class="page-item">
                            <a class="page-link" href="/pagingProduct?index=${index-1}">Previous</a>
                        </li>
                    </c:if>

                    <c:if test="${index <= endPage - 3 }">
                        <c:forEach  begin="${index}" end="${index + 2}" var="i">
                            <li class="page-item ${index == i ? "active" : ""}"><a class="page-link" href="/pagingProduct?index=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>

                    <c:if test="${index > endPage - 3}">
                        <c:forEach  begin="${endPage - 2}" end="${endPage}" var="i">
                            <li class="page-item ${index == i ? "active" : ""}"><a class="page-link" href="/pagingProduct?index=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>

                    <c:if test="${index < endPage}">
                        <li class="page-item">
                            <a class="page-link" href="/pagingProduct?index=${index+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!--========================-->
<script>

    $(document).ready(function() {
        $('#myForm').submit(function(event) {
            event.preventDefault(); // Ngăn chặn gửi form mặc định

            // Lấy giá trị từ các trường nhập trong form
            var name = $('#name').val();
            var image = $('#image').val();
            var quantity = $('#quantity').val();
            var price = $('#price').val();
            var select = $('#select').val();
            var description = $('#description').val();

            // Gửi yêu cầu AJAX
            $.ajax({
                url: '/product', // Đường dẫn đến script xử lý dữ liệu trên máy chủ
                method: 'POST',
                data: { name: name, image: image, quantity: quantity, price: price, select: select, description: description }, // Dữ liệu gửi đi
                success: function(response) {
                    // Xử lý kết quả trả về khi yêu cầu thành công
                    location.reload();
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi khi yêu cầu thất bại
                    console.error(error);
                }
            });
        });
    });
    function  deleteProduct(idProduct){
        // Gửi yêu cầu AJAX
        $.ajax({
            url: '/deleteProduct', // Đường dẫn đến script xử lý dữ liệu trên máy chủ
            method: 'POST',
            data: { idProduct: idProduct }, // Dữ liệu gửi đi
            success: function(response) {
                // Xử lý kết quả trả về khi yêu cầu thành công
                location.reload();
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi khi yêu cầu thất bại
                console.error(error);
            }
        });
    }
</script>
<!--========================-->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>
