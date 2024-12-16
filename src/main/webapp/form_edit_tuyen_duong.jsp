<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Tuyến Đường</title>
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
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #B71C1C; /* Màu chủ đạo */
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .button {
            padding: 10px 20px;
            background-color: #B71C1C; /* Màu chủ đạo */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .button:hover {
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
        <h1>Cập nhật Tuyến Đường</h1>
    </div>
	<%
		tuyenduong td = (tuyenduong) request.getAttribute("tuyenduong");
	%>
    <div class="container">
        <h2>Thông tin tuyến đường</h2>
        <form action="admin?action=update_tuyen_duong" method="post">
        	<input type="hidden" id="ma_tuyen_duong" name="ma_tuyen_duong" value="<%= td.get_ma_tuyen_duong()%>" >
        	
            <label for="diem_xuat_phat">Điểm xuất phát:</label>
			<input type="text" id="diem_xuat_phat" name="diem_xuat_phat" value="<%= td.get_diem_xuat_phat()%>" required disabled>

            <label for="diem_ket_thuc">Điểm kết thúc:</label>
			<input type="text" id="diem_ket_thuc" name="diem_ket_thuc" value="<%= td.get_diem_ket_thuc() %>" required disabled>

            <label for="khoang_cach">Khoảng cách (km):</label>
            <input type="number" id="khoang_cach" name="khoang_cach" value="<%= td.get_khoang_cach()%>" required min="0">

            <label for="gia_ve">Giá vé (VND):</label>
            <input type="number" id="gia_ve" name="gia_ve" value="<%= td.get_gia_ve()%>" required min="0">
			<div id="id-error" style="color: red;"></div>
            <button type="submit" class="button">Cập nhật Tuyến Đường</button>
        </form>
        
    </div>

    <div class="footer">
        <a href="javascript:history.back()">Quay lại trang trước</a>
    </div>

</body>
</html>
