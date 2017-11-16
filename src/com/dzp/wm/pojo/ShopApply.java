package com.dzp.wm.pojo;


/**
 * @author Ming
 *
 * 2017Äê10ÔÂ9ÈÕ
 */
public class ShopApply implements Comparable<ShopApply> {
	private int id;
	private User user; 
	private int state;
	private String shopName;
	private String shopRemark;
	private String applyPath;
	private String reason;
	
	public ShopApply(){}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getApplyPath() {
		return applyPath;
	}

	public void setApplyPath(String applyPath) {
		this.applyPath = applyPath;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopRemark() {
		return shopRemark;
	}

	public void setShopRemark(String shopRemark) {
		this.shopRemark = shopRemark;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public int compareTo(ShopApply o) {

		return this.id > o.id ? 1 : -1;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
