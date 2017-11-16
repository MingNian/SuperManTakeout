package com.dzp.wm.pojo;

public class Commodity {
	private int id;
	private String commodityImg;
	private String commodityName;
	private float price;
	private boolean status;
	private String commodityRemark;
	private Category category;
	
	public Commodity(){}
	
	public Commodity(int id, String commodityImg, String commodityName, float price, boolean status,
			String commodityRemark, Category category, Shop shop) {
		super();
		this.id = id;
		this.commodityImg = commodityImg;
		this.commodityName = commodityName;
		this.price = price;
		this.status = status;
		this.commodityRemark = commodityRemark;
		this.category = category;
	}
	
	public Commodity(int id){
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommodityImg() {
		return commodityImg;
	}

	public void setCommodityImg(String commodityImg) {
		this.commodityImg = commodityImg;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getCommodityRemark() {
		return commodityRemark;
	}

	public void setCommodityRemark(String commodityRemark) {
		this.commodityRemark = commodityRemark;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public boolean isStatus() {
		return status;
	}
}
