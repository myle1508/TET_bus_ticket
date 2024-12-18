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

import model.bean.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
       if ("confirmBooking".equals(action)) {
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
        else if("huyve".equals(action)) {
        	handleHuyVe(request, response);
        }
        
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); 
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
            ve ve = (ve) session.getAttribute("ve");
            nguoidung nguoidung = (nguoidung) session.getAttribute("user");
            lichtrinh lichtrinh = (lichtrinh) session.getAttribute("lichTrinh");

            int maNguoiDung = nguoidung.get_ma_nguoi_dung();
            int lichtrinhId = lichtrinh.get_ma_lich_trinh();
            int soVe = ve.get_so_ghe();
            int tong_tien = ve.get_tong_tien();
            String thanh_toan = request.getParameter("thanh_toan_hidden");
            String vitri = ve.get_vi_tri_ghe();
            Date ngaydat = ve.get_ngay_dat_hang();

           

            // Tạo booking mới
            ve newBooking = new ve();
            newBooking.set_ma_nguoi_dung(maNguoiDung);
            newBooking.set_ma_lich_trinh(lichtrinhId);
            newBooking.set_so_ghe(soVe);
            newBooking.set_trang_thai(true);
            newBooking.set_vi_tri_ghe(vitri);
            newBooking.set_tong_tien(tong_tien);
            newBooking.set_thanh_toan(thanh_toan);
            newBooking.set_ngay_dat_hang(ngaydat);

            if (veBO.insertve(newBooking)) {
              
               
                String seatList = lichtrinh.get_danh_sach_ghe(); 
                int availableSeats = lichtrinh.get_so_ghe_trong(); 

              
                char[] seatArray = seatList.toCharArray();
                String[] bookedSeats = vitri.split(",");

                for (String seat : bookedSeats) {
                    seat = seat.trim();
                    System.out.println("Debug: seat = " + seat);

                   
                    String seatNumberString = seat.replaceAll("\\D", ""); 
                    int seatIndex = Integer.parseInt(seatNumberString) - 1;
                    seatArray[seatIndex] = '1';
                }

         
                String updatedSeatList = new String(seatArray);
                int updatedAvailableSeats = availableSeats - soVe;
                lichtrinh.set_danh_sach_ghe(updatedSeatList);
                lichtrinh.set_so_ghe_trong(updatedAvailableSeats);

             
                if (lichtrinhBO.updatelichtrinh(lichtrinh)) {
                   
                    request.setAttribute("message", "Đặt vé thành công!");
                    request.getRequestDispatcher("thanhtoanthanhcong.jsp").forward(request, response);
                } else {
                   
                    request.setAttribute("errorMessage", "Đặt vé thành công, nhưng không thể cập nhật lịch trình!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
               
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi đặt vé!");
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Debug: Exception = " + e.getMessage());
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý đặt vé!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


    protected void handlehienthive(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        nguoidung nguoidung = (nguoidung) session.getAttribute("user");

        if (nguoidung != null) {
            int userId = nguoidung.get_ma_nguoi_dung();
            System.out.println(userId);
  
            List<ve> veList = veBO.get_ve_By_ma_nguoi_dung(userId);
            List<Map<String, Object>> resultList = new ArrayList<>();
            
            for (ve v : veList) {
            	System.out.println("Debug: seat");
                lichtrinh lt = lichtrinhBO.get_lich_trinh_by_ma_lich_trinh(v.get_ma_lich_trinh());

                if (lt != null) {
                  
                    boolean choHuy = false;
                    boolean daHoanThanh = false;

                    if (v.get_ngay_dat_hang().before(lt.get_thoi_gian_xuat_phat())) {
                        choHuy = true;
                    } else {
                        daHoanThanh = true; 
                    }

              
                    Map<String, Object> map = new HashMap<>();
                    map.put("ve", v);
                    map.put("lichtrinh", lt);
                    map.put("choHuy", choHuy);
                    map.put("daHoanThanh", daHoanThanh);
                    resultList.add(map);
                }
            }

            
            request.setAttribute("veList", resultList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("donhang.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
    protected void handleHuyVe(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int maVe;
            try {
                maVe = Integer.parseInt(request.getParameter("ma_ve"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("message", "Mã vé không hợp lệ.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin vé từ mã vé
            ve ve = veBO.get_ve_By_ma_ve(maVe);
            if (ve == null) {
                request.setAttribute("message", "Vé không tồn tại.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            // Lấy lịch trình liên quan
            int maLichTrinh = ve.get_ma_lich_trinh();
            lichtrinh lichtrinh = lichtrinhBO.get_lich_trinh_by_ma_lich_trinh(maLichTrinh);
            if (lichtrinh == null) {
                request.setAttribute("message", "Lịch trình không tồn tại.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            // Cập nhật trạng thái ghế
            String seatList = lichtrinh.get_danh_sach_ghe();
            char[] seatArray = seatList.toCharArray();
            String[] cancelledSeats = ve.get_vi_tri_ghe().split(","); // Ghế cần hủy

            for (String seat : cancelledSeats) {
                seat = seat.trim();
                String seatNumberString = seat.replaceAll("\\D", ""); // Lấy phần số
                int seatIndex = Integer.parseInt(seatNumberString) - 1; // Index trong mảng
                seatArray[seatIndex] = '0'; // Đặt ghế về trạng thái trống
            }

            // Tăng số ghế trống
            int currentAvailableSeats = lichtrinh.get_so_ghe_trong();
            int newAvailableSeats = currentAvailableSeats + cancelledSeats.length;


            lichtrinh.set_danh_sach_ghe(new String(seatArray));
            lichtrinh.set_so_ghe_trong(newAvailableSeats);

      
            boolean isLichTrinhUpdated = lichtrinhBO.updatelichtrinh(lichtrinh);
            ve.set_trang_thai(false); // Hủy vé
            boolean isVeUpdated = veBO.updateve(ve);

            if (isLichTrinhUpdated && isVeUpdated) {
                request.setAttribute("message", "Hủy vé thành công! Số ghế trống đã được cập nhật.");
                request.getRequestDispatcher("huyvethanhcong.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
            request.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
            try {
                request.getRequestDispatcher("/404.jsp").forward(request, response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
        }
    }


}