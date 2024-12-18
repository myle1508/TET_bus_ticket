<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
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
            <select id="diem_xuat_phat" name="diem_xuat_phat" onchange="checkroute()" required>
                <option value="" style="color:#ccc;">Chọn điểm xuất phát</option>
                <option value="Ha Noi">Hà Nội</option>
				<option value="Ho Chi Minh City">Hồ Chí Minh</option>
				<option value="Da Nang">Đà Nẵng</option>
				<option value="Hai Phong">Hải Phòng</option>
				<option value="Can Tho">Cần Thơ</option>
				<option value="Bac Ninh">Bắc Ninh</option>
				<option value="Bac Giang">Bắc Giang</option>
				<option value="Binh Duong">Bình Dương</option>
				<option value="Binh Phuoc">Bình Phước</option>
				<option value="Binh Thuan">Bình Thuận</option>
				<option value="Ba Ria- Vung Tau">Bà Rịa - Vũng Tàu</option>
				<option value="Ca Mau">Cà Mau</option>
				<option value="Cao Bang">Cao Bằng</option>
				<option value="Dak Lak">Đắk Lắk</option>
				<option value="Dak Nong">Đắk Nông</option>
				<option value="Dong Nai">Đồng Nai</option>
				<option value="Dong Thap">Đồng Tháp</option>
				<option value="Gia Lai">Gia Lai</option>
				<option value="Hau Giang">Hậu Giang</option>
				<option value="Hoa Binh">Hòa Bình</option>
				<option value="Hung Yen">Hưng Yên</option>
				<option value="Khanh Hoa">Khánh Hòa</option>
				<option value="Kien Giang">Kiên Giang</option>
				<option value="Kon Tum">Kon Tum</option>
				<option value="Lang Son">Lạng Sơn</option>
				<option value="Lao Cai">Lào Cai</option>
				<option value="Lam Dong">Lâm Đồng</option>
				<option value="Long An">Long An</option>
				<option value="Nam Dinh">Nam Định</option>
				<option value="Ninh Binh">Ninh Bình</option>
				<option value="Ninh Thuan">Ninh Thuận</option>
				<option value="Phu Tho">Phú Thọ</option>
				<option value="Phu Yen">Phú Yên</option>
				<option value="Quang Binh">Quảng Bình</option>
				<option value="Quang Nam">Quảng Nam</option>
				<option value="Quang Ngai">Quảng Ngãi</option>
				<option value="Quang Ninh">Quảng Ninh</option>
				<option value="Quang Tri">Quảng Trị</option>
				<option value="Soc Trang">Sóc Trăng</option>
				<option value="Sơn La">Sơn La</option>
				<option value="Tay Ninh">Tây Ninh</option>
				<option value="Thai Binh">Thái Bình</option>
				<option value="Thai Nguyen">Thái Nguyên</option>
				<option value="Thanh Hoa">Thanh Hóa</option>
				<option value="Thua Thien - Hue">Thừa Thiên - Huế</option>
				<option value="Tien Giang">Tiền Giang</option>
				<option value="Tuyen Quang">Tuyên Quang</option>
				<option value="Vinh Phuc">Vĩnh Phúc</option>
				<option value="Yen Bai">Yên Bái</option>

            </select>

            <label for="diem_ket_thuc">Điểm kết thúc:</label>
            <select id="diem_ket_thuc" name="diem_ket_thuc" onchange="checkroute()" required>
                <option value="" style="color:#ccc;">Chọn điểm kết thúc</option>
                <option value="Ha Noi">Hà Nội</option>
				<option value="Ho Chi Minh City">Hồ Chí Minh</option>
				<option value="Da Nang">Đà Nẵng</option>
				<option value="Hai Phong">Hải Phòng</option>
				<option value="Can Tho">Cần Thơ</option>
				<option value="Bac Ninh">Bắc Ninh</option>
				<option value="Bac Giang">Bắc Giang</option>
				<option value="Binh Duong">Bình Dương</option>
				<option value="Binh Phuoc">Bình Phước</option>
				<option value="Binh Thuan">Bình Thuận</option>
				<option value="Ba Ria- Vung Tau">Bà Rịa - Vũng Tàu</option>
				<option value="Ca Mau">Cà Mau</option>
				<option value="Cao Bang">Cao Bằng</option>
				<option value="Dak Lak">Đắk Lắk</option>
				<option value="Dak Nong">Đắk Nông</option>
				<option value="Dong Nai">Đồng Nai</option>
				<option value="Dong Thap">Đồng Tháp</option>
				<option value="Gia Lai">Gia Lai</option>
				<option value="Hau Giang">Hậu Giang</option>
				<option value="Hoa Binh">Hòa Bình</option>
				<option value="Hung Yen">Hưng Yên</option>
				<option value="Khanh Hoa">Khánh Hòa</option>
				<option value="Kien Giang">Kiên Giang</option>
				<option value="Kon Tum">Kon Tum</option>
				<option value="Lang Son">Lạng Sơn</option>
				<option value="Lao Cai">Lào Cai</option>
				<option value="Lam Dong">Lâm Đồng</option>
				<option value="Long An">Long An</option>
				<option value="Nam Dinh">Nam Định</option>
				<option value="Ninh Binh">Ninh Bình</option>
				<option value="Ninh Thuan">Ninh Thuận</option>
				<option value="Phu Tho">Phú Thọ</option>
				<option value="Phu Yen">Phú Yên</option>
				<option value="Quang Binh">Quảng Bình</option>
				<option value="Quang Nam">Quảng Nam</option>
				<option value="Quang Ngai">Quảng Ngãi</option>
				<option value="Quang Ninh">Quảng Ninh</option>
				<option value="Quang Tri">Quảng Trị</option>
				<option value="Soc Trang">Sóc Trăng</option>
				<option value="Sơn La">Sơn La</option>
				<option value="Tay Ninh">Tây Ninh</option>
				<option value="Thai Binh">Thái Bình</option>
				<option value="Thai Nguyen">Thái Nguyên</option>
				<option value="Thanh Hoa">Thanh Hóa</option>
				<option value="Thua Thien - Hue">Thừa Thiên - Huế</option>
				<option value="Tien Giang">Tiền Giang</option>
				<option value="Tuyen Quang">Tuyên Quang</option>
				<option value="Vinh Phuc">Vĩnh Phúc</option>
				<option value="Yen Bai">Yên Bái</option>
				<!-- Các tỉnh khác -->

                
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