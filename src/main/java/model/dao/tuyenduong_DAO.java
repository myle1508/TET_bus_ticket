package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.tuyenduong;

public class tuyenduong_DAO {
	private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/btap", "root", "");
    }
	
	// Lấy danh sách các tuyến đường
    public ArrayList<tuyenduong> getList() {
        ArrayList<tuyenduong> result = new ArrayList<>();
        Connection cnn = null;
        Statement sm = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            sm = cnn.createStatement();
            String sql = "SELECT * FROM tuyenduong";
            rs = sm.executeQuery(sql);
            while (rs.next()) {
            	tuyenduong tuyenduong = new tuyenduong();
            	tuyenduong.set_ma_tuyen_duong(rs.getInt(1));
            	tuyenduong.set_diem_xuat_phat(rs.getString(2));
            	tuyenduong.set_diem_ket_thuc(rs.getString(3));
            	tuyenduong.set_khoang_cach(rs.getInt(4));
            	tuyenduong.set_gia_ve(rs.getInt(5));
                result.add(tuyenduong);
            }
        } catch (Exception e) {
            System.out.println("Error in gettuyenduongList: " + e.getMessage());
        } finally {
            closeResources(rs, sm, cnn);
        }

        return result;
    }
    
    // check tuyến đường tồn tại
    public boolean checkRouteExists(String diemXuatPhat, String diemKetThuc) throws ClassNotFoundException {
        String query = "SELECT COUNT(*) FROM tuyenduong WHERE diem_xuat_phat = ? AND diem_ket_thuc = ?";
        Connection cnn = null; 
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            cnn = getConnection(); 

            stmt = cnn.prepareStatement(query);
            stmt.setString(1, diemXuatPhat);
            stmt.setString(2, diemKetThuc);

            rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; 
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; 
    }

    
    // Thêm tuyến đường
    public boolean inserttuyenduong(tuyenduong tuyenduong) {
        boolean isInserted = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "INSERT INTO  tuyenduong (diem_xuat_phat, diem_ket_thuc , khoang_cach, gia_ve) VALUES (?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, tuyenduong.get_diem_xuat_phat());
            ps.setString(2, tuyenduong.get_diem_ket_thuc());
            ps.setInt(3, tuyenduong.get_khoang_cach());
            ps.setInt(4, tuyenduong.get_gia_ve());

            int rows = ps.executeUpdate();
            isInserted = rows > 0;
        } catch (Exception e) {
            System.out.println("Error in inserttuyenduong: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isInserted;
    }
    
    // Lấy tuyến đường bằng mã tuyến đường
    public tuyenduong get_tuyen_duong_By_ma_tuyen_duong(int id) {
    	tuyenduong tuyenduong = null;
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM tuyenduong WHERE ma_tuyen_duong = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
            	tuyenduong = new tuyenduong();
                tuyenduong.set_ma_tuyen_duong(rs.getInt(1));
            	tuyenduong.set_diem_xuat_phat(rs.getString(2));
            	tuyenduong.set_diem_ket_thuc(rs.getString(3));
            	tuyenduong.set_khoang_cach(rs.getInt(4));
            	tuyenduong.set_gia_ve(rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println("Error in gettuyenduongById: " + e.getMessage());
        } finally {
            closeResources(rs, ps, cnn);
        }
        return tuyenduong;
    }
    
    // Cập nhật tuyến đường với khoảng cách và giá vé
    public boolean updatetuyenduong(tuyenduong updatedtuyenduong) {
        boolean isUpdated = false;
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "UPDATE tuyenduong SET khoang_cach = ?, gia_ve = ? WHERE ma_tuyen_duong = ?";
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, updatedtuyenduong.get_khoang_cach());
            ps.setInt(2, updatedtuyenduong.get_gia_ve());
            ps.setInt(3, updatedtuyenduong.get_ma_tuyen_duong());

            isUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Error in updatetuyenduong: " + e.getMessage());
        } finally {
            closeResources(ps, cnn);
        }

        return isUpdated;
    }
    
    // Tìm kiếm tuyến đường với điểm xuất phát hoặc điểm kết thức ( 1 đầu  vào )
    public ArrayList<tuyenduong> searchtuyenduong(String searchOption, String searchValue) {
        ArrayList<tuyenduong> resultList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        String query = "";
        
        switch (searchOption) {
            case "diem_xuat_phat":
                query = "SELECT * FROM tuyenduong WHERE diem_xuat_phat LIKE ?";
                break;
            case "diem_ket_thuc":
                query = "SELECT * FROM tuyenduong WHERE diem_ket_thuc LIKE ?";
                break;

            default:
                query = "SELECT * FROM tuyenduong";
                break;
        }
        try {
        	cnn = getConnection();
        	PreparedStatement stmt = cnn.prepareStatement(query) ;
        
            stmt.setString(1, "%" + searchValue + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tuyenduong tuyenduong = new tuyenduong();
                tuyenduong.set_ma_tuyen_duong(rs.getInt(1));
            	tuyenduong.set_diem_xuat_phat(rs.getString(2));
            	tuyenduong.set_diem_ket_thuc(rs.getString(3));
            	tuyenduong.set_khoang_cach(rs.getInt(4));
            	tuyenduong.set_gia_ve(rs.getInt(5));
                resultList.add(tuyenduong);
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
    
    // Tìm kiếm tuyến đường với điểm xuất phát và điểm kết thức ( 2 đầu  vào )
    public ArrayList<tuyenduong> searchtuyenduong(String searchOption, String searchValue, String searchValue1 ) {
        ArrayList<tuyenduong> resultList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        String query = "";
        
        switch (searchOption) {
            case "diem_xuat_phat_va_diem_ket_thuc":
                query = "SELECT * FROM tuyenduong WHERE diem_xuat_phat LIKE ? AND diem_ket_thuc LIKE ?";
                break;

            default:
                query = "SELECT * FROM tuyenduong";
                break;
        }
        try {
        	cnn = getConnection();
        	PreparedStatement stmt = cnn.prepareStatement(query) ;
        
            stmt.setString(1, "%" + searchValue + "%");
            stmt.setString(2, "%" + searchValue1 + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tuyenduong tuyenduong = new tuyenduong();
                tuyenduong.set_ma_tuyen_duong(rs.getInt(1));
            	tuyenduong.set_diem_xuat_phat(rs.getString(2));
            	tuyenduong.set_diem_ket_thuc(rs.getString(3));
            	tuyenduong.set_khoang_cach(rs.getInt(4));
            	tuyenduong.set_gia_ve(rs.getInt(5));
                resultList.add(tuyenduong);
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

    // Không có xóa tuyến đường
    
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
