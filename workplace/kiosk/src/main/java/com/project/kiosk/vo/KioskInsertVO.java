package com.project.kiosk.vo;

public class KioskInsertVO {
	private String charge_date;
	private String charge_time;
	private String product_data;
	private String take_out;
	
	public String getTake_out() {
		return take_out;
	}
	public void setTake_out(String take_out) {
		this.take_out = take_out;
	}
	public String getCharge_date() {
		return charge_date;
	}
	public void setCharge_date(String charge_date) {
		this.charge_date = charge_date;
	}
	public String getCharge_time() {
		return charge_time;
	}
	public void setCharge_time(String charge_time) {
		this.charge_time = charge_time;
	}
	public String getProduct_data() {
		return product_data;
	}
	public void setProduct_data(String product_data) {
		this.product_data = product_data;
	}
}
