<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/27/2024
  Time: 12:27 PM
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
<form class="row g-3" action="/khachhang/store" method="post">
    <div class="col-md-6">
    <label for="name" class="form-label">Tên Khách hàng</label>
    <input type="text" class="form-control" id="name" name="ten">
    </div>
    <div class="col-md-6">
        <label for="id" class="form-label">Địa chỉ</label>
        <input type="text" class="form-control" id="id" name="diaChi">
    </div>

    <div class="col-md-6">
        <label for="name" class="form-label">SDT</label>
        <input type="text" class="form-control" id="sdt" name="sdt">
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
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Them SP</button>
    </div>
</form>
</body>
</html>
