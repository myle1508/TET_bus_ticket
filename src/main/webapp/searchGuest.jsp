
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.tuyenduong" %>
<%@ page import="model.bean.lichtrinh" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>NLN_Chuyến xe ngày tết</title>
    <%@ include file ="headIncludeGuest.jsp"%>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <%@ include file="navbarGuest.jsp" %>


        <!-- Search Start -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
                <div class="row g-2">
                	<form name="form1" action="guest_servlet" method="GET" onsubmit="removeAccentsBeforeSubmit()">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-4">
                            	<label class="mx-2" for="diem-di" style="color: #FDF5E6">Điểm Xuất Phát</label>
                                <input type="text" id="diem-di" name="diem-di" placeholder="Nhập tên tỉnh" class="form-control border-0 py-3" required>
                                <div id="suggestions-diem-di" class="autocomplete-suggestions"></div>
                            </div>
                            <div class="col-md-4">
                            	<label class="mx-2" for="diem-di" style="color: #FDF5E6">Điểm Đến</label>
                                <input type="text" id="diem-den" name="diem-den" placeholder="Nhập tên tỉnh" class="form-control border-0 py-3" required>
                                <div id="suggestions-diem-den" class="autocomplete-suggestions"></div>
                            </div>
                            <div class="col-md-3">
                       			<label class="mx-2" for="ngay-di" style="color: #FDF5E6">Ngày đi</label>
                        		<input type="date" id="ngay-di" name="ngay-di" class="form-control border-0 py-3" >
                    		</div>
                    		<div class="col-md-1">
                    		<label class="mx-2" style="color: #FDF5E6"></label>
                       		<button name="actionSearch" value="searchForm" class="btn btn-dark border-0 w-100 py-3">Search</button>
                    	</div>
                        </div>
                        
                    </div>
                    
                    </form>
                </div>
            </div>
        </div>
        <!-- Search End -->


        <!-- Property List Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                            <h1 class="mb-3">Các tuyến đường</h1>
                            <p>Đong đầy từ Bắc, Trung, Nam.</p>
                        </div>
                    </div>                   
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">Tất cả</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                <!-- tab-1 là tất cả 2 loại xe nè -->
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                        <!-- bắt đầu từ chỗ này cho vòng lặp for đọc trong CSDL ra các tuyến đường nè-->
                        <%
                              	tuyenduong tuyenDuong = (tuyenduong) request.getAttribute("tuyenDuong");
              					ArrayList<lichtrinh> lichTrinhList =(ArrayList<lichtrinh> ) request.getAttribute("lichTrinhList");
                        		if (tuyenDuong != null && lichTrinhList.size() > 0){
     	         					for (lichtrinh lichTrinh : lichTrinhList){
     	         						String linkChiTietLichTrinh = "guest_servlet?action1=1&malichtrinh=" + lichTrinh.get_ma_lich_trinh();
                        %>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="<%= linkChiTietLichTrinh%>"><img class="img-fluid" src="img/5.jpg" alt=""></a>
                                        
                        				
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">Xe 1 tầng</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%=tuyenDuong.get_diem_xuat_phat() %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3"><%= tuyenDuong.get_gia_ve() %>.000 VNĐ</h5>
                                        <a class="d-block h5 mb-2" href="<%= linkChiTietLichTrinh%>"><%=tuyenDuong.get_diem_xuat_phat()%> - <%=tuyenDuong.get_diem_ket_thuc() %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%=lichTrinh.get_gio_xuat_phat() %> <%=lichTrinh.get_ngay_xuat_phat() %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%=tuyenDuong.get_khoang_cach()%> km</small>
                                       
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%=lichTrinh.get_so_ghe_trong()%> chỗ trống</small>
                                    </div>
                                </div>
                            </div>
                            <%
                        					}
                        		}else {
                        			%>
                        			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					                    <h1 class="mb-3">Không Có Tuyến Xe Nào Phù Hợp Với Tìm Kiếm Của Bạn</h1>
					                    <p>Hãy Bắt Đầu Tìm Kiếm Tuyến Xe Khác Cho Bản Thân</p>
					                </div>
                        			<%
                        		}
                                        %>
                          <!-- kết thúc vòng lặp ở đây -->


                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Property List End -->
        

       <%@ include file="footerIncludeGuest.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
	<%@ include file ="scriptsIncludeGuest.jsp"%>
</body>

</html>