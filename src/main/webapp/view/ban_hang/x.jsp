<%--
  Created by IntelliJ IDEA.
  User: nguyenvv
  Date: 12/03/2024
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

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
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten khach hang</td>
                <td>Ngay tao</td>
                <td>Tong tien</td>
                <td>Trang Thai</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${listHD}" var="hd" varStatus="i">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${hd.id}</td>
                        <td>${hd.kh.hoTen}</td>
                        <td>${hd.ngayTao}</td>
                        <td>0</td>
                        <td>${hd.trangThai}</td>
                        <td><a href="/hoa-don/detail?idHD=${hd.id}" class="btn btn-primary">Chọn</a></td>
                        <td><a href="/hoa-don/delete?idHD=${hd.id}" class="btn btn-danger">Xóa</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h2>Danh sách hoá đơn chi tiết</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten san pham</td>
                <td>So luong</td>
                <td>Gia ban</td>
                <td>Tong tien</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lstHdCt}" var="hdct" varStatus="i">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${hdct.id}</td>
                    <td>${hdct.ctsp.sp.tenSanpham}</td>
                    <td>${hdct.soLuongmua}</td>
                    <td>${hdct.giaBan}</td>
                    <td>${hdct.tongTien}</td>
<%--                    <td>--%>
<%--                        <a href="/hoa-don-chi-tiet/delete?idHdCT=${hdct.id}">Xóa</a>--%>
<%--                    </td>--%>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <div>
            <button class="btn btn-primary" onclick="handlePaymentSuccess()">Reset</button>
        </div>
        <form action="/tao-hoa-don" method="post">
        <h2>Tạo hoá đơn</h2>
        <div class="row">
            <form action="/hoa-don/timkiem" method="post">
                    <div>
                        <label class="mb-3 col-3">Số điện thoại</label>
                        <input type="text" class="col-7" name="sdt" value="${hdDetail.kh.sdt}">
                    </div>


            </form>
            <div class="mb-3">
                <label class="col-3">Ten Khach hang</label>
                <input type="text" class="col-7" readonly value="${hdDetail.kh.hoTen}" name="khachhang">
            </div>
            <div class="mb-3">
                <label class="col-3">ID Hoa don</label>
                <input type="text" class="col-7" readonly value="${hdDetail.id}" name="idHd">
            </div>
            <div class="mb-3">
                <label class="col-3">Tong tien</label>
                <input type="text" class="col-7" name="tongTien" readonly  value="${tongTien}">
            </div>
            <div>
                <button type="submit" class="btn btn-primary">Tạo hoá đơn</button>
                <button type="submit" class="btn btn-primary" >Thanh toán</button>
            </div>
        </div>
        </form>
    </div>
</div>
<div>
    <h2>Danh sách chi tiết sản phẩm</h2>
    <a href="/ctsp/index">more</a>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang thai</td>
            <td>Ngay tao</td>
            <td>Ngay sua</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listCTSP}" var="l" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${l.id}</td>
                <td>${l.sp.tenSanpham}</td>
                <td>${l.ms.tenMau}</td>
                <td>${l.sz.tenSize}</td>
                <td>${l.giaBan}</td>
                <td>${l.soLg}</td>
                <td>${l.trangThai}</td>
                <td>${l.ngayTao}</td>
                <td>${l.ngaySua}</td>
                <td>
                <a href="/hoa-don-chi-tiet/add?idCTSP=${l.id}" class="btn btn-info">Chon mua</a>
<%--                    &idHD=${hoaDon.id}--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
<script>
    function handlePaymentSuccess() {
        // Xóa dữ liệu khỏi input
        document.getElementsByName("sdt")[0].value = "";
        document.getElementsByName("khachhang")[0].value = "";
        document.getElementsByName("idHd")[0].value = "";
        document.getElementsByName("tongTien")[0].value = "0.0";
    }
</script>