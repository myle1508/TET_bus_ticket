<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
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
            background-color: #B71C1C;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-size: 1em;
            cursor: pointer;
        }

        .button:hover {
            background-color: #FF5722;
        }

        .add-button {
            padding: 10px 20px;
            background-color: #B71C1C;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #FF5722;
        }

        .status-active {
            color: green;
            font-weight: bold;
        }

        .status-inactive {
            color: red;
            font-weight: bold;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 16px;
            color: #777;
        }

        .footer a {
            color: #B71C1C;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #8C0000;
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
            List<tuyenduong> tuyenDuongList = (List<tuyenduong>) request.getAttribute("List_tuyen_duong");
            List<lichtrinh> lichTrinhs = (List<lichtrinh>) request.getAttribute("List_lich_trinh");
            if (lichTrinhs != null && !lichTrinhs.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã lịch trình</th>
                    <th>Tuyến đường</th>
                    <th>Thời gian xuất phát</th>
                    <th>Số ghế trống</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% 
				    for (lichtrinh lt : lichTrinhs) { 
				        tuyenduong matchedTuyen = null;
				        for (tuyenduong td : tuyenDuongList) {
				            if (td.get_ma_tuyen_duong() == lt.get_ma_tuyen_duong()) {
				                matchedTuyen = td;
				                break;
				            }
				        }
				        if (matchedTuyen != null) {
				%>
				<tr>
				    <td><%= lt.get_ma_lich_trinh() %></td>
				    <td><%= matchedTuyen.get_diem_xuat_phat() + " - " + matchedTuyen.get_diem_ket_thuc() %></td>
				    <td><%= lt.get_thoi_gian_xuat_phat() %></td>
				    <td><%= lt.get_so_ghe_trong() +" / " + lt.get_danh_sach_ghe().length() %></td>
				    <td class="<%= lt.get_trang_thai() ? "status-active" : "status-inactive" %>">
				        <%= lt.get_trang_thai() ? "Hoạt động" : "Dừng" %>
				    </td>
				    <td>
				        <a href="admin?action=update_lich_trinh&ma_lich_trinh=<%= lt.get_ma_lich_trinh() %>" class="button">Cập nhật</a>
				    </td>
				</tr>
				<% 
				        }
				    }
				%>

            </tbody>
        </table>
        <% } else { %>
        <p>Không có lịch trình nào để hiển thị.</p>
        <% } %>
    </div>
</body>
</html>
