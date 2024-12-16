package model.bo;

import java.util.ArrayList;

import model.bean.ve;
import model.dao.ve_DAO;

public class ve_BO {
	ve_DAO ve_DAO = new ve_DAO();
	
	public ArrayList<ve> getList()
	{
		return ve_DAO.getList();
	}
	public ve get_ve_By_ma_ve(int ma_ve)
	{
		return ve_DAO.get_ve_By_ma_ve(ma_ve);
	}
	public ArrayList<ve>  get_ve_By_ma_nguoi_dung(int ma_nguoi_dung)
	{
		return ve_DAO.get_ve_By_ma_nguoi_dung(ma_nguoi_dung);
	}
	public ArrayList<ve>  get_ve_By_ma_lich_trinh(int ma_lich_trinh)
	{
		return ve_DAO.get_ve_By_ma_lich_trinh(ma_lich_trinh);
	}
	public boolean insertve(ve ve)
	{
		return ve_DAO.insertve(ve);
	}
	public boolean updateve(ve updatedve) 
	{
		return ve_DAO.updateve(updatedve);
	}
	public boolean deleteve(int ma_ve) 
	{
		return ve_DAO.deleteve(ma_ve);
	}
}
