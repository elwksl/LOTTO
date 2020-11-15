package dev.lotto.vo;

public class Lotto_HistoryVO {
	private String lotto_no;
	private String user_id;
	private String dangchum_yn;
	private String buy_date;
	private int num1;
	private int num2;
	private int num3;
	private int num4;
	private int num5;
	private int num6;
	private int drow_cnt;
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
	public String getDangchum_yn() {
		return dangchum_yn;
	}
	public void setDangchum_yn(String dangchum_yn) {
		this.dangchum_yn = dangchum_yn;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public int getNum3() {
		return num3;
	}
	public void setNum3(int num3) {
		this.num3 = num3;
	}
	public int getNum4() {
		return num4;
	}
	public void setNum4(int num4) {
		this.num4 = num4;
	}
	public int getNum5() {
		return num5;
	}
	public void setNum5(int num5) {
		this.num5 = num5;
	}
	public int getNum6() {
		return num6;
	}
	public void setNum6(int num6) {
		this.num6 = num6;
	}
	public int getDrow_cnt() {
		return drow_cnt;
	}
	public void setDrow_cnt(int drow_cnt) {
		this.drow_cnt = drow_cnt;
	}
	@Override
	public String toString() {
		return "Lotto_HistoryVO [lotto_no=" + lotto_no + ", user_id=" + user_id + ", dangchum_yn=" + dangchum_yn
				+ ", buy_date=" + buy_date + ", num1=" + num1 + ", num2=" + num2 + ", num3=" + num3 + ", num4=" + num4
				+ ", num5=" + num5 + ", num6=" + num6 + ", drow_cnt=" + drow_cnt + "]";
	}
	
}
