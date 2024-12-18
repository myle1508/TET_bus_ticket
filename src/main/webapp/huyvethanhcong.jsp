<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.*  ,java.util.List"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>

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
        width: 100%; /* Đảm bảo nút đầy rộng trong container */
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

    /* Căn giữa nút */
    .center-button {
        text-align: center;
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
   <div class="container mt-5">
    <!-- Tabs Section -->
    <div class="row main-container">
        <div class="col-12 text-center">
            <div class="info-card mb-3 center-button">
                <h5 class="info-header">Thông báo</h5>
                <p>Vé của bạn đã được hủy thành công.</p>
                <a href="index.jsp" class="btn btn-primary btn-lg btn-block">Trở lại trang chủ</a>
            </div>
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
