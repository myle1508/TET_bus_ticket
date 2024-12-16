package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class TicketStatistics_DAO{

    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/btap", "root", "");
    }

    private ResultSet executeQuery(String query, String... params) throws SQLException, ClassNotFoundException {
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);

        for (int i = 0; i < params.length; i++) {
            stmt.setString(i + 1, params[i]);
        }

        return stmt.executeQuery();
    }
    public Map<String, Double> getRevenueByDate(String period) throws ClassNotFoundException {
        Map<String, Double> revenueByDate = new HashMap<>();
        
        String query = "SELECT DATE_FORMAT(lt.thoi_gian_xuat_phat, ?) AS period, "
                + "SUM(td.gia_ve) AS doanh_thu "
                + "FROM ve v "
                + "JOIN lichtrinh lt ON v.ma_lich_trinh = lt.ma_lich_trinh "
                + "JOIN tuyenduong td ON lt.ma_tuyen_duong = td.ma_tuyen_duong "
                + "GROUP BY period "
                + "ORDER BY period";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, period); 

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    revenueByDate.put(rs.getString("period"), rs.getDouble("doanh_thu"));

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueByDate;
    }



    public List<Map<String, Object>> getTop3UsersByTickets() throws ClassNotFoundException {
        List<Map<String, Object>> topUsers = new ArrayList<>();
        
        String query = "SELECT u.ho_ten, COUNT(v.ma_ve) AS so_ve_mua " +
                       "FROM nguoidung u " +
                       "JOIN ve v ON u.ma_nguoi_dung = v.ma_nguoi_dung " +
                       "GROUP BY u.ho_ten " +
                       "ORDER BY so_ve_mua DESC LIMIT 3";

        try (ResultSet rs = executeQuery(query)) {
            while (rs.next()) {
                Map<String, Object> user = new HashMap<>();
                user.put("ho_ten", rs.getString("ho_ten"));
                user.put("so_ve_mua", rs.getInt("so_ve_mua"));
                topUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return topUsers;
    }

    public Map<String, Integer> getTopRouteByTickets() throws ClassNotFoundException {
        Map<String, Integer> topRoutes = new LinkedHashMap<>();
        
        String query = "SELECT td.diem_xuat_phat, td.diem_ket_thuc, COUNT(v.ma_ve) AS so_ve " +
                       "FROM ve v " +
                       "JOIN lichtrinh lt ON v.ma_lich_trinh = lt.ma_lich_trinh " +
                       "JOIN tuyenduong td ON lt.ma_tuyen_duong = td.ma_tuyen_duong " +
                       "GROUP BY td.diem_xuat_phat, td.diem_ket_thuc " +
                       "ORDER BY so_ve DESC LIMIT 3";


        try (ResultSet rs = executeQuery(query)) {
            if (rs == null) {
                System.out.println("Không có dữ liệu trả về.");
            } else {
                while (rs.next()) {
                    String route = rs.getString("diem_xuat_phat") + " - " + rs.getString("diem_ket_thuc");
                    topRoutes.put(route, rs.getInt("so_ve"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
                return topRoutes;
    }


}
