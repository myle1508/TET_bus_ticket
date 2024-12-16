package model.bean;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
public class lichtrinh {

	private int ma_lich_trinh;
	private int ma_tuyen_duong;
	private Timestamp thoi_gian_xuat_phat;
	private String danh_sach_ghe;
	private int so_ghe_trong;
	private boolean trang_thai;
	
	
	public int get_ma_lich_trinh()
	{
		return ma_lich_trinh;
	}
	public int get_ma_tuyen_duong()
	{
		return ma_tuyen_duong;
	}
	public Timestamp get_thoi_gian_xuat_phat()
	{
		return thoi_gian_xuat_phat;
	}
	public String get_danh_sach_ghe()
	{
		return danh_sach_ghe;
	}
	public int get_so_ghe_trong()
	{
		return so_ghe_trong;
	}
	public boolean get_trang_thai()
	{
		return trang_thai;
	}

	public void set_ma_lich_trinh(int ma_lich_trinh) 
	{
		this.ma_lich_trinh = ma_lich_trinh;
	}
	public void set_ma_tuyen_duong(int ma_tuyen_duong) 
	{
		this.ma_tuyen_duong = ma_tuyen_duong;
	}
	public void set_thoi_gian_xuat_phat(Timestamp thoi_gian_xuat_phat) 
	{
		this.thoi_gian_xuat_phat = thoi_gian_xuat_phat;
	}
	public void set_danh_sach_ghe(String danh_sach_ghe) 
	{
		this.danh_sach_ghe = danh_sach_ghe;
	}
	public void set_so_ghe_trong(int so_ghe_trong) 
	{
		this.so_ghe_trong = so_ghe_trong;
	}
	public void set_trang_thai(boolean trang_thai) 
	{
		this.trang_thai = trang_thai;
	}
	
	public String get_ngay_xuat_phat() {
		Timestamp timestamp = this.get_thoi_gian_xuat_phat(); // Giả sử đây là Timestamp bạn có
		LocalDateTime localDateTime = timestamp.toLocalDateTime();

		// Tách ngày
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String date = localDateTime.format(dateFormatter);
		return date;
	}
	
	public String get_gio_xuat_phat() {
		Timestamp timestamp = this.get_thoi_gian_xuat_phat(); // Giả sử đây là Timestamp bạn có
		LocalDateTime localDateTime = timestamp.toLocalDateTime();
		
		// Tách giờ
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
		String time = localDateTime.format(timeFormatter);
		return time;
	}
	public void thulich() {
		System.out.print("lll");
		System.out.println("sfe");
	}
}
