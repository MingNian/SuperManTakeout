package com.dzp.wm.pojo;

import java.util.Set;

public class Shop implements Comparable<Shop> {
	private int id;
	private int status;
	private ShopDetail shopDetail;
	private User user;// shop闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹凤拷
	private String docPath;// 闁跨喐鏆�绾攱瀚归柨鐔告灮閹风兘鏁撻弬銈嗗闁跨喍鑼庣喊澶嬪鐠侯垶鏁撻弬銈嗗
	private String startTime;
	private String closeTime;
	private String shopName;
	private String shopAddress;
	
	private Set<User> collectors;
	private Set<Evaluate> evaluates;
	private Set<Category> categorys;

	public Shop() {
	}

	public Shop(int id, int status, User user) {
		super();
		this.id = id;
		this.status = status;
		this.user = user;
	}

	public Shop(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ShopDetail getShopDetail() {
		return shopDetail;
	}

	public void setShopDetail(ShopDetail shopDetail) {
		this.shopDetail = shopDetail;
	}

	public Set<Evaluate> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(Set<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}

	public Set<User> getCollectors() {
		return collectors;
	}

	public void setCollectors(Set<User> collectors) {
		this.collectors = collectors;
	}

	public String getDocPath() {
		return docPath;
	}

	public void setDocPath(String docPath) {
		this.docPath = docPath;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Shop [id=" + id + ", status=" + status + ", shopDetail=" + shopDetail + ", user=" + user + ", docPath="
				+ docPath + "]";
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}


	@Override
	public int compareTo(Shop o) {
		if(this.id == o.id){
			return 0;
		}
		return this.id > o.id ? 1 : -1;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public Set<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(Set<Category> categorys) {
		this.categorys = categorys;
	}
}
