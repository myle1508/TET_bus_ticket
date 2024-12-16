package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.nguoidung;
import model.dao.nguoidung_DAO;

public class nguoidung_BO {
	nguoidung_DAO nguoidung_DAO = new nguoidung_DAO();
	
	public int isValidUser(String userName, String passWord) throws ClassNotFoundException, SQLException
	{
		return nguoidung_DAO.isExistUser(userName, passWord);
	}
	public ArrayList<nguoidung> getList()
	{
		return nguoidung_DAO.getList();
	}
	public boolean insertnguoidung(nguoidung nguoidung)
	{
		return nguoidung_DAO.insertnguoidung(nguoidung);
	}
	public nguoidung get_nguoi_dung_By_ma_nguoi_dung(int id)
	{
		return nguoidung_DAO.get_nguoi_dung_By_ma_nguoi_dung(id);
	}
	public nguoidung get_nguoi_dung_By_ten_dang_nhap(String id)
	{
		return nguoidung_DAO.get_nguoi_dung_By_ten_dang_nhap(id);
	}
	public ArrayList<nguoidung> searchnguoidung(String searchOption, String searchValue) 
	{
        return nguoidung_DAO.searchnguoidung(searchOption, searchValue);
    }
	public boolean updatenguoidung(nguoidung updatednguoidung) 
	{
		return nguoidung_DAO.updatenguoidung(updatednguoidung);
	}
	public nguoidung getUserByUsernameAndPassword(String username, String password) {
	    return nguoidung_DAO.getUserByUsernameAndPassword(username, password);
	}
}
