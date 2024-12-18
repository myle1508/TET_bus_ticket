<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.bean.*" %>
<%


nguoidung user = (nguoidung) session.getAttribute("user");


%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>NLN_Chuyến xe ngày tết</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f6f9;
        }

        .main-container {
            margin-top: 50px;
        }

        .info-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .info-header {
            text-align: center;
            font-size: 1.8rem;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .info-section {
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            background: #f8f9fa;
            border-left: 4px solid #007bff;
        }

        .info-section p {
            margin: 0;
            font-size: 1rem;
        }

        .info-section i {
            margin-right: 10px;
            color: #007bff;
        }

        .action-btns {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .footer {
            margin-top: 50px;
            text-align: center;
            background-color: #343a40;
            color: white;
            padding: 10px 0;
        }
    </style>
</head>
<body>
     <%@ include file="navbarGuest.jsp" %>

    </div>
    <div class="container main-container">
        <div class="row justify-content-center">
            <!-- Cột bên trái: Thông tin người dùng -->
            <div class="col-md-6">
                <div class="info-card">
                    <div class="info-header">
                        Xác Nhận Thông Tin Người Dùng
                    </div>
                    <% if (user != null) { %>
                        <div class="info-section">
                            <p><i class="fas fa-user-circle"></i> <strong>Họ tên người đặt:</strong> <%= user.get_ho_ten() %></p>
                        </div>
                        <div class="info-section">
                            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> <%= user.get_email() %></p>
                        </div>
                        <div class="info-section">
                            <p><i class="fas fa-phone"></i> <strong>Số điện thoại:</strong> <%= user.get_so_dien_thoai() %></p>
                        </div>
                    <% } else { %>
                        <div class="alert alert-danger text-center">
                            <i class="fas fa-exclamation-triangle"></i> Không tìm thấy thông tin người dùng!
                        </div>
                    <% } %>
                </div>
            </div>

            <!-- Cột bên phải: Thông tin chuyến đi -->
            <div class="col-md-4">
                <!-- Tạm tính -->
                <div class="info-card mb-4">
                    <h5 class="info-header">Tạm tính</h5>
                    
                    <% 
                    ve ve = (ve) session.getAttribute("ve");
          
                    lichtrinh lichtrinh = (lichtrinh) session.getAttribute("lichTrinh");
                    tuyenduong tuyenduong = (tuyenduong) session.getAttribute("tuyenduong");
                    
                                   
                    %>
                    <p style="font-size: 1.5rem; font-weight: bold; text-align: center; color: #333;">
                 
                        <%= String.format("%,d",ve.get_tong_tien()) %>.000đ
                        
                    </p>
                </div>

                <div class="info-card">
                    <h5 class="info-header">Thông tin chuyến đi</h5>
                    <div>
                    
                        <p><strong>Ngày đi:</strong> <%=lichtrinh.get_ngay_xuat_phat() %></p>
                         <p><strong>Giờ đi:</strong> <%=lichtrinh.get_gio_xuat_phat() %></p>
                        <hr>
                        <p><strong>Điểm đi:</strong>  <%= tuyenduong.get_diem_xuat_phat() %></p>
                        <p><strong>Điểm đến:</strong> <%= tuyenduong.get_diem_ket_thuc() %></p>
                           <p><strong>Số ghế:</strong> <%=ve.get_so_ghe() %></p>
                           <p><strong>Vị trí ghế:</strong> <%=ve.get_vi_tri_ghe() %></p>
                    </div>
                </div>
            </div>
        </div>
      <div class="action-btns">
    <a href="index.jsp" class="btn btn-secondary btn-lg"><i class="fas fa-arrow-left"></i> Quay lại</a>
    <a href="thanhtoan.jsp" class="btn btn-success btn-lg"><i class="fas fa-check-circle"></i> Tiếp tục đặt vé </a>
</div>

    </div>

    <!-- Footer Start -->
    <div class="footer">
        &copy; 2024 N_L_N. All Rights Reserved.
    </div>
    <!-- Footer End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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

<!-- Bootstrap and FontAwesome Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>  