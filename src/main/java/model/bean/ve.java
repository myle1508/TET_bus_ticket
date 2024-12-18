package model.bean;

import java.util.Date;

public class ve {
	private int ma_ve;
	private int ma_nguoi_dung;
	private int ma_lich_trinh;
	private int so_ghe;
	private boolean trang_thai;
	private String vi_tri_ghe;
	private int tong_tien;
	private  String thanh_toan;
	private  Date ngay_dat_hang;
	
	
	public int get_ma_ve()
	{
		return ma_ve;
	}
	public int get_ma_nguoi_dung()
	{
		return ma_nguoi_dung;
	}
	public int get_ma_lich_trinh()
	{
		return ma_lich_trinh;
	}
	public int get_so_ghe()
	{
		return so_ghe;
	}
	public int get_tong_tien()
	{
		return tong_tien;
	}
	public String get_thanh_toan()
	{
		return thanh_toan;
	}
	public String get_vi_tri_ghe()
	{
		return vi_tri_ghe;
	}
	public boolean get_trang_thai()
	{
		return trang_thai;
	}
	public Date get_ngay_dat_hang()
	{
		return ngay_dat_hang;
	}
	
	
	public void set_ma_ve(int ma_ve) 
	{
		this.ma_ve = ma_ve;
	}
	
	public void set_ma_nguoi_dung(int ma_nguoi_dung) 
	{
		this.ma_nguoi_dung = ma_nguoi_dung;
	}
	public void set_ma_lich_trinh(int ma_lich_trinh) 
	{
		this.ma_lich_trinh = ma_lich_trinh;
	}
	public void set_so_ghe(int so_ghe) 
	{
		this.so_ghe = so_ghe;
	}
	public void set_trang_thai(boolean trang_thai) 
	{
		this.trang_thai = trang_thai;
	}
	public void set_tong_tien(int tong_tien) 
	{
		this.tong_tien = tong_tien;
	}
	public void set_thanh_toan(String thanh_toan) 
	{
		this.thanh_toan = thanh_toan;
	}
	public void set_vi_tri_ghe(String vi_tri_ghe) 
	{
		this.vi_tri_ghe = vi_tri_ghe;
	}
	public void set_ngay_dat_hang(Date ngay_dat_hang) 
	{
		this.ngay_dat_hang = ngay_dat_hang;
	}
}