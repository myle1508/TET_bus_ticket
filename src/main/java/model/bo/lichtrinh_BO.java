package model.bo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import model.bean.lichtrinh;
import model.dao.lichtrinh_DAO;

public class lichtrinh_BO {
	lichtrinh_DAO lichtrinh_DAO = new lichtrinh_DAO();
	
	public ArrayList<lichtrinh> getList()
	{
		return lichtrinh_DAO.getList();
	}
	public ArrayList<lichtrinh> get_lich_trinh_by_ma_tuyen_duong(int ma_tuyen_duong)
	{
		return lichtrinh_DAO.get_lich_trinh_by_ma_tuyen_duong(ma_tuyen_duong);
	}
	public boolean insertlichtrinh(lichtrinh lichtrinh)
	{
		return lichtrinh_DAO.insertlichtrinh(lichtrinh);
	}
	public lichtrinh get_lich_trinh_by_ma_lich_trinh(int ma_lich_trinh)
	{
		return lichtrinh_DAO.get_lich_trinh_by_ma_lich_trinh(ma_lich_trinh);
	}
	public boolean updatelichtrinh(lichtrinh updatedlichtrinh) 
	{
		return lichtrinh_DAO.updatelichtrinh(updatedlichtrinh);
	}
	public ArrayList<lichtrinh> searchlichtrinh(String searchOption, Timestamp searchValue) 
	{
        return lichtrinh_DAO.searchlichtrinh(searchOption, searchValue);
    }
	public ArrayList<String> getAlltuyenduong() 
	{
		return lichtrinh_DAO.getAlltuyenduong();
	}
	public ArrayList<lichtrinh> get_lich_trinh_by_ma_tuyen_duong_trang_thai(int ma_tuyen_duong){
		ArrayList<lichtrinh> resultList = new ArrayList<lichtrinh>();
		ArrayList<lichtrinh> lichTrinhList = this.get_lich_trinh_by_ma_tuyen_duong(ma_tuyen_duong);
		for (lichtrinh lichTrinh : lichTrinhList) {
			if (lichTrinh.get_trang_thai())
				resultList.add(lichTrinh);
		}
		return resultList;
	}
}
