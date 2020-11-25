package dev.lotto.vo;

public class Lotto_PayVO {
	private String lotto_no;
	private String user_id;
	private String shop_id;
	private String pay;
	private String pr_yn;
	public String getLotto_no() {
		return lotto_no;
	}
	public void setLotto_no(String lotto_no) {
		this.lotto_no = lotto_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getShop_id() {
		return shop_id;
	}
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getPr_yn() {
		return pr_yn;
	}
	public void setPr_yn(String pr_yn) {
		this.pr_yn = pr_yn;
	}
	@Override
	public String toString() {
		return "Lotto_PayVO [lotto_no=" + lotto_no + ", user_id=" + user_id + ", shop_id=" + shop_id + ", pay=" + pay
				+ ", pr_yn=" + pr_yn + "]";
	}
	
}
