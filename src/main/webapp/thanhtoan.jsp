<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.*" %>
   
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
    <%@ include file="navbarGuest.jsp" %>

             <% 
                
               ve ve = (ve) session.getAttribute("ve");
             
             lichtrinh lichtrinh = (lichtrinh) session.getAttribute("lichTrinh");
             tuyenduong tuyenduong = (tuyenduong) session.getAttribute("tuyenduong");
             
                   
                %>
               
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
                  <p>
    <i class=""></i> 
    <strong><%= String.format("%,d", ve.get_tong_tien()) %>.000 VNĐ</strong>
</p>

                   
                    
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
			    <input type="hidden" name="lichtrinhId" value="<%= lichtrinh.get_ma_lich_trinh() %>">
			    <input type="hidden" name="soVe" value="<%= ve.get_so_ghe() %>">
			    <input type="hidden" name="tong_tien" value="<%= ve.get_tong_tien()%>">
			    <input type="hidden" id="thanh_toan_hidden" name="thanh_toan_hidden" value="<%= thanhToanValue %>">
			    <input type="hidden" name="ngay_dat_hang" value="<%= currentTime %>">
			
			    <select class="form-select mb-3" id="paymentSelect">
			        <option value="QR" <%= "QR".equals(thanhToanValue) ? "selected" : "" %>>Thanh toán tại nhà xe / Khi lên xe</option>
			        <option value="The" <%= "Thẻ".equals(thanhToanValue) ? "selected" : "" %>>Thẻ thanh toán quốc tế</option>
			        <option value="ShopeePay" <%= "ShopeePay".equals(thanhToanValue) ? "selected" : "" %>>QR chuyển khoản / Ví điện tử</option>
			        <option value="ZaloPay" <%= "ZaloPay".equals(thanhToanValue) ? "selected" : "" %>>Ví ZaloPay</option>
			    </select>
			
			    <div class="d-flex justify-content-center mt-3">
			        <button type="submit" class="btn btn-primary px-4 mx-2">Xác nhận</button>
			        <a href="index.jsp" class="btn btn-danger px-4 mx-2">Hủy bỏ</a>
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
                    <p><i class="fas fa-bus text-warning"></i> <strong>Ngày đi:</strong> <%= lichtrinh.get_ngay_xuat_phat() %></p>
                    <p><i class="fas fa-calendar-alt text-info"></i> <strong>Điểm đi:</strong> <%= tuyenduong.get_diem_xuat_phat() %></p>
                    <p><i class="fas fa-map-marker-alt text-danger"></i> <strong>Điểm đến:</strong> <%= tuyenduong.get_diem_ket_thuc() %></p>
                </div>

                <div class="info-section">
                    <p><i class="fas fa-chair text-success"></i> <strong>Số ghế:</strong> <%= ve.get_so_ghe() %></p>
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