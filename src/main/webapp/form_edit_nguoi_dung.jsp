<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.bean.nguoidung" %>
<%
    String ten_dang_nhap = (String) session.getAttribute("username");
    if (ten_dang_nhap == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Chỉnh sửa tài khoản</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color:  #d0f2e7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        label {
            font-weight: bold;
            color: #444;
            margin-bottom: 5px;
            display: inline-block;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
            border-color: #4CAF50;
            outline: none;
        }
        .form-group {
            grid-column: span 2;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            grid-column: span 2;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }
        a:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <%
        nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung");
    %>
    <div class="container">
        <h2>Thông tin tài khoản</h2>
        <form action="admin?action=update_nguoi_dung" method="post">
            <input type="hidden" id="ma_nguoi_dung" name="ma_nguoi_dung" value="<%=nguoidung.get_ma_nguoi_dung()%>">
            
            <div>
                <label for="ten_dang_nhap">Tên đăng nhập:</label>
                <input type="text" id="ten_dang_nhap" name="ten_dang_nhap" value="<%=nguoidung.get_ten_dang_nhap() %>" readonly>
            </div>
            
            <div>
                <label for="ho_ten">Họ và tên:</label>
                <input type="text" id="ho_ten" name="ho_ten" value="<%=nguoidung.get_ho_ten() %>" placeholder="Nhập họ và tên" required>
            </div>
            
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" onchange="validateEmail()"  value="<%= nguoidung.get_email() %>" placeholder="Nhập email" required>
            </div>
            
            <div>
                <label for="so_dien_thoai">Số điện thoại:</label>
                <input type="text" id="so_dien_thoai" name="so_dien_thoai" value="<%= nguoidung.get_so_dien_thoai() %>" placeholder="Nhập số điện thoại" required>
            </div>
            
            <input type="hidden" id="mat_khau" name="mat_khau" value="<%=nguoidung.get_mat_khau()%>">
            <input type="hidden" id="vai_tro" name="vai_tro" value="<%=nguoidung.get_vai_tro()%>">
            
            <div class="form-actions">
                <button type="submit">Cập nhật</button>
                <a href="javascript:window.history.back()">Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>
