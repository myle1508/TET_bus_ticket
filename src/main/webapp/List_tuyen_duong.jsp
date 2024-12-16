<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách tuyến đường</title>
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
        <h1>Danh sách tuyến đường</h1>
    </div>

    <div class="container">
        <div style="text-align: right; margin-bottom: 20px;">
            <a href="admin?action=insert_tuyen_duong" class="add-button">Thêm tuyến đường</a>
        </div>

        <h2>Danh sách tuyến đường</h2>
        <%
            List<tuyenduong> tuyenDuongs = (List<tuyenduong>) request.getAttribute("List_tuyen_duong");
            if (tuyenDuongs != null && !tuyenDuongs.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã tuyến đường</th>
                    <th>Điểm xuất phát</th>
                    <th>Điểm kết thúc</th>
                    <th>Khoảng cách (km)</th>
                    <th>Giá vé (K VNĐ)</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% for (tuyenduong td : tuyenDuongs) { %>
                <tr>
                    <td><%= td.get_ma_tuyen_duong()%></td>              
                    <td><%= td.get_diem_xuat_phat()%></td>
                    <td><%= td.get_diem_ket_thuc()%></td>
                    <td><%= td.get_khoang_cach()%></td>
                    <td><%= td.get_gia_ve()%></td>
                    <td>
                        <a href="admin?action=update_tuyen_duong&ma_tuyen_duong=<%= td.get_ma_tuyen_duong() %>" class="button">Sửa</a>
                        <a href="admin?action=delete_tuyen_duong&ma_tuyen_duong=<%= td.get_ma_tuyen_duong() %>" class="button">Xóa</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Không có tuyến đường nào để hiển thị.</p>
        <% } %>
    </div>
</body>
</html>
