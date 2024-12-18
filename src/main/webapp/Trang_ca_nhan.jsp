<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.bean.*"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin người dùng</title>
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color:  #f2f2f2;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .header {
            background-color: #4caf50;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
        }
        .container {
            width: 90%;
            max-width: 850px;
            margin: 30px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 15px;
            border: 2px solid #4caf50; /* Thêm viền xanh lá */
   			box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2); /* Tăng bóng đổ */
            transition: all 0.3s ease;
        }
        .container:hover {
            background-color: #e8f5e9; /* Đổi màu nền khi hover */
    		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        .detail {
            margin-bottom: 25px;
            font-size: 18px;
            line-height: 1.6;
        }
        .detail label {
            font-weight: bold;
            color: #4caf50;
            margin-right: 12px;
        }
        .detail span {
            color: #555;
        }
        .edit-link-container {
            margin-top: 30px;
            display: flex;
            justify-content: space-evenly;
            gap: 20px;
        }
        .edit-link {
            padding: 12px 35px;
            text-decoration: none;
            background-color: #007bff; /* Xanh biển */
		    color: #fff;
            border-radius: 10px;
            transition: background-color 0.3s ease;
            font-size: 17px;
            display: inline-block;
            text-align: center;
            background: linear-gradient(45deg, #4caf50, #2196f3);
        }

		.edit-link:hover {
		    background-color: #0056b3; /* Xanh biển đậm khi hover */
		}
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 16px;
            color: #777;
        }
        .footer a {
            color: #ff0000;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #cc0000;
        }
    </style>
</head>
<body>
    <div class="header">
        Thông tin người dùng
    </div>
    <div class="container">
        <%
            nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung");
            if (nguoidung != null) {
        %>
            <div class="detail">
                <label>Tên đăng nhập:</label> <span><%= nguoidung.get_ten_dang_nhap()%></span>
            </div>
            <div class="detail">
                <label>Họ và tên:</label> <span><%= nguoidung.get_ho_ten()%></span>
            </div>
            <div class="detail">
                <label>Email:</label> <span><%= nguoidung.get_email()%></span>
            </div>
            <div class="detail">
                <label>Số điện thoại:</label> <span><%= nguoidung.get_so_dien_thoai()%></span>
            </div>
        <%
            } else {
        %>
            <p>Không tìm thấy thông tin người dùng.</p>
        <%
            }
        %>
    </div>
    <div class="edit-link-container">
        <a class="edit-link" href="admin?action=update_nguoi_dung&ten_dang_nhap=<%= nguoidung != null ? nguoidung.get_ten_dang_nhap() : "" %>">Chỉnh sửa thông tin</a>
        <a class="edit-link" href="admin?action=doi_mk&ten_dang_nhap=<%= nguoidung != null ? nguoidung.get_ten_dang_nhap() : "" %>">Đổi mật khẩu</a>
    </div>
    <div class="footer">
    <a href="javascript:history.back()">Quay lại trang trước</a>
</div>

</body>
</html>
