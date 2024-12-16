<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="icon" type="image/x-icon" href="img/1.png">
    
    <style>
        :root {
            --primary: #E57373;  /* Màu đỏ trầm */
            --secondary: #FFB74D; /* Màu vàng nhẹ */
            --accent: #388E3C;    /* Màu xanh lá dịu */
            --bg-light: #ECEFF1;   /* Nền xám nhạt */
            --bg-dark: #B71C1C;    /* Nền đỏ trầm cho thanh bên và footer */
            --text-light: #FFFFFF; /* Màu chữ sáng */
            --text-dark: #333333;  /* Màu chữ tối */
            --text-muted: #FF0000; /* Màu chữ đỏ khi nền tối */
        }

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-image: url('img/slide1.jpg');
            background-size: cover;
            background-position: center;
        }

        .header, .sidebar, .footer {
            position: relative;
        }

        .header {
            color: var(--text-light);
            padding: 5px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 2.5em;
            color: #333;
        }

        .welcome p {
            margin: 0;
            color: #333;
            font-size: 1.2em;
        }

        .welcome a {
            text-decoration: none;
            font-weight: bold;
            color: #333;
        }

        .welcome a:hover {
            color: var(--accent);
            text-decoration: underline;
        }

        .main-content {
            display: flex;
            flex-grow: 1;
            overflow: hidden;
        }

        .sidebar {
		    width: 250px;
		    color: #fff;
		    padding: 20px;
		    height: 100%;
		    box-sizing: border-box;
		    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
		}
		
		.sidebar a {
		    display: block;
		    padding: 15px;
		    margin: 10px 0;
		    text-decoration: none;
		    background-color: #FF5722; /* Màu cam cho liên kết */
		    color: #FFFFFF; /* Màu chữ sáng */
		    border-radius: 5px;
		    font-size: 1.1em;
		    font-weight: bold;  /* Làm đậm chữ */
		    transition: background-color 0.3s, transform 0.3s;
		}
		
		.sidebar a:hover {
		    background-color: #FF9800; /* Màu cam sáng khi hover */
		    transform: translateX(10px); /* Di chuyển nhẹ khi hover */
		}


        .content-area {
            flex-grow: 1;
            padding: 0;
            box-sizing: border-box;
            overflow: hidden;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .footer {
            color: var(--text-light);
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }

        .footer p {
            margin: 0;
            font-size: 1em;
        }

    </style>
</head>
<body>

    <div class="header">
        <h1>Admin Dashboard</h1>
        <div class="welcome">
            <%
                String ten_dang_nhap = (String) session.getAttribute("username");
                if (ten_dang_nhap != null) {
            %>
                <p>Chào mừng, <a target="mainFrame" href="admin?action=view&ten_dang_nhap=<%= ten_dang_nhap %>"><%= ten_dang_nhap.substring(0, 1).toUpperCase() + ten_dang_nhap.substring(1) %></a>!</p>
            <% 
                } else {
            %>
                <p>Chào mừng, khách!</p>
            <% 
                }
            %>
        </div>
    </div>

    <div class="main-content">
        <div class="sidebar">
            <a href="dashboard.jsp" >Dashboard</a>
            <a href="admin?action=select_nguoi_dung" target="mainFrame">Quản lý người dùng</a>
            <a href="admin?action=select_ve" target="mainFrame">Quản lý vé</a>
            <a href="admin?action=select_tuyen_duong" target="mainFrame">Quản lý tuyến đường</a>
            <a href="admin?action=select_lich_trinh" target="mainFrame">Quản lý lịch trình</a>
            <a href="thong-ke" target="mainFrame">Thống kê</a>
            <a href="admin?action=view&ten_dang_nhap=<%= ten_dang_nhap %>" target="mainFrame">Trang Cá nhân</a>
            <a href="logout.jsp" target="_top">Đăng xuất</a>
        </div>
        <div class="content-area">
            <iframe name="mainFrame"></iframe>
        </div>
    </div>

    <div class="footer">
        <p>Admin Dashboard N_L_N</p>
    </div>

</body>
</html>
