<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Spinner Start -->
<!--       <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
          <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
              <span class="sr-only">Loading...</span>
          </div>
      </div> -->
      <!-- Spinner End -->


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
                      <a href="guest_servlet?action2=1" class="nav-item nav-link">Tuyến Xe</a>
                      <% 
                      String username = (String) session.getAttribute("username");
                       %>                   
                  </div>
                  <% if (username != null){
                	  
                    	%>
                    <!-- Nếu đã đăng nhập, hiển thị hình người dùng và menu thả xuống -->
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img src="img/user.png" alt="User" class="img-fluid" style="width: 30px; height: 30px; border-radius: 50%;">
                        </a>
                        <div class="dropdown-menu rounded-0 m-0">
                        	<a href="admin?action=view&ten_dang_nhap=<%= username %>" class="dropdown-item">Thông tin tài khoản</a>
                      		<a href="account?action=listve" class="dropdown-item">Đơn hàng của tôi</a>
                            <a href="logout.jsp" class="dropdown-item">Đăng xuất</a>
                        </div>
                    </div>
                   <%}
                  else {
                %>
                  <a href="login.jsp" class="btn btn-primary px-3 d-none d-lg-flex">Đăng nhập</a>
                  <% }%>
              </div>
          </nav>
      </div>
      <!-- Navbar End -->
    