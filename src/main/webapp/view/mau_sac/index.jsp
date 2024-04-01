
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
                <a class="nav-link" href="/sanpham/index">Sản phẩm</a>
                <a class="nav-link" href="/khachhang/index">Khách Hàng</a>
            </div>
        </div>
    </div>
</nav>
<a class="btn btn-primary" href="/mausac/create">Thêm mau</a>
<h2>Danh sách Màu sắc</h2>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã Màu</th>
        <th scope="col">Tên Màu</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay tao</th>
        <th scope="col">Ngay Sua</th>
        <th colspan="2">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ms}" var="m">
        <tr>
            <td>${m.id}</td>
            <td>${m.maMau}</td>
            <td>${m.tenMau}</td>
            <td>${m.trangThai}</td>
            <td>${m.ngayTao}</td>
            <td>${m.ngaySua}</td>
            <td>
                <a class="btn btn-primary" href="/mausac/edit?id=${m.id}">Cập nhật</a>
            </td>
            <td>
                <a class="btn btn-danger" href="/mausac/delete?id=${m.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
