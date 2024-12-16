<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Tuyến Đường</title>
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
    <script>
    function checkroute(){
        var diem_xuat_phat = document.getElementById("diem_xuat_phat").value;
        var diem_ket_thuc = document.getElementById("diem_ket_thuc").value;
        var errorField = document.getElementById("id-error");
        var submitButton = document.querySelector("button[type='submit']");
        var khoang_cach = document.getElementById("khoang_cach");
        var gia_ve = document.getElementById("gia_ve");
        var httpRequest = new XMLHttpRequest();
        httpRequest.open("GET", "admin?action=check_tuyen_duong&diem_xuat_phat=" + encodeURIComponent(diem_xuat_phat) + "&diem_ket_thuc=" + encodeURIComponent(diem_ket_thuc), true);

        httpRequest.onload = function () {
            if (httpRequest.status === 200) {
                var response = JSON.parse(httpRequest.responseText);

                if (response.exists) {
                    errorField.textContent = "Tuyến đường đã tồn tại.";
                    submitButton.disabled = true;
                    khoang_cach.disabled = true;
                    gia_ve.disabled = true;
                } else {
                    errorField.textContent = "";
                    submitButton.disabled = false;
                    khoang_cach.disabled = false;
                    gia_ve.disabled = false;
                }
            }
        };

        httpRequest.send();
    }
    </script>
</head>
<body>

    <div class="header">
        <h1>Thêm Tuyến Đường</h1>
    </div>

    <div class="container">
        <h2>Thông tin tuyến đường</h2>
        <form action="admin?action=insert_tuyen_duong" method="post">
        
            <label for="diem_xuat_phat">Điểm xuất phát:</label>
            <select id="diem_xuat_phat" name="diem_xuat_phat" required>
                <option value="" style="color:#ccc;">Chọn điểm xuất phát</option>
                <option value="Da Nang">Đà Nẵng</option>
				<option value="Quang Nam">Quảng Nam</option>
				<option value="Hue">Huế</option>
				<option value="Quang Tri">Quảng Trị</option>
				<option value="Quang Binh">Quảng Bình</option>
				<option value="Binh Dinh">Bình Định</option>
				<option value="Phu Yen">Phú Yên</option>
				<option value="Khanh Hoa">Khánh Hòa</option>
				<option value="Ninh Thuan">Ninh Thuận</option>
				<option value="Binh Thuan">Bình Thuận</option>
				<option value="Gia Lai">Gia Lai</option>
				<option value="Kon Tum">Kon Tum</option>
				<!-- Thêm các tỉnh khác nếu cần -->

            </select>

            <label for="diem_ket_thuc">Điểm kết thúc:</label>
            <select id="diem_ket_thuc" name="diem_ket_thuc" onchange="checkroute()" required>
                <option value="" style="color:#ccc;">Chọn điểm kết thúc</option>
                <option value="Da Nang">Đà Nẵng</option>
				<option value="Quang Nam">Quảng Nam</option>
				<option value="Hue">Huế</option>
				<option value="Quang Tri">Quảng Trị</option>
				<option value="Quang Binh">Quảng Bình</option>
				<option value="Binh Dinh">Bình Định</option>
				<option value="Phu Yen">Phú Yên</option>
				<option value="Khanh Hoa">Khánh Hòa</option>
				<option value="Ninh Thuan">Ninh Thuận</option>
				<option value="Binh Thuan">Bình Thuận</option>
				<option value="Gia Lai">Gia Lai</option>
				<option value="Kon Tum">Kon Tum</option>
				<!-- Thêm các tỉnh khác nếu cần -->
                
            </select>

            <label for="khoang_cach">Khoảng cách (km):</label>
            <input type="number" id="khoang_cach" name="khoang_cach" required min="0">

            <label for="gia_ve">Giá vé (VND):</label>
            <input type="number" id="gia_ve" name="gia_ve" required min="0">
			<div id="id-error" style="color: red;"></div>
            <button type="submit" class="button">Thêm Tuyến Đường</button>
        </form>
        
    </div>

    <div class="footer">
        <a href="javascript:history.back()">Quay lại trang trước</a>
    </div>

</body>
</html>
