<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Spinner Start -->
      <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
          <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
              <span class="sr-only">Loading...</span>
          </div>
      </div>
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
                  <a href="login.jsp" class="btn btn-primary px-3 d-none d-lg-flex">Đăng nhập</a>
              </div>
          </nav>
      </div>
      <!-- Navbar End -->
    