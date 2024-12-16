<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.nguoidung" %>
   
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
    /* Body */
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f6f9;
    }
    .main-container {
        margin-top: 50px;
    }

    /* Thẻ viền */
    .info-card {
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        border: 1px solid #ddd; /* Viền khung mờ */
        transition: all 0.3s ease; /* Hiệu ứng khi hover */
    }
    
    .info-card:hover {
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* Hiệu ứng khi hover */
    }

    /* Định dạng tiêu đề */
    .info-header {
        font-size: 1.5rem;
        font-weight: bold;
        color: #007bff;
        margin-bottom: 15px;
        text-align: center;
    }

    /* Điều chỉnh padding và font */
    .info-section p {
        font-size: 1rem;
        margin-bottom: 10px;
    }

    /* Responsive nút bấm */
    .btn {
        border-radius: 25px;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    /* Định dạng khoảng cách giữa cột */
    .main-container .row > div {
        margin-bottom: 20px;
    }

    /* Tăng khoảng cách giữa các phần tử */
    .info-section {
        margin-bottom: 15px;
        padding: 10px;
        border-radius: 5px;
        background-color: #f8f9fa;
    }

    /* Tạo hiệu ứng hover cho nút */
    .action-btns .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Property</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="property-list.jsp" class="dropdown-item">Property List</a>
                            <a href="property-type.jsp" class="dropdown-item">Property Type</a>
                            <a href="property-agent.jsp" class="dropdown-item">Property Agent</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                            <a href="404.jsp" class="dropdown-item">404</a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Liên hệ</a>
                </div>
             <% 
                    String username = (String) session.getAttribute("username");
             nguoidung users = (nguoidung) request.getAttribute("user");
                   
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

<div class="container main-container">
    <div class="row">
        <!-- Cột bên trái -->
        <div class="col-lg-6 col-md-12 mb-4">
            <div class="info-card bg-white">
                <div class="info-header">Tổng tiền và phương thức thanh toán</div>

                <div class="info-section">
                    <p><i class="fas fa-dollar-sign text-success"></i> <strong><%= session.getAttribute("tongGiaTien") %></strong> </p>
                </div>

                <div class="info-section">
                       <%
                        String thanhToanValue = request.getParameter("thanh_toan");
                        if (thanhToanValue == null || thanhToanValue.isEmpty()) {
                            thanhToanValue = "QR";
                        }
                    %>

			               <div class="info-section">
			   <%
			    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    String currentTime = sdf.format(new java.util.Date());
			%>
			
			<form method="post" action="account?action=Booking">
			    <input type="hidden" name="lichtrinhId" value="<%= session.getAttribute("lichtrinhId") %>">
			    <input type="hidden" name="soVe" value="<%= session.getAttribute("sove") %>">
			    <input type="hidden" name="tong_tien" value="<%= session.getAttribute("tongGiaTien") %>">
			    <input type="hidden" id="thanh_toan_hidden" name="thanh_toan" value="<%= thanhToanValue %>">
			    <input type="hidden" name="ngay_dat_hang" value="<%= currentTime %>">
			
			    <select class="form-select mb-3" id="paymentSelect">
			        <option value="QR" <%= "QR".equals(thanhToanValue) ? "selected" : "" %>>Thanh toán tại nhà xe / Khi lên xe</option>
			        <option value="The" <%= "Thẻ".equals(thanhToanValue) ? "selected" : "" %>>Thẻ thanh toán quốc tế</option>
			        <option value="ShopeePay" <%= "ShopeePay".equals(thanhToanValue) ? "selected" : "" %>>QR chuyển khoản / Ví điện tử</option>
			        <option value="ZaloPay" <%= "ZaloPay".equals(thanhToanValue) ? "selected" : "" %>>Ví ZaloPay</option>
			    </select>
			
			    <div class="d-flex justify-content-center mt-3">
			        <button type="submit" class="btn btn-primary px-4 mx-2">Xác nhận</button>
			        <a href="cancel.jsp" class="btn btn-danger px-4 mx-2">Hủy bỏ</a>
			    </div>
			</form>

</div>


<script>
    // When the select dropdown changes, update the hidden input's value
    document.getElementById('paymentSelect').addEventListener('change', function() {
        document.getElementById('thanh_toan_hidden').value = this.value;
    });
</script>
            </div>
        </div>

        <!-- Cột bên phải -->
       
        
        
        
    </div>
     <div class="col-lg-6 col-md-12">
            <div class="info-card bg-white">
                <div class="info-header">Thông tin người đặt vé và vé xe</div>

                <div class="info-section">
                    <p><i class="fas fa-bus text-warning"></i> <strong>Ngày đi:</strong> <%= session.getAttribute("ngayDi") %></p>
                    <p><i class="fas fa-calendar-alt text-info"></i> <strong>Điểm đi:</strong> <%= session.getAttribute("diemDi") %></p>
                    <p><i class="fas fa-map-marker-alt text-danger"></i> <strong>Điểm đến:</strong> <%= session.getAttribute("diemDen") %></p>
                </div>

                <div class="info-section">
                    <p><i class="fas fa-chair text-success"></i> <strong>Số ghế:</strong> <%= session.getAttribute("sove") %></p>
                </div>

                <% 
                    nguoidung user = (nguoidung) session.getAttribute("user");
                    if (user != null) { 
                %>
                <div class="info-section">
                    <p><i class="fas fa-user text-primary"></i> <strong>Họ tên:</strong> <%= user.get_ho_ten() %></p>
                    <p><i class="fas fa-envelope text-warning"></i> <strong>Email:</strong> <%= user.get_email() %></p>
                    <p><i class="fas fa-phone text-success"></i> <strong>Số điện thoại:</strong> <%= user.get_so_dien_thoai() %></p>
                </div>
                <% } else { %>
                <div class="alert alert-danger text-center">
                    <i class="fas fa-exclamation-triangle"></i> Không tìm thấy thông tin người dùng!
                </div>
                <% } %>
            </div>
        </div>
</div>


    <!-- Footer Start -->
    <div class="footer">
        <p class="m-0">&copy; 2024 NLN. Tất cả các quyền được bảo lưu.</p>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Javascript Libraries -->
    <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html> 