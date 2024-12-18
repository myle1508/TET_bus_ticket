

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

        <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">Nào ta cùng đón <span class="text-primary">Chuyến xe ngày Tết</span> để đoàn tụ cùng gia đình</h1>
                    <p class="animated fadeIn mb-4 pb-2">Nhà là nơi để về.
                        Chuyến xe đưa bạn đến nơi hạnh phúc.</p>
                    <a href="#search"  class="btn btn-primary py-3 px-5 me-3 animated fadeIn">Bắt đầu hành trình</a>
                </div>
                <div class="col-md-6 animated fadeIn">
                    <div class="owl-carousel header-carousel">
                        <div class="owl-carousel-item">
                            <img class="img-fluid" src="img/slide2.png" alt="">
                        </div>
                        <div class="owl-carousel-item" >
                            <img class="img-fluid" src="img/slide1.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <!-- Search Start -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;" id="search">
            <div class="container" >
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


        <!-- Category Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Ưu đãi ngày Tết</h1>
                    <p>Siêu ưu đãi giá vé khi đặt online dành cho khu vực Miền Trung. Đặt ngay hôm nay</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Quang+Nam&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Quảng Nam</h6>
                                <span>Biển số 92</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Da+Nang&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Đà Nẵng</h6>
                                <span>Biển số 43</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Quang+Binh&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Quảng Bình</h6>
                                <span>Biển số 73</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Quang+Tri&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Quảng Trị</h6>
                                <span>Biển số 74</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Hue&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Huế</h6>
                                <span>Biển số 75</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Nghe+An&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Nghệ An</h6>
                                <span>Biển số 37</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Ha+Tinh&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Hà Tĩnh</h6>
                                <span>Biển số 38</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="guest_servlet?diem-di=Thanh+Hoa&actionSearch=searchForm">
                            <div class="rounded p-4">
                                <div class="icon mb-3">
                                    <img class="img-fluid" src="img/2.jpg" alt="Icon">
                                </div>
                                <h6>Thanh Hóa</h6>
                                <span>Biển số 36</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Category End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="about-img position-relative overflow-hidden p-5 pe-0">
                            <img class="img-fluid w-100" src="img/3.jpg">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="mb-4">#1 Đứng đầu về dịch vụ chăm sóc khách hàng ngày Tết</h1>
                        <p class="mb-4">Cảm ơn quý khách đã luôn quan tâm theo dõi và đồng hành cùng chúng tôi trên những chuyến xe thật ý nghĩa này</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Giá ưu đãi cho học sinh, sinh viên</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Đặt vé nhanh, gọn, dễ dàng</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Hỗ trợ chở miễn phí cho những người có hoàn cảnh khó khăn</p>
                        <a class="btn btn-primary py-3 px-5 mt-3" href="">Thêm</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->



        <!-- Call to Action Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="bg-light rounded p-3">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                                <img class="img-fluid rounded w-100" src="img/4.png" alt="">
                            </div>
                            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                                <div class="mb-4">
                                    <h1 class="mb-3">Liên hệ với chúng tôi ngay</h1>
                                    <p>Hãy cùng đồng hành trên chuyến hành trình về quê hương.</p>
                                </div>
                                <a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Liên lạc</a>
                                <a href="" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Lên lịch Đặt vé</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call to Action End -->


		<!-- Team Start -->
		<div class="container-xxl py-5">
		    <div class="container">
		        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
		            <h1 class="mb-3">Thành viên</h1>
		            <p>Các nhà đầu tư cho dự án</p>
		        </div>
		        <div class="row g-3">
		            <!-- Thành viên 1 -->
		            <div class="col-lg-3 col-md-6 d-flex justify-content-center wow fadeInUp" data-wow-delay="0.1s">
		                <div class="team-item rounded overflow-hidden d-flex flex-column">
		                    <div class="position-relative">
		                        <img class="img-fluid" src="img/t1.jpg" alt="" style="height: 250px; width:100%; object-fit: cover;">
		                        <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
		                        </div>
		                    </div>
		                    <div class="text-center p-4 mt-3">
		                        <h5 class="fw-bold mb-0">Nguyễn Thị Quỳnh Nha</h5>
		                        <small>Thành viên 1</small>
		                    </div>
		                </div>
		            </div>
		
		            <!-- Thành viên 2 -->
		            <div class="col-lg-3 col-md-6 d-flex justify-content-center wow fadeInUp" data-wow-delay="0.3s">
		                <div class="team-item rounded overflow-hidden d-flex flex-column">
		                    <div class="position-relative">
		                        <img class="img-fluid" src="img/t3.png" alt="" style="height: 250px; width:100%; object-fit: cover;">
		                        <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
		                        </div>
		                    </div>
		                    <div class="text-center p-4 mt-3">
		                        <h5 class="fw-bold mb-0">Nguyễn Thị Mỹ Lệ</h5>
		                        <small>Thành viên 2</small>
		                    </div>
		                </div>
		            </div>
		
		            <!-- Thành viên 3 -->
		            <div class="col-lg-3 col-md-6 d-flex justify-content-center wow fadeInUp" data-wow-delay="0.5s">
		                <div class="team-item rounded overflow-hidden d-flex flex-column">
		                    <div class="position-relative">
		                        <img class="img-fluid" src="img/t2.jpg" alt="" style="height: 250px; width:100%; object-fit: cover;">
		                        <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
		                        </div>
		                    </div>
		                    <div class="text-center p-4 mt-3">
		                        <h5 class="fw-bold mb-0">Huỳnh Thị Thanh Nhàn</h5>
		                        <small>Thành viên 3</small>
		                    </div>
		                </div>
		            </div>
		
		            <!-- Thành viên 4 -->
		            <div class="col-lg-3 col-md-6 d-flex justify-content-center wow fadeInUp" data-wow-delay="0.5s">
		                <div class="team-item rounded overflow-hidden d-flex flex-column">
		                    <div class="position-relative">
		                        <img class="img-fluid" src="img/t4.png" alt="" style="height: 250px; width:100%; object-fit: cover;">
		                        <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
		                            <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
		                        </div>
		                    </div>
		                    <div class="text-center p-4 mt-3">
		                        <h5 class="fw-bold mb-0">Mai Văn Hà</h5>
		                        <small>Giảng viên</small>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Team End -->



        <!-- Testimonial Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Trải nghiệm của khách hàng!</h1>
                        <p>Dựa trên sự nhiệt tình và ủng hộ của mọi người cho những chuyến xe ngày Tết </p>
                </div>
                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>Dịch vụ đặt xe online khá nhanh và thuận tiên... 10 điểm</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-1.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Quỳnh Nha</h6>
                                    <small>09/12/2024</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>Thật là tuyệt vời. Dịch vụ đặt xe online khá nhanh và thuận tiện</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-2.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Mỹ Lệ</h6>
                                    <small>15/12/2024</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>Quá may mắn mình đã đặt vé kịp...Dịch vụ đặt xe online khá nhanh và thuận tiên</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-3.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Thanh Nhàn</h6>
                                    <small>16/12/2024</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        

		<%@ include file="footerIncludeGuest.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
	<%@ include file ="scriptsIncludeGuest.jsp"%>
</body>

</html>
