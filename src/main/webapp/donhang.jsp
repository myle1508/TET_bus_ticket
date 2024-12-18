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
                 
             nguoidung users = (nguoidung) request.getAttribute("user");
                   
                %>
             

   <div class="container mt-5">
    <!-- Tabs Section -->
    <ul class="nav nav-tabs" id="orderTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="current-tab" data-bs-toggle="tab" data-bs-target="#current" type="button" role="tab">Lịch sử đặt vé </button>
        </li>
       
    </ul>
<div class="tab-content p-4" id="orderTabsContent">
    <%
        List<Map<String, Object>> veList = (List<Map<String, Object>>) request.getAttribute("veList");
        if (veList != null && !veList.isEmpty()) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            for (Map<String, Object> item : veList) {
                ve v = (ve) item.get("ve");
                lichtrinh lt = (lichtrinh) item.get("lichtrinh");
                boolean choHuy = (boolean) item.get("choHuy");
                boolean daHoanThanh = (boolean) item.get("daHoanThanh");

                Date ngayDatHang = v.get_ngay_dat_hang();
                if (ngayDatHang != null) {
    %>
    <div class="info-card mb-3">
        <h5 class="info-header">Mã Vé: <%= v.get_ma_ve() %></h5>
        <p><strong>Ngày đặt hàng:</strong> <%= dateFormat.format(ngayDatHang) %></p>
        <p><strong>Ngày khởi hành:</strong> <%= dateFormat.format(lt.get_thoi_gian_xuat_phat()) %></p>
        <p><strong>Số ghế:</strong> <%= v.get_so_ghe() %></p>
     <p><strong>Trạng thái vé:</strong> 
    <%
        if (!v.get_trang_thai()) { 
            out.print("Đã hủy");
        } else if (daHoanThanh) { 
            out.print("Hết hiệu lực");
        } else { 
            out.print("Còn hiệu lực");
        }
    %>
</p>

        
      
        <% if (choHuy && v.get_trang_thai()) { %> <!-- Corrected condition -->
     <p><a href="account?action=huyve&ma_ve=<%= v.get_ma_ve() %>" onclick="return confirm('Bạn có chắc muốn hủy vé này không?');" class="button">Hủy</a></p>

        <% } %>
        <p><a href="admin?action=detail_ve&ma_ve=<%= v.get_ma_ve() %>" class="button">Chi tiết</a></p>
    </div>
    <%
                } else {
    %>
    <p><strong>Ngày đặt hàng:</strong> Không xác định</p>
    <%
                }
            }
        } else {
    %>
    <p>Bạn chưa có vé nào.</p>
    <%
        }
    %>
</div>

<script type="text/javascript">
    function confirmAction(message) {
        return confirm(message);
    }
</script>


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