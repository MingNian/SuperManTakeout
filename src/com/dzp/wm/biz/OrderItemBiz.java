package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.OrderItem;

public interface OrderItemBiz {
	
	//��ȡ�ض�Id�Ķ�������
	OrderItem getOrderItem(int orderItemId);
	
	//��ȡ�ض������Ķ�������
	Set<OrderItem> getOrderItems(int orderBeanId);

	void addOrderItem(OrderItem orderItem);
}
