<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách vé đã đặt</title>
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
        <h1>Danh sách vé đã đặt</h1>
    </div>

    <div class="container">
        <h2>Danh sách vé</h2>
        <%
            List<ve> ves = (List<ve>) request.getAttribute("List_ve");
            if (ves != null && !ves.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã vé</th>
                    <th>Mã lịch trình</th>
                    <th>Mã người dùng</th>
                    <th>Số ghế</th>
                    <th>Trạng thái</th>
                    <th>Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <% for (ve ve : ves) { %>
                <tr>
                    <td><%= ve.get_ma_ve() %></td>
                    <td><%= ve.get_ma_lich_trinh() %></td>
                    <td><%= ve.get_ma_nguoi_dung() %></td>
                    <td><%= ve.get_so_ghe() %></td>
                    <td><%= ve.get_trang_thai()? "Hoạt động" : "Hết hạn" %></td>
                    <td>
                        <a href="admin?action=detail_ve&ma_ve=<%= ve.get_ma_ve() %>" class="button">xxx</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Không có vé nào để hiển thị.</p>
        <% } %>
    </div>
</body>
</html>
