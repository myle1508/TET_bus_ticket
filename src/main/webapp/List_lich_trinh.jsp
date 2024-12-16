<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách lịch trình</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #B71C1C; /* Màu chủ đạo */
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
            background-color: #B71C1C; /* Màu chủ đạo */
            color: #fff;
        }

        td {
            background-color: #f9f9f9;
        }

        .button {
            padding: 10px 20px;
            background-color: #B71C1C; /* Màu chủ đạo */
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-size: 1em;
            cursor: pointer;
        }

        .button:hover {
            background-color: #FF5722; /* Màu sáng hơn khi hover */
        }

        .add-button {
            padding: 10px 20px;
            background-color: #B71C1C; /* Màu chủ đạo */
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #FF5722; /* Màu sáng hơn khi hover */
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 16px;
            color: #777;
        }

        .footer a {
            color: #B71C1C; /* Màu chủ đạo */
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #8C0000; /* Màu nhạt hơn khi hover */
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Danh sách lịch trình</h1>
    </div>

    <div class="container">
        <div style="text-align: right; margin-bottom: 20px;">
            <a href="admin?action=insert_lich_trinh" class="add-button">Thêm lịch trình</a>
        </div>

        <h2>Danh sách lịch trình</h2>
        <%
            List<lichtrinh> lichTrinhs = (List<lichtrinh>) request.getAttribute("List_lich_trinh");
            if (lichTrinhs != null && !lichTrinhs.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã lịch trình</th>
                    <th>Mã tuyến đường</th>
                    <th>Thời gian xuất phát</th>
                    <th>Danh sách ghế</th>
                    <th>Số ghế trống</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% for (lichtrinh lt : lichTrinhs) { %>
                <tr>
                    <td><%= lt.get_ma_lich_trinh() %></td>
                    <td><%= lt.get_ma_tuyen_duong() %></td>
                    <td><%= lt.get_thoi_gian_xuat_phat() %></td>
                    <td><%= lt.get_danh_sach_ghe() %></td>
                    <td><%= lt.get_so_ghe_trong() %></td>
                    <td><%= lt.get_trang_thai() ? "Hoạt động" : "Dừng" %></td>
                    <td>
                        <a href="admin?action=update_lich_trinh&ma_lich_trinh=<%= lt.get_ma_lich_trinh() %>" class="button">Sửa</a>
                        <a href="admin?action=delete_lich_trinh&ma_lich_trinh=<%= lt.get_ma_lich_trinh() %>" class="button">Xóa</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Không có lịch trình nào để hiển thị.</p>
        <% } %>
    </div>
</body>
</html>
