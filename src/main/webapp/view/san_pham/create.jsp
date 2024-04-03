<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/27/2024
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/ban-hang">Bán Hàng</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="/ban-hang">Home</a>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Sản phẩm </a>

                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/sanpham/index">Sản phẩm</a></li>
                    <li><a class="dropdown-item" href="/mausac/index">Màu sắc</a></li>
                    <li><a class="dropdown-item" href="/size/index">Kích thước</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/danhmuc/index">Danh mục</a></li>
                </ul>
                </li>
                <a class="nav-link" href="/khachhang/index">Khách Hàng</a>
            </div>
        </div>
    </div>
</nav>
<form class="row g-3" action="/sanpham/store" method="post">
    <div class="col-md-6">
        <label for="id" class="form-label">Mã sản phẩm</label>
        <input type="text" class="form-control" id="id" name="ma">
    </div>
    <div class="col-md-6">
        <label for="name" class="form-label">Tên sản phẩm</label>
        <input type="text" class="form-control" id="name" name="ten">
    </div>
    <div class="col-md-6">
        <label for="sex" class="form-label">TRạng thái</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="sta" value="Active">
            <label class="form-check-label" for="sta">
                Active
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="sex" value="Inactive">
            <label class="form-check-label" for="sex">
                Inactive
            </label>
        </div>
        <div class="col-md-6">
            <label for="inputState" class="form-label">Danh mục</label>
            <select id="inputState" class="form-select" name="dm">
                <c:forEach items="${dm}" var="dm">
                    <option value="${dm.id}">${dm.tenDanhMuc}</option>
                </c:forEach>
            </select>
            <a href="/danhmuc/index">thêm danh mục</a>
        </div>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Them SP</button>
    </div>
</form>
</body>
</html>
