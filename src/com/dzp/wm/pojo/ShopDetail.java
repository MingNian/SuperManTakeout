package com.dzp.wm.pojo;

import java.util.Date;

public class ShopDetail {
	private int id;//��ӦShop��id
	private String shopAddress;
	private String shopImg;
	private String notice;//����
	private String shopRemark;
	
	private Date shopOpenTime;
	private int duration;//����ʱ��
	private float leastMoney;//���ͷ�
	private float serviceMoney;//���ͷ�
	private Shop shop;
	
	public ShopDetail() {
		this.shopAddress = "";
		this.shopImg = "";
		this.notice = "";
		this.shopRemark = "";
		this.shopOpenTime = null;
		this.duration = 30;
		this.leastMoney = 0;
		this.serviceMoney = 0;
	}
	
	public ShopDetail(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopImg() {
		return shopImg;
	}

	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}

	public String getShopRemark() {
		return shopRemark;
	}

	public void setShopRemark(String shopRemark) {
		this.shopRemark = shopRemark;
	}

	public Date getShopOpenTime() {
		return shopOpenTime;
	}

	public void setShopOpenTime(Date shopOpenTime) {
		this.shopOpenTime = shopOpenTime;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public float getLeastMoney() {
		return leastMoney;
	}

	public void setLeastMoney(float leastMoney) {
		this.leastMoney = leastMoney;
	}

	public float getServiceMoney() {
		return serviceMoney;
	}

	public void setServiceMoney(float serviceMoney) {
		this.serviceMoney = serviceMoney;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

}
