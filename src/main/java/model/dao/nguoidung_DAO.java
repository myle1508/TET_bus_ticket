package model.dao;

import java.sql.*;
import java.util.ArrayList;

import model.bean.nguoidung;
import model.bean.tuyenduong;

public class nguoidung_DAO {
	private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/btap", "root", "");
    }
	
	// Kiểm tra đăng nhập nè
    public int isExistUser(String username, String password) {
    	int role = 0;
    	Connection cnn = null;
        Statement sm = null;
        ResultSet rs = null;
        try {
            cnn = getConnection();
            sm = cnn.createStatement();
            String sql = "SELECT * FROM nguoidung";
            rs = sm.executeQuery(sql);
            while (rs.next()) {
                if (username.equals(rs.getString(2)) && password.equals(rs.getString(3))) {
                    role = Integer.parseInt(rs.getString(7)) ;
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error in isExistUser: " + e.getMessage());
        } finally {
            closeResources(rs, sm, cnn);
        }
        return role ;
    }
    
    // Lấy danh sách người dùng mua
    public ArrayList<nguoidung> getList() {
        ArrayList<nguoidung> result = new ArrayList<>();
        Connection cnn = null;
        Statement sm = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            sm = cnn.createStatement();
            String sql = "SELECT * FROM nguoidung WHERE vai_tro = 2";
            rs = sm.executeQuery(sql);
            while (rs.next()) {
            	nguoidung nguoidung = new nguoidung();
            	
            	nguoidung.set_ma_nguoi_dung(rs.getInt(1));
            	nguoidung.set_ten_dang_nhap(rs.getString(2));
            	nguoidung.set_mat_khau(rs.getString(3));
            	nguoidung.set_ho_ten(rs.getString(4));
            	nguoidung.set_email(rs.getString(5));
            	nguoidung.set_so_dien_thoai(rs.getString(6));
            	nguoidung.set_vai_tro(rs.getInt(7));
            	
                result.add(nguoidung);
            }
        } catch (Exception e) {
            System.out.println("Error in getnguoidungList: " + e.getMessage());
        } finally {
            closeResources(rs, sm, cnn);
        }

        return result;
    }
    
    // Thêm người dùng 
    public boolean insertnguoidung(nguoidung nguoidung) {
        boolean isInserted = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "INSERT INTO  nguoidung (ten_dang_nhap, mat_khau, ho_ten, email, so_dien_thoai, vai_tro) VALUES (?, ?, ?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, nguoidung.get_ten_dang_nhap());
            ps.setString(2, nguoidung.get_mat_khau());
            ps.setString(3, nguoidung.get_ho_ten());
            ps.setString(4, nguoidung.get_email());
            ps.setString(5, nguoidung.get_so_dien_thoai());
            ps.setInt(6, nguoidung.get_vai_tro());

            int rows = ps.executeUpdate();
            isInserted = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in insertnguoidung: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isInserted;
    }
    
    // Lấy người dùng bằng mã người dùng
    public nguoidung get_nguoi_dung_By_ma_nguoi_dung(int id) {
    	nguoidung nguoidung = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM nguoidung WHERE ma_nguoi_dung = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	nguoidung = new nguoidung();

                nguoidung.set_ma_nguoi_dung(rs.getInt(1));
            	nguoidung.set_ten_dang_nhap(rs.getString(2));
            	nguoidung.set_mat_khau(rs.getString(3));
            	nguoidung.set_ho_ten(rs.getString(4));
            	nguoidung.set_email(rs.getString(5));
            	nguoidung.set_so_dien_thoai(rs.getString(6));
            	nguoidung.set_vai_tro(rs.getInt(7));
            }
        } catch (Exception e) {
            System.out.println("Error in getnguoidungById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return nguoidung;
    }
    
    // Lấy người dùng bằng tên đăng nhập
    public nguoidung get_nguoi_dung_By_ten_dang_nhap(String id) {
    	nguoidung nguoidung = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM nguoidung WHERE ten_dang_nhap = ?";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	nguoidung = new nguoidung();

                nguoidung.set_ma_nguoi_dung(rs.getInt(1));
            	nguoidung.set_ten_dang_nhap(rs.getString(2));
            	nguoidung.set_mat_khau(rs.getString(3));
            	nguoidung.set_ho_ten(rs.getString(4));
            	nguoidung.set_email(rs.getString(5));
            	nguoidung.set_so_dien_thoai(rs.getString(6));
            	nguoidung.set_vai_tro(rs.getInt(7));
            }
        } catch (Exception e) {
            System.out.println("Error in getnguoidungByten_dang_nhap: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return nguoidung;
    }
    
    // Tìm kiếm người dùng theo họ tên, email, số điện thoại
    public ArrayList<nguoidung> searchnguoidung(String searchOption, String searchValue) {
        ArrayList<nguoidung> resultList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        String query = "";
        
        switch (searchOption) {
            case "ho_ten":
                query = "SELECT * FROM nguoidung WHERE ho_ten LIKE ?";
                break;
            case "email":
                query = "SELECT * FROM nguoidung WHERE email LIKE ?";
                break;
            case "so_dien_thoai":
                query = "SELECT * FROM nguoidung WHERE so_dien_thoai LIKE ?";
                break;
            default:
                query = "SELECT * FROM nguoidung";
                break;
        }
        try {
        	cnn = getConnection();
        	PreparedStatement stmt = cnn.prepareStatement(query) ;
        
            stmt.setString(1, "%" + searchValue + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                nguoidung nguoidung = new nguoidung();
                
                nguoidung.set_ma_nguoi_dung(rs.getInt(1));
            	nguoidung.set_ten_dang_nhap(rs.getString(2));
            	nguoidung.set_mat_khau(rs.getString(3));
            	nguoidung.set_ho_ten(rs.getString(4));
            	nguoidung.set_email(rs.getString(5));
            	nguoidung.set_so_dien_thoai(rs.getString(6));
            	nguoidung.set_vai_tro(rs.getInt(7));
            	
                resultList.add(nguoidung);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
            closeResources(ps, cnn);
        }
        return resultList;
    }
    
    public boolean updatenguoidung(nguoidung updatednguoidung) {
        boolean isUpdated = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "UPDATE nguoidung SET mat_khau = ?, ho_ten = ?, email = ?, so_dien_thoai = ? WHERE ma_nguoi_dung = ?";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, updatednguoidung.get_mat_khau());
            ps.setString(2, updatednguoidung.get_ho_ten());
            ps.setString(3, updatednguoidung.get_email());
            ps.setString(4, updatednguoidung.get_so_dien_thoai());
            ps.setInt(5, updatednguoidung.get_ma_nguoi_dung());

            isUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error in updatenguoidung: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isUpdated;
    }
    public nguoidung getUserByUsernameAndPassword(String username, String password) {
        nguoidung user = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM nguoidung WHERE ten_dang_nhap = ? AND mat_khau = ?";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new nguoidung();
                user.set_ma_nguoi_dung(rs.getInt("ma_nguoi_dung"));
                user.set_ten_dang_nhap(rs.getString("ten_dang_nhap"));
                user.set_mat_khau(rs.getString("mat_khau"));
                user.set_ho_ten(rs.getString("ho_ten"));
                user.set_email(rs.getString("email"));
                user.set_so_dien_thoai(rs.getString("so_dien_thoai"));
                user.set_vai_tro(rs.getInt("vai_tro"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, ps, cnn);
        }
        return user;
    }
    private void closeResources(ResultSet rs, Statement sm, Connection cnn) {
        try {
            if (rs != null) rs.close();
            if (sm != null) sm.close();
            if (cnn != null) cnn.close();
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }

    private void closeResources(Statement sm, Connection cnn) {
        closeResources(null, sm, cnn);
    }
}
