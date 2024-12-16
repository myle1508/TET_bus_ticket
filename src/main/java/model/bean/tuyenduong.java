package model.bean;

public class tuyenduong {
	private int ma_tuyen_duong;
	private String diem_xuat_phat;
	private String diem_ket_thuc;
	private int khoang_cach;
	private int gia_ve;
	
	public int get_ma_tuyen_duong()
	{
		return ma_tuyen_duong;
	}
	public String get_diem_xuat_phat()
	{
		return diem_xuat_phat;
	}
	public String get_diem_ket_thuc()
	{
		return diem_ket_thuc;
	}
	public int get_khoang_cach()
	{
		return khoang_cach;
	}
	public int get_gia_ve()
	{
		return gia_ve;
	}
	
	public void set_ma_tuyen_duong(int ma_tuyen_duong) 
	{
		this.ma_tuyen_duong = ma_tuyen_duong;
	}
	public void set_diem_xuat_phat(String diem_xuat_phat) 
	{
		this.diem_xuat_phat = diem_xuat_phat;
	}
	public void set_diem_ket_thuc(String diem_ket_thuc) 
	{
		this.diem_ket_thuc = diem_ket_thuc;
	}
	public void set_khoang_cach(int khoang_cach) 
	{
		this.khoang_cach = khoang_cach;
	}
	public void set_gia_ve(int gia_ve) 
	{
		this.gia_ve = gia_ve;
	}
}
