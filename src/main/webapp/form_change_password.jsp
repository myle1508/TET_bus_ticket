<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Thay đổi mật khẩu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #d0f2e7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .input-group input[type="text"],
        .input-group input[type="password"],
        .input-group select {
            flex: 1;
            padding: 10px 20px;
            margin-right: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .input-group input[type="text"]:focus,
        .input-group input[type="password"]:focus,
        .input-group select:focus {
            outline: none;
            border-color: #4CAF50;
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        button,
        a {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover,
        a:hover {
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
        function checkpass() {
            var errorField = document.getElementById("id-error1");
            var passwordField = document.getElementById("newpassword");
            var passwordRepeatField = document.getElementById("newpassword_repeat");
            var submitButton = document.querySelector("button[type='submit']");

            if (passwordField.value !== passwordRepeatField.value) {
                errorField.textContent = "Mật khẩu nhập lại không khớp.";
                submitButton.disabled = true;
            } else {
                errorField.textContent = "";
                submitButton.disabled = false;
            }
        }

        function checkpasscu() {
            var ten_dang_nhap = document.getElementById("ten_dang_nhap").value;
            var mat_khau = document.getElementById("mat_khau").value;
            var errorField = document.getElementById("id-error");
            var submitButton = document.querySelector("button[type='submit']");

            var httpRequest = new XMLHttpRequest();
            httpRequest.open("GET", "admin?action=checkpass&ten_dang_nhap=" + encodeURIComponent(ten_dang_nhap) + "&mat_khau=" + encodeURIComponent(mat_khau), true);

            httpRequest.onload = function () {
                if (httpRequest.status === 200) {
                    var response = JSON.parse(httpRequest.responseText);

                    if (!response.exists) {
                        errorField.textContent = "Sai mật khẩu cũ.";
                        submitButton.disabled = true;
                    } else {
                        errorField.textContent = "";
                        submitButton.disabled = false;
                    }
                }
            };

            httpRequest.send();
        }
    </script>
</head>

<body>
    <div class="container">
        <h2>Thay đổi mật khẩu</h2>
        <% nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung"); %>
        <form action="admin?action=doi_mk" method="post">
            <div class="input-group">
                <label for="ten_dang_nhap">Tên đăng nhập:</label>
                <input type="text" id="ten_dang_nhap" name="ten_dang_nhap" value="<%= nguoidung.get_ten_dang_nhap() %>" readonly required>
            </div>
            <div class="input-group">
                <label for="mat_khau">Mật khẩu cũ:</label>
                <input type="password" id="mat_khau" name="mat_khau" onchange="checkpasscu()" required>
                <span id="id-error" style="color: red; font-size: 14px;"></span>
            </div>
            <div class="input-group">
                <label for="newpassword">Mật khẩu mới:</label>
                <input type="password" id="newpassword" name="newpassword" required>
            </div>
            <div class="input-group">
                <label for="newpassword_repeat">Nhập lại mật khẩu:</label>
                <input type="password" id="newpassword_repeat" name="newpassword_repeat" onchange="checkpass()" required>
                <span id="id-error1" style="color: red; font-size: 14px;"></span>
            </div>
            <div class="form-actions">
                <button type="submit" disabled>Cập nhật</button>
                <a href="javascript:window.history.back()">Quay lại</a>
            </div>
        </form>
    </div>
</body>

</html>
