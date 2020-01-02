package com.project.kiosk.vo;

import org.json.simple.JSONObject;

public class KioskPaymentVO {
	private JSONObject payment_data;
	private JSONObject take_out;
	
	public JSONObject getTake_out() {
		return take_out;
	}

	public void setTake_out(JSONObject take_out) {
		this.take_out = take_out;
	}

	public JSONObject getPayment_data() {
		return payment_data;
	}

	public void setPayment_data(JSONObject payment_data) {
		this.payment_data = payment_data;
	}
}
