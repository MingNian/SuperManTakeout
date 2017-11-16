package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.OrderItem;

public interface OrderItemDAO extends IBaseDAO<OrderItem>  {
	
	//获取特定订单的订单详情
	public Set<OrderItem> getOrderItems(int orderBeanId);

	public void addOrderItem(OrderItem orderItem);
	
}
