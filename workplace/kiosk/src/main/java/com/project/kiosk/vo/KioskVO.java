package com.project.kiosk.vo;

/* "VO(Value Object)" 또는 "DTO(Data Transfer Object)"라고 함 */
/* DB에서 불러온 데이터를 객체로 변환하는 객체 */
public class KioskVO {
	private String id;
	private String product;
	private int price;
	private String launch_date;
	private String img;
	
	/* getter와 setter를 이용해서 값을 저장하고 추출할 수 있음 */
	/* get이나 set 뒤의 명칭은 Property로써 DB의 변수 명과 동일함 */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLaunch_date() {
		return launch_date;
	}
	public void setLaunch_date(String launch_date) {
		this.launch_date = launch_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}
