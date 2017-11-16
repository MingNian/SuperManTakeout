package com.dzp.wm.pojo;

import java.util.Date;

//用户评价t_evaluate
public class Evaluate {
	private int id;
	private Date evaluateDate;
	private String content;
	private int stars;//商家星星数
	private Reply reply;
	private OrderBean orderBean;
	private Shop shop;
	private User user;
	
	public Evaluate(){}

	public Evaluate(int id) {
		super();
		this.id = id;
	}

	public Evaluate(int id, Date evaluateDate, String content, int stars, OrderBean orderBean) {
		super();
		this.id = id;
		this.evaluateDate = evaluateDate;
		this.content = content;
		this.stars = stars;
		this.orderBean = orderBean;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEvaluateDate() {
		return evaluateDate;
	}

	public void setEvaluateDate(Date evaluateDate) {
		this.evaluateDate = evaluateDate;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
