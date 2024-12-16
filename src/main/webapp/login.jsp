<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link rel="icon" type="image/x-icon" href="img/1.png">
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

        .login-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }
        .login-container h1 {
            margin: 0 0 20px 0;
            color: #333;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .login-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .login-container a.register {
            display: inline-block;
            margin-top: 15px;
            color: #4CAF50;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        .login-container a.register:hover {
            color: #2e7d32;
        }
        .login-container .error {
            color: red;
            margin-bottom: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Đăng Nhập</h1>
        <form action="CheckLoginServlet" method="post">
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="error"><%= errorMessage %></div>
            <% } %>
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <input type="submit" value="Đăng Nhập">
        </form>
        <a href="register.jsp" class="register">Đăng ký tài khoản mới</a>
    </div>
</body>
</html>
