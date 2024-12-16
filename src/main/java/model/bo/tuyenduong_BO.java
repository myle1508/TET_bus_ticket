package model.bo;

import java.util.ArrayList;
import model.bean.tuyenduong;
import model.dao.tuyenduong_DAO;

public class tuyenduong_BO {
	tuyenduong_DAO tuyenduong_DAO = new tuyenduong_DAO();
	
	public ArrayList<tuyenduong> getList()
	{
		return tuyenduong_DAO.getList();
	}
	public tuyenduong get_tuyen_duong_By_ma_tuyen_duong(int ma_tuyen_duong)
	{
		return tuyenduong_DAO.get_tuyen_duong_By_ma_tuyen_duong(ma_tuyen_duong);
	}
	public boolean inserttuyenduong(tuyenduong tuyenduong)
	{
		return tuyenduong_DAO.inserttuyenduong(tuyenduong);
	}
	public boolean updatetuyenduong(tuyenduong updatedtuyenduong) 
	{
		return tuyenduong_DAO.updatetuyenduong(updatedtuyenduong);
	}
	public ArrayList<tuyenduong> searchtuyenduong(String searchOption, String searchValue) 
	{
        return tuyenduong_DAO.searchtuyenduong(searchOption, searchValue);
    }
	public ArrayList<tuyenduong> searchtuyenduong(String searchOption, String searchValue, String searchValue1 ) 
	{
        return tuyenduong_DAO.searchtuyenduong(searchOption, searchValue, searchValue1);
    }
	public boolean checkRouteExists(String diemXuatPhat, String diemKetThuc) throws ClassNotFoundException 
	{
		return tuyenduong_DAO.checkRouteExists(diemXuatPhat, diemKetThuc);
	}
	public tuyenduong getTuyenDuongByDiemDenDiemDi(String diemDen,String diemDi) {
		ArrayList<tuyenduong> tuyenDuongList = this.getList();
		for(tuyenduong tuyenDuong: tuyenDuongList) {
			String diemxuatphat = tuyenDuong.get_diem_xuat_phat().toLowerCase();
			String diemkethtuc = tuyenDuong.get_diem_ket_thuc().toLowerCase();
			if (diemxuatphat.contains(diemDen) || diemDen.contains(diemxuatphat)) {
				if (diemkethtuc.contains(diemDi) || diemDi.contains(diemkethtuc)) {
					return tuyenDuong;
				}
			}
		}
		return null;
	}
	public tuyenduong getTuyenDuongByDiemDen(String diemDen) {
		ArrayList<tuyenduong> tuyenDuongList = this.getList();
		for(tuyenduong tuyenDuong: tuyenDuongList) {
			String diemxuatphat = tuyenDuong.get_diem_xuat_phat().toLowerCase();
			if (diemxuatphat.contains(diemDen) || diemDen.contains(diemxuatphat)) {
				return tuyenDuong;
			}
		}
		return null;
	}
}
