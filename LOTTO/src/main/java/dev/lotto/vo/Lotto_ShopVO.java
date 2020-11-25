package dev.lotto.vo;

public class Lotto_ShopVO {
	private String shop_id;
	private String shop_name;
	private String address;
	private String phone;
	public String getShop_id() {
		return shop_id;
	}
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Lotto_ShopVO [shop_id=" + shop_id + ", shop_name=" + shop_name + ", address=" + address + ", phone="
				+ phone + "]";
	}
	
	
}
