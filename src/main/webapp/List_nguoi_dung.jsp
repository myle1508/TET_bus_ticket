<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #B71C1C;
            color: #fff;
            text-align: center;
            padding: 5px;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #B71C1C;
            color: #fff;
        }

        td {
            background-color: #f9f9f9;
        }

        .button {
            padding: 10px 20px;
            background-color: #FF5722;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-size: 1em;
            cursor: pointer;
        }

        .button:hover {
            background-color: #FF9800;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Quản lý người dùng</h1>
    </div>

    <div class="container">
        <h2>Danh sách người dùng</h2>
        <table>
            <thead>
                <tr>
                    <th>Họ và tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Xem danh sách vé đã đặt</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Giả sử bạn đã có một danh sách người dùng từ cơ sở dữ liệu
                    List<nguoidung> users = (List<nguoidung>) request.getAttribute("List_nguoi_dung");

                    if (users != null) {
                        for (nguoidung user : users) {
                %>
                    <tr>
                        <td><%= user.get_ho_ten()%></td>
                        <td><%= user.get_email()%></td>
                        <td><%= user.get_so_dien_thoai()%></td>
                        <td>
                            <a href="admin?action=view_ve_user&ma_nguoi_dung=<%= user.get_ma_nguoi_dung() %>" class="button">xxx</a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
