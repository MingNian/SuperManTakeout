package com.dzp.wm.biz.impl;

import java.util.Set;

import com.dzp.wm.biz.OrderItemBiz;
import com.dzp.wm.dao.OrderItemDAO;
import com.dzp.wm.pojo.OrderItem;

public class OrderItemBizImpl implements OrderItemBiz {

	private OrderItemDAO orderItemDAO;
	
	@Override
	public OrderItem getOrderItem(int orderItemId) {
		return orderItemDAO.get(orderItemId);
	}

	@Override
	public Set<OrderItem> getOrderItems(int orderBeanId) {
		return orderItemDAO.getOrderItems(orderBeanId);
	}
	
	public OrderItemDAO getOrderItemDAO() {
		return orderItemDAO;
	}

	public void setOrderItemDAO(OrderItemDAO orderItemDAO) {
		this.orderItemDAO = orderItemDAO;
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		orderItemDAO.addOrderItem(orderItem);
		
	}

}
