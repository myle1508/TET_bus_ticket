<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.tuyenduong" %>
<%@ page import="model.bean.lichtrinh" %>
<%@ page import="model.bean.nguoidung" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<% nguoidung user = (nguoidung) request.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>NLN_Chuyến xe ngày tết</title>
    <%@ include file ="headIncludeGuest.jsp"%>
    <style>
        .sofa {
            width: 60px;
            height: 40px;
            background-color: white;
            color: #333;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            border: 3px solid #9bc5e6;
            border-radius: 15px 15px 5px 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .sofa.selected {
            background-color: #ffcccc;
            border-color: #ff6666;
            color: #fff;
        }
        .sofa.sold {
            background-color: #d3d3d3;
            border-color: #a9a9a9;
            color: #666;
            pointer-events: none;
        }
        .legend-color {
            width: 30px;
            height: 30px;
            border-radius: 5px;
            border: 2px solid #ccc;
        }
        .legend-color.sold {
            background-color: #d3d3d3;
        }
        .legend-color.available {
            background-color: white;
            border-color: #9bc5e6;
        }
        .legend-color.selected {
            background-color: #ffcccc;
        }
        .sofa + .sofa {
            margin-left: 15px;
        }
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <%@ include file="navbarGuest.jsp" %>

		<div class="container my-5">
        	
		</div>
		    
		    <div class="container">
                <div class="bg-light rounded p-3">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                        	
					        <div class="row justify-content-center p-5">
					       		
					            <div class="col-md-7">
					            	<h2 class="text-center mb-4">Chọn Ghế</h2>	
					                 <!-- Sơ đồ ghế -->
						                <% 
						                    // Lấy chuỗi danh_sach_ghe từ request
						                    lichtrinh lichTrinh = (lichtrinh) request.getAttribute("lichTrinh");
						                	tuyenduong tuyenDuong = (tuyenduong) request.getAttribute("tuyenDuong");
						                    String danhSachGhe = (String) lichTrinh.get_danh_sach_ghe();
						                    if (danhSachGhe != null) {
						                        int soLuongGhe = danhSachGhe.length();
						                        int soCot = 4; // Số ghế mỗi hàng
						                        int soHang = (int) Math.ceil((double) soLuongGhe / soCot); // Tính số hàng cần thiết
						
						                        int gheIndex = 0; // Chỉ số ghế trong danh_sach_ghe
						
						                        for (int i = 0; i < soHang; i++) { 
						                %>
						                <div class="d-flex justify-content-center mb-3">
						                    <% for (int j = 0; j < soCot; j++) { 
						                        if (gheIndex < soLuongGhe) {
						                            char trangThai = danhSachGhe.charAt(gheIndex);
						                            gheIndex++;
						                    %>
						                    <div class="sofa <%= trangThai == '1' ? "sold" : "" %>">
						                        G<%= gheIndex %>
						                    </div>
						                    <% }} %>
						                </div>
						                <% } } else { %>
						                <p class="text-center text-danger">Danh sách ghế không có dữ liệu.</p>
						                <% } %>
					            </div>
					            <!-- Hướng dẫn -->
					            <div class="col-md-5">
					            	<div class="bg-white rounded p-4 mt-5" style="border: 1px dashed rgba(0, 185, 142, .3);">
                    						<h5>Trạng thái ghế</h5>
							                <div class="d-flex align-items-center mb-2">
							                    <div class="legend-color sold me-2"></div>
							                    <span>Đã bán</span>
							                </div>
							                <div class="d-flex align-items-center mb-2">
							                    <div class="legend-color available me-2"></div>
							                    <span>Còn trống</span>
							                </div>
							                <div class="d-flex align-items-center">
							                    <div class="legend-color selected me-2"></div>
							                    <span>Đang chọn</span>
							                </div>
                    				</div>
									<form name="form1" action="guest_servlet" method="POST" onsubmit="return validateForm()">
	                  					<div class="bg-white rounded p-4 mt-2" style="border: 1px dashed rgba(0, 185, 142, .3)">
	                  						<h5>Thông tin chuyến đi</h5>
	                  						<div class="row justify-content-center">
	                  							<div class="col-md-6">Tuyến xe</div>
	                  							<div class="col-md-6 text-end" style="color: black;"><%= tuyenDuong.get_diem_xuat_phat()%> - <%= tuyenDuong.get_diem_ket_thuc() %></div>
	                  						</div>
	                  						<div class="row justify-content-center">
	                  							<div class="col-md-6">Thời gian xuất phát</div>
	                  							<div class="col-md-6 text-end" style="color: #00613D;"><%= lichTrinh.get_gio_xuat_phat() %>  <%= lichTrinh.get_ngay_xuat_phat() %></div>
	                  						</div>
	                  						<div class="row justify-content-center">
	                  							<div class="col-md-6">Số lượng ghế</div>
	                  							<div class="col-md-6 text-end" id="soluongghe" name="soluongghe" style="color: black;"></div>
	                  						</div>
	                  						<div class="row justify-content-center">
	                  							<div class="col-md-6">Số ghế</div>
	                  							<div class="col-md-6 text-end" id="soghe" name="soghe" style="color: #00613D;"></div>
	                  						</div>
	                  						<div class="row justify-content-center">
	                  							<div class="col-md-6">Tổng tiền chuyến đi</div>
	                  							<div class="col-md-6 text-end" id="tongtien" name="tongtien" style="color: #ef5222;"></div>
	                  						</div>
	                  					</div>
	                  					
	                  					<div class="text-center  mt-4">
	                  						<input type="text" name="malichtrinh" value="<%= lichTrinh.get_ma_lich_trinh() %>" hidden>
	                  						<input type="hidden" id="soluongghe_hidden" name="soluongghe_hidden">
	                  						<input type="hidden" id="soghe_hidden" name="soghe_hidden">
	                  						<input type="hidden" id="tongtien_hidden" name="tongtien_hidden">
	                  						<button name="submitForm" value="payForm" class="btn btn-primary py-3 px-5 me-3 animated fadeIn">Thanh Toán</button>
	                  					</div>
                    				</form>
					            </div>
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
	<script>
        // Xử lý chọn ghế
        document.addEventListener('DOMContentLoaded', () => {
		    const sofas = document.querySelectorAll('.sofa');
		    const soluongghe = document.getElementById('soluongghe');
		    const soghe = document.getElementById('soghe');
		    const tongtien = document.getElementById('tongtien');
		    var sotien = 0;
		    const maxSeats = 5; // Giới hạn số lượng ghế tối đa
		
		    sofas.forEach(sofa => {
		        sofa.addEventListener('click', () => {
		            // Kiểm tra nếu ghế đã bán thì không thay đổi
		            if (!sofa.classList.contains('sold')) {
		                // Kiểm tra số lượng ghế đã chọn
		                const selectedSofas = document.querySelectorAll('.sofa.selected');
		                if (selectedSofas.length >= maxSeats && !sofa.classList.contains('selected')) {
		                    alert("Bạn chỉ có thể chọn tối đa " + maxSeats + " ghế!");
		                    return; // Nếu đã chọn đủ số ghế, không cho phép chọn thêm
		                }
		
		                sofa.classList.toggle('selected');
		                updateGhichu(); // Cập nhật sau khi ghế được chọn
		            }
		        });
		    });
		
		    function updateGhichu() {
		        const selectedSofas = document.querySelectorAll('.sofa.selected');
		        const selectedSofaIds = [];
		        const processedSofaIds = [];

		        selectedSofas.forEach((sofa) => {
		            // Lấy ID của ghế, ví dụ G14, G9, ...
		            const sofaId = sofa.textContent.trim();
		            selectedSofaIds.push(sofaId); // Thêm ID ghế vào danh sách

		             // Xử lý: bỏ chữ G và trừ vị trí ghế đi 1
		            /* const position = parseInt(sofaId.replace('G', ''), 10) - 1;
		            processedSofaIds.push(position); // Lưu vị trí đã xử lý  */
		        });

		        // Cập nhật nội dung hiển thị
		        soluongghe.textContent = selectedSofaIds.length + " ghế"; // Số lượng ghế
		        soghe.textContent = selectedSofaIds.join(', '); // Danh sách ghế
		        sotien = selectedSofaIds.length * <%= tuyenDuong.get_gia_ve() %>;
		        tongtien.textContent = sotien + ".000 VND"; // Tổng tiền

		        // Cập nhật giá trị cho các trường hidden input
		        document.getElementById('soluongghe_hidden').value = selectedSofaIds.length; // Số lượng ghế
		        document.getElementById('soghe_hidden').value = selectedSofaIds.join(', '); // Danh sách ghế đã xử lý
		        document.getElementById('tongtien_hidden').value = sotien;
		    }
		    

		});

		function validateForm(){
			var soghe_hidden = document.form1.soghe_hidden.value;
			if (soghe_hidden === ""){
				alert("Bạn hãy chọn ghế trước khi thanh toán");
				return false;
			}
			return true;
		}
    </script>
</body>

</html>