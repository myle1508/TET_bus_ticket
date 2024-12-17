package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.bean.nguoidung;
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
            
            HttpSession session = (request.getSession(false) == null) ? request.getSession(true) : request.getSession(false);
            
            if (user != null) {
                session.setAttribute("username", username);
                session.setAttribute("user", user); // Lưu thông tin người dùng vào session
                
                if (role == 1) {
                    // User with role 1: Admin
                    destination = "/dashboard.jsp";
                } else if (role == 2) {
                    // User with role 2: Regular user
                    session.setAttribute("ma_nguoi_dung", user.get_ma_nguoi_dung());
                    
                    if (session.getAttribute("ve") != null) {
                        // Nếu session có "ve", chuyển hướng tới trang xác nhận đặt vé
                    	 destination = "/confirmbooking.jsp";
                    } else {
                        // Nếu không có "ve" trong session, chuyển hướng tới trang người dùng chính
                        destination = "/index.jsp";
                    }
                } else {
                    // Nếu không phải role 1 hoặc 2
                    request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                    destination = "/login.jsp";
                }
            } else {
                // User not found in database
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                destination = "/login.jsp";
            }
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã có lỗi xảy ra.");
        }
    }
}
