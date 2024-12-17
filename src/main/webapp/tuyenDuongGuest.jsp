
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
    <title>Danh Sách Tuyến Xe</title>
    <%@ include file ="headIncludeGuest.jsp"%>
    <style>
        .route-title {
            color: red;
            font-weight: bold;
        }
        .btn-custom {
            background-color: #ffebe8;
            color: red;
            border: none;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #ffcfcf;
        }
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <%@ include file="navbarGuest.jsp" %>
		
        <div class="container-xxl pt-5">
            <div class="container">
                <div class="bg-light rounded ">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                            <div class="col-lg-4" style="font-weight: bold; font-size:1.2rem ">
                               	Tuyen xe
                            </div>
                            <div class="col-lg-3" style="font-weight: bold; font-size:1.2rem ">
                                Quang duong
                                <!-- <a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Liên lạc</a>
                                <a href="" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Lên lịch Đặt vé</a> -->
                            </div>
                            <div class="col-lg-3" style="font-weight: bold; font-size:1.2rem ">
                                Gia ve
                            </div>
                            <div class="col-lg-2" >
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-xxl pt-3">
            <div class="container">
                <div class="bg-light rounded ">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-2 align-items-center">
                        <%
                        	ArrayList<tuyenduong> tuyenDuongList = (ArrayList<tuyenduong>) request.getAttribute("tuyenDuongList");
                        	if (tuyenDuongList.size() > 0){
                        		for (tuyenduong tuyenDuong : tuyenDuongList){
                        		String link = "guest_servlet?diem-di=" + tuyenDuong.get_diem_xuat_phat() + "&diem-den=" + tuyenDuong.get_diem_ket_thuc() + "&actionSearch=searchForm";
                        %>
                            <div class="col-lg-4" >
                               <span class="route-title"><%=tuyenDuong.get_diem_xuat_phat() %> ⇆ <%=tuyenDuong.get_diem_ket_thuc() %></span>
                            </div>
                            <div class="col-lg-3" >
                                <%=tuyenDuong.get_khoang_cach() %> Km
                            </div>
                            <div class="col-lg-2" style="text-align: left;">
                                <%=tuyenDuong.get_gia_ve() %>.000 VND
                            </div>
                            <div class="col-lg-3" style="text-align:center" >
                                <a href="<%=link %>" class="btn btn-custom">Tìm tuyến xe</a>
                            </div>
                         <%
                        		}
                        	}
                        %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <%@ include file="footerIncludeGuest.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
	<%@ include file ="scriptsIncludeGuest.jsp"%>
</body>

</html>