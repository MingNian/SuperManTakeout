package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.OrderItem;

public interface OrderItemDAO extends IBaseDAO<OrderItem>  {
	
	//��ȡ�ض������Ķ�������
	public Set<OrderItem> getOrderItems(int orderBeanId);

	public void addOrderItem(OrderItem orderItem);
	
}
