<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Lịch Trình</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .header {
            background-color: #B71C1C;
            color: white;
            text-align: center;
            padding: 5px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }
        h2 {
            text-align: center;
            color: #B71C1C;
        }
        .container {
            display: flex;
            flex-direction: column;
            width: 60%;
            max-width: 600px;
            margin-top: 200px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }

        input[type="text"], input[type="number"], select, textarea, input[type="datetime-local"] {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        button {
            padding: 12px 20px;
            background-color: #B71C1C;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #FF5722;
        }

        .footer {
            position: absolute;
            bottom: -180px;
            width: 100%;
            text-align: center;
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
        <h1>Cập nhật Lịch Trình</h1>
    </div>
    <%
        lichtrinh lt = (lichtrinh) request.getAttribute("lichtrinh");
    	tuyenduong td = (tuyenduong) request.getAttribute("tuyenduong");
    	String tenTuyen = td.get_diem_xuat_phat() + " - " + td.get_diem_ket_thuc();
    %>
    <div class="container">
        <h2>Thông tin lịch trình</h2>
        <form action="admin?action=update_lich_trinh" method="post">
            <input type="hidden" id="ma_lich_trinh" name="ma_lich_trinh" value="<%= lt.get_ma_lich_trinh()%>" required>
        
            <label for="ma_tuyen_duong">Tuyến Đường:</label>
				<select id="ma_tuyen_duong" name="ma_tuyen_duong" required>	
			        <option value="<%= lt.get_ma_tuyen_duong() %>"><%= tenTuyen %></option>
			    </select>        
            <label for="thoi_gian_xuat_phat">Thời gian xuất phát:</label>
            <input type="datetime-local" id="thoi_gian_xuat_phat" name="thoi_gian_xuat_phat" value="<%= lt.get_thoi_gian_xuat_phat().toString()%>" required>
        
            <label for="danh_sach_ghe">Danh sách ghế:</label>
            <input type="text" id="danh_sach_ghe" name="danh_sach_ghe" value="<%= lt.get_danh_sach_ghe() %>" required>
        
            <label for="so_ghe_trong">Số ghế trống:</label>
            <input type="number" id="so_ghe_trong" name="so_ghe_trong" value="<%= lt.get_so_ghe_trong() %>" required min="1">
        
            <label for="trang_thai">Trạng thái: <input type="checkbox" id="trang_thai" name="trang_thai" <% if (lt.get_trang_thai()) { %>checked<% } %> > Đang hoạt động </label><br>
        
            <button type="submit" class="button">Cập nhật Lịch Trình</button>
        </form>

    </div>

    <div class="footer">
        <a href="javascript:history.back()">Quay lại trang trước</a>
    </div>

</body>
</html>
