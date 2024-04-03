
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
<a class="btn btn-primary" href="/khachhang/create">Thêm khách hàng</a>
<h2>Danh sách Khách hàng</h2>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Họ Tên</th>
        <th scope="col">Địa Chỉ</th>
        <th scope="col">SDT</th>
        <th scope="col">Trạng Thái</th>
        <th scope="col">Ngay tao</th>
        <th scope="col">Ngay Sua</th>
        <th colspan="2">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${kh}" var="kh">
        <tr>
            <td>${kh.id}</td>
            <td>${kh.hoTen}</td>
            <td>${kh.diaChi}</td>
            <td>${kh.sdt}</td>
            <td>${kh.trangThai}</td>
            <td>${kh.ngayTao}</td>
            <td>${kh.ngaySua}</td>
            <td>
                <a class="btn btn-primary" href="/khachhang/edit?id=${kh.id}">Cập nhật</a>
            </td>
            <td>
                <a class="btn btn-danger" href="/khachhang/delete?id=${kh.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
