package dev.lotto.vo;

public class UserVO {

	private String user_id; 		// 아이디
	private String user_name; 		// 이름
	private String address; 		// 주소
	private String phone;			// 핸드폰번호
	private String pwd;				// 비밀번호
	private String social_number;	// 주민번호
	private String enter_date;		// 가입날짜
	private String reg_date;		// 마지막수정날짜
	private String reg_id;			// 마지막수정자
	private String user_auth;		// 권한 
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSocial_number() {
		return social_number;
	}
	public void setSocial_number(String social_number) {
		this.social_number = social_number;
	}
	public String getEnter_date() {
		return enter_date;
	}
	public void setEnter_date(String enter_date) {
		this.enter_date = enter_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", address=" + address + ", phone=" + phone
				+ ", pwd=" + pwd + ", social_number=" + social_number + ", enter_date=" + enter_date + ", reg_date="
				+ reg_date + ", reg_id=" + reg_id + ", user_auth=" + user_auth + "]";
	}
	
}
