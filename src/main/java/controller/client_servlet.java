package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.lichtrinh_BO;
import model.bo.ve_BO;
import model.bo.nguoidung_BO;
import model.bean.lichtrinh;
import model.bean.nguoidung;
import model.bean.ve;

import java.util.List;

@WebServlet("/account")
public class client_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private nguoidung_BO nguoidungBO;
    private lichtrinh_BO lichtrinhBO;
    private ve_BO veBO;

    @Override
    public void init() throws ServletException {
        lichtrinhBO = new lichtrinh_BO();
        nguoidungBO = new nguoidung_BO();
        veBO = new ve_BO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            handleLogout(request, response);
        } else if ("confirmBooking".equals(action)) {
            handleConfirmBooking(request, response);
        } 
        else if ("Booking".equals(action)) {
        	handleBooking(request, response);
        }
        else if ("deleteve".equals(action)) {
        	
        }
        else if("listve".equals(action)) {
        	handlehienthive(request, response);
        }
        
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // Chuyển về doPost để tái sử dụng logic
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Hủy session
        }
        response.sendRedirect("login.jsp"); 
    }
    private void handleConfirmBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("maNguoiDung") == null) {
                response.sendRedirect("login.jsp"); 
                return;
            }
            int maNguoiDung = (int) session.getAttribute("maNguoiDung");

           
            nguoidung user = nguoidungBO.get_nguoi_dung_By_ma_nguoi_dung(maNguoiDung);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("confirmbooking.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi lấy thông tin người dùng!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void handleBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("maNguoiDung") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            int maNguoiDung = (int) session.getAttribute("maNguoiDung");
            int lichtrinhId = Integer.parseInt(request.getParameter("lichtrinhId"));
            int soVe = Integer.parseInt(request.getParameter("soVe"));
            int tong_tien = Integer.parseInt(request.getParameter("tong_tien"));
            String thanh_toan = request.getParameter("thanh_toan");

            // Lưu thanh toán vào session
            session.setAttribute("thanh_toan", thanh_toan);

            System.out.println("User ID: " + maNguoiDung);
            System.out.println("Schedule ID: " + lichtrinhId);
            System.out.println("Number of tickets: " + soVe);
            System.out.println("Total amount: " + tong_tien);
            System.out.println("Payment method: " + thanh_toan);
            
            // Thêm vào bảng ve
            ve newBooking = new ve();
            newBooking.set_ma_nguoi_dung(maNguoiDung);
            newBooking.set_ma_lich_trinh(lichtrinhId);
            newBooking.set_so_ghe(soVe);
            newBooking.set_trang_thai(true); // Mặc định là đã xác nhận đặt vé
            newBooking.set_tong_tien(tong_tien);
            newBooking.set_thanh_toan(thanh_toan);

            if (veBO.insertve(newBooking)) {
                request.setAttribute("message", "Đặt vé thành công!");
                request.getRequestDispatcher("thanhtoanthanhcong.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi đặt vé!");
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý đặt vé!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void handlehienthive(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = (int) request.getSession().getAttribute("maNguoiDung");

   
        List<ve> veList = veBO.get_ve_By_ma_nguoi_dung(userId);

        
        request.setAttribute("veList", veList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("donhang.jsp");
        dispatcher.forward(request, response);
    }
}