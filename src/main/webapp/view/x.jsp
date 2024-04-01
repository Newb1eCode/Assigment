<%--
  Created by IntelliJ IDEA.
  User: nguyenvv
  Date: 12/03/2024
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
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
            <c:forEach items="${lstHd}" varStatus="i" var="x">
                <tr>
                    <td>${i.index}</td>
                    <td>${x.id}</td>
                    <td>${x.kh.tenKhanhHang}</td>
                    <td>${x.ngayTao}</td>
                    <td>${x.tongtien}</td>
                    <td>${x.trangThai}</td>
                    <td><a href="/hoa-don/detail?idHoaDon=${x.id}" class="btn btn-primary">Chon</a></td>
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
            <c:forEach items="${lstcthd}" varStatus="i" var="x">
                <tr>
                    <td>${i.index}</td>
                    <td>${x.id}</td>
                    <td>${x.chiTietSanPham.sanPham.tenSanPham}</td>
                    <td>${x.soLuong}</td>
                    <td>${x.giaBan}</td>
                    <td>${x.tongTien}</td>
                    <td><a href="#" class="btn btn-primary">Xoa</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <h2>Tạo hoá đơn</h2>
        <div class="row">
            <div>
                <div>
                    <label class="mb-3 col-3">Số điện thoại</label>
                    <input type="text" class="col-7" name="sdt">
                </div>
                <a href="/khang-hang/detail?sdt=${k.sdt}" class="btn btn-primary">Tạo hoá đơn</a>
            </div>
            <form action="/hoa-don/thanhtoan" method="post">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <input type="text" class="col-7" readonly value="${k.hoTen}" name="tenKh">
                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" readonly name="idHoaDon" value="${hDdetail.id}">
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly value="${tongtien}" name="tongtien">
                </div>
                <div>
                    <a href="/hoa-don/store" class="btn btn-primary">Tạo hoá đơn</a>
                    <button class="btn btn-primary" type="submit">Thanh toán</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div>
    <h2>Danh sách chi tiếtsản phẩm</h2>
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
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ctsp}" var="x" varStatus="i">
            <tr>
                <td>${i.index}</td>
                <td>${x.id}</td>
                <td>${x.sp.tenSanpham}</td>
                <td>${x.ms.tenMau}</td>
                <td>${x.sz.tenSize}</td>
                <td>${x.giaBan}</td>
                <td>${x.soLg}</td>
                <td>${x.trangThai}</td>
                <td>
                    <a href="/hoa-don/add?idCTSP=${x.id}"class="btn btn-primary">Chọn mua</a>
<%--                    <button class="btn btn-primary">Chọn mua</button>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
