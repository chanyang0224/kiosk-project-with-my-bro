package com.project.kiosk.test;

public class TestJavaClass {

	public static void main(String[] args) {
		String img;
		img = "C:/Java/workplace/kiosk_image/coffee/ice_americano.jpg";
		String[] imgLocation = img.split("/");
		System.out.println(imgLocation[imgLocation.length-1]);
		
	}

}
