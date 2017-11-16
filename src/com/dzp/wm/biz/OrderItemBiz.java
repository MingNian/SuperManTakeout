package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.OrderItem;

public interface OrderItemBiz {
	
	//获取特定Id的订单详情
	OrderItem getOrderItem(int orderItemId);
	
	//获取特定订单的订单详情
	Set<OrderItem> getOrderItems(int orderBeanId);

	void addOrderItem(OrderItem orderItem);
}
