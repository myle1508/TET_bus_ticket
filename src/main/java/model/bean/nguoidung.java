package model.bean;

public class nguoidung {
	private int ma_nguoi_dung;
	private String ten_dang_nhap;
	private String mat_khau;
	private String ho_ten;
	private String email;
	private String so_dien_thoai;
	private int vai_tro;
	
	public int get_ma_nguoi_dung()
	{
		return ma_nguoi_dung;
	}
	public String get_ten_dang_nhap()
	{
		return ten_dang_nhap;
	}
	public String get_mat_khau()
	{
		return mat_khau;
	}
	public String get_ho_ten()
	{
		return ho_ten;
	}
	public String get_email()
	{
		return email;
	}
	public String get_so_dien_thoai()
	{
		return so_dien_thoai;
	}
	public int get_vai_tro()
	{
		return vai_tro;
	}

	public void set_ma_nguoi_dung(int ma_nguoi_dung) 
	{
		this.ma_nguoi_dung = ma_nguoi_dung;
	}
	public void set_ten_dang_nhap(String ten_dang_nhap) 
	{
		this.ten_dang_nhap = ten_dang_nhap;
	}
	public void set_mat_khau(String mat_khau) 
	{
		this.mat_khau = mat_khau;
	}
	public void set_ho_ten(String ho_ten) 
	{
		this.ho_ten = ho_ten;
	}
	public void set_email(String email) 
	{
		this.email = email;
	}
	public void set_so_dien_thoai(String so_dien_thoai) 
	{
		this.so_dien_thoai = so_dien_thoai;
	}
	public void set_vai_tro(int vai_tro) 
	{
		this.vai_tro = vai_tro;
	}

}
