<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/2/2024
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang thanh toán</title>
    <!-- Thêm các liên kết CSS và JS cần thiết -->
</head>
<body>

<!-- Phần nội dung trang -->

<!-- Mô-đun thông báo thanh toán thành công -->
<div id="paymentSuccessModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thanh toán thành công</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Cảm ơn bạn đã thanh toán thành công.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!-- Kết thúc mô-đun thông báo -->

<!-- Kết thúc phần nội dung trang -->

<!-- Thêm các liên kết JS cần thiết -->
</body>
</html>
