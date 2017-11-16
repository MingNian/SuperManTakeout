package com.dzp.wm.pojo;

import java.util.Set;

//��Ʒ�����t_category
public class Category implements Comparable<Category> {
	private int id;
	private String categoryName;
	private String categoryRemark;
	private Shop shop;
	private Set<Commodity> commodities;
	
	private int state;
	
	public Category() {
	}

	public Category(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryRemark() {
		return categoryRemark;
	}

	public void setCategoryRemark(String categoryRemark) {
		this.categoryRemark = categoryRemark;
	}

	@Override
	public int compareTo(Category o) {
		return this.id > o.id ? 1 : -1;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Set<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(Set<Commodity> commodities) {
		this.commodities = commodities;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
