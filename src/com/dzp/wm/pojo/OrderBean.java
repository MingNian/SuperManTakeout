package com.dzp.wm.pojo;

import java.util.Date;
import java.util.Set;

public class OrderBean {
	private int id;
	private Date orderBeanTime;
	private float orderBeanMoney;
	private String orderBeanRemark;
	private UserAddress orderBeanAddr;
	private String orderBeanTel;
	private int status;
	
	private Evaluate evaluate;
	private User user;
	private Shop shop;
	private Set<OrderItem> orderItems;
	
	public OrderBean(){}

	public OrderBean(int id) {
		super();
		this.id = id;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public float getOrderBeanMoney() {
		return orderBeanMoney;
	}


	public void setOrderBeanMoney(float orderBeanMoney) {
		this.orderBeanMoney = orderBeanMoney;
	}


	

	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Shop getShop() {
		return shop;
	}


	public void setShop(Shop shop) {
		this.shop = shop;
	}


	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}


	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOrderBeanRemark() {
		return orderBeanRemark;
	}

	public void setOrderBeanRemark(String orderBeanRemark) {
		this.orderBeanRemark = orderBeanRemark;
	}

	public UserAddress getOrderBeanAddr() {
		return orderBeanAddr;
	}

	public void setOrderBeanAddr(UserAddress orderBeanAddr) {
		this.orderBeanAddr = orderBeanAddr;
	}

	public String getOrderBeanTel() {
		return orderBeanTel;
	}

	public void setOrderBeanTel(String orderBeanTel) {
		this.orderBeanTel = orderBeanTel;
	}

	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}

	public Date getOrderBeanTime() {
		return orderBeanTime;
	}

	public void setOrderBeanTime(Date orderBeanTime) {
		this.orderBeanTime = orderBeanTime;
	}

	
}
