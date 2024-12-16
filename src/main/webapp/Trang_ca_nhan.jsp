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
            background-color:  #d0f2e7;
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
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .container:hover {
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
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
            background-color: #ff7f50;
            color: white;
            border-radius: 10px;
            transition: background-color 0.3s ease;
            font-size: 17px;
            display: inline-block;
            text-align: center;
        }
        .edit-link:hover {
            background-color: #e07b3c;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 16px;
            color: #777;
        }
        .footer a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #388e3c;
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
