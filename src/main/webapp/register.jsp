<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Đăng ký</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('img/slide1.jpg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); 
            z-index: -1; 
        }
        .container {
        	background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .input-group {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 20px;
        }
        .input-group label {
            flex: 0 0 150px;
            font-weight: bold;
            color: #333;
        }
        .input-group input[type="text"],.input-group input[type="password"],
        .input-group input[type="email"], .input-group select {
            flex: 1;
            padding: 10px 20px;
            margin-right: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .input-group input[type="text"]:focus,.input-group input[type="password"]:focus, .input-group input[type="email"]:focus,.input-group select:focus {
            outline: none;
            border-color: #4CAF50;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        button, a {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover, a:hover {
            background-color: #45a049;
        }
        a {
            background-color: #f44336;
        }
        a:hover {
            background-color: #d32f2f;
        }
    </style>
    <script>
    function checkID() {
        var ten_dang_nhap = document.getElementById("ten_dang_nhap").value;
        var errorField = document.getElementById("id-error");
        var fields = document.querySelectorAll("input:not([id='ten_dang_nhap'])");
        var submitButton = document.querySelector("button[type='submit']");

        var httpRequest = new XMLHttpRequest();
        httpRequest.open("GET", "admin?action=checkID&ten_dang_nhap=" + encodeURIComponent(ten_dang_nhap), true);

        httpRequest.onload = function () {
            if (httpRequest.status === 200) {
                var response = JSON.parse(httpRequest.responseText);

                if (response.exists) {
                    errorField.textContent = "Tên đăng nhập đã tồn tại! Vui lòng nhập mã khác.";
                    fields.forEach(field => field.disabled = true);
                    submitButton.disabled = true;
                } else {
                    errorField.textContent = "";
                    fields.forEach(field => field.disabled = false);
                    submitButton.disabled = false;
                }
            }
        };

        httpRequest.send();
    }

    function checkpass() {
        var errorField = document.getElementById("id-error1");
        var mat_khau = document.getElementById("mat_khau").value;
        var password = document.getElementById("password").value;

        if (mat_khau !== password) {
            errorField.textContent = "Mật khẩu không giống.";
        } else {
            errorField.textContent = "";
        }
    }

    function validateEmail() {
        var emailField = document.getElementById("email");
        var errorField = document.getElementById("email-error");
        var email = emailField.value;
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!emailRegex.test(email)) {
            errorField.textContent = "Email không hợp lệ.";
        } else {
            errorField.textContent = "";
        }
    }

    function validatePhoneNumber() {
        var phoneField = document.getElementById("so_dien_thoai");
        var errorField = document.getElementById("phone-error");
        var phone = phoneField.value;
        var phoneRegex = /^[0-9]{10,11}$/;

        if (!phoneRegex.test(phone)) {
            errorField.textContent = "Số điện thoại không hợp lệ.";
        } else {
            errorField.textContent = "";
        }
    }
    </script>
</head>
<body>
    <div class="container">
        <h2>Đăng ký</h2>

        <form action="admin?action=insert_nguoi_dung" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="input-group">
			    <label for="ten_dang_nhap">Tên đăng nhập:</label>
			    <input type="text" id="ten_dang_nhap" name="ten_dang_nhap" onchange="checkID()" required>
			    <span id="id-error" style="color: red; font-size: 14px; margin-left: -20px;"></span>
			</div>
			
			<div class="input-group">
			    <label for="mat_khau">Mật khẩu:</label>
			    <input type="password" id="mat_khau" name="mat_khau" disabled required>
			</div>
			<div class="input-group">
			    <label for="password">Xác nhận mật khẩu:</label>
			    <input type="password" id="password" name="password" onchange="checkpass()" disabled required>
			 	<span id="id-error1" style="color: red; font-size: 14px; margin-left: -20px;"></span>			    
			</div>
            
            <div class="input-group">
                <label for="ho_ten">Họ và tên:</label>
                <input type="text" id="ho_ten" name="ho_ten" disabled required>
            </div>
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" disabled onchange="validateEmail()" required>
                <span id="email-error" style="color: red; font-size: 14px; margin-left: -20px;"></span>
            </div>
            <div class="input-group">
                <label for="so_dien_thoai">Số điện thoại:</label>
                <input type="text" id="so_dien_thoai" name="so_dien_thoai" disabled onchange="validatePhoneNumber()" required>
                <span id="phone-error" style="color: red; font-size: 14px; margin-left: -20px;"></span>
                <input type="hidden" id="vai_tro" name="vai_tro" value="2">
            </div>
            <div class="form-actions">
                <button type="submit" disabled>Thêm</button>
                <a href="javascript:window.history.back()">Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>
