<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--========================-->
<form action="/updateProduct?idProduct=${product.id}" method="post">
  <div class="container" style="width: 500px;padding-top: 100px">
    <div class=" border radius p-3">
      <div class="modal-header">
        <h3 class="modal-title">Cập nhật sản phẩm</h3>
      </div>
      <div class="modal-body">
        <!-- Name input -->
        <div class="form-outline mb-4">
          <input type="text" id="name" class="form-control" value="${product.name}" name="name" required/>
          <label class="form-label" for="name">Tên sản phẩm</label>
        </div>

        <!-- image input -->
        <div class="form-outline mb-4">
          <input type="url" id="image" class="form-control" value="${product.image}" name="image" required/>
          <label class="form-label" for="image">Đường dẫn hình ảnh</label>
        </div>

        <div class="row">
          <div class="col order-first">
            <!-- quantity input -->
            <div class="form-outline mb-4">
              <input type="number" min="0" id="quantity" class="form-control" value="${product.quantity}" name="quantity" required/>
              <label class="form-label" for="quantity">Số lượng</label>
            </div>
          </div>
          <div class="col">
            <!-- price input -->
            <div class="form-outline mb-4">
              <input type="number" min="0" id="price" class="form-control" value="${product.price}" name="price" required/>
              <label class="form-label" for="price">Giá bán</label>
            </div>
          </div>

          <div class="col order-last">
            <!-- Category input -->
            <select class="form-control" id="select" name="select">
              <option selected value="${product.idCategory}">${product.nameCategory}</option>
              <c:forEach items="${listC}" var="category">
                <option value="${category.id}">${category.name}</option>
              </c:forEach>
            </select>
          </div>

        </div>

        <div class="form-outline mb-4">
          <textarea class="form-control" id="description" rows="4" name="description" required>${product.description}</textarea>
          <label class="form-label" for="description">Mô tả sản phẩm</label>
        </div>

      </div>
      <div class="modal-footer me-5">
        <a href="/pagingProduct" class="btn btn-secondary me-4" >Thoát</a>
        <button type="submit" class="btn btn-primary">Lưu</button>
      </div>

    </div>
  </div>
</form>
<!--========================-->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
</body>
</html>
