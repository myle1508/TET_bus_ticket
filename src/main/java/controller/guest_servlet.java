package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.lichtrinh;
import model.bean.tuyenduong;
import model.bo.lichtrinh_BO;
import model.bo.tuyenduong_BO;
@WebServlet("/guest_servlet")
// người dùng 3 -> Không cần đăng nhấp
public class guest_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
 	protected void forwardToDestination(String destination, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
 	}
 	
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		lichtrinh_BO lichtrinhBO = new lichtrinh_BO();
 		tuyenduong_BO tuyenduongBO = new tuyenduong_BO();
 		if (request.getParameter("actionSearch") != null ) {
 			// Xử lý form search tuyến xe ở index.jsp và searhGuest.jsp 
 			String diemxuatphat = request.getParameter("diem-di");
 			String diemketthuc = request.getParameter("diem-den");
 			String ngaydi = request.getParameter("ngay-di");

 			tuyenduong tuyenDuong =  tuyenduongBO.getTuyenDuongByDiemDenDiemDi(diemxuatphat.toLowerCase(), diemketthuc.toLowerCase());
 			ArrayList<lichtrinh> lichTrinhListTemp = new ArrayList<lichtrinh>();
	 		ArrayList<lichtrinh> lichTrinhList = new ArrayList<lichtrinh>();
	 		
 			if (tuyenDuong != null) {
 	 			lichTrinhListTemp = lichtrinhBO.get_lich_trinh_by_ma_tuyen_duong(tuyenDuong.get_ma_tuyen_duong());
 	 			if (!ngaydi.isEmpty()) {
 	 				for(lichtrinh lichTrinh : lichTrinhListTemp) {
 	 					LocalDateTime localDateTime = lichTrinh.get_thoi_gian_xuat_phat().toLocalDateTime();
 	 					// Tách ngày
 	 					DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 	 					String date = localDateTime.format(dateFormatter);
 	 					if (ngaydi.equals(date)) {
 	 						lichTrinhList.add(lichTrinh);
 	 					}
 	 				}
 	 			} else {
 	 				lichTrinhList = lichTrinhListTemp;
 	 			}
 	 			
 			}
 			request.setAttribute("tuyenDuong", tuyenDuong);
	 		request.setAttribute("lichTrinhList", lichTrinhList);
	 		this.forwardToDestination("/searchGuest.jsp", request, response);
 			
 		}
 		else if (request.getParameter("action1") != null) {
 			int malichtrinh = Integer.parseInt(request.getParameter("malichtrinh"));
 			lichtrinh lichTrinh = lichtrinhBO.get_lich_trinh_by_ma_lich_trinh(malichtrinh);
 			tuyenduong tuyenDuong = tuyenduongBO.get_tuyen_duong_By_ma_tuyen_duong(lichTrinh.get_ma_tuyen_duong());
 			request.setAttribute("lichTrinh", lichTrinh);
 			request.setAttribute("tuyenDuong", tuyenDuong);
 			this.forwardToDestination("/detailSchedulesGuest.jsp", request, response);
 		}
 	}
 	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		lichtrinh_BO lichtrinhBO = new lichtrinh_BO();
 		tuyenduong_BO tuyenduongBO = new tuyenduong_BO();
 		HttpSession session = request.getSession(false); 
 		if (request.getParameter("submitForm") != null ) {
 			if (request.getParameter("submitForm").equals("payForm")) {
 				String malichtrinh = request.getParameter("malichtrinh");
 				String soluongghe = request.getParameter("soluongghe_hidden");
 				String soghe = request.getParameter("soghe_hidden");
// 				String[] numbers = soghe.split(",\\s*");
 				
 			}
 		}
 	}
}