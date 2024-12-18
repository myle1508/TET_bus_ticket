<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.bean.*"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Chi tiết vé</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
        }

        .detail-group {
            margin-bottom: 15px;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #eee;
        }

        .detail-group label {
            font-weight: bold;
            color: #333;
            width: 30%;
        }

        .detail-group .value {
            color: #555;
            width: 65%;
            text-align: right;
        }

        .btn-back {
            display: inline-block;
            padding: 12px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            width: 100%;
            text-align: center;
        }

        .btn-back:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Chi tiết vé</h2>

        <% 
            ve ve = (ve) request.getAttribute("ve");
            nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung");
            lichtrinh lichtrinh = (lichtrinh) request.getAttribute("lichtrinh");
            tuyenduong tuyenduong = (tuyenduong) request.getAttribute("tuyenduong");
        %>

        <div class="section-title">Thông tin người dùng</div>

        <div class="detail-group">
            <label>Họ tên:</label>
            <div class="value"><%= nguoidung.get_ho_ten() %></div>
        </div>

        <div class="detail-group">
            <label>Email:</label>
            <div class="value"><%= nguoidung.get_email() %></div>
        </div>

        <div class="detail-group">
            <label>Số điện thoại:</label>
            <div class="value"><%= nguoidung.get_so_dien_thoai() %></div>
        </div>

        <div class="section-title">Thông tin lịch trình</div>

        <div class="detail-group">
            <label>Thời gian xuất phát:</label>
            <div class="value"><%= lichtrinh.get_thoi_gian_xuat_phat() %></div>
        </div>

        <div class="detail-group">
            <label>Trạng thái:</label>
            <div class="value"><%= lichtrinh.get_trang_thai() ? "Hoạt động" : "Hết hạn" %></div>
        </div>

        <div class="section-title">Thông tin tuyến đường</div>

        <div class="detail-group">
            <label>Điểm xuất phát:</label>
            <div class="value"><%= tuyenduong.get_diem_xuat_phat() %></div>
        </div>

        <div class="detail-group">
            <label>Điểm kết thúc:</label>
            <div class="value"><%= tuyenduong.get_diem_ket_thuc() %></div>
        </div>

        <div class="detail-group">
            <label>Khoảng cách:</label>
            <div class="value"><%= tuyenduong.get_khoang_cach() %> km</div>
        </div>

        <div class="detail-group">
            <label>Giá vé:</label>
            <div class="value"><%= tuyenduong.get_gia_ve() %>.000 VND</div>
        </div>

        <a href="javascript:window.history.back()" class="btn-back">Quay lại</a>
    </div>
</body>
</html>
