package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.bean.nguoidung;
import model.bean.ve;
import model.bo.nguoidung_BO;

@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        nguoidung_BO nguoidung_BO = new nguoidung_BO();
        
        try {
        	int role = nguoidung_BO.isValidUser(username, password);      	
        	nguoidung user = nguoidung_BO.getUserByUsernameAndPassword(username, password);
        	
        	/*
        	 * Ở đây sẽ có hai trường hợp cho sesstion 
        	 * Trường hợp Một là session đã được tạo trong phần của guest khi đã chọn tuyến và bấm thanh toán.Khi bấm thanh toán nó sẽ chuyển về login và ở đây session sẽ lấy session đã được
        	 * 			tạo ở function xử lý thanh toán (payForm trong guest_servlet). session đó đã lấy bằng câu lệnh request.getSession(false)
        	 *  Trường hợp Hai là session chưa từng được tạo trước đây thì nó sẽ tạo một session mới bằng câu lệnh request.getSession(true
        	 *  Để logic này hoạt động hiệu quả thì ở phần logout của mỗi người phải có câu lệnh để xoá session làm việc hiện tại bằng cách session.invalidate();
        	 */
        	HttpSession session = (request.getSession(false) == null) ? request.getSession(true) : request.getSession(false);
        	
            //session.setAttribute("maNguoiDung", user.get_ma_nguoi_dung()); // Lưu mã người dùng vào session
            
        	if ( role == 1 ) {
                session.setAttribute("username", username);
                session.setAttribute("username", user.get_ten_dang_nhap());
                destination = "/dashboard.jsp";
            }else if(role == 2){
            	session.setAttribute("username", user.get_ten_dang_nhap());
            	session.setAttribute("ma_nguoi_dung", user.get_ten_dang_nhap());
            	
            	if (session.getAttribute("ve") != null ) {
            		ve ve = (ve) session.getAttribute("ve");
            		System.out.println(ve.get_so_ghe());
            		System.out.println(ve.get_vi_tri_ghe());
            		System.out.println("Day nay");
            		destination = "/thanhtoan.jsp";
            	}else {
            		destination = "/main_user.jsp";
            	}
            	
            }          
            else {
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                destination = "/login.jsp";
            }
            
//            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã có lỗi xảy ra.");
        }
    }
}
