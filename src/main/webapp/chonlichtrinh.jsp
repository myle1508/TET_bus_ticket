<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.lichtrinh" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.nguoidung" %>
<%
    nguoidung user = (nguoidung) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Chọn Lịch Trình</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Navbar Start -->
        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center">
                    <div class="icon p-2 me-2">
                        <img class="img-fluid" src="img/1.png" alt="Icon" style="width: 30px; height: 30px;">
                    </div>
                    <h1 class="m-0 text-primary">N_L_N</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index.jsp" class="nav-item nav-link active">Trang chủ</a>
                        <a href="about.jsp" class="nav-item nav-link">Nhóm tôi</a>
                        <a href="contact.jsp" class="nav-item nav-link">Liên hệ</a>
                    </div>
                     <% 
                String username = (String) session.getAttribute("username");
            %>
            <nav>
                <% if (username != null) { %>
                    <!-- Nếu đã đăng nhập, hiển thị hình người dùng và menu thả xuống -->
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img src="img/user.png" alt="User" class="img-fluid" style="width: 30px; height: 30px; border-radius: 50%;">
                        </a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="thongtin_nguoidung.jsp" class="dropdown-item">Thông tin tài khoản</a>
                            <a href="thanhvien.jsp" class="dropdown-item">Thành viên Thường</a>
                            <a href="donhang.jsp" class="dropdown-item">Đơn hàng của tôi</a>
                            <a href="uudai.jsp" class="dropdown-item">Ưu đãi</a>
                            <a href="quanlythe.jsp" class="dropdown-item">Quản lý thẻ</a>
                            <a href="chuyendi.jsp" class="dropdown-item">Nhận xét chuyến đi</a>
                            <a href="logout.jsp" class="dropdown-item">Đăng xuất</a>
                        </div>
                    </div>
                <% } else { %>
                    <!-- Nếu chưa đăng nhập, hiển thị nút Đăng nhập -->
                    <a href="login.jsp" class="btn btn-primary px-3 d-none d-lg-flex">Đăng nhập</a>
                <% } %>
            </nav>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->

        <!-- Select Schedule Start -->
        <div class="container py-5">
            <h2 class="text-center mb-4">Chọn Lịch Trình</h2>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Danh sách lịch trình</h5>
                            <ul class="list-group">
                      


<%@ page import="model.bean.lichtrinh" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn Lịch Trình</title>
</head>
<body>
   <%
    session.setAttribute("ngayDi", "16:30, 31/12/2024");

   	session.setAttribute("lichtrinhId", "1");
    session.setAttribute("diemDi", "Hà Nội");
  
    session.setAttribute("diemDen", "Hải Phòng");
    session.setAttribute("giaTien", "240.000đ");
    session.setAttribute("sove", "3");
    
%>
<a href="confirmbooking.jsp" class="btn btn-success">Xác nhận thông tin</a>
    </ul>
</body>
</html>


                           
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Select Schedule End -->

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white py-4">
            <div class="text-center">
                <p class="mb-0">&copy; 2024 N_L_N. All Rights Reserved.</p>
            </div>
        </div>
        <!-- Footer End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>